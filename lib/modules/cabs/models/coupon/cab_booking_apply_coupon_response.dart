/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cab_booking_apply_coupon_response.freezed.dart';

part 'cab_booking_apply_coupon_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CabBookingApplyCouponResponse with _$CabBookingApplyCouponResponse {
  const factory CabBookingApplyCouponResponse({
    CartDetail? cartDetail,
    String? cartID,
    String? currencyCode,
  }) = _CabBookingApplyCouponResponse;

  factory CabBookingApplyCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CabBookingApplyCouponResponseFromJson(json);
}
