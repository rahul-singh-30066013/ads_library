// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeProductDataModel _$$_DutyFreeProductDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeProductDataModel(
      materialGroup: json['materialGroup'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      category: json['category'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      skuCode: json['skuCode'] as String? ?? '',
      skuName: json['skuName'] as String? ?? '',
      skuDescription: json['skuDescription'] as String? ?? '',
      itemID: json['itemID'] as String? ?? '',
      skuPlateform: json['skuPlateform'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      skuSize: json['skuSize'] as String? ?? '',
      productUrl: json['productUrl'] as String? ??
          'https://source.unsplash.com/user/c_v_r/1900x800',
      price: json['price'] as num? ?? 0,
      discountPrice: json['discountPrice'] as num? ?? 0,
      discountAmount: json['discountAmount'] as num? ?? 0,
      storeCode: json['storeCode'] as String? ?? '',
      airportStoreCode: json['airportStoreCode'] as String? ?? '',
      productName: json['productName'] as String? ?? '',
      exclusiveImage: json['exclusiveImage'] as String?,
      productDescription: json['productDescription'] as String? ?? '',
      productHighlights: (json['productHighlights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      keyIngredients: (json['keyIngredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      benefits: (json['benefits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      howToUse: json['howToUse'] as String?,
      safety:
          (json['safety'] as List<dynamic>?)?.map((e) => e as String).toList(),
      productBarcodeNumber: json['productBarcodeNumber'] as String? ?? '',
      productBarcodeImage: json['productBarcodeImage'] as String? ?? '',
      manufacturerDetails: json['manufacturerDetails'] as String? ?? '',
      countryOfOrigin: json['countryOfOrigin'] as String? ?? '',
      cancellationAndRefundPolicy:
          json['cancellationAndRefundPolicy'] as String? ?? '',
      productLength: json['productLength'] as String? ?? '',
      productWidth: json['productWidth'] as String? ?? '',
      productHeight: json['productHeight'] as String? ?? '',
      productVolume: json['productVolume'] as String? ?? '',
      productVolumeUnit: json['productVolumeUnit'] as String? ?? '',
      productWeight: json['productWeight'] as String? ?? '',
      productWeightUnit: json['productWeightUnit'] as String? ?? '',
      productGender: json['productGender'] as String? ?? '',
      productLiquorAge: json['productLiquorAge'] as String? ?? '',
      productLiquorAlchohol: json['productLiquorAlchohol'] as String? ?? '',
      availability: json['availability'] as bool? ?? true,
      sellableQuantity: json['sellableQuantity'],
      skuUnit: json['skuUnit'] as String? ?? '',
      showOnHomePage: json['showOnHomePage'] as bool? ?? false,
      popular: json['popular'] as bool? ?? false,
      newArrival: json['newArrival'] as bool? ?? false,
      isExclusive: json['isExclusive'] as bool? ?? false,
      gstin: json['gstin'] as String? ?? '',
      storeType: json['storeType'] as String? ?? '',
      targetMarket: json['targetMarket'] as String? ?? '',
      promotions: (json['promotions'] as List<dynamic>?)
              ?.map((e) => DutyFreeProductPromotionModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      productImages: (json['productImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      specifications: (json['specifications'] as List<dynamic>?)
              ?.map((e) => DutyFreeProductSpecificationModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      otherDetails: (json['otherDetails'] as List<dynamic>?)
              ?.map((e) => DutyFreeProductSpecificationModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      quantity: json['quantity'] as int? ?? 0,
      loyaltyPoints: json['loyaltyPoints'] as num? ?? 0,
      earn2XString: json['earn2XString'] as String? ?? '',
      timeStamp: json['timeStamp'] as String? ?? '',
      availableQuantity: json['availableQuantity'] as num? ?? 0,
      airportCode: json['airportCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_DutyFreeProductDataModelToJson(
        _$_DutyFreeProductDataModel instance) =>
    <String, dynamic>{
      'materialGroup': instance.materialGroup,
      'brand': instance.brand,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'skuCode': instance.skuCode,
      'skuName': instance.skuName,
      'skuDescription': instance.skuDescription,
      'itemID': instance.itemID,
      'skuPlateform': instance.skuPlateform,
      'active': instance.active,
      'skuSize': instance.skuSize,
      'productUrl': instance.productUrl,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'discountAmount': instance.discountAmount,
      'storeCode': instance.storeCode,
      'airportStoreCode': instance.airportStoreCode,
      'productName': instance.productName,
      'exclusiveImage': instance.exclusiveImage,
      'productDescription': instance.productDescription,
      'productHighlights': instance.productHighlights,
      'keyIngredients': instance.keyIngredients,
      'benefits': instance.benefits,
      'howToUse': instance.howToUse,
      'safety': instance.safety,
      'productBarcodeNumber': instance.productBarcodeNumber,
      'productBarcodeImage': instance.productBarcodeImage,
      'manufacturerDetails': instance.manufacturerDetails,
      'countryOfOrigin': instance.countryOfOrigin,
      'cancellationAndRefundPolicy': instance.cancellationAndRefundPolicy,
      'productLength': instance.productLength,
      'productWidth': instance.productWidth,
      'productHeight': instance.productHeight,
      'productVolume': instance.productVolume,
      'productVolumeUnit': instance.productVolumeUnit,
      'productWeight': instance.productWeight,
      'productWeightUnit': instance.productWeightUnit,
      'productGender': instance.productGender,
      'productLiquorAge': instance.productLiquorAge,
      'productLiquorAlchohol': instance.productLiquorAlchohol,
      'availability': instance.availability,
      'sellableQuantity': instance.sellableQuantity,
      'skuUnit': instance.skuUnit,
      'showOnHomePage': instance.showOnHomePage,
      'popular': instance.popular,
      'newArrival': instance.newArrival,
      'isExclusive': instance.isExclusive,
      'gstin': instance.gstin,
      'storeType': instance.storeType,
      'targetMarket': instance.targetMarket,
      'promotions': instance.promotions,
      'productImages': instance.productImages,
      'specifications': instance.specifications,
      'otherDetails': instance.otherDetails,
      'quantity': instance.quantity,
      'loyaltyPoints': instance.loyaltyPoints,
      'earn2XString': instance.earn2XString,
      'timeStamp': instance.timeStamp,
      'availableQuantity': instance.availableQuantity,
      'airportCode': instance.airportCode,
    };
