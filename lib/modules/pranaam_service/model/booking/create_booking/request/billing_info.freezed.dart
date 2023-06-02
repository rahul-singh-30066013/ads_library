// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillingInfo _$BillingInfoFromJson(Map<String, dynamic> json) {
  return _BillingInfo.fromJson(json);
}

/// @nodoc
mixin _$BillingInfo {
  @JsonKey(name: 'personName')
  PersonNameModel get personName => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryDialCode')
  String get countryDialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile')
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthDate')
  String get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get emailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  AddressModel get addressModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'billingGSTIN')
  BillingGstInModel get billingGstInModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillingInfoCopyWith<BillingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingInfoCopyWith<$Res> {
  factory $BillingInfoCopyWith(
          BillingInfo value, $Res Function(BillingInfo) then) =
      _$BillingInfoCopyWithImpl<$Res, BillingInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'personName') PersonNameModel personName,
      @JsonKey(name: 'countryDialCode') String countryDialCode,
      @JsonKey(name: 'mobile') String mobileNumber,
      @JsonKey(name: 'birthDate') String birthDate,
      @JsonKey(name: 'email') String emailId,
      @JsonKey(name: 'address') AddressModel addressModel,
      @JsonKey(name: 'billingGSTIN') BillingGstInModel billingGstInModel});

  $PersonNameModelCopyWith<$Res> get personName;
  $AddressModelCopyWith<$Res> get addressModel;
  $BillingGstInModelCopyWith<$Res> get billingGstInModel;
}

/// @nodoc
class _$BillingInfoCopyWithImpl<$Res, $Val extends BillingInfo>
    implements $BillingInfoCopyWith<$Res> {
  _$BillingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personName = null,
    Object? countryDialCode = null,
    Object? mobileNumber = null,
    Object? birthDate = null,
    Object? emailId = null,
    Object? addressModel = null,
    Object? billingGstInModel = null,
  }) {
    return _then(_value.copyWith(
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as PersonNameModel,
      countryDialCode: null == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      addressModel: null == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      billingGstInModel: null == billingGstInModel
          ? _value.billingGstInModel
          : billingGstInModel // ignore: cast_nullable_to_non_nullable
              as BillingGstInModel,
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
  $AddressModelCopyWith<$Res> get addressModel {
    return $AddressModelCopyWith<$Res>(_value.addressModel, (value) {
      return _then(_value.copyWith(addressModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BillingGstInModelCopyWith<$Res> get billingGstInModel {
    return $BillingGstInModelCopyWith<$Res>(_value.billingGstInModel, (value) {
      return _then(_value.copyWith(billingGstInModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BillingInfoCopyWith<$Res>
    implements $BillingInfoCopyWith<$Res> {
  factory _$$_BillingInfoCopyWith(
          _$_BillingInfo value, $Res Function(_$_BillingInfo) then) =
      __$$_BillingInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'personName') PersonNameModel personName,
      @JsonKey(name: 'countryDialCode') String countryDialCode,
      @JsonKey(name: 'mobile') String mobileNumber,
      @JsonKey(name: 'birthDate') String birthDate,
      @JsonKey(name: 'email') String emailId,
      @JsonKey(name: 'address') AddressModel addressModel,
      @JsonKey(name: 'billingGSTIN') BillingGstInModel billingGstInModel});

  @override
  $PersonNameModelCopyWith<$Res> get personName;
  @override
  $AddressModelCopyWith<$Res> get addressModel;
  @override
  $BillingGstInModelCopyWith<$Res> get billingGstInModel;
}

/// @nodoc
class __$$_BillingInfoCopyWithImpl<$Res>
    extends _$BillingInfoCopyWithImpl<$Res, _$_BillingInfo>
    implements _$$_BillingInfoCopyWith<$Res> {
  __$$_BillingInfoCopyWithImpl(
      _$_BillingInfo _value, $Res Function(_$_BillingInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personName = null,
    Object? countryDialCode = null,
    Object? mobileNumber = null,
    Object? birthDate = null,
    Object? emailId = null,
    Object? addressModel = null,
    Object? billingGstInModel = null,
  }) {
    return _then(_$_BillingInfo(
      personName: null == personName
          ? _value.personName
          : personName // ignore: cast_nullable_to_non_nullable
              as PersonNameModel,
      countryDialCode: null == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      addressModel: null == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      billingGstInModel: null == billingGstInModel
          ? _value.billingGstInModel
          : billingGstInModel // ignore: cast_nullable_to_non_nullable
              as BillingGstInModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BillingInfo implements _BillingInfo {
  const _$_BillingInfo(
      {@JsonKey(name: 'personName')
          this.personName = const PersonNameModel(),
      @JsonKey(name: 'countryDialCode')
          this.countryDialCode = '',
      @JsonKey(name: 'mobile')
          this.mobileNumber = '',
      @JsonKey(name: 'birthDate')
          this.birthDate = '',
      @JsonKey(name: 'email')
          this.emailId = ' ',
      @JsonKey(name: 'address')
          this.addressModel = const AddressModel(),
      @JsonKey(name: 'billingGSTIN')
          this.billingGstInModel = const BillingGstInModel()});

  factory _$_BillingInfo.fromJson(Map<String, dynamic> json) =>
      _$$_BillingInfoFromJson(json);

  @override
  @JsonKey(name: 'personName')
  final PersonNameModel personName;
  @override
  @JsonKey(name: 'countryDialCode')
  final String countryDialCode;
  @override
  @JsonKey(name: 'mobile')
  final String mobileNumber;
  @override
  @JsonKey(name: 'birthDate')
  final String birthDate;
  @override
  @JsonKey(name: 'email')
  final String emailId;
  @override
  @JsonKey(name: 'address')
  final AddressModel addressModel;
  @override
  @JsonKey(name: 'billingGSTIN')
  final BillingGstInModel billingGstInModel;

  @override
  String toString() {
    return 'BillingInfo(personName: $personName, countryDialCode: $countryDialCode, mobileNumber: $mobileNumber, birthDate: $birthDate, emailId: $emailId, addressModel: $addressModel, billingGstInModel: $billingGstInModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillingInfo &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.countryDialCode, countryDialCode) ||
                other.countryDialCode == countryDialCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.addressModel, addressModel) ||
                other.addressModel == addressModel) &&
            (identical(other.billingGstInModel, billingGstInModel) ||
                other.billingGstInModel == billingGstInModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personName, countryDialCode,
      mobileNumber, birthDate, emailId, addressModel, billingGstInModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BillingInfoCopyWith<_$_BillingInfo> get copyWith =>
      __$$_BillingInfoCopyWithImpl<_$_BillingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillingInfoToJson(
      this,
    );
  }
}

abstract class _BillingInfo implements BillingInfo {
  const factory _BillingInfo(
      {@JsonKey(name: 'personName')
          final PersonNameModel personName,
      @JsonKey(name: 'countryDialCode')
          final String countryDialCode,
      @JsonKey(name: 'mobile')
          final String mobileNumber,
      @JsonKey(name: 'birthDate')
          final String birthDate,
      @JsonKey(name: 'email')
          final String emailId,
      @JsonKey(name: 'address')
          final AddressModel addressModel,
      @JsonKey(name: 'billingGSTIN')
          final BillingGstInModel billingGstInModel}) = _$_BillingInfo;

  factory _BillingInfo.fromJson(Map<String, dynamic> json) =
      _$_BillingInfo.fromJson;

  @override
  @JsonKey(name: 'personName')
  PersonNameModel get personName;
  @override
  @JsonKey(name: 'countryDialCode')
  String get countryDialCode;
  @override
  @JsonKey(name: 'mobile')
  String get mobileNumber;
  @override
  @JsonKey(name: 'birthDate')
  String get birthDate;
  @override
  @JsonKey(name: 'email')
  String get emailId;
  @override
  @JsonKey(name: 'address')
  AddressModel get addressModel;
  @override
  @JsonKey(name: 'billingGSTIN')
  BillingGstInModel get billingGstInModel;
  @override
  @JsonKey(ignore: true)
  _$$_BillingInfoCopyWith<_$_BillingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
