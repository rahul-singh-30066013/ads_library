/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/story_view_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/mixin/apply_coupon.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_coupon_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class CabBookingCouponState extends ADBaseViewModel {
  final CabsBookingRepository cabsBookingRepository = CabsBookingRepository();

  // coupon code
  /// all these for coupon input box
  final TextEditingController applyCouponController = TextEditingController();
  ValueNotifier<int> selectedCouponNotFound = ValueNotifier(0);
  ValueNotifier<bool> applyButtonEnableNotifier = ValueNotifier(false);
  ValueNotifier<String> couponTextErrorNotifier = ValueNotifier('');
  ValueNotifier<String> couponError = ValueNotifier('');
  ADResponseState couponState = ADResponseState.loading();
  ValueNotifier<bool> isCouponApplying = ValueNotifier(false);
  bool isCouponAppliedFromInput = false;

  CouponListResponse? cabBookingCouponResponse;

  void cancelIconClick() {
    couponError.value = '';
    couponTextErrorNotifier.value = '';
    applyCouponController.clear();
    selectedCouponNotFound.value = 0;
    applyButtonEnableNotifier.value = false;
  }

  void updateProductListStatus(Status status) {
    adLog(status.toString());
    // _cabCartDetailState.viewStatus = status;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  /// get list of available coupon
  void getCoupon(
    CabBookingCouponRequest request,
    String oldAgentId,
  ) {
    couponState.viewStatus = Status.loading;
    cabsBookingRepository
        .getCoupon(dutyFreeGetCouponRequest: request, oldAgentID: oldAgentId)
        .then(
      (value) {
        updateProductListStatus(Status.complete);
        if (value.data != null) {
          couponState.viewStatus = Status.complete;
          cabBookingCouponResponse = CouponListResponse.fromJson(value.data);
        } else {
          couponState.viewStatus = Status.complete;
        }
      },
    );
  }

  Future<void> applyCoupon({
    required CabCartDetailResponseModel? cabCartDetailResponseModel,
    required BuildContext context,
    int? index,
    required num amount,
    required ApplyCoupon applyCoupon,
    required String oldAgentId,
  }) async {
    CabBookingApplyCouponRequest request = const CabBookingApplyCouponRequest();
    if (index == -1) {
      if (applyCouponController.text.trim().isNotEmpty) {
        isCouponApplying.value = true;
        isCouponAppliedFromInput = true;
        notifyListeners();
        request = request.copyWith(
          promoCode: applyCouponController.text.trim(),
          amount: amount,
        );
        CabGoogleAnalytics().sendGAParametersApplyCoupon(
          cabCartDetailResponseModel,
          applyCouponController.text,
          null,
        );
      }
    } else {
      isCouponApplying.value = true;
      request = request.copyWith(
        promoCode:
            cabBookingCouponResponse?.promoDetails[index ?? 0].couponCode ?? '',
        amount: amount,
      );
      CouponDetails couponDataItem =
          cabBookingCouponResponse?.promoDetails[index ?? 0] ??
              const CouponDetails();

      couponDataItem = couponDataItem.copyWith(isSelected: true);
      cabBookingCouponResponse?.promoDetails[index ?? 0] = couponDataItem;
      CabGoogleAnalytics().sendGAParametersApplyCoupon(
        cabCartDetailResponseModel,
        '',
        couponDataItem,
      );
      notifyListeners();
    }

    await cabsBookingRepository
        .applyCoupon(applyCouponRequest: request, oldAgentID: oldAgentId)
        .then(
      (value) async {
        isCouponAppliedFromInput = false;
        updateProductListStatus(Status.complete);
        String errorMessage = '';
        if (value.viewStatus == Status.error) {
          errorMessage = value.message ?? '';
          if (applyCouponController.text.trim().isEmpty) {
            showToast(
              context,
              errorMessage,
            );
          }
        }

        couponError.value =
            applyCouponController.text.trim().isNotEmpty ? errorMessage : '';

        if (value.data != null) {
          isCouponApplying.value = false;
          final CabBookingApplyCouponResponse applyCouponResponse =
              CabBookingApplyCouponResponse.fromJson(value.data);

          if ((applyCouponResponse.cartDetail?.promoDetails?.promoValue ?? 0)
                  .toDouble() >
              0) {
            try {
              CabGoogleAnalytics().sendGAParametersApplyCouponAppliedSuccessful(
                applyCouponResponse,
              );
              navigatorPopScreen(context);
            } catch (e) {
              adLog('message');
            }
            applyCoupon
                .applyCallBack(applyCouponResponse.cartDetail ?? CartDetail());
          }
        } else {
          isCouponApplying.value = false;

          if ((index ?? 0) >= 0) {
            CouponDetails couponDataItem =
                cabBookingCouponResponse?.promoDetails[index ?? 0] ??
                    const CouponDetails();
            couponDataItem = couponDataItem.copyWith(isSelected: false);
            cabBookingCouponResponse?.promoDetails[index ?? 0] = couponDataItem;
            CabGoogleAnalytics().sendGAParametersCabBookingCouponFailed(
              cabCartDetailResponseModel,
              '',
              couponDataItem,
              errorMessage,
            );
          } else {
            selectedCouponNotFound.value = two;
            CabGoogleAnalytics().sendGAParametersCabBookingCouponFailed(
              cabCartDetailResponseModel,
              applyCouponController.text,
              null,
              errorMessage,
            );
          }
        }

        notifyListeners();
      },
    );
  }

  void showToast(BuildContext context, String message) {
    const int duration = 3000;
    SnackBarUtil.showSnackBar(
      context,
      message,
      duration,
      EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_64 + context.k_30,
      ),
    );
  }
}
