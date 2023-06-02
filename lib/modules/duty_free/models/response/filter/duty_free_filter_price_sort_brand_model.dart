/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_filter_price_sort_brand_model.freezed.dart';
part 'duty_free_filter_price_sort_brand_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeFilterPriceSortBrandModel
    with _$DutyFreeFilterPriceSortBrandModel {
  const factory DutyFreeFilterPriceSortBrandModel({
    @Default('') String filterTitle,
    @Default('') String filterCode,
    @Default('') String filterValue,
    @Default(false) bool multiselect,
    @Default(false) bool showInPrimery,
    @Default([]) List<DutyFreeFilterData> filterData,
  }) = _DutyFreeFilterPriceSortBrandModel;

  factory DutyFreeFilterPriceSortBrandModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DutyFreeFilterPriceSortBrandModelFromJson(json);
}
