/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_order_cancellation_response.freezed.dart';
part 'duty_free_order_cancellation_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeOrderCancellationResponse
    with _$DutyFreeOrderCancellationResponse {
  const factory DutyFreeOrderCancellationResponse({
     String? message,
     String? status,

  }) = _DutyFreeOrderCancellationResponse;

  factory DutyFreeOrderCancellationResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeOrderCancellationResponseFromJson(json);
}
