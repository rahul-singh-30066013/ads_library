// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromoCodeResponse _$$_PromoCodeResponseFromJson(Map<String, dynamic> json) =>
    _$_PromoCodeResponse(
      promoCode: json['promoCode'] as String?,
      offerValue: (json['offerValue'] as num?)?.toDouble(),
      promoValueType: json['promoValueType'] as String?,
    );

Map<String, dynamic> _$$_PromoCodeResponseToJson(
        _$_PromoCodeResponse instance) =>
    <String, dynamic>{
      'promoCode': instance.promoCode,
      'offerValue': instance.offerValue,
      'promoValueType': instance.promoValueType,
    };
