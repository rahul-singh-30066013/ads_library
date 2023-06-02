// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placard_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlacardInfo _$$_PlacardInfoFromJson(Map<String, dynamic> json) =>
    _$_PlacardInfo(
      personName: json['personName'] == null
          ? const PersonNameModel()
          : PersonNameModel.fromJson(
              json['personName'] as Map<String, dynamic>),
      countryDialCode: json['countryDialCode'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      specialInstruction: json['specialInstruction'] as String? ?? '',
      porterName: json['porterName'] as String? ?? '',
      baggageCount: json['baggageCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PlacardInfoToJson(_$_PlacardInfo instance) =>
    <String, dynamic>{
      'personName': instance.personName.toJson(),
      'countryDialCode': instance.countryDialCode,
      'mobileNumber': instance.mobileNumber,
      'specialInstruction': instance.specialInstruction,
      'porterName': instance.porterName,
      'baggageCount': instance.baggageCount,
    };
