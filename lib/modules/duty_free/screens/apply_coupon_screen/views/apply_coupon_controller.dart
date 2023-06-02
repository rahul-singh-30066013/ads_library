/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/confetti/confetti_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_widget_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/apply_coupons/request_model/coupon_request.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/apply_coupons/responce_model/apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/validate_coupons/request_model/validate_coupon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/apply_coupon_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///this class is for buisness logic of apply coupon screen
class ApplyCouponController extends State<ApplyCouponScreen> {
  ///this is used to get applyCoupon State
  final ApplyCouponState applyCouponViewModel = ApplyCouponState();

  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  List<Coupon> couponListData = [];
  int couponId = 0;

  @override
  void initState() {
    super.initState();
    //const int airPortId = 0;
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    applyCouponViewModel
        .getPranaamCoupon(
          CouponRequest(
            originAirportId: context
                    .read<PranaamAppDataStateManagement>()
                    .cartDataResponse
                    ?.tripDetail
                    .serviceAirportId ??
                0,
          ),
        )
        .then((value) => adLog('getCouponDetails :$value'));
  }

  /// this method is handle click listener on apply coupon code
  /*void onTap() {
    widget.cartData.updateCouponDiscount(couponCode.toDouble());
    navigatorPopScreenWithData(context, couponCode);
  }*/

  void onTap() {
    ///TODO CALL VERIFY COUPON API
    navigatorPopScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return ApplyCouponWidgetView(
      this,
      adGenericCallback: (value) => widget.adGenericCallback(value),
    );
  }

  int getCouponId(String couponCode) {
    couponListData = applyCouponViewModel.applyCouponResponse?.coupons ?? [];
    adLog('DataList...${couponListData.length}');
    for (int couponIndex = 0;
        couponIndex < couponListData.length;
        couponIndex++) {
      if (couponCode == couponListData[couponIndex].couponCode) {
        couponId = couponListData[couponIndex].id;
      }
    }
    return couponId;
  }

  void onCouponApplyClicked(
    Coupon appliedCoupon,
    BuildContext context,
  ) {
    //ProcessDialog.showLoadingDialog(context);
    if (appliedCoupon.couponCode.isNotEmpty) {
      pranaamAppDataStateManagement.updateApplyCouponState(value: true);
      applyCouponViewModel
          .validateCoupon(
            getValidateCouponRequest(appliedCoupon).toJson(),
          )
          .then((value) => onCouponResponse(value, context));
    } else {
      adLog('coupon code is empty');
      pranaamAppDataStateManagement.updateApplyCouponState(value: false);
      //ProcessDialog.closeLoadingDialog(context);
      SnackBarUtil.showSnackBar(
        context,
        'enter_coupon_code'.localize(context),
      );
    }
  }

  void onCouponApplyFillCodeClicked(
    Coupon appliedCoupon,
    BuildContext context,
  ) {
    //ProcessDialog.showLoadingDialog(context);
    if (appliedCoupon.couponCode.isNotEmpty) {
      pranaamAppDataStateManagement.updateapplyListClick(value: true);
      applyCouponViewModel
          .validateCoupon(
            getValidateCouponRequest(appliedCoupon).toJson(),
          )
          .then((value) => onCouponResponse(value, context));
    } else {
      adLog('coupon code is empty');
      pranaamAppDataStateManagement.updateapplyListClick(value: false);
      //ProcessDialog.closeLoadingDialog(context);
      SnackBarUtil.showSnackBar(
        context,
        'enter_coupon_code'.localize(context),
      );
    }
  }

  void onCouponResponse(ADResponseState adResponseState, BuildContext context) {
    //ProcessDialog.closeLoadingDialog(context);
    if (adResponseState.viewStatus == Status.complete) {
      widget.adGenericCallback(adResponseState);
      // SnackBarUtil.showSnackBar(
      //   context,
      //   '${'yay_You_saved'.localize(context)} ${FlightUtils.getAmountWithTwoDecimalPoint(
      //     pranaamAppDataStateManagement.cartDataResponse?.packageDetail
      //             .pricingInfo.discountCouponDetail.couponDiscountAmount ??
      //         0,
      //   )} ${'with_this_coupon'.localize(context)}',
      // );
      // PranaamBookingGaAnalytics().removeCouponGaAnalytics(
      //   PranaamClickEvents.book_pranaam_coupon_remove_start,
      //   context.read<PranaamAppDataStateManagement>(),
      // );

      navigatorPopScreen(context);

      final Future future = showDialog(
        context: context,
        builder: (BuildContext context) {
          PlaySound.playAudioSound('coupon_code.mp3');
          return ConfettiView(
            couponCode: pranaamAppDataStateManagement
                    .cartDataResponse
                    ?.packageDetail
                    .pricingInfo
                    .discountCouponDetail
                    .couponCode ??
                '',
            amount: pranaamAppDataStateManagement
                    .cartDataResponse
                    ?.packageDetail
                    .pricingInfo
                    .discountCouponDetail
                    .couponDiscountAmount ??
                0,
            couponMessage: '',
          );
        },
      );

      /// book_pranaam_coupon event
      PranaamBookingGaAnalytics().applyCouponCodeGaAnalytics(
        context.read<PranaamAppDataStateManagement>(),
      );
      adLog(future.toString());

      pranaamAppDataStateManagement
        ..updateApplyCouponState(value: false)
        ..updateapplyListClick(value: false)
        ..selectedCouponNotFound.value = ''
        ..applyButtonEnableNotifier.value = '';
    } else if (adResponseState.viewStatus == Status.error) {
      pranaamAppDataStateManagement
        ..updateApplyCouponState(value: false)
        ..updateapplyListClick(value: false);
      adLog('${adResponseState.message}');
      pranaamAppDataStateManagement.selectedCouponNotFound.value =
          adResponseState.message ??
              'Looks like you entered invalid coupon. Please try again.';
      pranaamAppDataStateManagement.applyButtonEnableNotifier.value =
          adResponseState.message ??
              'Looks like you entered invalid coupon. Please try again.';

      ///GA Offers coupon error
      final map = GaEvent.getInstance().parameterMap;
      map[Parameters.error_text.name] = adResponseState.message ??
          'Looks like you entered invalid coupon. Please try again.';
      map[Parameters.error_code.name] = adResponseState.errorCode ?? '';
      ClickEvents.offers_coupon_code_error.logEvent(parameters: map);
    } else {
      pranaamAppDataStateManagement
        ..updateApplyCouponState(value: false)
        ..updateapplyListClick(value: false);
      SnackBarUtil.showSnackBar(
        context,
        'somethingWentWrong'.localize(context),
      );
    }
  }

  ValidateCoupon getValidateCouponRequest(Coupon appliedCoupon) {
    return ValidateCoupon(
      userId: pranaamAppDataStateManagement.cartDataResponse?.userId ?? '',
      packageId: context
              .read<PranaamAppDataStateManagement>()
              .cartDataResponse
              ?.packageDetail
              .packageId ??
          0,
      couponId: appliedCoupon.id,
      couponCode: appliedCoupon.couponCode,
      adultCount:
          pranaamAppDataStateManagement.serviceBookingData.travellers?.adults ??
              1,
      childCount: pranaamAppDataStateManagement
              .serviceBookingData.travellers?.children ??
          0,
      infantCount: pranaamAppDataStateManagement
              .serviceBookingData.travellers?.infants ??
          0,
      inputLanguage: 'English',
      isMerchantFunded: appliedCoupon.isMerchantFunded,
      pcmPercentage: appliedCoupon.pcmPercentage,
    );
  }
}
