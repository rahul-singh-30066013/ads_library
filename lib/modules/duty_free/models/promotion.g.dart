// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Promotions _$$_PromotionsFromJson(Map<String, dynamic> json) =>
    _$_Promotions(
      promotionType: json['promotionType'] as int? ?? 0,
      promotionQty: json['promotionQty'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
      offer: json['offer'] as String? ?? '',
    );

Map<String, dynamic> _$$_PromotionsToJson(_$_Promotions instance) =>
    <String, dynamic>{
      'promotionType': instance.promotionType,
      'promotionQty': instance.promotionQty,
      'type': instance.type,
      'offer': instance.offer,
    };
