/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_coupon_response.freezed.dart';
part 'duty_free_coupon_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeCouponResponse with _$DutyFreeCouponResponse {
  const factory DutyFreeCouponResponse(
    List<CouponDataItem> coupons,
  ) = _DutyFreeCouponResponse;

  factory DutyFreeCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeCouponResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CouponDataItem with _$CouponDataItem {
  const factory CouponDataItem({
    @Default(0) int promoId,
    @Default('') String promoName,
    @Default('') String promoDescription,
    @Default('') String promoStatus,
    @Default('') String promoStaticPromoCode,
    @Default(0) int pcmPercentage,
    @Default('') String promoTermsAndCondition,
    @Default(false) bool? eligible,
    @Default('') String pcmPromoImgUrl,
    @Default('') String promoExpiryDate,
    @Default(false) bool? isSelected,
    @Default(Recommendations()) Recommendations recommendations,
  }) = _CouponDataItem;

  factory CouponDataItem.fromJson(Map<String, dynamic> json) =>
      _$CouponDataItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Recommendations with _$Recommendations {
  const factory Recommendations({
    @Default('') String amount,
  }) = _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);
}
