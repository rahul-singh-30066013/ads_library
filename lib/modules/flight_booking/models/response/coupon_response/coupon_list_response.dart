/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_list_response.freezed.dart';
part 'coupon_list_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CouponListResponse with _$CouponListResponse {
  const factory CouponListResponse({
    @Default([]) List<CouponDetails> elgibleOfferInfo,
    @Default([]) List<CouponDetails> promoList,
    @Default([]) List<CouponDetails> promoDetails,
    @Default([]) List<CouponDetails> promoCodes,
    @Default([]) List<CouponDetails> earningPercentage,
  }) = _CouponListResponse;

  factory CouponListResponse.fromJson(Map<String, dynamic> json) =>
      _$CouponListResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CouponDetails with _$CouponDetails {
  const factory CouponDetails({
    @Default(0) int id,
    @Default('') String promoName,
    @Default('') String description,
    @Default('') String promoStatus,
    @Default('') String couponCode,
    @Default(0) num discountPercentage,
    @Default(0) num maximumDiscountAmount,
    @Default(0) num minimumBillingAmount,
    @Default(0) num caculationBasedOnAmount,
    @Default('') String promoTermsAndConditions,
    @Default('') String eligibilityAmount,
    @Default(false) bool? eligible,
    @Default(false) bool? isInstantDiscount,
    @Default('') String promoImgUrl,
    @Default('') String endDate,
    @Default('') String startDate,
    @Default(false) bool? isSelected,
    @Default('') String promoType,
    @Default(Recommendations()) Recommendations recommendations,
    @Default('') String narration,
    @Default('') String promoCode,
    @Default('') String promoDescription,
    @Default('') String promoCategory,
    @Default(0) num promoPriority,
    @Default(false) bool? international,
    @Default('') String promoTermsAndCondition,
    @Default(0) num earningPercentage,
    @Default('') String earningPercentageLob,
  }) = _CouponDetails;

  factory CouponDetails.fromJson(Map<String, dynamic> json) =>
      _$CouponDetailsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Recommendations with _$Recommendations {
  const factory Recommendations({
    @Default('') String amount,
  }) = _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);
}
