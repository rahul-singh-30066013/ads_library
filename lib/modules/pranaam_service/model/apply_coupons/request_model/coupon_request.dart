/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_request.freezed.dart';
part 'coupon_request.g.dart';

///this class is used send request in getCouponList API
@Freezed(makeCollectionsUnmodifiable: false)
class CouponRequest with _$CouponRequest {
  const factory CouponRequest({
    required int originAirportId,
  }) = _CouponRequest;
  factory CouponRequest.fromJson(Map<String, dynamic> json) =>
      _$CouponRequestFromJson(json);
}
