// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      personInfo: json['personInfo'] == null
          ? null
          : PersonInfo.fromJson(json['personInfo'] as Map<String, dynamic>),
      isLoyaltyMember: json['isLoyaltyMember'] as bool?,
      loyaltyProfile: json['loyaltyProfile'] == null
          ? null
          : LoyaltyProfile.fromJson(
              json['loyaltyProfile'] as Map<String, dynamic>),
      fcm: json['fcm'] as String?,
      organizationId: json['organizationId'] as int?,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'personInfo': instance.personInfo,
      'isLoyaltyMember': instance.isLoyaltyMember,
      'loyaltyProfile': instance.loyaltyProfile,
      'fcm': instance.fcm,
      'organizationId': instance.organizationId,
    };

_$_PersonInfo _$$_PersonInfoFromJson(Map<String, dynamic> json) =>
    _$_PersonInfo(
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      dob: json['dob'] as String?,
      nationality: json['nationality'] as String?,
      gender: json['gender'] as String?,
      passportNumber: json['passportNumber'] as String?,
      passportExpiryDate: json['passportExpiryDate'] as String?,
      profileImage: json['profileImage'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      anniversary: json['anniversary'] as String?,
      joiningDate: json['joiningDate'] as String?,
      emails: (json['emails'] as List<dynamic>?)
          ?.map((e) => Emails.fromJson(e as Map<String, dynamic>))
          .toList(),
      phones: (json['phones'] as List<dynamic>?)
          ?.map((e) => Phones.fromJson(e as Map<String, dynamic>))
          .toList(),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Addresses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PersonInfoToJson(_$_PersonInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'passportNumber': instance.passportNumber,
      'passportExpiryDate': instance.passportExpiryDate,
      'profileImage': instance.profileImage,
      'maritalStatus': instance.maritalStatus,
      'anniversary': instance.anniversary,
      'joiningDate': instance.joiningDate,
      'emails': instance.emails,
      'phones': instance.phones,
      'addresses': instance.addresses,
    };

_$_Emails _$$_EmailsFromJson(Map<String, dynamic> json) => _$_Emails(
      emailAddress: json['emailAddress'] as String?,
      type: json['type'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
    );

Map<String, dynamic> _$$_EmailsToJson(_$_Emails instance) => <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'type': instance.type,
      'isEmailVerified': instance.isEmailVerified,
    };

_$_Phones _$$_PhonesFromJson(Map<String, dynamic> json) => _$_Phones(
      number: json['number'] as String?,
      countryCode: json['countryCode'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_PhonesToJson(_$_Phones instance) => <String, dynamic>{
      'number': instance.number,
      'countryCode': instance.countryCode,
      'type': instance.type,
    };

_$_Addresses _$$_AddressesFromJson(Map<String, dynamic> json) => _$_Addresses(
      type: json['type'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      pinCode: json['pinCode'] as String?,
    );

Map<String, dynamic> _$$_AddressesToJson(_$_Addresses instance) =>
    <String, dynamic>{
      'type': instance.type,
      'line1': instance.line1,
      'line2': instance.line2,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pinCode': instance.pinCode,
    };

_$_LoyaltyProfile _$$_LoyaltyProfileFromJson(Map<String, dynamic> json) =>
    _$_LoyaltyProfile(
      avaliableBalance: json['avaliableBalance'] as String?,
      totalBurning: json['totalBurning'] as String?,
      referralCode: json['referralCode'] as String?,
    );

Map<String, dynamic> _$$_LoyaltyProfileToJson(_$_LoyaltyProfile instance) =>
    <String, dynamic>{
      'avaliableBalance': instance.avaliableBalance,
      'totalBurning': instance.totalBurning,
      'referralCode': instance.referralCode,
    };
