/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_detail_response.freezed.dart';
part 'price_detail_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PriceDetailResponse with _$PriceDetailResponse {
  const factory PriceDetailResponse({
    @Default(0) num amount,
    @Default('') String currency,
    @Default(0) num percentageDiscount,
    @Default('') String preOrderDiscountTime,
  }) = _PriceDetailResponse;

  factory PriceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PriceDetailResponseFromJson(json);
}
