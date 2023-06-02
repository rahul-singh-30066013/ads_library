/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_potential_request_model.freezed.dart';
part 'loyalty_potential_request_model.g.dart';

@freezed
class LoyaltyPotentialRequestModel with _$LoyaltyPotentialRequestModel {
  const factory LoyaltyPotentialRequestModel({
    String? businessSubType,
    String? promoCode,
    num? nonLoyaltyPaymentAmount,
    num? taxableAmount,
    num? grossAmount,
    List<SaleItem>? saleItems,
    AdditionalFilters? additionalFilters,
  }) = _LoyaltyPotentialRequestModel;

  factory LoyaltyPotentialRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyPotentialRequestModelFromJson(json);
}

@freezed
class SaleItem with _$SaleItem {
  const factory SaleItem({
    String? productCode,
    int? quantity,
    num? unitPrice,
  }) = _SaleItem;

  factory SaleItem.fromJson(Map<String, dynamic> json) =>
      _$SaleItemFromJson(json);
}

@freezed
class AdditionalFilters with _$AdditionalFilters {
  const factory AdditionalFilters({
    bool? isInternational,
  }) = _AdditionalFilters;

  factory AdditionalFilters.fromJson(Map<String, dynamic> json) =>
      _$AdditionalFiltersFromJson(json);
}
