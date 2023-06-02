/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/cancel_booking/api_response_model/cancel_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/response/create_booking_response_model.dart';
import 'package:adani_airport_mobile/network/pranaam_api/pranaam_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// This Repository is used to call apis related to TravellerDetails Screen
class BookingPaymentCancellationRepository {
  final ADApiClient adApiClient = ADApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );
  final ADAksApiClient adAksApiClient = ADAksApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  /// this is used to create booking on button pressed of pranaam
  /// traveller details screen from CreateBooking
  Future<ADResponseState> createBooking(
    Map<String, dynamic> createBookingRequestModel,
  ) async {
    adLog(createBookingRequestModel.toString());
    final ADResponseState responseState;
    try {
      responseState = await adApiClient.post(
        path: PranaamApiUrls.createBooking,
        header: APIHeaderUtils.flightBookingHeaders(),
        params: jsonEncode(createBookingRequestModel),
      );
    } catch (e) {
      return ADResponseState.error('Something went wrong');
    }

    if (responseState.viewStatus == Status.complete) {
      responseState.data =
          CreateBookingResponseModel.fromJson(responseState.data);
      adLog('createBooking res :${responseState.data}');
    }
    return responseState;
  }

  /// this is used to get booking details in init state of my account/my orders screen
  Future<ADResponseState> getBookingDetails(
    Map<String, dynamic> getBookingRequestModel, {
    required String orderId,
  }) async {
    adLog(
      'getBookingRequestModel ${getBookingRequestModel.toString()}',
      className: this,
    );
    final ADResponseState responseState = await adAksApiClient.get(
      path: '${PranaamApiUrls.getBookingDetails}/$orderId',
      header: APIHeaderUtils.flightBookingHeaders(),
      // params: jsonEncode(getBookingRequestModel),
    );
    if (responseState.viewStatus == Status.complete) {
      responseState.data =
          CommonOrderDetailBaseResponse.fromJson(responseState.data);
    }
    return responseState;
  }

  ///This method will be used for cancellation api.
  Future<ADResponseState> cancelBooking(
    Map<String, dynamic> cancelBookingRequestModel,
  ) async {
    adLog(
      'cancelBookingRequestModel ${cancelBookingRequestModel.toString()}',
      className: this,
    );
    final ADResponseState responseState = await adAksApiClient.post(
      path: PranaamApiUrls.cancelBooking,
      header: APIHeaderUtils.tempFlightBookingHeaders(),
      params: jsonEncode(cancelBookingRequestModel),
    );

    if (responseState.viewStatus == Status.complete) {
      responseState.data =
          CancelBookingResponseModel.fromJson(responseState.data);
    }
    return responseState;
  }

  Future<ADResponseState> createPranaamPayments(
    Map<String, dynamic> createPranaamPaymentsRequestModel,
  ) async {
    adLog(
      'createPranaamPayments $createPranaamPaymentsRequestModel',
      className: this,
    );
    final Map<String, dynamic> flightBookingHeaders =
        APIHeaderUtils.flightBookingHeaders();
    adLog(
      'createPranaamPayments headers ${flightBookingHeaders.values}',
      className: this,
    );
    final ADResponseState responseState = await adApiClient.post(
      path: PranaamApiUrls.createPranaamPayments,
      header: flightBookingHeaders,
      params: jsonEncode(createPranaamPaymentsRequestModel),
    );

    // if (responseState.viewStatus == Status.complete) {
    //   responseState.data =
    //       CancelBookingResponseModel.fromJson(responseState.data);
    // }
    return responseState;
  }
}
