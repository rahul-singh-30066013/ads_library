/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_status_history_details_response.freezed.dart';
part 'duty_free_status_history_details_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeStatusHistoryDetailsResponse
    with _$DutyFreeStatusHistoryDetailsResponse {
  const factory DutyFreeStatusHistoryDetailsResponse({
    @Default('') String status,
    @Default('') String createdOn,
  }) = _DutyFreeStatusHistoryDetailsResponse;

  factory DutyFreeStatusHistoryDetailsResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeStatusHistoryDetailsResponseFromJson(json);
}
