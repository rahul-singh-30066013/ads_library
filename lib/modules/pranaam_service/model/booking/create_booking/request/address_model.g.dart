// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      addressLine_1: json['addressLine1'] as String? ?? '',
      addressLine_2: json['addressLine2'] as String? ?? '',
      pinCode: json['postalCode'] as String? ?? '',
      countryDetails: json['country'] == null
          ? const CountryModel()
          : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
      cityDetails: json['city'] == null
          ? const CityModel()
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      stateDetails: json['stateProv'] == null
          ? const StateProvModel()
          : StateProvModel.fromJson(json['stateProv'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'addressLine1': instance.addressLine_1,
      'addressLine2': instance.addressLine_2,
      'postalCode': instance.pinCode,
      'country': instance.countryDetails.toJson(),
      'city': instance.cityDetails.toJson(),
      'stateProv': instance.stateDetails.toJson(),
    };
