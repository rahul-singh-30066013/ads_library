/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_product_filter_request.freezed.dart';
part 'duty_free_product_filter_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeProductFilterRequest with _$DutyFreeProductFilterRequest {
  const factory DutyFreeProductFilterRequest({
    @Default('Liquor') String materialGroup,
    @Default('en') String language,
    @Default(false) bool restricted,
    @Default('app') String channel,
    @Default('') String storeType,
    @Default('') String airportCode,
    String? slug,
  }) = _DutyFreeProductFilterRequest;

  factory DutyFreeProductFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeProductFilterRequestFromJson(json);
}
