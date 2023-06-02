// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_masters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryMasters _$$_CountryMastersFromJson(Map<String, dynamic> json) =>
    _$_CountryMasters(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      dialCode: json['dialCode'] as String? ?? '',
      isO3: json['isO3'] as String? ?? '',
      isO2: json['isO2'] as String? ?? '',
      currencyName: json['currencyName'] as String? ?? '',
      currencyCode: json['currencyCode'] as String? ?? '',
      untermEnglishFormal: json['untermEnglishFormal'] as String? ?? '',
      regionName: json['regionName'] as String? ?? '',
      capital: json['capital'] as String? ?? '',
      continent: json['continent'] as String? ?? '',
      tld: json['tld'] as String? ?? '',
      languages: json['languages'] as String? ?? '',
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CountryMastersToJson(_$_CountryMasters instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dialCode': instance.dialCode,
      'isO3': instance.isO3,
      'isO2': instance.isO2,
      'currencyName': instance.currencyName,
      'currencyCode': instance.currencyCode,
      'untermEnglishFormal': instance.untermEnglishFormal,
      'regionName': instance.regionName,
      'capital': instance.capital,
      'continent': instance.continent,
      'tld': instance.tld,
      'languages': instance.languages,
      'isDeleted': instance.isDeleted,
    };
