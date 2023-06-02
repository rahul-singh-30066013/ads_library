// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_product_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeProductFilterRequest _$$_DutyFreeProductFilterRequestFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeProductFilterRequest(
      materialGroup: json['materialGroup'] as String? ?? 'Liquor',
      language: json['language'] as String? ?? 'en',
      restricted: json['restricted'] as bool? ?? false,
      channel: json['channel'] as String? ?? 'app',
      storeType: json['storeType'] as String? ?? '',
      airportCode: json['airportCode'] as String? ?? '',
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$_DutyFreeProductFilterRequestToJson(
        _$_DutyFreeProductFilterRequest instance) =>
    <String, dynamic>{
      'materialGroup': instance.materialGroup,
      'language': instance.language,
      'restricted': instance.restricted,
      'channel': instance.channel,
      'storeType': instance.storeType,
      'airportCode': instance.airportCode,
      'slug': instance.slug,
    };
