/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_apply_coupon_response.freezed.dart';
part 'duty_free_apply_coupon_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeApplyCouponResponse with _$DutyFreeApplyCouponResponse {
  const factory DutyFreeApplyCouponResponse() = _DutyFreeApplyCouponResponse;

  factory DutyFreeApplyCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeApplyCouponResponseFromJson(json);
}
