// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_gst_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillingGstInModel _$$_BillingGstInModelFromJson(Map<String, dynamic> json) =>
    _$_BillingGstInModel(
      gstNumber: json['gstNumber'] as String? ?? '',
      gstName: json['name'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      emailId: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      pinCode: json['pinCode'] as int? ?? 0,
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

Map<String, dynamic> _$$_BillingGstInModelToJson(
        _$_BillingGstInModel instance) =>
    <String, dynamic>{
      'gstNumber': instance.gstNumber,
      'name': instance.gstName,
      'mobileNumber': instance.mobileNumber,
      'email': instance.emailId,
      'address': instance.address,
      'pinCode': instance.pinCode,
      'country': instance.countryDetails.toJson(),
      'city': instance.cityDetails.toJson(),
      'stateProv': instance.stateDetails.toJson(),
    };
