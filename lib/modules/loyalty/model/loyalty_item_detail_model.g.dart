// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_item_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyItemDetailModel _$$_LoyaltyItemDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyItemDetailModel(
      loyaltyItemDetailData: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  LoyaltyItemDetailData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LoyaltyItemDetailModelToJson(
        _$_LoyaltyItemDetailModel instance) =>
    <String, dynamic>{
      'data': instance.loyaltyItemDetailData,
    };

_$_LoyaltyItemDetailData _$$_LoyaltyItemDetailDataFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyItemDetailData(
      name: json['name'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LoyaltyItemDetailDataToJson(
        _$_LoyaltyItemDetailData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
    };
