// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartPromotion _$$_CartPromotionFromJson(Map<String, dynamic> json) =>
    _$_CartPromotion(
      promotionType: json['promotionType'] as int? ?? 0,
      promotionQty: json['promotionQty'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
      offer: json['offer'] as num?,
    );

Map<String, dynamic> _$$_CartPromotionToJson(_$_CartPromotion instance) =>
    <String, dynamic>{
      'promotionType': instance.promotionType,
      'promotionQty': instance.promotionQty,
      'type': instance.type,
      'offer': instance.offer,
    };
