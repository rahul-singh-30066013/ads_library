// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_retrieve_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyRetrieveMemberModel _$$_LoyaltyRetrieveMemberModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyRetrieveMemberModel(
      mobileNumber: json['mobileNumber'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      referralCode: json['referralCode'] as String? ?? '',
      referralLink: json['referralLink'] as String? ?? '',
    );

Map<String, dynamic> _$$_LoyaltyRetrieveMemberModelToJson(
        _$_LoyaltyRetrieveMemberModel instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'referralCode': instance.referralCode,
      'referralLink': instance.referralLink,
    };
