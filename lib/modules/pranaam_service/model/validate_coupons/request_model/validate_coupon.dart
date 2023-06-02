/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_coupon.freezed.dart';
part 'validate_coupon.g.dart';

/// Request model to validate coupon applied by the user in the
/// Apply coupon section
@Freezed(makeCollectionsUnmodifiable: false)
class ValidateCoupon with _$ValidateCoupon {
  const factory ValidateCoupon({
    required String userId,
    required int packageId,
    required int couponId,
    required String couponCode,
    required int adultCount,
    required int childCount,
    required int infantCount,
    required String inputLanguage,
    @Default(false) bool isMerchantFunded,
    @Default(0) num pcmPercentage,
  }) = _ValidateCoupon;

  factory ValidateCoupon.fromJson(Map<String, dynamic> json) =>
      _$ValidateCouponFromJson(json);
}
