/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/payment_confirm_response/confirm_payment_response.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/foundation.dart';

class PaymentRepository {
  final ADApiClient adApiClient;

  final String payNowPath;

  final String confirmPaymentPath;

  PaymentRepository(this.adApiClient, this.payNowPath, this.confirmPaymentPath);

  // Future<ADResponseState> requestPayment({
  //   String? path,
  //   String? oldAgentID,
  //   required String requestModel,
  // }) async {
  //   final ADResponseState response = await adApiClient.post(
  //     path: path ?? payNowPath,
  //     params: requestModel,
  //     header: oldAgentID != null && oldAgentID.isNotEmpty
  //         ? APIHeaderUtils.flightBookingHeaders(
  //             isGuestLoggedIn: oldAgentID.isNotEmpty,
  //             oldAgentID: oldAgentID,
  //           )
  //         : APIHeaderUtils.flightBookingHeaders(),
  //   );
  //   if (response.viewStatus == Status.complete) {
  //     response.data = await compute(_parsePaymentDataBackground, response.data);
  //   }
  //   return response;
  // }

  // static PayNowResponse _parsePaymentDataBackground(dynamic encodedJson) {
  //   return PayNowResponse.fromJson(encodedJson);
  // }

//Api to confirm payment once payment completed
  Future<ADResponseState> confirmPayment(
    String? path, {
    required String requestModel,
  }) async {
    final ADResponseState response = await adApiClient.post(
      path: path ?? confirmPaymentPath,
      params: requestModel,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_parseConfirmPaymentDataBackground, response.data);
    }
    return response;
  }

  static ConfirmPaymentResponse _parseConfirmPaymentDataBackground(
    dynamic encodedJson,
  ) {
    return ConfirmPaymentResponse.fromJson(encodedJson);
  }
}
