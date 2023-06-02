/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cab_booking_cancellation_request.freezed.dart';
part 'cab_booking_cancellation_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CabBookingCancellationRequest with _$CabBookingCancellationRequest {
  const factory CabBookingCancellationRequest({
    @Default('') String? cancelReason,
    @Default('') String? orderReferenceId,
  }) = _CabBookingCancellationRequest;

  factory CabBookingCancellationRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CabBookingCancellationRequestFromJson(json);
}
