/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/cart_promotion.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/promotion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_detail_response.freezed.dart';
part 'item_detail_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ItemDetailResponse with _$ItemDetailResponse {
  const factory ItemDetailResponse({
    @Default('') String storeType,
    @Default('') String materialName,
    @Default('') String categoryName,
    @Default('') String subCategoryName,
    @Default('') String brandName,
    @Default('') String skuCode,
    @Default('') String skuName,
    @Default(0) int quantity,
    @Default(0) num unitPrice,
    @Default(0) num totalPrice,
    @Default(0) num discountedPrice,
    @Default('') String productImage,
    @Default(0) num totalDiscountedPrice,
    @Default(0) num totalUnitPrice,
    @Default(0) num overheadStock,
    @Default(0) num availableStock,
    @Default(0) num loyaltyPoints,
    @Default('') String earn2XString,
    @Default(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'])
        List<String> quantities,
    @Default([]) List<Promotion> promotions,
    CartPromotion? promotion,
    @Default(true) bool inStock,
    @Default('') String storeCode,
    @Default('') String airportCode,
    @Default(false) bool isExclusive,
  }) = _ItemDetailResponse;

  factory ItemDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailResponseFromJson(json);
}
