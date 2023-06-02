/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/earning.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/potential_earning_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/email_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/offers/repositories/offer_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/important_info.dart';
import 'package:adani_airport_mobile/modules/site_core/repositories/site_core_repository.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

/// this class is used to manage the state of FlightBooking confirmation Screen.
class FlightBookingConfirmationState extends BaseViewModel {
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  final SiteCoreRepository _siteCoreRepository = SiteCoreRepository();

  // FlightViewTripResponseModel? flightBookingResponseModel;
  FlightViewTripResponseModel? flightbookingDetail;
  String? contactNo;
  ADResponseState offersState = ADResponseState.loading();
  final OfferRepository _offerRepository = OfferRepository();
  ADResponseState pranaamUpSellState = ADResponseState.loading();

  ADResponseState importantInformation = ADResponseState.loading();

  /// Initiate loading state for api hit
  ADResponseState flightBookingConfirmation = ADResponseState.loading();

  /// to show import information based of travel type
  ImportantInfo? flightInformationPoliciesResponse;

  bool isInternational = false;

  bool isInsured = false;
  bool isEarnPointsLoading = false;
  CommonOrderDetailBaseResponse commonOrderDetailBaseResponse =
      CommonOrderDetailBaseResponse();

  bool isZeroCancellation = false;

  String? orderStatus;

  ///It will provide details related itinerary
  Future<void> viewTripDetails(
    String orderRefId, {
    bool pullToFresh = false,
  }) async {
    if (flightBookingConfirmation.viewStatus != Status.loading &&
        !pullToFresh) {
      flightBookingConfirmation = ADResponseState.loading();
      notifyListeners();
    }
    await _flightBookingRepository.getOrder(orderRefId).then((value) {
      updateTripDetailsState(value);
    });
  }

  Future<ADResponseState> getOrder(
    String? referenceId,
  ) async {
    if (flightBookingConfirmation.viewStatus != Status.loading) {
      flightBookingConfirmation = ADResponseState.loading();
      notifyListeners();
    }

    return _flightBookingRepository.getOrder(
      referenceId ?? '',
    );
  }

  ///It will update ADResponseState status related view itinerarys
  void updateTripDetailsState(ADResponseState response) {
    flightBookingConfirmation = response;
    commonOrderDetailBaseResponse = flightBookingConfirmation.data;
    flightbookingDetail =
        commonOrderDetailBaseResponse.orderDetail?.flightbookingDetail;
    getPotentialEarning();
    getPranaamUpsell(flightbookingDetail?.bookingID ?? '').then((_) {
      getFlightInformationData();
      notifyListeners();
    });
  }

  void getFlightInformationData() {
    isInternational = flightbookingDetail?.isInternational ?? false;
    isInsured =
        (flightbookingDetail?.paymentDetails?.travelInsuranceFare ?? 0) != 0;
    isZeroCancellation = flightbookingDetail?.isZeroCancellation ?? false;
    orderStatus = flightbookingDetail?.orderStatus ?? '';

    final Map<String, dynamic> queryParams = {
      itemKey: SiteCoreApiUrls.siteCoreFlightImportantInfo,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
      infotype: isInternational ? 'international' : 'domestic',
      insurance: isInsured,
      zeroCancellation: isZeroCancellation,
      status: orderStatus,
    };
    _siteCoreRepository
        .fetchFlightInformationPolicies(queryParams)
        .then((value) => _updateFlightInformationPoliciesData(value));
  }

  void _updateFlightInformationPoliciesData(ADResponseState response) {
    importantInformation = response;
    if (response.viewStatus == Status.complete) {
      if (response.data != null) {
        flightInformationPoliciesResponse = response.data;
      }
    }
    notifyListeners();
  }

  Future<void> getPotentialEarning() async {
    if (commonOrderDetailBaseResponse.earning == null) {
      isEarnPointsLoading = true;
      notifyListeners();
      final potentialEarningResponse =
          await _flightBookingRepository.getPotentialEarning(
        commonOrderDetailBaseResponse.orderReferenceId ?? '',
      );
      if (potentialEarningResponse.viewStatus == Status.complete) {
        final PotentialEarningResponseModel potentialEarningResponseModel =
            potentialEarningResponse.data as PotentialEarningResponseModel;
        commonOrderDetailBaseResponse.earning = Earning(
          total: potentialEarningResponseModel.totalPotentialEarning,
          reward: potentialEarningResponseModel.rewardPotentialEarning,
          order: potentialEarningResponseModel.orderPotentialEarning,
        );

        isEarnPointsLoading = false;
        notifyListeners();
      } else {
        isEarnPointsLoading = false;
        notifyListeners();
      }
    } else {
      isEarnPointsLoading = false;
      notifyListeners();
    }
  }

  ///It will fetch unlocked offers data
  Future<void> getAllUnlockedOffers() async {
    final Map<String, Object> queryParameters = {
      'language': 'en',
      'OfferUniqueID': '',
      'isUnlockOffer': true,
      'appType': 'app',
      'AirportCode': airportPrefixName().toString(),
    };

    final value = await _offerRepository.fetchUnlockedOffers(
      queryParameters: queryParameters,
    );
    offersState = value;
    notifyListeners();
  }

  ///It will fetch pranaam upsell banner
  Future<void> getPranaamUpsell(String tripId) async {
    final Map<String, String> queryParameters = {
      'lob': 'FlightBooking',
    };
    final value = await _flightBookingRepository.getPranaamUpSellResponse(
      tripId,
      queryParameters,
    );
    pranaamUpSellState = value;
    notifyListeners();
  }

  String? airportPrefixName() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty == false
        ? selectedAirportsData?.airportPrefixName
        : 'adani-one-airport';
  }

  ///It will provide details related itinerary
  Future<void> downloadTripInvoice({
    required String tripId,
    required String bookingId,
    required String businessSubType,
    required BuildContext context,
  }) async {
    unawaited(
      _flightBookingRepository.downloadInvoice(
        tripId,
        bookingId,
        businessSubType,
        context,
      ),
    );
  }

  ///to send email to user related itinerary
  Future<void> emailItinerary(String tripId, String emailId, context) async {
    unawaited(
      _flightBookingRepository.emailItinerary(
        EmailItineraryRequestModel(
          tripId: tripId,
          email: emailId,
        ),
        context,
      ),
    );
  }
}
