// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_offer_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInOfferListResponse _$$_SignInOfferListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SignInOfferListResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SignInOffer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SignInOfferListResponseToJson(
        _$_SignInOfferListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_SignInOffer _$$_SignInOfferFromJson(Map<String, dynamic> json) =>
    _$_SignInOffer(
      promoCode: json['promoCode'] as String? ?? '',
      promoName: json['promoName'] as String? ?? '',
      promoDescription: json['promoDescription'] as String? ?? '',
      promoPercentage: json['promoPercentage'] as num? ?? 0,
      promoCappingValue: json['promoCappingValue'] as num? ?? 0,
      promoCategory: json['promoCategory'] as String? ?? '',
      promoPriority: json['promoPriority'] as num? ?? 0,
      isInternational: json['isInternational'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SignInOfferToJson(_$_SignInOffer instance) =>
    <String, dynamic>{
      'promoCode': instance.promoCode,
      'promoName': instance.promoName,
      'promoDescription': instance.promoDescription,
      'promoPercentage': instance.promoPercentage,
      'promoCappingValue': instance.promoCappingValue,
      'promoCategory': instance.promoCategory,
      'promoPriority': instance.promoPriority,
      'isInternational': instance.isInternational,
    };
