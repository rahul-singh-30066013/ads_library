// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_active_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetActiveCartResponseModel _$$_GetActiveCartResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_GetActiveCartResponseModel(
      businessSubType: json['businessSubType'] as String? ?? '',
      businessType: json['businessType'] as String? ?? '',
      cartId: json['cartId'] as String? ?? '',
      itenaryId: json['itenaryId'] as String? ?? '',
      productType: json['productType'] as String? ?? '',
      productCount: json['productCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GetActiveCartResponseModelToJson(
        _$_GetActiveCartResponseModel instance) =>
    <String, dynamic>{
      'businessSubType': instance.businessSubType,
      'businessType': instance.businessType,
      'cartId': instance.cartId,
      'itenaryId': instance.itenaryId,
      'productType': instance.productType,
      'productCount': instance.productCount,
    };
