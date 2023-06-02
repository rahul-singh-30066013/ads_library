/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    PersonInfo? personInfo,
    bool? isLoyaltyMember,
    LoyaltyProfile? loyaltyProfile,
    String? fcm,
    int? organizationId,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PersonInfo with _$PersonInfo {
  const factory PersonInfo({
    String? title,
    String? firstName,
    String? middleName,
    String? lastName,
    String? dob,
    String? nationality,
    String? gender,
    String? passportNumber,
    String? passportExpiryDate,
    String? profileImage,
    String? maritalStatus,
    String? anniversary,
    String? joiningDate,
    List<Emails>? emails,
    List<Phones>? phones,
    List<Addresses>? addresses,
  }) = _PersonInfo;
  factory PersonInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonInfoFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Emails with _$Emails {
  const factory Emails({
    String? emailAddress,
    String? type,
    bool? isEmailVerified,
  }) = _Emails;
  factory Emails.fromJson(Map<String, dynamic> json) => _$EmailsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Phones with _$Phones {
  const factory Phones({
    String? number,
    String? countryCode,
    String? type,
  }) = _Phones;
  factory Phones.fromJson(Map<String, dynamic> json) => _$PhonesFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Addresses with _$Addresses {
  const factory Addresses({
    String? type,
    String? line1,
    String? line2,
    String? street,
    String? city,
    String? state,
    String? country,
    String? pinCode,
  }) = _Addresses;
  factory Addresses.fromJson(Map<String, dynamic> json) =>
      _$AddressesFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class LoyaltyProfile with _$LoyaltyProfile {
  const factory LoyaltyProfile({
    String? avaliableBalance,
    String? totalBurning,
    String? referralCode,
  }) = _LoyaltyProfile;

  factory LoyaltyProfile.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyProfileFromJson(json);
}

enum AddressType { home, billing }
