/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/story_view_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class FlightCouponState extends ADBaseViewModel {
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();

  ADResponseState couponListState = ADResponseState.loading();

  CouponListResponse couponListResponse = const CouponListResponse();

  ADResponseState reviewDetailsState = ADResponseState.init();

  FlightViewItineraryResponseModel? flightViewItineraryResponseModel;

  bool isCouponAppliedFromInput = false;

  Future<void> getCouponListApi(String itineraryId) async {
    await _flightBookingRepository.getCouponList(itineraryId).then((value) {
      _updateResponseCouponList(value);
    });
  }

  ///It will update get profile ADResponseState
  void _updateResponseCouponList(ADResponseState response) {
    if (response.viewStatus == Status.complete) {
      couponListState = response;
      couponListResponse = couponListState.data;
      notifyListeners();
    }
  }

  Future<ADResponseState> applyCoupon(
    String itineraryId,
    String promoCode,
    int index,
    String promoDescription,
    BuildContext context,
  ) async {
    reviewDetailsState = ADResponseState.loading();
    notifyListeners();
    CouponDetails? coupon;
    if (index == -1) {
      isCouponAppliedFromInput = true;
    } else {
      coupon = couponListResponse.elgibleOfferInfo[index];
      coupon = coupon.copyWith(isSelected: true);
      couponListResponse.elgibleOfferInfo[index] = coupon;
    }
    notifyListeners();
    final ApplyCouponRequest applyCouponRequest = ApplyCouponRequest(
      itineraryId,
      promoCode,
      isCCFRequired: false,
    );

    ///GA Offers coupon apply
    GaEvent.getInstance()
        .offersCouponApplyEvent(promoDescription, promoCode, 'book_flight');
    ClickEvents.book_flight_coupon_applied
        .logEvent(parameters: GaEvent.getInstance().parameterMap);

    await _flightBookingRepository
        .applyCoupon(applyCouponRequest: applyCouponRequest)
        .then((value) {
      if (value.viewStatus == Status.error) {
        if (index == -1) {
          selectedCouponNotFound.value = two;
        } else {
          getView(
            context: context,
            dialogEnm: DialogTypeEnm.toast,
            message: value.message,
            backgroundColor: context.adColors.blackTextColor,
          );
        }

        isCouponAppliedFromInput = false;

        ///GA Offers coupon error
        GaEvent.getInstance()
            .offersCouponApplyErrorEvent(value.message, value.errorCode);
        ClickEvents.offers_coupon_code_error
            .logEvent(parameters: GaEvent.getInstance().parameterMap);
        reviewDetailsState = value;

        /// value will be false case of coupon apply from list
        if (index != -1) {
          coupon = couponListResponse.elgibleOfferInfo[index];
          coupon = coupon?.copyWith(isSelected: false);
          couponListResponse.elgibleOfferInfo[index] =
              coupon ?? const CouponDetails();
        }
        notifyListeners();
      } else {
        if (index == -1) {
          isCouponAppliedFromInput = false;
        } else {
          coupon = coupon?.copyWith(isSelected: false);
          couponListResponse.elgibleOfferInfo[index] =
              coupon ?? const CouponDetails();
        }
        reviewDetailsState = value;
        flightViewItineraryResponseModel = reviewDetailsState.data;
        notifyListeners();
      }
    });
    return reviewDetailsState;
  }

  /// this code is for coupon

  TextEditingController applyCouponController = TextEditingController();

  /// this is use for update error and value
  ValueNotifier<int> selectedCouponNotFound = ValueNotifier(0);
  ValueNotifier<String> applyButtonEnableNotifier = ValueNotifier('');
  ValueNotifier<String> couponTextErrorNotifier = ValueNotifier('');
  // ValueNotifier<bool> couponTextChangeNotifier = ValueNotifier(false);

  void cancelIconClick() {
    couponTextErrorNotifier.value = '';
    applyCouponController.clear();
    selectedCouponNotFound.value = 0;
    applyButtonEnableNotifier.value = '';
  }
}
