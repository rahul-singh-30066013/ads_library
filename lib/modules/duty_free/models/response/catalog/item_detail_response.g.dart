// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemDetailResponse _$$_ItemDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ItemDetailResponse(
      storeType: json['storeType'] as String? ?? '',
      materialName: json['materialName'] as String? ?? '',
      categoryName: json['categoryName'] as String? ?? '',
      subCategoryName: json['subCategoryName'] as String? ?? '',
      brandName: json['brandName'] as String? ?? '',
      skuCode: json['skuCode'] as String? ?? '',
      skuName: json['skuName'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      unitPrice: json['unitPrice'] as num? ?? 0,
      totalPrice: json['totalPrice'] as num? ?? 0,
      discountedPrice: json['discountedPrice'] as num? ?? 0,
      productImage: json['productImage'] as String? ?? '',
      totalDiscountedPrice: json['totalDiscountedPrice'] as num? ?? 0,
      totalUnitPrice: json['totalUnitPrice'] as num? ?? 0,
      overheadStock: json['overheadStock'] as num? ?? 0,
      availableStock: json['availableStock'] as num? ?? 0,
      loyaltyPoints: json['loyaltyPoints'] as num? ?? 0,
      earn2XString: json['earn2XString'] as String? ?? '',
      quantities: (json['quantities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
      promotions: (json['promotions'] as List<dynamic>?)
              ?.map((e) => Promotion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promotion: json['promotion'] == null
          ? null
          : CartPromotion.fromJson(json['promotion'] as Map<String, dynamic>),
      inStock: json['inStock'] as bool? ?? true,
      storeCode: json['storeCode'] as String? ?? '',
      airportCode: json['airportCode'] as String? ?? '',
      isExclusive: json['isExclusive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ItemDetailResponseToJson(
        _$_ItemDetailResponse instance) =>
    <String, dynamic>{
      'storeType': instance.storeType,
      'materialName': instance.materialName,
      'categoryName': instance.categoryName,
      'subCategoryName': instance.subCategoryName,
      'brandName': instance.brandName,
      'skuCode': instance.skuCode,
      'skuName': instance.skuName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'discountedPrice': instance.discountedPrice,
      'productImage': instance.productImage,
      'totalDiscountedPrice': instance.totalDiscountedPrice,
      'totalUnitPrice': instance.totalUnitPrice,
      'overheadStock': instance.overheadStock,
      'availableStock': instance.availableStock,
      'loyaltyPoints': instance.loyaltyPoints,
      'earn2XString': instance.earn2XString,
      'quantities': instance.quantities,
      'promotions': instance.promotions,
      'promotion': instance.promotion,
      'inStock': instance.inStock,
      'storeCode': instance.storeCode,
      'airportCode': instance.airportCode,
      'isExclusive': instance.isExclusive,
    };
