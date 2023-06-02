// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      productName: json['product_name'] as String?,
      actualPrice: json['actual_price'] as num?,
      discountedPrice: json['discounted_price'] as num?,
      bestOffers: (json['best_offers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cashbackOffers: (json['cashback_offers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => Specification.fromJson(e as Map<String, dynamic>))
          .toList(),
      similarProducts: (json['similar_products'] as List<dynamic>?)
          ?.map((e) =>
              ProductDetailSubProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      comboPackDeals: (json['combo_pack_deals'] as List<dynamic>?)
          ?.map((e) =>
              ProductDetailSubProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      specification: (json['specification'] as List<dynamic>?)
          ?.map((e) => Specification.fromJson(e as Map<String, dynamic>))
          .toList(),
      otherDetail: (json['other_detail'] as List<dynamic>?)
          ?.map((e) => OtherDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'images': instance.images,
      'product_name': instance.productName,
      'actual_price': instance.actualPrice,
      'discounted_price': instance.discountedPrice,
      'best_offers': instance.bestOffers,
      'cashback_offers': instance.cashbackOffers,
      'description': instance.description,
      'similar_products': instance.similarProducts,
      'combo_pack_deals': instance.comboPackDeals,
      'specification': instance.specification,
      'other_detail': instance.otherDetail,
    };

ProductDetailSubProduct _$ProductDetailSubProductFromJson(
        Map<String, dynamic> json) =>
    ProductDetailSubProduct(
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['product_name'] as String?,
      json['actual_price'] as num?,
      json['discounted_price'] as num?,
    );

Map<String, dynamic> _$ProductDetailSubProductToJson(
        ProductDetailSubProduct instance) =>
    <String, dynamic>{
      'images': instance.images,
      'product_name': instance.productName,
      'actual_price': instance.actualPrice,
      'discounted_price': instance.discountedPrice,
    };

Specification _$SpecificationFromJson(Map<String, dynamic> json) =>
    Specification(
      json['type'] as String?,
      json['content'] as String?,
    );

Map<String, dynamic> _$SpecificationToJson(Specification instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.content,
    };

OtherDetail _$OtherDetailFromJson(Map<String, dynamic> json) => OtherDetail(
      json['type'] as String?,
      json['content'] as String?,
    );

Map<String, dynamic> _$OtherDetailToJson(OtherDetail instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.content,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      json['type'] as String?,
      json['content'] as String?,
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.content,
    };
