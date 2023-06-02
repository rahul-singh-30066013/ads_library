// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pranaam_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PranaamBannerModel _$$_PranaamBannerModelFromJson(
        Map<String, dynamic> json) =>
    _$_PranaamBannerModel(
      upSellLink: (json['upSellLink'] as List<dynamic>?)
          ?.map((e) => UpSellLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      offerLink: (json['offerLink'] as List<dynamic>?)
          ?.map((e) => UpSellLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PranaamBannerModelToJson(
        _$_PranaamBannerModel instance) =>
    <String, dynamic>{
      'upSellLink': instance.upSellLink,
      'offerLink': instance.offerLink,
    };

_$_UpSellLink _$$_UpSellLinkFromJson(Map<String, dynamic> json) =>
    _$_UpSellLink(
      appBannerURL: json['appBannerURL'] as String? ?? '',
      lob: json['lob'] as String? ?? '',
      serviceAirport: json['serviceAirport'] as String? ?? '',
      serviceType: json['serviceType'] as String? ?? '',
      offerUniqueID: json['offerUniqueID'] as String? ?? '',
      redirectUrl: json['redirectUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$_UpSellLinkToJson(_$_UpSellLink instance) =>
    <String, dynamic>{
      'appBannerURL': instance.appBannerURL,
      'lob': instance.lob,
      'serviceAirport': instance.serviceAirport,
      'serviceType': instance.serviceType,
      'offerUniqueID': instance.offerUniqueID,
      'redirectUrl': instance.redirectUrl,
    };
