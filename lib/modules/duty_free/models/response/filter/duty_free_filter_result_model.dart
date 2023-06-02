/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_category_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_price_sort_brand_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_material_group_banner.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_selected_filter_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_filter_result_model.freezed.dart';
part 'duty_free_filter_result_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeFilterResultModel with _$DutyFreeFilterResultModel {
  const factory DutyFreeFilterResultModel({
    @Default([]) List<DutyFreeFilterCategoryModel> categories,
    @Default(DutyFreeFilterPriceSortBrandModel())
        DutyFreeFilterPriceSortBrandModel price,
    @Default(DutyFreeFilterPriceSortBrandModel())
        DutyFreeFilterPriceSortBrandModel sort,
    @Default(DutyFreeFilterPriceSortBrandModel())
        DutyFreeFilterPriceSortBrandModel brands,
    @Default(DutyFreeFilterPriceSortBrandModel())
        DutyFreeFilterPriceSortBrandModel offers,
    DutyFreeFilterPriceSortBrandModel? exclusive,
    @Default(DutyFreeFilterPriceSortBrandModel())
        DutyFreeFilterPriceSortBrandModel includeOOS,
    DutyFreeMaterialGroupBanner? materialGroupBanner,
    DutyFreeSelectedFilterResponse? selectedFilter,
  }) = _DutyFreeFilterResultModel;

  factory DutyFreeFilterResultModel.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeFilterResultModelFromJson(json);
}
