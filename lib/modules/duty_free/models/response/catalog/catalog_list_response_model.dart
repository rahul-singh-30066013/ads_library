/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_policy_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_list_response_model.freezed.dart';
part 'catalog_list_response_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CatalogListResponseModel with _$CatalogListResponseModel {
  const factory CatalogListResponseModel({
    @Default([]) List<DutyFreeProductDataModel> result,
    @Default(0) int count,
    @Default(null) List<DutyFreeProductDataModel>? similar,
    @Default(null) List<DutyFreeProductDataModel>? soldTogether,
    @Default(null) List<DutyFreeProductDataModel>? exclusive,
    DutyFreePolicyResponse? policy,
    @Default('') String store,
    @Default('') String collectionPoint,
  }) = _CatalogListResponseModel;

  factory CatalogListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogListResponseModelFromJson(json);
}
