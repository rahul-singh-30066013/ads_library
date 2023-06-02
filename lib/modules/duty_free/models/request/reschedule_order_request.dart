/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reschedule_order_request.freezed.dart';
part 'reschedule_order_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class RescheduleOrderRequest with _$RescheduleOrderRequest {
  const factory RescheduleOrderRequest({
    @Default('') String orderReferenceId,
    @Default('') String customerID,
    @Default('') String orderDate,
    @Default('') String orderTime,
    @Default('') String reason,
    @Default('') String flightNo,
  }) = _RescheduleOrderRequest;

  factory RescheduleOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$RescheduleOrderRequestFromJson(json);
}
