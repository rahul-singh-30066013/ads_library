/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'duty_free_cancel_order_details_response.dart';

part 'duty_free_cancel_order_sku_details.freezed.dart';
part 'duty_free_cancel_order_sku_details.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeCancelOrderSKUDetails with _$DutyFreeCancelOrderSKUDetails {
  const factory DutyFreeCancelOrderSKUDetails({
    String? bookingId,
    String? storeType,
    String? materialName,
    String? categoryName,
    String? subCategoryName,
    String? brandName,
    String? skuCode,
    String? skuName,
    int? quantity,
    num? unitPrice,
    num? totalPrice,
    num? discountedPrice,
    String? productImage,
    Promotion? promotion,
    String? skuSize,
    String? skuUnit,
    String? skuStatus,
    String? storeCode,
    String? loyaltyOffer,
    num? finalUnitPrice,
    num? totalDiscountedPrice,
    num? totalUnitPrice,
    num? preOrderDiscount,
    bool? inStock,
    int? overheadStock,
    int? availableStock,
    String? potentialPromoText,
    bool? isExclusive,
    //  ItemStatus? itemStatus,
  }) = _DutyFreeCancelOrderSKUDetails;

  factory DutyFreeCancelOrderSKUDetails.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeCancelOrderSKUDetailsFromJson(json);
}
