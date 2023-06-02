/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_product_list_request.freezed.dart';
part 'duty_free_product_list_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeProductListRequest with _$DutyFreeProductListRequest {
  const factory DutyFreeProductListRequest({
    @Default('') String? materialGroup,
    @Default('') String? language,
    @Default([]) List<String>? category,
    @Default([]) List<String>? brand,
    @Default([]) List<String>? subCategory,
    @Default([]) List<String>? skuCode,
    @Default([]) List<String>? offers,
    @Default(false) bool restricted,
    int? page,
    int? pageSize,
    @Default('app') String? channel,
    @Default('') String airportCode,
    @Default('departure') String storeType,
    @Default('') String sort,
    @Default(null) num? minPrice,
    @Default(null) num? maxPrice,
    @Default('') String? pageType,
    String? slug,
    bool? showOnHomepage,
    @Default(false) bool exclusive,
    @Default(false) bool includeOOS,
  }) = _DutyFreeProductListRequest;

  factory DutyFreeProductListRequest.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeProductListRequestFromJson(json);
}
