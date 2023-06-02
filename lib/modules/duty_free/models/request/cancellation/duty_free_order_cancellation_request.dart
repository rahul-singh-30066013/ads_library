/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_order_cancellation_request.freezed.dart';
part 'duty_free_order_cancellation_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeOrderCancellationRequest with _$DutyFreeOrderCancellationRequest {
  const factory DutyFreeOrderCancellationRequest({
    @Default('') String? reason,
    @Default('') String? orderReferenceId,
  }) = _DutyFreeOrderCancellationRequest;

  factory DutyFreeOrderCancellationRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeOrderCancellationRequestFromJson(json);
}
