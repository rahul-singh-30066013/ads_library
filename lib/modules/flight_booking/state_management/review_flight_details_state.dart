/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_create_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_create_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_itinerary_price_change.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository_sitecore.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/session/repository/session_repository.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

/// this class is used to manage the state of review flight/booking screen.
class ReviewFlightDetailsState extends ADBaseViewModel {
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  final FlightBookingRepositorySitecore _flightBookingRepositorySitecore =
      FlightBookingRepositorySitecore();
  FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  FlightCreateItineraryResponseModel? flightItineraryResponseModel;
  FlightItineraryPriceChange? flightItineraryPriceChange;

  /// Initiate loading state for api hit
  ADResponseState reviewDetails = ADResponseState.loading();
  ADResponseState removeCouponState = ADResponseState.init();

  /// this is use for only fridge UI when user apply insurance
  ADResponseState applyInsurance = ADResponseState.init();

  final SessionRepository sessionRepository = SessionRepository();

  bool? isInsuredLoading;
  bool? isInsuredFalseLoading;

  List<WidgetItem> filteredOfferList = List.empty();
  bool? result;

  bool valueForZeroCancellation = false;

  bool? errorCodeVisible = false;

  GlobalKey? globalKey = GlobalKey();

  bool? valueForVisibleOfStrip = false;

  // ADResponseState couponList = ADResponseState.loading();
  //
  // TextEditingController controller = TextEditingController();
  //
  // CouponListResponse couponListResponse = const CouponListResponse();

  ///It will provide details related itinerary
  Future<void> viewItineraryDetails(
    String itineraryId,
    String oldUserId, {
    bool requiredInsurance = false,
    bool isInsured = false,
    bool requiredZeroCancellation = false,
    bool isZeroCancellation = false,
  }) async {
    if (requiredInsurance) {
      if (isInsured) {
        isInsuredLoading = true;
        result = true;
      } else {
        isInsuredFalseLoading = true;
        result = false;
      }
      applyInsurance = ADResponseState.loading();
      notifyListeners();
    } else if (requiredZeroCancellation) {
      applyInsurance = ADResponseState.loading();
      notifyListeners();
    } else {
      if (reviewDetails.viewStatus != Status.loading) {
        reviewDetails = ADResponseState.loading();
        notifyListeners();
      }
    }
    await _flightBookingRepository
        .viewItinerary(
      itineraryId: itineraryId,
      requiredInsurance: requiredInsurance,
      isInsured: isInsured,
      reviewedID: oldUserId,
      requiredZeroCancellation: requiredZeroCancellation,
      isZeroCancellation: isZeroCancellation,
    )
        .then((value) {
      _updateItineraryDetailsState(
        value,
        requiredInsurance: requiredInsurance,
        isInsured: isInsured,
        requiredZeroCancellation: requiredZeroCancellation,
      );
    });
  }

  void setValueForZeroCancellation({required bool valueOfZeroCan}) {
    valueForZeroCancellation = valueOfZeroCan;
    notifyListeners();
  }

  void setValueForVisibilityForStrip({required bool value}) {
    valueForVisibleOfStrip = value;
    notifyListeners();
  }

  void setErrorCodeVisible() {
    errorCodeVisible = result == null;
    notifyListeners();
  }

  ///It will update ADResponseState status related view itinerary
  void _updateItineraryDetailsState(
    ADResponseState response, {
    bool? requiredInsurance,
    bool? isInsured,
    bool? requiredZeroCancellation,
  }) {
    reviewDetails = response;
    flightViewItineraryResponseModel = reviewDetails.data;
    if (requiredInsurance ?? false) {
      if (isInsured ?? false) {
        isInsuredLoading = false;
      } else {
        isInsuredFalseLoading = false;
      }
      result = flightViewItineraryResponseModel?.insurance?.insured;
      applyInsurance = response;
      setErrorCodeVisible();
    } else if (requiredZeroCancellation ?? false) {
      applyInsurance = response;
    }
    notifyListeners();
  }

  // void setValueOFRadioButton(bool? value) {
  //   result = value;
  //   notifyListeners();
  // }

  ///It will create itinerary
  Future<void> createItinerary(
    SelectedFlightModel selectedFlightModel,
    String oldUserId,
  ) async {
    await _flightBookingRepository
        .createItinerarySession(selectedFlightModel)
        .then((value) {
      if (value.data != null) {
        getAllOffers();
        flightItineraryResponseModel = value.data;
        viewItineraryDetails(
          flightItineraryResponseModel?.itineraryId ?? '',
          oldUserId,
        );
      } else {
        _updateItineraryDetailsState(value);
      }
    });
  }

  // Future<void> getCouponListApi(String itineraryId) async {
  //   await _flightBookingRepository.getCouponList(itineraryId).then((value) {
  //     _updateResponseCouponList(value);
  //   });
  // }
  //
  // ///It will update get profile ADResponseState
  // void _updateResponseCouponList(ADResponseState response) {
  //   if (response.viewStatus == Status.complete) {
  //     couponList = response;
  //     couponListResponse = couponList.data;
  //     notifyListeners();
  //   }
  // }

  // Future<void> applyCoupon(
  //   String itineraryId,
  //   String promoCode,
  //   int index,
  //   BuildContext context,
  // ) async {
  //   reviewDetails = ADResponseState.loading();
  //   FlightBookingCoupon coupon = couponListResponse.elgibleOfferInfo[index];
  //   coupon = coupon.copyWith(isSelected: true);
  //   couponListResponse.elgibleOfferInfo[index] = coupon;
  //   notifyListeners();
  //   final ApplyCouponRequest applyCouponRequest =
  //       ApplyCouponRequest(itineraryId, promoCode);
  //
  //   await _flightBookingRepository
  //       .applyCoupon(applyCouponRequest: applyCouponRequest)
  //       .then((value) {
  //     coupon = coupon.copyWith(isSelected: false);
  //     couponListResponse.elgibleOfferInfo[index] = coupon;
  //     //  notifyListeners();
  //     _updateItineraryDetailsState(value);
  //     navigatorPopScreen(context);
  //   });
  // }

  Future<void> removeCoupon(
    String itineraryId,
    String promoCode,
  ) async {
    removeCouponState = ADResponseState.loading();
    notifyListeners();
    final ApplyCouponRequest applyCouponRequest = ApplyCouponRequest(
      itineraryId,
      promoCode,
      isCCFRequired: false,
    );
    await _flightBookingRepository
        .removeCoupon(applyCouponRequest: applyCouponRequest)
        .then((value) {
      Analytics.flightBookingGAObject?[Parameters.coupon.name] = '';
      Analytics.flightBookingGAObject?[Parameters.coupon_value.name] = '';
      removeCouponState = ADResponseState.completed(value);
      _updateItineraryDetailsState(value);
    });
  }

  void updateReviewModelfromCoupon(
    FlightViewItineraryResponseModel flightViewItineraryResponseModelFromCoupon,
  ) {
    reviewDetails = ADResponseState.loading();
    reviewDetails.data = flightViewItineraryResponseModelFromCoupon;
    reviewDetails =
        ADResponseState.completed(flightViewItineraryResponseModelFromCoupon);
    flightViewItineraryResponseModel =
        flightViewItineraryResponseModelFromCoupon;
    notifyListeners();
  }

  ///It will fetch grid offer data
  Future<void> getAllOffers() async {
    final Map<String, dynamic> queryParameters = {
      'language': 'en',
      'StoreType': '',
      'AirportCode': airportPrefixName().toString(),
      'isBankOffer': true,
      'LOB': 'flightbooking',
    };

    final value = await _flightBookingRepositorySitecore.fetchOffers(
      queryParameters: queryParameters,
    );
    filteredOfferList = (value.data as OfferItems).result;
  }

  String? airportPrefixName() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty == false
        ? selectedAirportsData?.airportPrefixName
        : 'adani-one-airport';
  }
}
