// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travellers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TravellersModel _$TravellersModelFromJson(Map<String, dynamic> json) {
  return _TravellersModel.fromJson(json);
}

/// @nodoc
mixin _$TravellersModel {
  @JsonKey(name: 'personName')
  PersonNameModel get personName => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  CountryModel get countryDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  int? get travellersAge => throw _privateConstructorUsedError;
  @JsonKey(name: 'passengerTypeID')
  int? get passengerTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'passportNumber')
  String? get passportNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'passengerStatus')
  String? get passengerStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'passengerTypeName')
  String? get passengerTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'passengerTypeCode')
  String? get passengerTypeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'spocPhone')
  String get spocPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'flyingClassId')
  int? get flyingClassId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flyingClass')
  String? get flyingClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'flyingClassName')
  String? get flyingClassName => throw _privateConstructorUsedError;
  @JsonKey(name: 'passengerId')
  int? get passengerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravellersModelCopyWith<TravellersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravellersModelCopyWith<$Res> {
  factory $TravellersModelCopyWith(
          TravellersModel value, $Res Function(TravellersModel) then) =
      _$TravellersModelCopyWithImpl<$Res, TravellersModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'personName') PersonNameModel personName,
      @JsonKey(name: 'country') CountryModel countryDetails,
      @JsonKey(name: 'age') int? travellersAge,
      @JsonKey(name: 'passengerTypeID') int? passengerTypeId,
      @JsonKey(name: 'passportNumber') String? passportNumber,
      @JsonKey(name: 'passengerStatus') String? passengerStatus,
      @JsonKey(name: 'passengerTypeName') String? passengerTypeName,
      @JsonKey(name: 'passengerTypeCode') String? passengerTypeCode,
      @JsonKey(name: 'spocPhone') String spocPhone,
      @JsonKey(name: 'flyingClassId') int? flyingClassId,
      @JsonKey(name: 'flyingClass') String? flyingClass,
      @JsonKey(name: 'flyingClassName') String? flyingClassName,
      @JsonKey(name: 'passengerId') int? passengerId,
      @JsonKey(name: 'email') String? email});

  $PersonNameModelCopyWith<$Res> get personName;
  $CountryModelCopyWith<$Res> get countryDetails;
}

/// @nodoc
class _$TravellersModelCopyWithImpl<$Res, $Val extends TravellersModel>
    implements $TravellersModelCopyWith<$Res> {
  _$TravellersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personName = null,
    Object? countryDetails = null,
    Object? travellersAge = freezed,
    Object? passengerTypeId = freezed,
    Object? passportNumber = freezed,
    Object? passengerStatus = freezed,
    Object? passengerTypeName = freezed,
    Object? passengerTypeCode = freezed,
    Object? spocPhone = null,
    Object? flyingClassId = freezed,
    Object? flyingClass = freezed,
    Object? flyingClassName = freezed,
    Object? passengerId = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as PersonNameModel,
      countryDetails: null == countryDetails
          ? _value.countryDetails
          : countryDetails // ignore: cast_nullable_to_non_nullable
              as CountryModel,
      travellersAge: freezed == travellersAge
          ? _value.travellersAge
          : travellersAge // ignore: cast_nullable_to_non_nullable
              as int?,
      passengerTypeId: freezed == passengerTypeId
          ? _value.passengerTypeId
          : passengerTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerStatus: freezed == passengerStatus
          ? _value.passengerStatus
          : passengerStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerTypeName: freezed == passengerTypeName
          ? _value.passengerTypeName
          : passengerTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerTypeCode: freezed == passengerTypeCode
          ? _value.passengerTypeCode
          : passengerTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      spocPhone: null == spocPhone
          ? _value.spocPhone
          : spocPhone // ignore: cast_nullable_to_non_nullable
              as String,
      flyingClassId: freezed == flyingClassId
          ? _value.flyingClassId
          : flyingClassId // ignore: cast_nullable_to_non_nullable
              as int?,
      flyingClass: freezed == flyingClass
          ? _value.flyingClass
          : flyingClass // ignore: cast_nullable_to_non_nullable
              as String?,
      flyingClassName: freezed == flyingClassName
          ? _value.flyingClassName
          : flyingClassName // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerId: freezed == passengerId
          ? _value.passengerId
          : passengerId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonNameModelCopyWith<$Res> get personName {
    return $PersonNameModelCopyWith<$Res>(_value.personName, (value) {
      return _then(_value.copyWith(personName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryModelCopyWith<$Res> get countryDetails {
    return $CountryModelCopyWith<$Res>(_value.countryDetails, (value) {
      return _then(_value.copyWith(countryDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TravellersModelCopyWith<$Res>
    implements $TravellersModelCopyWith<$Res> {
  factory _$$_TravellersModelCopyWith(
          _$_TravellersModel value, $Res Function(_$_TravellersModel) then) =
      __$$_TravellersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'personName') PersonNameModel personName,
      @JsonKey(name: 'country') CountryModel countryDetails,
      @JsonKey(name: 'age') int? travellersAge,
      @JsonKey(name: 'passengerTypeID') int? passengerTypeId,
      @JsonKey(name: 'passportNumber') String? passportNumber,
      @JsonKey(name: 'passengerStatus') String? passengerStatus,
      @JsonKey(name: 'passengerTypeName') String? passengerTypeName,
      @JsonKey(name: 'passengerTypeCode') String? passengerTypeCode,
      @JsonKey(name: 'spocPhone') String spocPhone,
      @JsonKey(name: 'flyingClassId') int? flyingClassId,
      @JsonKey(name: 'flyingClass') String? flyingClass,
      @JsonKey(name: 'flyingClassName') String? flyingClassName,
      @JsonKey(name: 'passengerId') int? passengerId,
      @JsonKey(name: 'email') String? email});

  @override
  $PersonNameModelCopyWith<$Res> get personName;
  @override
  $CountryModelCopyWith<$Res> get countryDetails;
}

/// @nodoc
class __$$_TravellersModelCopyWithImpl<$Res>
    extends _$TravellersModelCopyWithImpl<$Res, _$_TravellersModel>
    implements _$$_TravellersModelCopyWith<$Res> {
  __$$_TravellersModelCopyWithImpl(
      _$_TravellersModel _value, $Res Function(_$_TravellersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personName = null,
    Object? countryDetails = null,
    Object? travellersAge = freezed,
    Object? passengerTypeId = freezed,
    Object? passportNumber = freezed,
    Object? passengerStatus = freezed,
    Object? passengerTypeName = freezed,
    Object? passengerTypeCode = freezed,
    Object? spocPhone = null,
    Object? flyingClassId = freezed,
    Object? flyingClass = freezed,
    Object? flyingClassName = freezed,
    Object? passengerId = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_TravellersModel(
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as PersonNameModel,
      countryDetails: null == countryDetails
          ? _value.countryDetails
          : countryDetails // ignore: cast_nullable_to_non_nullable
              as CountryModel,
      travellersAge: freezed == travellersAge
          ? _value.travellersAge
          : travellersAge // ignore: cast_nullable_to_non_nullable
              as int?,
      passengerTypeId: freezed == passengerTypeId
          ? _value.passengerTypeId
          : passengerTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerStatus: freezed == passengerStatus
          ? _value.passengerStatus
          : passengerStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerTypeName: freezed == passengerTypeName
          ? _value.passengerTypeName
          : passengerTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerTypeCode: freezed == passengerTypeCode
          ? _value.passengerTypeCode
          : passengerTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      spocPhone: null == spocPhone
          ? _value.spocPhone
          : spocPhone // ignore: cast_nullable_to_non_nullable
              as String,
      flyingClassId: freezed == flyingClassId
          ? _value.flyingClassId
          : flyingClassId // ignore: cast_nullable_to_non_nullable
              as int?,
      flyingClass: freezed == flyingClass
          ? _value.flyingClass
          : flyingClass // ignore: cast_nullable_to_non_nullable
              as String?,
      flyingClassName: freezed == flyingClassName
          ? _value.flyingClassName
          : flyingClassName // ignore: cast_nullable_to_non_nullable
              as String?,
      passengerId: freezed == passengerId
          ? _value.passengerId
          : passengerId // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TravellersModel implements _TravellersModel {
  const _$_TravellersModel(
      {@JsonKey(name: 'personName') this.personName = const PersonNameModel(),
      @JsonKey(name: 'country') this.countryDetails = const CountryModel(),
      @JsonKey(name: 'age') this.travellersAge = 0,
      @JsonKey(name: 'passengerTypeID') this.passengerTypeId = 0,
      @JsonKey(name: 'passportNumber') this.passportNumber,
      @JsonKey(name: 'passengerStatus') this.passengerStatus,
      @JsonKey(name: 'passengerTypeName') this.passengerTypeName,
      @JsonKey(name: 'passengerTypeCode') this.passengerTypeCode,
      @JsonKey(name: 'spocPhone') this.spocPhone = '',
      @JsonKey(name: 'flyingClassId') this.flyingClassId,
      @JsonKey(name: 'flyingClass') this.flyingClass,
      @JsonKey(name: 'flyingClassName') this.flyingClassName,
      @JsonKey(name: 'passengerId') this.passengerId = 0,
      @JsonKey(name: 'email') this.email = ''});

  factory _$_TravellersModel.fromJson(Map<String, dynamic> json) =>
      _$$_TravellersModelFromJson(json);

  @override
  @JsonKey(name: 'personName')
  final PersonNameModel personName;
  @override
  @JsonKey(name: 'country')
  final CountryModel countryDetails;
  @override
  @JsonKey(name: 'age')
  final int? travellersAge;
  @override
  @JsonKey(name: 'passengerTypeID')
  final int? passengerTypeId;
  @override
  @JsonKey(name: 'passportNumber')
  final String? passportNumber;
  @override
  @JsonKey(name: 'passengerStatus')
  final String? passengerStatus;
  @override
  @JsonKey(name: 'passengerTypeName')
  final String? passengerTypeName;
  @override
  @JsonKey(name: 'passengerTypeCode')
  final String? passengerTypeCode;
  @override
  @JsonKey(name: 'spocPhone')
  final String spocPhone;
  @override
  @JsonKey(name: 'flyingClassId')
  final int? flyingClassId;
  @override
  @JsonKey(name: 'flyingClass')
  final String? flyingClass;
  @override
  @JsonKey(name: 'flyingClassName')
  final String? flyingClassName;
  @override
  @JsonKey(name: 'passengerId')
  final int? passengerId;
  @override
  @JsonKey(name: 'email')
  final String? email;

  @override
  String toString() {
    return 'TravellersModel(personName: $personName, countryDetails: $countryDetails, travellersAge: $travellersAge, passengerTypeId: $passengerTypeId, passportNumber: $passportNumber, passengerStatus: $passengerStatus, passengerTypeName: $passengerTypeName, passengerTypeCode: $passengerTypeCode, spocPhone: $spocPhone, flyingClassId: $flyingClassId, flyingClass: $flyingClass, flyingClassName: $flyingClassName, passengerId: $passengerId, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravellersModel &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.countryDetails, countryDetails) ||
                other.countryDetails == countryDetails) &&
            (identical(other.travellersAge, travellersAge) ||
                other.travellersAge == travellersAge) &&
            (identical(other.passengerTypeId, passengerTypeId) ||
                other.passengerTypeId == passengerTypeId) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber) &&
            (identical(other.passengerStatus, passengerStatus) ||
                other.passengerStatus == passengerStatus) &&
            (identical(other.passengerTypeName, passengerTypeName) ||
                other.passengerTypeName == passengerTypeName) &&
            (identical(other.passengerTypeCode, passengerTypeCode) ||
                other.passengerTypeCode == passengerTypeCode) &&
            (identical(other.spocPhone, spocPhone) ||
                other.spocPhone == spocPhone) &&
            (identical(other.flyingClassId, flyingClassId) ||
                other.flyingClassId == flyingClassId) &&
            (identical(other.flyingClass, flyingClass) ||
                other.flyingClass == flyingClass) &&
            (identical(other.flyingClassName, flyingClassName) ||
                other.flyingClassName == flyingClassName) &&
            (identical(other.passengerId, passengerId) ||
                other.passengerId == passengerId) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      personName,
      countryDetails,
      travellersAge,
      passengerTypeId,
      passportNumber,
      passengerStatus,
      passengerTypeName,
      passengerTypeCode,
      spocPhone,
      flyingClassId,
      flyingClass,
      flyingClassName,
      passengerId,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravellersModelCopyWith<_$_TravellersModel> get copyWith =>
      __$$_TravellersModelCopyWithImpl<_$_TravellersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravellersModelToJson(
      this,
    );
  }
}

abstract class _TravellersModel implements TravellersModel {
  const factory _TravellersModel(
      {@JsonKey(name: 'personName') final PersonNameModel personName,
      @JsonKey(name: 'country') final CountryModel countryDetails,
      @JsonKey(name: 'age') final int? travellersAge,
      @JsonKey(name: 'passengerTypeID') final int? passengerTypeId,
      @JsonKey(name: 'passportNumber') final String? passportNumber,
      @JsonKey(name: 'passengerStatus') final String? passengerStatus,
      @JsonKey(name: 'passengerTypeName') final String? passengerTypeName,
      @JsonKey(name: 'passengerTypeCode') final String? passengerTypeCode,
      @JsonKey(name: 'spocPhone') final String spocPhone,
      @JsonKey(name: 'flyingClassId') final int? flyingClassId,
      @JsonKey(name: 'flyingClass') final String? flyingClass,
      @JsonKey(name: 'flyingClassName') final String? flyingClassName,
      @JsonKey(name: 'passengerId') final int? passengerId,
      @JsonKey(name: 'email') final String? email}) = _$_TravellersModel;

  factory _TravellersModel.fromJson(Map<String, dynamic> json) =
      _$_TravellersModel.fromJson;

  @override
  @JsonKey(name: 'personName')
  PersonNameModel get personName;
  @override
  @JsonKey(name: 'country')
  CountryModel get countryDetails;
  @override
  @JsonKey(name: 'age')
  int? get travellersAge;
  @override
  @JsonKey(name: 'passengerTypeID')
  int? get passengerTypeId;
  @override
  @JsonKey(name: 'passportNumber')
  String? get passportNumber;
  @override
  @JsonKey(name: 'passengerStatus')
  String? get passengerStatus;
  @override
  @JsonKey(name: 'passengerTypeName')
  String? get passengerTypeName;
  @override
  @JsonKey(name: 'passengerTypeCode')
  String? get passengerTypeCode;
  @override
  @JsonKey(name: 'spocPhone')
  String get spocPhone;
  @override
  @JsonKey(name: 'flyingClassId')
  int? get flyingClassId;
  @override
  @JsonKey(name: 'flyingClass')
  String? get flyingClass;
  @override
  @JsonKey(name: 'flyingClassName')
  String? get flyingClassName;
  @override
  @JsonKey(name: 'passengerId')
  int? get passengerId;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_TravellersModelCopyWith<_$_TravellersModel> get copyWith =>
      throw _privateConstructorUsedError;
}
