/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_coupon_response.freezed.dart';
part 'apply_coupon_response.g.dart';

///this class is used getFinal response of applyCoupon response
@Freezed(makeCollectionsUnmodifiable: false)
class ApplyCouponResponse with _$ApplyCouponResponse {
  const factory ApplyCouponResponse({
    @Default([]) List<Coupon> coupons,
  }) = _ApplyCouponResponse;

  factory ApplyCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplyCouponResponseFromJson(json);
}

//TODO: Rahul - Need to change this to num
///this class is used getCouponList from applyCoupon Response
@Freezed(makeCollectionsUnmodifiable: false)
class Coupon with _$Coupon {
  const factory Coupon({
    @Default(0) int id,
    @Default(0) int originAirportId,
    @Default('') String couponCode,
    @Default(0) int couponTypeId,
    @Default('') String promoTermsAndCondition,
    @Default('') String promoName,
    @Default('') String description,
    String? startDate,
    String? endDate,
    @Default('') String bookingEndDate,
    @Default(0) num discountValue,
    @Default(0) num maxDiscountAmount,
    @Default(0) num minimumBillingAmount,
    @Default(false) bool isActive,
    @Default(false) bool isSelected,
    @Default(false) bool isMerchantFunded,
    @Default(0) num pcmPercentage,
    @Default('') String pcmPromoImgUrl,
    @Default(Recommendations()) Recommendations recommendations,
    @Default(false) bool? eligible,
  }) = _Coupon;
  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Recommendations with _$Recommendations {
  const factory Recommendations({
    @Default('') String amount,
  }) = _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);
}
