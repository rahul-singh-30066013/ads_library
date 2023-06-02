/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_product_promotion_model.freezed.dart';
part 'duty_free_product_promotion_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeProductPromotionModel with _$DutyFreeProductPromotionModel {
  const factory DutyFreeProductPromotionModel({
    @Default('') String code,
    @Default(0) int quantity,
    @Default(0) int type,
    @Default('') String offer,
    @Default('') String displayText,
    @Default('') String tc,
    @Default(0) num discountPrice,
    @Default(0) num offerPrice,
  }) = _DutyFreeProductPromotionModel;

  factory DutyFreeProductPromotionModel.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeProductPromotionModelFromJson(json);
}
