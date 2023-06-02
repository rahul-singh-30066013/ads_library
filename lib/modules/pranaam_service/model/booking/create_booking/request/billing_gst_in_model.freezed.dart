// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_gst_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillingGstInModel _$BillingGstInModelFromJson(Map<String, dynamic> json) {
  return _BillingGstInModel.fromJson(json);
}

/// @nodoc
mixin _$BillingGstInModel {
  @JsonKey(name: 'gstNumber')
  String get gstNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get gstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNumber')
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get emailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinCode')
  int get pinCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  CountryModel get countryDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  CityModel get cityDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'stateProv')
  StateProvModel get stateDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillingGstInModelCopyWith<BillingGstInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingGstInModelCopyWith<$Res> {
  factory $BillingGstInModelCopyWith(
          BillingGstInModel value, $Res Function(BillingGstInModel) then) =
      _$BillingGstInModelCopyWithImpl<$Res, BillingGstInModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gstNumber') String gstNumber,
      @JsonKey(name: 'name') String gstName,
      @JsonKey(name: 'mobileNumber') String mobileNumber,
      @JsonKey(name: 'email') String emailId,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'pinCode') int pinCode,
      @JsonKey(name: 'country') CountryModel countryDetails,
      @JsonKey(name: 'city') CityModel cityDetails,
      @JsonKey(name: 'stateProv') StateProvModel stateDetails});

  $CountryModelCopyWith<$Res> get countryDetails;
  $CityModelCopyWith<$Res> get cityDetails;
  $StateProvModelCopyWith<$Res> get stateDetails;
}

/// @nodoc
class _$BillingGstInModelCopyWithImpl<$Res, $Val extends BillingGstInModel>
    implements $BillingGstInModelCopyWith<$Res> {
  _$BillingGstInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gstNumber = null,
    Object? gstName = null,
    Object? mobileNumber = null,
    Object? emailId = null,
    Object? address = null,
    Object? pinCode = null,
    Object? countryDetails = null,
    Object? cityDetails = null,
    Object? stateDetails = null,
  }) {
    return _then(_value.copyWith(
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gstName: null == gstName
          ? _value.gstName
          : gstName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as int,
      countryDetails: null == countryDetails
          ? _value.countryDetails
          : countryDetails // ignore: cast_nullable_to_non_nullable
              as CountryModel,
      cityDetails: null == cityDetails
          ? _value.cityDetails
          : cityDetails // ignore: cast_nullable_to_non_nullable
              as CityModel,
      stateDetails: null == stateDetails
          ? _value.stateDetails
          : stateDetails // ignore: cast_nullable_to_non_nullable
              as StateProvModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryModelCopyWith<$Res> get countryDetails {
    return $CountryModelCopyWith<$Res>(_value.countryDetails, (value) {
      return _then(_value.copyWith(countryDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityModelCopyWith<$Res> get cityDetails {
    return $CityModelCopyWith<$Res>(_value.cityDetails, (value) {
      return _then(_value.copyWith(cityDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateProvModelCopyWith<$Res> get stateDetails {
    return $StateProvModelCopyWith<$Res>(_value.stateDetails, (value) {
      return _then(_value.copyWith(stateDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BillingGstInModelCopyWith<$Res>
    implements $BillingGstInModelCopyWith<$Res> {
  factory _$$_BillingGstInModelCopyWith(_$_BillingGstInModel value,
          $Res Function(_$_BillingGstInModel) then) =
      __$$_BillingGstInModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gstNumber') String gstNumber,
      @JsonKey(name: 'name') String gstName,
      @JsonKey(name: 'mobileNumber') String mobileNumber,
      @JsonKey(name: 'email') String emailId,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'pinCode') int pinCode,
      @JsonKey(name: 'country') CountryModel countryDetails,
      @JsonKey(name: 'city') CityModel cityDetails,
      @JsonKey(name: 'stateProv') StateProvModel stateDetails});

  @override
  $CountryModelCopyWith<$Res> get countryDetails;
  @override
  $CityModelCopyWith<$Res> get cityDetails;
  @override
  $StateProvModelCopyWith<$Res> get stateDetails;
}

/// @nodoc
class __$$_BillingGstInModelCopyWithImpl<$Res>
    extends _$BillingGstInModelCopyWithImpl<$Res, _$_BillingGstInModel>
    implements _$$_BillingGstInModelCopyWith<$Res> {
  __$$_BillingGstInModelCopyWithImpl(
      _$_BillingGstInModel _value, $Res Function(_$_BillingGstInModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gstNumber = null,
    Object? gstName = null,
    Object? mobileNumber = null,
    Object? emailId = null,
    Object? address = null,
    Object? pinCode = null,
    Object? countryDetails = null,
    Object? cityDetails = null,
    Object? stateDetails = null,
  }) {
    return _then(_$_BillingGstInModel(
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gstName: null == gstName
          ? _value.gstName
          : gstName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as int,
      countryDetails: null == countryDetails
          ? _value.countryDetails
          : countryDetails // ignore: cast_nullable_to_non_nullable
              as CountryModel,
      cityDetails: null == cityDetails
          ? _value.cityDetails
          : cityDetails // ignore: cast_nullable_to_non_nullable
              as CityModel,
      stateDetails: null == stateDetails
          ? _value.stateDetails
          : stateDetails // ignore: cast_nullable_to_non_nullable
              as StateProvModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_BillingGstInModel implements _BillingGstInModel {
  const _$_BillingGstInModel(
      {@JsonKey(name: 'gstNumber') this.gstNumber = '',
      @JsonKey(name: 'name') this.gstName = '',
      @JsonKey(name: 'mobileNumber') this.mobileNumber = '',
      @JsonKey(name: 'email') this.emailId = '',
      @JsonKey(name: 'address') this.address = '',
      @JsonKey(name: 'pinCode') this.pinCode = 0,
      @JsonKey(name: 'country') this.countryDetails = const CountryModel(),
      @JsonKey(name: 'city') this.cityDetails = const CityModel(),
      @JsonKey(name: 'stateProv') this.stateDetails = const StateProvModel()});

  factory _$_BillingGstInModel.fromJson(Map<String, dynamic> json) =>
      _$$_BillingGstInModelFromJson(json);

  @override
  @JsonKey(name: 'gstNumber')
  final String gstNumber;
  @override
  @JsonKey(name: 'name')
  final String gstName;
  @override
  @JsonKey(name: 'mobileNumber')
  final String mobileNumber;
  @override
  @JsonKey(name: 'email')
  final String emailId;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'pinCode')
  final int pinCode;
  @override
  @JsonKey(name: 'country')
  final CountryModel countryDetails;
  @override
  @JsonKey(name: 'city')
  final CityModel cityDetails;
  @override
  @JsonKey(name: 'stateProv')
  final StateProvModel stateDetails;

  @override
  String toString() {
    return 'BillingGstInModel(gstNumber: $gstNumber, gstName: $gstName, mobileNumber: $mobileNumber, emailId: $emailId, address: $address, pinCode: $pinCode, countryDetails: $countryDetails, cityDetails: $cityDetails, stateDetails: $stateDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillingGstInModel &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.gstName, gstName) || other.gstName == gstName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.countryDetails, countryDetails) ||
                other.countryDetails == countryDetails) &&
            (identical(other.cityDetails, cityDetails) ||
                other.cityDetails == cityDetails) &&
            (identical(other.stateDetails, stateDetails) ||
                other.stateDetails == stateDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gstNumber, gstName, mobileNumber,
      emailId, address, pinCode, countryDetails, cityDetails, stateDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BillingGstInModelCopyWith<_$_BillingGstInModel> get copyWith =>
      __$$_BillingGstInModelCopyWithImpl<_$_BillingGstInModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillingGstInModelToJson(
      this,
    );
  }
}

abstract class _BillingGstInModel implements BillingGstInModel {
  const factory _BillingGstInModel(
          {@JsonKey(name: 'gstNumber') final String gstNumber,
          @JsonKey(name: 'name') final String gstName,
          @JsonKey(name: 'mobileNumber') final String mobileNumber,
          @JsonKey(name: 'email') final String emailId,
          @JsonKey(name: 'address') final String address,
          @JsonKey(name: 'pinCode') final int pinCode,
          @JsonKey(name: 'country') final CountryModel countryDetails,
          @JsonKey(name: 'city') final CityModel cityDetails,
          @JsonKey(name: 'stateProv') final StateProvModel stateDetails}) =
      _$_BillingGstInModel;

  factory _BillingGstInModel.fromJson(Map<String, dynamic> json) =
      _$_BillingGstInModel.fromJson;

  @override
  @JsonKey(name: 'gstNumber')
  String get gstNumber;
  @override
  @JsonKey(name: 'name')
  String get gstName;
  @override
  @JsonKey(name: 'mobileNumber')
  String get mobileNumber;
  @override
  @JsonKey(name: 'email')
  String get emailId;
  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'pinCode')
  int get pinCode;
  @override
  @JsonKey(name: 'country')
  CountryModel get countryDetails;
  @override
  @JsonKey(name: 'city')
  CityModel get cityDetails;
  @override
  @JsonKey(name: 'stateProv')
  StateProvModel get stateDetails;
  @override
  @JsonKey(ignore: true)
  _$$_BillingGstInModelCopyWith<_$_BillingGstInModel> get copyWith =>
      throw _privateConstructorUsedError;
}
