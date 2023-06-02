// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  @JsonKey(name: 'addressLine1')
  String get addressLine_1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'addressLine2')
  String get addressLine_2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'postalCode')
  String get pinCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  CountryModel get countryDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  CityModel get cityDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'stateProv')
  StateProvModel get stateDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'addressLine1') String addressLine_1,
      @JsonKey(name: 'addressLine2') String addressLine_2,
      @JsonKey(name: 'postalCode') String pinCode,
      @JsonKey(name: 'country') CountryModel countryDetails,
      @JsonKey(name: 'city') CityModel cityDetails,
      @JsonKey(name: 'stateProv') StateProvModel stateDetails});

  $CountryModelCopyWith<$Res> get countryDetails;
  $CityModelCopyWith<$Res> get cityDetails;
  $StateProvModelCopyWith<$Res> get stateDetails;
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressLine_1 = null,
    Object? addressLine_2 = null,
    Object? pinCode = null,
    Object? countryDetails = null,
    Object? cityDetails = null,
    Object? stateDetails = null,
  }) {
    return _then(_value.copyWith(
      addressLine_1: null == addressLine_1
          ? _value.addressLine_1
          : addressLine_1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine_2: null == addressLine_2
          ? _value.addressLine_2
          : addressLine_2 // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$_AddressModelCopyWith(
          _$_AddressModel value, $Res Function(_$_AddressModel) then) =
      __$$_AddressModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'addressLine1') String addressLine_1,
      @JsonKey(name: 'addressLine2') String addressLine_2,
      @JsonKey(name: 'postalCode') String pinCode,
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
class __$$_AddressModelCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$_AddressModel>
    implements _$$_AddressModelCopyWith<$Res> {
  __$$_AddressModelCopyWithImpl(
      _$_AddressModel _value, $Res Function(_$_AddressModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressLine_1 = null,
    Object? addressLine_2 = null,
    Object? pinCode = null,
    Object? countryDetails = null,
    Object? cityDetails = null,
    Object? stateDetails = null,
  }) {
    return _then(_$_AddressModel(
      addressLine_1: null == addressLine_1
          ? _value.addressLine_1
          : addressLine_1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine_2: null == addressLine_2
          ? _value.addressLine_2
          : addressLine_2 // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_AddressModel implements _AddressModel {
  const _$_AddressModel(
      {@JsonKey(name: 'addressLine1') this.addressLine_1 = '',
      @JsonKey(name: 'addressLine2') this.addressLine_2 = '',
      @JsonKey(name: 'postalCode') this.pinCode = '',
      @JsonKey(name: 'country') this.countryDetails = const CountryModel(),
      @JsonKey(name: 'city') this.cityDetails = const CityModel(),
      @JsonKey(name: 'stateProv') this.stateDetails = const StateProvModel()});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  @JsonKey(name: 'addressLine1')
  final String addressLine_1;
  @override
  @JsonKey(name: 'addressLine2')
  final String addressLine_2;
  @override
  @JsonKey(name: 'postalCode')
  final String pinCode;
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
    return 'AddressModel(addressLine_1: $addressLine_1, addressLine_2: $addressLine_2, pinCode: $pinCode, countryDetails: $countryDetails, cityDetails: $cityDetails, stateDetails: $stateDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressModel &&
            (identical(other.addressLine_1, addressLine_1) ||
                other.addressLine_1 == addressLine_1) &&
            (identical(other.addressLine_2, addressLine_2) ||
                other.addressLine_2 == addressLine_2) &&
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
  int get hashCode => Object.hash(runtimeType, addressLine_1, addressLine_2,
      pinCode, countryDetails, cityDetails, stateDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      __$$_AddressModelCopyWithImpl<_$_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
          {@JsonKey(name: 'addressLine1') final String addressLine_1,
          @JsonKey(name: 'addressLine2') final String addressLine_2,
          @JsonKey(name: 'postalCode') final String pinCode,
          @JsonKey(name: 'country') final CountryModel countryDetails,
          @JsonKey(name: 'city') final CityModel cityDetails,
          @JsonKey(name: 'stateProv') final StateProvModel stateDetails}) =
      _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  @JsonKey(name: 'addressLine1')
  String get addressLine_1;
  @override
  @JsonKey(name: 'addressLine2')
  String get addressLine_2;
  @override
  @JsonKey(name: 'postalCode')
  String get pinCode;
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
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}
