// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_cancel_order_sku_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeCancelOrderSKUDetails _$$_DutyFreeCancelOrderSKUDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeCancelOrderSKUDetails(
      bookingId: json['bookingId'] as String?,
      storeType: json['storeType'] as String?,
      materialName: json['materialName'] as String?,
      categoryName: json['categoryName'] as String?,
      subCategoryName: json['subCategoryName'] as String?,
      brandName: json['brandName'] as String?,
      skuCode: json['skuCode'] as String?,
      skuName: json['skuName'] as String?,
      quantity: json['quantity'] as int?,
      unitPrice: json['unitPrice'] as num?,
      totalPrice: json['totalPrice'] as num?,
      discountedPrice: json['discountedPrice'] as num?,
      productImage: json['productImage'] as String?,
      promotion: json['promotion'] == null
          ? null
          : Promotion.fromJson(json['promotion'] as Map<String, dynamic>),
      skuSize: json['skuSize'] as String?,
      skuUnit: json['skuUnit'] as String?,
      skuStatus: json['skuStatus'] as String?,
      storeCode: json['storeCode'] as String?,
      loyaltyOffer: json['loyaltyOffer'] as String?,
      finalUnitPrice: json['finalUnitPrice'] as num?,
      totalDiscountedPrice: json['totalDiscountedPrice'] as num?,
      totalUnitPrice: json['totalUnitPrice'] as num?,
      preOrderDiscount: json['preOrderDiscount'] as num?,
      inStock: json['inStock'] as bool?,
      overheadStock: json['overheadStock'] as int?,
      availableStock: json['availableStock'] as int?,
      potentialPromoText: json['potentialPromoText'] as String?,
      isExclusive: json['isExclusive'] as bool?,
    );

Map<String, dynamic> _$$_DutyFreeCancelOrderSKUDetailsToJson(
        _$_DutyFreeCancelOrderSKUDetails instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
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
      'promotion': instance.promotion,
      'skuSize': instance.skuSize,
      'skuUnit': instance.skuUnit,
      'skuStatus': instance.skuStatus,
      'storeCode': instance.storeCode,
      'loyaltyOffer': instance.loyaltyOffer,
      'finalUnitPrice': instance.finalUnitPrice,
      'totalDiscountedPrice': instance.totalDiscountedPrice,
      'totalUnitPrice': instance.totalUnitPrice,
      'preOrderDiscount': instance.preOrderDiscount,
      'inStock': instance.inStock,
      'overheadStock': instance.overheadStock,
      'availableStock': instance.availableStock,
      'potentialPromoText': instance.potentialPromoText,
      'isExclusive': instance.isExclusive,
    };
