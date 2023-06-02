// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_master_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryMasterResponseModel _$$_CountryMasterResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_CountryMasterResponseModel(
      countryMasters: (json['countryMasters'] as List<dynamic>?)
              ?.map((e) => CountryMasters.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CountryMasterResponseModelToJson(
        _$_CountryMasterResponseModel instance) =>
    <String, dynamic>{
      'countryMasters': instance.countryMasters,
    };
