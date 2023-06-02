/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_apply_coupon_request.freezed.dart';
part 'duty_free_apply_coupon_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeApplyCouponRequest with _$DutyFreeApplyCouponRequest {
  const factory DutyFreeApplyCouponRequest({
    String? promoCode,
    @Default(0) num amount,
  }) = _DutyFreeApplyCouponRequest;

  factory DutyFreeApplyCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeApplyCouponRequestFromJson(json);
}
