/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_status_history_details_response.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_status_history_response.freezed.dart';
part 'duty_free_status_history_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeStatusHistoryResponse with _$DutyFreeStatusHistoryResponse {
  const factory DutyFreeStatusHistoryResponse({
    @Default([]) List<DutyFreeStatusHistoryDetailsResponse> statusHistory,
  }) = _DutyFreeStatusHistoryResponse;

  factory DutyFreeStatusHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeStatusHistoryResponseFromJson(json);
}
