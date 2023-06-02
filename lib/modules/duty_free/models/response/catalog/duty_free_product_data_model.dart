/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_promotion_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_specification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_product_data_model.freezed.dart';
part 'duty_free_product_data_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeProductDataModel with _$DutyFreeProductDataModel {
  const factory DutyFreeProductDataModel({
    @Default('') String materialGroup,
    @Default('') String brand,
    @Default('') String category,
    @Default('') String subCategory,
    @Default('') String skuCode,
    @Default('') String skuName,
    @Default('') String skuDescription,
    @Default('') String itemID,
    @Default('') String skuPlateform,
    @Default(false) bool active,
    @Default('') String skuSize,
    @Default('https://source.unsplash.com/user/c_v_r/1900x800')
        String productUrl,
    @Default(0) num price,
    @Default(0) num discountPrice,
    @Default(0) num discountAmount,
    @Default('') String storeCode,
    @Default('') String airportStoreCode,
    @Default('') String productName,
    String? exclusiveImage,
    @Default('') String productDescription,
    List<String>? productHighlights,
    List<String>? keyIngredients,
    List<String>? benefits,
    String? howToUse,
    List<String>? safety,
    @Default('') String productBarcodeNumber,
    @Default('') String productBarcodeImage,
    @Default('') String manufacturerDetails,
    @Default('') String countryOfOrigin,
    @Default('') String cancellationAndRefundPolicy,
    @Default('') String productLength,
    @Default('') String productWidth,
    @Default('') String productHeight,
    @Default('') String productVolume,
    @Default('') String productVolumeUnit,
    @Default('') String productWeight,
    @Default('') String productWeightUnit,
    @Default('') String productGender,
    @Default('') String productLiquorAge,
    @Default('') String productLiquorAlchohol,
    @Default(true) bool availability,
    dynamic sellableQuantity,
    @Default('') String skuUnit,
    @Default(false) bool showOnHomePage,
    @Default(false) bool popular,
    @Default(false) bool newArrival,
    @Default(false) bool isExclusive,
    @Default('') String gstin,
    @Default('') String storeType,
    @Default('') String targetMarket,
    @Default([]) List<DutyFreeProductPromotionModel> promotions,
    @Default([]) List<String> productImages,
    @Default([]) List<DutyFreeProductSpecificationModel> specifications,
    @Default([]) List<DutyFreeProductSpecificationModel> otherDetails,
    @Default(0) int quantity,
    @Default(0) num loyaltyPoints,
    @Default('') String earn2XString,
    @Default('') String timeStamp,
    @Default(0) num availableQuantity,
    @Default('') String airportCode,
  }) = _DutyFreeProductDataModel;

  factory DutyFreeProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeProductDataModelFromJson(json);

  @override
  String toString() {
    return 'Quantity==========> $quantity';
  }
}
