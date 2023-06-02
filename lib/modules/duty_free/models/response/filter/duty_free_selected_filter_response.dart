/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_selected_filter_response.freezed.dart';
part 'duty_free_selected_filter_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeSelectedFilterResponse with _$DutyFreeSelectedFilterResponse {
  const factory DutyFreeSelectedFilterResponse({
    @Default('') String materialGroupTitle,
    @Default('') String materialGroup,
    @Default([]) List<String> category,
    @Default([]) List<String> subCategory,
    @Default([]) List<String> brand,
    @Default([]) List<String> skuCode,
    @Default([]) List<String> offers,
  }) = _DutyFreeSelectedFilterResponse;

  factory DutyFreeSelectedFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeSelectedFilterResponseFromJson(json);
}
