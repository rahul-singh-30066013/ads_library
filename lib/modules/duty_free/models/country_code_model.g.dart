// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCodeModel _$CountryCodeModelFromJson(Map<String, dynamic> json) =>
    CountryCodeModel(
      countryCodes: (json['countryCodes'] as List<dynamic>)
          .map((e) => CountryCodeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryCodeModelToJson(CountryCodeModel instance) =>
    <String, dynamic>{
      'countryCodes': instance.countryCodes,
    };

CountryCodeData _$CountryCodeDataFromJson(Map<String, dynamic> json) =>
    CountryCodeData(
      countryCode: json['country_code'] as String?,
      name: json['name'] as String?,
      callingCode: json['calling_code'] as String?,
      flag: json['flag'] as String?,
      max: json['max'] as String?,
      min: json['min'] as String?,
    );

Map<String, dynamic> _$CountryCodeDataToJson(CountryCodeData instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'name': instance.name,
      'calling_code': instance.callingCode,
      'flag': instance.flag,
      'max': instance.max,
      'min': instance.min,
    };
