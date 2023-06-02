import 'package:freezed_annotation/freezed_annotation.dart';
part 'cab_booking_coupon_response.g.dart';

part 'cab_booking_coupon_response.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CabBookingCouponResponse with _$CabBookingCouponResponse {
  const factory CabBookingCouponResponse(
    List<CabBookingCoupon> promoDetails,
  ) = _CabBookingCouponResponse;

  factory CabBookingCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CabBookingCouponResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CabBookingCoupon with _$CabBookingCoupon {
  const factory CabBookingCoupon({
    @Default(0) int promoId,
    @Default('') String promoName,
    @Default('') String promoDescription,
    @Default('') String promoStatus,
    @Default('') String promoStaticPromoCode,
    @Default(0) num pcmPercentage,
    @Default('') String promoTermsAndCondition,
    @Default(false) bool? eligible,
    @Default('') String pcmPromoImgUrl,
    @Default('') String promoExpiryDate,
    @Default(false) bool? isSelected,
    @Default(Recommendations()) Recommendations recommendations,
  }) = _CabBookingCoupon;

  factory CabBookingCoupon.fromJson(Map<String, dynamic> json) =>
      _$CabBookingCouponFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Recommendations with _$Recommendations {
  const factory Recommendations({
    @Default('') String amount,
  }) = _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);
}
