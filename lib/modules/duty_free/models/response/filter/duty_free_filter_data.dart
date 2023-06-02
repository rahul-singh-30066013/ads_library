/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_filter_data.freezed.dart';
part 'duty_free_filter_data.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeFilterData with _$DutyFreeFilterData {
  const factory DutyFreeFilterData({
    @Default('') String title,
    @Default('') String code,
    @Default('') String imageSrc,
    @Default(false) bool filterSelected,
    @Default('') String filterValue,
  }) = _DutyFreeFilterData;

  factory DutyFreeFilterData.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeFilterDataFromJson(json);
}
