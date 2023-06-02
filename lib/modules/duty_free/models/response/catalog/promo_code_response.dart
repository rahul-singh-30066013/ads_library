/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_code_response.freezed.dart';
part 'promo_code_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PromoCodeResponse with _$PromoCodeResponse {
  const factory PromoCodeResponse({
    String? promoCode,
    double? offerValue,
    String? promoValueType,
  }) = _PromoCodeResponse;

  factory PromoCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeResponseFromJson(json);
}
