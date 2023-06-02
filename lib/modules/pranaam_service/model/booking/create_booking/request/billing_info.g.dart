// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillingInfo _$$_BillingInfoFromJson(Map<String, dynamic> json) =>
    _$_BillingInfo(
      personName: json['personName'] == null
          ? const PersonNameModel()
          : PersonNameModel.fromJson(
              json['personName'] as Map<String, dynamic>),
      countryDialCode: json['countryDialCode'] as String? ?? '',
      mobileNumber: json['mobile'] as String? ?? '',
      birthDate: json['birthDate'] as String? ?? '',
      emailId: json['email'] as String? ?? ' ',
      addressModel: json['address'] == null
          ? const AddressModel()
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      billingGstInModel: json['billingGSTIN'] == null
          ? const BillingGstInModel()
          : BillingGstInModel.fromJson(
              json['billingGSTIN'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BillingInfoToJson(_$_BillingInfo instance) =>
    <String, dynamic>{
      'personName': instance.personName.toJson(),
      'countryDialCode': instance.countryDialCode,
      'mobile': instance.mobileNumber,
      'birthDate': instance.birthDate,
      'email': instance.emailId,
      'address': instance.addressModel.toJson(),
      'billingGSTIN': instance.billingGstInModel.toJson(),
    };
