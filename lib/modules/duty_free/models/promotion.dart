/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';
part 'promotion.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Promotion with _$Promotion {
  const factory Promotion({
    @Default(0) int promotionType,
    @Default(0) int promotionQty,
    @Default(0) int type,
    @Default('') String offer,
  }) = _Promotions;

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);
}
