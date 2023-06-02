import 'package:freezed_annotation/freezed_annotation.dart';

part 'cab_booking_coupon_request.freezed.dart';
part 'cab_booking_coupon_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CabBookingCouponRequest with _$CabBookingCouponRequest {
  const factory CabBookingCouponRequest({
    @Default(0) num amount,
  }) = _CabBookingCouponRequest;

  factory CabBookingCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$CabBookingCouponRequestFromJson(json);
}
