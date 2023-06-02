/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'reschedule_response.freezed.dart';
part 'reschedule_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class RescheduleResponse with _$RescheduleResponse {
  const factory RescheduleResponse({
    @Default('') String description,
  }) = _RescheduleResponse;

  factory RescheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$RescheduleResponseFromJson(json);
}
