// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_add_to_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeAddToCartRequest _$$_DutyFreeAddToCartRequestFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeAddToCartRequest(
      skuCode: json['skuCode'] as String? ?? '',
      skuName: json['skuName'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      unitPrice: json['unitPrice'] as num? ?? 0,
      discountedPrice: json['discountedPrice'] as num? ?? 0,
      totalPrice: json['totalPrice'] as num? ?? 0,
      storeType: json['storeType'] as String? ?? '',
      airportCode: json['airportCode'] as String? ?? '',
      materialName: json['materialName'] as String? ?? '',
      categoryName: json['categoryName'] as String? ?? '',
      subCategoryName: json['subCategoryName'] as String? ?? '',
      brandName: json['brandName'] as String? ?? '',
      productImage: json['productImage'] as String? ?? '',
      storeCode: json['storeCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_DutyFreeAddToCartRequestToJson(
        _$_DutyFreeAddToCartRequest instance) =>
    <String, dynamic>{
      'skuCode': instance.skuCode,
      'skuName': instance.skuName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'discountedPrice': instance.discountedPrice,
      'totalPrice': instance.totalPrice,
      'storeType': instance.storeType,
      'airportCode': instance.airportCode,
      'materialName': instance.materialName,
      'categoryName': instance.categoryName,
      'subCategoryName': instance.subCategoryName,
      'brandName': instance.brandName,
      'productImage': instance.productImage,
      'storeCode': instance.storeCode,
    };
