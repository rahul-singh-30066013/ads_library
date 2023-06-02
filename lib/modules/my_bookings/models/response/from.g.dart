// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'from.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

From _$FromFromJson(Map<String, dynamic> json) => From()
  ..locationCode = json['locationCode'] as String?
  ..terminal = json['terminal'] as String?
  ..name = json['name'] as String?
  ..city = json['city'] as String?
  ..country = json['country'] as String?;

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
      'locationCode': instance.locationCode,
      'terminal': instance.terminal,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
    };
