/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/apply_coupons/request_model/coupon_request.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/apply_coupons/responce_model/apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/cart_repository/cart_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class ApplyCouponState extends ADBaseViewModel {
  final CartRepository _cartRepository = CartRepository();
  ApplyCouponResponse? applyCouponResponse;

  /// Initiate loading state for api hit
  ADResponseState applyCouponDetails = ADResponseState.loading();
  final CartRepository cartRepository = CartRepository();

  ///this getPranaamCoupon
  Future<ADResponseState> getPranaamCoupon(CouponRequest couponRequest) async {
    final ADResponseState response = await _cartRepository.getPranaamCoupons(
      couponRequest.toJson(),
    );
    applyCouponDetails = response;
    applyCouponResponse = applyCouponDetails.data;
    notifyListeners();
    return response;
  }

  Future<ADResponseState> validateCoupon(
    Map<String, dynamic> requestJson,
  ) async {
    return cartRepository.validateCoupon(requestJson);
  }
}
