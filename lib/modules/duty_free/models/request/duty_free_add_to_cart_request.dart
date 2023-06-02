/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_add_to_cart_request.freezed.dart';
part 'duty_free_add_to_cart_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeAddToCartRequest with _$DutyFreeAddToCartRequest {
  const factory DutyFreeAddToCartRequest({
    @Default('') String skuCode,
    @Default('') String skuName,
    @Default(0) int quantity,
    @Default(0) num unitPrice,
    @Default(0) num discountedPrice,
    @Default(0) num totalPrice,
    @Default('') String storeType,
    @Default('') String airportCode,
    @Default('') String materialName,
    @Default('') String categoryName,
    @Default('') String subCategoryName,
    @Default('') String brandName,
    @Default('') String productImage,
    @Default('') String storeCode,
    // @Default([]) List<Promotion> promotion,
  }) = _DutyFreeAddToCartRequest;

  const DutyFreeAddToCartRequest._();

  factory DutyFreeAddToCartRequest.fromDutyFreeProductDataModel(
    DutyFreeProductDataModel model,
    String terminal,
    int quantity,
  ) {
    return DutyFreeAddToCartRequest(
      quantity: quantity,
      storeCode: model.storeCode,
      skuCode: model.skuCode,
      airportCode: model.airportCode.isEmpty
          ? selectedAirportsData?.airportCode ?? ''
          : model.airportCode,
      skuName: model.skuName,
      unitPrice: model.price,
      discountedPrice: model.discountPrice,
      totalPrice: model.discountPrice > 0
          ? quantity * model.discountPrice
          : quantity * model.price,
      storeType: model.storeType.isEmpty ? terminal : model.storeType,
      materialName: model.materialGroup,
      categoryName: model.category,
      subCategoryName: model.subCategory,
      brandName: model.brand,
      productImage:
          model.productImages.isNotEmpty ? model.productImages.first : '',
    );
  }

  factory DutyFreeAddToCartRequest.fromItemDetailResponse(
    ItemDetailResponse model,
    String terminal,
    int quantity,
  ) {
    return DutyFreeAddToCartRequest(
      quantity: quantity,
      airportCode: model.airportCode,
      skuCode: model.skuCode,
      skuName: model.skuName,
      unitPrice: model.unitPrice,
      discountedPrice:
          model.discountedPrice == 0 ? model.unitPrice : model.discountedPrice,
      totalPrice: model.unitPrice - model.discountedPrice,
      storeType: model.storeType.isEmpty ? terminal : model.storeType,
      materialName: model.materialName,
      categoryName: model.categoryName,
      subCategoryName: model.subCategoryName,
      brandName: model.brandName,
      storeCode: model.storeCode,
      productImage: model.productImage,
    );
  }

  factory DutyFreeAddToCartRequest.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeAddToCartRequestFromJson(json);
}
