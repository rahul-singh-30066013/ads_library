/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_coupon_request.freezed.dart';
part 'apply_coupon_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ApplyCouponRequest with _$ApplyCouponRequest {
  const factory ApplyCouponRequest(
    String itineraryId,
    String promoCode, {
    @Default(false) bool isCCFRequired,
  }) = _ApplyCouponRequest;

  factory ApplyCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$ApplyCouponRequestFromJson(json);
}
