// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_product_promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeProductPromotionModel _$$_DutyFreeProductPromotionModelFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeProductPromotionModel(
      code: json['code'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
      offer: json['offer'] as String? ?? '',
      displayText: json['displayText'] as String? ?? '',
      tc: json['tc'] as String? ?? '',
      discountPrice: json['discountPrice'] as num? ?? 0,
      offerPrice: json['offerPrice'] as num? ?? 0,
    );

Map<String, dynamic> _$$_DutyFreeProductPromotionModelToJson(
        _$_DutyFreeProductPromotionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'quantity': instance.quantity,
      'type': instance.type,
      'offer': instance.offer,
      'displayText': instance.displayText,
      'tc': instance.tc,
      'discountPrice': instance.discountPrice,
      'offerPrice': instance.offerPrice,
    };
