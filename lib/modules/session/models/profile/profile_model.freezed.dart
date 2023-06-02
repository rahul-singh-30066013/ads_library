// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  PersonInfo? get personInfo => throw _privateConstructorUsedError;
  bool? get isLoyaltyMember => throw _privateConstructorUsedError;
  LoyaltyProfile? get loyaltyProfile => throw _privateConstructorUsedError;
  String? get fcm => throw _privateConstructorUsedError;
  int? get organizationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {PersonInfo? personInfo,
      bool? isLoyaltyMember,
      LoyaltyProfile? loyaltyProfile,
      String? fcm,
      int? organizationId});

  $PersonInfoCopyWith<$Res>? get personInfo;
  $LoyaltyProfileCopyWith<$Res>? get loyaltyProfile;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personInfo = freezed,
    Object? isLoyaltyMember = freezed,
    Object? loyaltyProfile = freezed,
    Object? fcm = freezed,
    Object? organizationId = freezed,
  }) {
    return _then(_value.copyWith(
      personInfo: freezed == personInfo
          ? _value.personInfo
          : personInfo // ignore: cast_nullable_to_non_nullable
              as PersonInfo?,
      isLoyaltyMember: freezed == isLoyaltyMember
          ? _value.isLoyaltyMember
          : isLoyaltyMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      loyaltyProfile: freezed == loyaltyProfile
          ? _value.loyaltyProfile
          : loyaltyProfile // ignore: cast_nullable_to_non_nullable
              as LoyaltyProfile?,
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonInfoCopyWith<$Res>? get personInfo {
    if (_value.personInfo == null) {
      return null;
    }

    return $PersonInfoCopyWith<$Res>(_value.personInfo!, (value) {
      return _then(_value.copyWith(personInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LoyaltyProfileCopyWith<$Res>? get loyaltyProfile {
    if (_value.loyaltyProfile == null) {
      return null;
    }

    return $LoyaltyProfileCopyWith<$Res>(_value.loyaltyProfile!, (value) {
      return _then(_value.copyWith(loyaltyProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$_ProfileModelCopyWith(
          _$_ProfileModel value, $Res Function(_$_ProfileModel) then) =
      __$$_ProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PersonInfo? personInfo,
      bool? isLoyaltyMember,
      LoyaltyProfile? loyaltyProfile,
      String? fcm,
      int? organizationId});

  @override
  $PersonInfoCopyWith<$Res>? get personInfo;
  @override
  $LoyaltyProfileCopyWith<$Res>? get loyaltyProfile;
}

/// @nodoc
class __$$_ProfileModelCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$_ProfileModel>
    implements _$$_ProfileModelCopyWith<$Res> {
  __$$_ProfileModelCopyWithImpl(
      _$_ProfileModel _value, $Res Function(_$_ProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personInfo = freezed,
    Object? isLoyaltyMember = freezed,
    Object? loyaltyProfile = freezed,
    Object? fcm = freezed,
    Object? organizationId = freezed,
  }) {
    return _then(_$_ProfileModel(
      personInfo: freezed == personInfo
          ? _value.personInfo
          : personInfo // ignore: cast_nullable_to_non_nullable
              as PersonInfo?,
      isLoyaltyMember: freezed == isLoyaltyMember
          ? _value.isLoyaltyMember
          : isLoyaltyMember // ignore: cast_nullable_to_non_nullable
              as bool?,
      loyaltyProfile: freezed == loyaltyProfile
          ? _value.loyaltyProfile
          : loyaltyProfile // ignore: cast_nullable_to_non_nullable
              as LoyaltyProfile?,
      fcm: freezed == fcm
          ? _value.fcm
          : fcm // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel implements _ProfileModel {
  const _$_ProfileModel(
      {this.personInfo,
      this.isLoyaltyMember,
      this.loyaltyProfile,
      this.fcm,
      this.organizationId});

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  @override
  final PersonInfo? personInfo;
  @override
  final bool? isLoyaltyMember;
  @override
  final LoyaltyProfile? loyaltyProfile;
  @override
  final String? fcm;
  @override
  final int? organizationId;

  @override
  String toString() {
    return 'ProfileModel(personInfo: $personInfo, isLoyaltyMember: $isLoyaltyMember, loyaltyProfile: $loyaltyProfile, fcm: $fcm, organizationId: $organizationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileModel &&
            (identical(other.personInfo, personInfo) ||
                other.personInfo == personInfo) &&
            (identical(other.isLoyaltyMember, isLoyaltyMember) ||
                other.isLoyaltyMember == isLoyaltyMember) &&
            (identical(other.loyaltyProfile, loyaltyProfile) ||
                other.loyaltyProfile == loyaltyProfile) &&
            (identical(other.fcm, fcm) || other.fcm == fcm) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personInfo, isLoyaltyMember,
      loyaltyProfile, fcm, organizationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      __$$_ProfileModelCopyWithImpl<_$_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {final PersonInfo? personInfo,
      final bool? isLoyaltyMember,
      final LoyaltyProfile? loyaltyProfile,
      final String? fcm,
      final int? organizationId}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  PersonInfo? get personInfo;
  @override
  bool? get isLoyaltyMember;
  @override
  LoyaltyProfile? get loyaltyProfile;
  @override
  String? get fcm;
  @override
  int? get organizationId;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonInfo _$PersonInfoFromJson(Map<String, dynamic> json) {
  return _PersonInfo.fromJson(json);
}

/// @nodoc
mixin _$PersonInfo {
  String? get title => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get passportNumber => throw _privateConstructorUsedError;
  String? get passportExpiryDate => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String? get maritalStatus => throw _privateConstructorUsedError;
  String? get anniversary => throw _privateConstructorUsedError;
  String? get joiningDate => throw _privateConstructorUsedError;
  List<Emails>? get emails => throw _privateConstructorUsedError;
  List<Phones>? get phones => throw _privateConstructorUsedError;
  List<Addresses>? get addresses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonInfoCopyWith<PersonInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonInfoCopyWith<$Res> {
  factory $PersonInfoCopyWith(
          PersonInfo value, $Res Function(PersonInfo) then) =
      _$PersonInfoCopyWithImpl<$Res, PersonInfo>;
  @useResult
  $Res call(
      {String? title,
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
      List<Addresses>? addresses});
}

/// @nodoc
class _$PersonInfoCopyWithImpl<$Res, $Val extends PersonInfo>
    implements $PersonInfoCopyWith<$Res> {
  _$PersonInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? nationality = freezed,
    Object? gender = freezed,
    Object? passportNumber = freezed,
    Object? passportExpiryDate = freezed,
    Object? profileImage = freezed,
    Object? maritalStatus = freezed,
    Object? anniversary = freezed,
    Object? joiningDate = freezed,
    Object? emails = freezed,
    Object? phones = freezed,
    Object? addresses = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      passportExpiryDate: freezed == passportExpiryDate
          ? _value.passportExpiryDate
          : passportExpiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      anniversary: freezed == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as String?,
      joiningDate: freezed == joiningDate
          ? _value.joiningDate
          : joiningDate // ignore: cast_nullable_to_non_nullable
              as String?,
      emails: freezed == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<Emails>?,
      phones: freezed == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<Phones>?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Addresses>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonInfoCopyWith<$Res>
    implements $PersonInfoCopyWith<$Res> {
  factory _$$_PersonInfoCopyWith(
          _$_PersonInfo value, $Res Function(_$_PersonInfo) then) =
      __$$_PersonInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
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
      List<Addresses>? addresses});
}

/// @nodoc
class __$$_PersonInfoCopyWithImpl<$Res>
    extends _$PersonInfoCopyWithImpl<$Res, _$_PersonInfo>
    implements _$$_PersonInfoCopyWith<$Res> {
  __$$_PersonInfoCopyWithImpl(
      _$_PersonInfo _value, $Res Function(_$_PersonInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? dob = freezed,
    Object? nationality = freezed,
    Object? gender = freezed,
    Object? passportNumber = freezed,
    Object? passportExpiryDate = freezed,
    Object? profileImage = freezed,
    Object? maritalStatus = freezed,
    Object? anniversary = freezed,
    Object? joiningDate = freezed,
    Object? emails = freezed,
    Object? phones = freezed,
    Object? addresses = freezed,
  }) {
    return _then(_$_PersonInfo(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      passportExpiryDate: freezed == passportExpiryDate
          ? _value.passportExpiryDate
          : passportExpiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      anniversary: freezed == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as String?,
      joiningDate: freezed == joiningDate
          ? _value.joiningDate
          : joiningDate // ignore: cast_nullable_to_non_nullable
              as String?,
      emails: freezed == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as List<Emails>?,
      phones: freezed == phones
          ? _value.phones
          : phones // ignore: cast_nullable_to_non_nullable
              as List<Phones>?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Addresses>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PersonInfo implements _PersonInfo {
  const _$_PersonInfo(
      {this.title,
      this.firstName,
      this.middleName,
      this.lastName,
      this.dob,
      this.nationality,
      this.gender,
      this.passportNumber,
      this.passportExpiryDate,
      this.profileImage,
      this.maritalStatus,
      this.anniversary,
      this.joiningDate,
      this.emails,
      this.phones,
      this.addresses});

  factory _$_PersonInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PersonInfoFromJson(json);

  @override
  final String? title;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? dob;
  @override
  final String? nationality;
  @override
  final String? gender;
  @override
  final String? passportNumber;
  @override
  final String? passportExpiryDate;
  @override
  final String? profileImage;
  @override
  final String? maritalStatus;
  @override
  final String? anniversary;
  @override
  final String? joiningDate;
  @override
  final List<Emails>? emails;
  @override
  final List<Phones>? phones;
  @override
  final List<Addresses>? addresses;

  @override
  String toString() {
    return 'PersonInfo(title: $title, firstName: $firstName, middleName: $middleName, lastName: $lastName, dob: $dob, nationality: $nationality, gender: $gender, passportNumber: $passportNumber, passportExpiryDate: $passportExpiryDate, profileImage: $profileImage, maritalStatus: $maritalStatus, anniversary: $anniversary, joiningDate: $joiningDate, emails: $emails, phones: $phones, addresses: $addresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonInfo &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber) &&
            (identical(other.passportExpiryDate, passportExpiryDate) ||
                other.passportExpiryDate == passportExpiryDate) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.anniversary, anniversary) ||
                other.anniversary == anniversary) &&
            (identical(other.joiningDate, joiningDate) ||
                other.joiningDate == joiningDate) &&
            const DeepCollectionEquality().equals(other.emails, emails) &&
            const DeepCollectionEquality().equals(other.phones, phones) &&
            const DeepCollectionEquality().equals(other.addresses, addresses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      firstName,
      middleName,
      lastName,
      dob,
      nationality,
      gender,
      passportNumber,
      passportExpiryDate,
      profileImage,
      maritalStatus,
      anniversary,
      joiningDate,
      const DeepCollectionEquality().hash(emails),
      const DeepCollectionEquality().hash(phones),
      const DeepCollectionEquality().hash(addresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonInfoCopyWith<_$_PersonInfo> get copyWith =>
      __$$_PersonInfoCopyWithImpl<_$_PersonInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonInfoToJson(
      this,
    );
  }
}

abstract class _PersonInfo implements PersonInfo {
  const factory _PersonInfo(
      {final String? title,
      final String? firstName,
      final String? middleName,
      final String? lastName,
      final String? dob,
      final String? nationality,
      final String? gender,
      final String? passportNumber,
      final String? passportExpiryDate,
      final String? profileImage,
      final String? maritalStatus,
      final String? anniversary,
      final String? joiningDate,
      final List<Emails>? emails,
      final List<Phones>? phones,
      final List<Addresses>? addresses}) = _$_PersonInfo;

  factory _PersonInfo.fromJson(Map<String, dynamic> json) =
      _$_PersonInfo.fromJson;

  @override
  String? get title;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get dob;
  @override
  String? get nationality;
  @override
  String? get gender;
  @override
  String? get passportNumber;
  @override
  String? get passportExpiryDate;
  @override
  String? get profileImage;
  @override
  String? get maritalStatus;
  @override
  String? get anniversary;
  @override
  String? get joiningDate;
  @override
  List<Emails>? get emails;
  @override
  List<Phones>? get phones;
  @override
  List<Addresses>? get addresses;
  @override
  @JsonKey(ignore: true)
  _$$_PersonInfoCopyWith<_$_PersonInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Emails _$EmailsFromJson(Map<String, dynamic> json) {
  return _Emails.fromJson(json);
}

/// @nodoc
mixin _$Emails {
  String? get emailAddress => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isEmailVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailsCopyWith<Emails> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailsCopyWith<$Res> {
  factory $EmailsCopyWith(Emails value, $Res Function(Emails) then) =
      _$EmailsCopyWithImpl<$Res, Emails>;
  @useResult
  $Res call({String? emailAddress, String? type, bool? isEmailVerified});
}

/// @nodoc
class _$EmailsCopyWithImpl<$Res, $Val extends Emails>
    implements $EmailsCopyWith<$Res> {
  _$EmailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? type = freezed,
    Object? isEmailVerified = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailsCopyWith<$Res> implements $EmailsCopyWith<$Res> {
  factory _$$_EmailsCopyWith(_$_Emails value, $Res Function(_$_Emails) then) =
      __$$_EmailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? emailAddress, String? type, bool? isEmailVerified});
}

/// @nodoc
class __$$_EmailsCopyWithImpl<$Res>
    extends _$EmailsCopyWithImpl<$Res, _$_Emails>
    implements _$$_EmailsCopyWith<$Res> {
  __$$_EmailsCopyWithImpl(_$_Emails _value, $Res Function(_$_Emails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? type = freezed,
    Object? isEmailVerified = freezed,
  }) {
    return _then(_$_Emails(
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: freezed == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Emails implements _Emails {
  const _$_Emails({this.emailAddress, this.type, this.isEmailVerified});

  factory _$_Emails.fromJson(Map<String, dynamic> json) =>
      _$$_EmailsFromJson(json);

  @override
  final String? emailAddress;
  @override
  final String? type;
  @override
  final bool? isEmailVerified;

  @override
  String toString() {
    return 'Emails(emailAddress: $emailAddress, type: $type, isEmailVerified: $isEmailVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Emails &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, emailAddress, type, isEmailVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailsCopyWith<_$_Emails> get copyWith =>
      __$$_EmailsCopyWithImpl<_$_Emails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmailsToJson(
      this,
    );
  }
}

abstract class _Emails implements Emails {
  const factory _Emails(
      {final String? emailAddress,
      final String? type,
      final bool? isEmailVerified}) = _$_Emails;

  factory _Emails.fromJson(Map<String, dynamic> json) = _$_Emails.fromJson;

  @override
  String? get emailAddress;
  @override
  String? get type;
  @override
  bool? get isEmailVerified;
  @override
  @JsonKey(ignore: true)
  _$$_EmailsCopyWith<_$_Emails> get copyWith =>
      throw _privateConstructorUsedError;
}

Phones _$PhonesFromJson(Map<String, dynamic> json) {
  return _Phones.fromJson(json);
}

/// @nodoc
mixin _$Phones {
  String? get number => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhonesCopyWith<Phones> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhonesCopyWith<$Res> {
  factory $PhonesCopyWith(Phones value, $Res Function(Phones) then) =
      _$PhonesCopyWithImpl<$Res, Phones>;
  @useResult
  $Res call({String? number, String? countryCode, String? type});
}

/// @nodoc
class _$PhonesCopyWithImpl<$Res, $Val extends Phones>
    implements $PhonesCopyWith<$Res> {
  _$PhonesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? countryCode = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhonesCopyWith<$Res> implements $PhonesCopyWith<$Res> {
  factory _$$_PhonesCopyWith(_$_Phones value, $Res Function(_$_Phones) then) =
      __$$_PhonesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? number, String? countryCode, String? type});
}

/// @nodoc
class __$$_PhonesCopyWithImpl<$Res>
    extends _$PhonesCopyWithImpl<$Res, _$_Phones>
    implements _$$_PhonesCopyWith<$Res> {
  __$$_PhonesCopyWithImpl(_$_Phones _value, $Res Function(_$_Phones) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? countryCode = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Phones(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Phones implements _Phones {
  const _$_Phones({this.number, this.countryCode, this.type});

  factory _$_Phones.fromJson(Map<String, dynamic> json) =>
      _$$_PhonesFromJson(json);

  @override
  final String? number;
  @override
  final String? countryCode;
  @override
  final String? type;

  @override
  String toString() {
    return 'Phones(number: $number, countryCode: $countryCode, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Phones &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, countryCode, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhonesCopyWith<_$_Phones> get copyWith =>
      __$$_PhonesCopyWithImpl<_$_Phones>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhonesToJson(
      this,
    );
  }
}

abstract class _Phones implements Phones {
  const factory _Phones(
      {final String? number,
      final String? countryCode,
      final String? type}) = _$_Phones;

  factory _Phones.fromJson(Map<String, dynamic> json) = _$_Phones.fromJson;

  @override
  String? get number;
  @override
  String? get countryCode;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_PhonesCopyWith<_$_Phones> get copyWith =>
      throw _privateConstructorUsedError;
}

Addresses _$AddressesFromJson(Map<String, dynamic> json) {
  return _Addresses.fromJson(json);
}

/// @nodoc
mixin _$Addresses {
  String? get type => throw _privateConstructorUsedError;
  String? get line1 => throw _privateConstructorUsedError;
  String? get line2 => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get pinCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressesCopyWith<Addresses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressesCopyWith<$Res> {
  factory $AddressesCopyWith(Addresses value, $Res Function(Addresses) then) =
      _$AddressesCopyWithImpl<$Res, Addresses>;
  @useResult
  $Res call(
      {String? type,
      String? line1,
      String? line2,
      String? street,
      String? city,
      String? state,
      String? country,
      String? pinCode});
}

/// @nodoc
class _$AddressesCopyWithImpl<$Res, $Val extends Addresses>
    implements $AddressesCopyWith<$Res> {
  _$AddressesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressesCopyWith<$Res> implements $AddressesCopyWith<$Res> {
  factory _$$_AddressesCopyWith(
          _$_Addresses value, $Res Function(_$_Addresses) then) =
      __$$_AddressesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? line1,
      String? line2,
      String? street,
      String? city,
      String? state,
      String? country,
      String? pinCode});
}

/// @nodoc
class __$$_AddressesCopyWithImpl<$Res>
    extends _$AddressesCopyWithImpl<$Res, _$_Addresses>
    implements _$$_AddressesCopyWith<$Res> {
  __$$_AddressesCopyWithImpl(
      _$_Addresses _value, $Res Function(_$_Addresses) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? pinCode = freezed,
  }) {
    return _then(_$_Addresses(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      pinCode: freezed == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Addresses implements _Addresses {
  const _$_Addresses(
      {this.type,
      this.line1,
      this.line2,
      this.street,
      this.city,
      this.state,
      this.country,
      this.pinCode});

  factory _$_Addresses.fromJson(Map<String, dynamic> json) =>
      _$$_AddressesFromJson(json);

  @override
  final String? type;
  @override
  final String? line1;
  @override
  final String? line2;
  @override
  final String? street;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? pinCode;

  @override
  String toString() {
    return 'Addresses(type: $type, line1: $line1, line2: $line2, street: $street, city: $city, state: $state, country: $country, pinCode: $pinCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Addresses &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.line2, line2) || other.line2 == line2) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, line1, line2, street, city, state, country, pinCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressesCopyWith<_$_Addresses> get copyWith =>
      __$$_AddressesCopyWithImpl<_$_Addresses>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressesToJson(
      this,
    );
  }
}

abstract class _Addresses implements Addresses {
  const factory _Addresses(
      {final String? type,
      final String? line1,
      final String? line2,
      final String? street,
      final String? city,
      final String? state,
      final String? country,
      final String? pinCode}) = _$_Addresses;

  factory _Addresses.fromJson(Map<String, dynamic> json) =
      _$_Addresses.fromJson;

  @override
  String? get type;
  @override
  String? get line1;
  @override
  String? get line2;
  @override
  String? get street;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get pinCode;
  @override
  @JsonKey(ignore: true)
  _$$_AddressesCopyWith<_$_Addresses> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyProfile _$LoyaltyProfileFromJson(Map<String, dynamic> json) {
  return _LoyaltyProfile.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyProfile {
  String? get avaliableBalance => throw _privateConstructorUsedError;
  String? get totalBurning => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyProfileCopyWith<LoyaltyProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyProfileCopyWith<$Res> {
  factory $LoyaltyProfileCopyWith(
          LoyaltyProfile value, $Res Function(LoyaltyProfile) then) =
      _$LoyaltyProfileCopyWithImpl<$Res, LoyaltyProfile>;
  @useResult
  $Res call(
      {String? avaliableBalance, String? totalBurning, String? referralCode});
}

/// @nodoc
class _$LoyaltyProfileCopyWithImpl<$Res, $Val extends LoyaltyProfile>
    implements $LoyaltyProfileCopyWith<$Res> {
  _$LoyaltyProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avaliableBalance = freezed,
    Object? totalBurning = freezed,
    Object? referralCode = freezed,
  }) {
    return _then(_value.copyWith(
      avaliableBalance: freezed == avaliableBalance
          ? _value.avaliableBalance
          : avaliableBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      totalBurning: freezed == totalBurning
          ? _value.totalBurning
          : totalBurning // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyProfileCopyWith<$Res>
    implements $LoyaltyProfileCopyWith<$Res> {
  factory _$$_LoyaltyProfileCopyWith(
          _$_LoyaltyProfile value, $Res Function(_$_LoyaltyProfile) then) =
      __$$_LoyaltyProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? avaliableBalance, String? totalBurning, String? referralCode});
}

/// @nodoc
class __$$_LoyaltyProfileCopyWithImpl<$Res>
    extends _$LoyaltyProfileCopyWithImpl<$Res, _$_LoyaltyProfile>
    implements _$$_LoyaltyProfileCopyWith<$Res> {
  __$$_LoyaltyProfileCopyWithImpl(
      _$_LoyaltyProfile _value, $Res Function(_$_LoyaltyProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avaliableBalance = freezed,
    Object? totalBurning = freezed,
    Object? referralCode = freezed,
  }) {
    return _then(_$_LoyaltyProfile(
      avaliableBalance: freezed == avaliableBalance
          ? _value.avaliableBalance
          : avaliableBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      totalBurning: freezed == totalBurning
          ? _value.totalBurning
          : totalBurning // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyProfile implements _LoyaltyProfile {
  const _$_LoyaltyProfile(
      {this.avaliableBalance, this.totalBurning, this.referralCode});

  factory _$_LoyaltyProfile.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyProfileFromJson(json);

  @override
  final String? avaliableBalance;
  @override
  final String? totalBurning;
  @override
  final String? referralCode;

  @override
  String toString() {
    return 'LoyaltyProfile(avaliableBalance: $avaliableBalance, totalBurning: $totalBurning, referralCode: $referralCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyProfile &&
            (identical(other.avaliableBalance, avaliableBalance) ||
                other.avaliableBalance == avaliableBalance) &&
            (identical(other.totalBurning, totalBurning) ||
                other.totalBurning == totalBurning) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, avaliableBalance, totalBurning, referralCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyProfileCopyWith<_$_LoyaltyProfile> get copyWith =>
      __$$_LoyaltyProfileCopyWithImpl<_$_LoyaltyProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyProfileToJson(
      this,
    );
  }
}

abstract class _LoyaltyProfile implements LoyaltyProfile {
  const factory _LoyaltyProfile(
      {final String? avaliableBalance,
      final String? totalBurning,
      final String? referralCode}) = _$_LoyaltyProfile;

  factory _LoyaltyProfile.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyProfile.fromJson;

  @override
  String? get avaliableBalance;
  @override
  String? get totalBurning;
  @override
  String? get referralCode;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyProfileCopyWith<_$_LoyaltyProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
