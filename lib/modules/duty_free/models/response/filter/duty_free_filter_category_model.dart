/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_filter_category_model.freezed.dart';
part 'duty_free_filter_category_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeFilterCategoryModel with _$DutyFreeFilterCategoryModel {
  const factory DutyFreeFilterCategoryModel({
    @Default('') String filterTitle,
    @Default('') String filterCode,
    @Default('') String filterValue,
    @Default(0.0) double minValue,
    @Default(0.0) double maxValue,
    @Default(false) bool multiselect,
    @Default(false) bool showInPrimery,
    @Default([]) List<DutyFreeFilterData> filterData,
    // @Default([]) List<DutyFreeBrand> brands,
  }) = _DutyFreeFilterCategoryModel;

  factory DutyFreeFilterCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeFilterCategoryModelFromJson(json);
}
