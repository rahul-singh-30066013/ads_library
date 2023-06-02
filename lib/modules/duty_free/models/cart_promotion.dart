/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_promotion.freezed.dart';
part 'cart_promotion.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CartPromotion with _$CartPromotion {
  const factory CartPromotion({
    @Default(0) int promotionType,
    @Default(0) int promotionQty,
    @Default(0) int type,
    num? offer,
  }) = _CartPromotion;

  factory CartPromotion.fromJson(Map<String, dynamic> json) =>
      _$CartPromotionFromJson(json);
}
