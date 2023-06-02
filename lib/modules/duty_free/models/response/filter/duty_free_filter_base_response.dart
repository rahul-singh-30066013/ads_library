/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_result_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_filter_base_response.freezed.dart';
part 'duty_free_filter_base_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeFilterBaseResponse with _$DutyFreeFilterBaseResponse {
  const factory DutyFreeFilterBaseResponse({
    @Default(0) int count,
    @Default(DutyFreeFilterResultModel()) DutyFreeFilterResultModel result,
  }) = _DutyFreeFilterBaseResponse;

  factory DutyFreeFilterBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeFilterBaseResponseFromJson(json);
}
