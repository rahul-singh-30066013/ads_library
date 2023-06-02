import 'package:freezed_annotation/freezed_annotation.dart';

part 'cab_booking_apply_coupon_request.freezed.dart';
part 'cab_booking_apply_coupon_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CabBookingApplyCouponRequest with _$CabBookingApplyCouponRequest {
  const factory CabBookingApplyCouponRequest({
    @Default('') String promoCode,
    @Default(0) num amount,
  }) = _CabBookingApplyCouponRequest;

  factory CabBookingApplyCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$CabBookingApplyCouponRequestFromJson(json);
}
