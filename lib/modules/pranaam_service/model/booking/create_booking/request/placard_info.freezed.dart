// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'placard_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlacardInfo _$PlacardInfoFromJson(Map<String, dynamic> json) {
  return _PlacardInfo.fromJson(json);
}

/// @nodoc
mixin _$PlacardInfo {
  @JsonKey(name: 'personName')
  PersonNameModel get personName => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryDialCode')
  String get countryDialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNumber')
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstruction')
  String get specialInstruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'porterName')
  String get porterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'baggageCount')
  int get baggageCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlacardInfoCopyWith<PlacardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacardInfoCopyWith<$Res> {
  factory $PlacardInfoCopyWith(
          PlacardInfo value, $Res Function(PlacardInfo) then) =
      _$PlacardInfoCopyWithImpl<$Res, PlacardInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'personName') PersonNameModel personName,
      @JsonKey(name: 'countryDialCode') String countryDialCode,
      @JsonKey(name: 'mobileNumber') String mobileNumber,
      @JsonKey(name: 'specialInstruction') String specialInstruction,
      @JsonKey(name: 'porterName') String porterName,
      @JsonKey(name: 'baggageCount') int baggageCount});

  $PersonNameModelCopyWith<$Res> get personName;
}

/// @nodoc
class _$PlacardInfoCopyWithImpl<$Res, $Val extends PlacardInfo>
    implements $PlacardInfoCopyWith<$Res> {
  _$PlacardInfoCopyWithImpl(this._value, this._then);

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
    Object? specialInstruction = null,
    Object? porterName = null,
    Object? baggageCount = null,
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
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      porterName: null == porterName
          ? _value.porterName
          : porterName // ignore: cast_nullable_to_non_nullable
              as String,
      baggageCount: null == baggageCount
          ? _value.baggageCount
          : baggageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonNameModelCopyWith<$Res> get personName {
    return $PersonNameModelCopyWith<$Res>(_value.personName, (value) {
      return _then(_value.copyWith(personName: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlacardInfoCopyWith<$Res>
    implements $PlacardInfoCopyWith<$Res> {
  factory _$$_PlacardInfoCopyWith(
          _$_PlacardInfo value, $Res Function(_$_PlacardInfo) then) =
      __$$_PlacardInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'personName') PersonNameModel personName,
      @JsonKey(name: 'countryDialCode') String countryDialCode,
      @JsonKey(name: 'mobileNumber') String mobileNumber,
      @JsonKey(name: 'specialInstruction') String specialInstruction,
      @JsonKey(name: 'porterName') String porterName,
      @JsonKey(name: 'baggageCount') int baggageCount});

  @override
  $PersonNameModelCopyWith<$Res> get personName;
}

/// @nodoc
class __$$_PlacardInfoCopyWithImpl<$Res>
    extends _$PlacardInfoCopyWithImpl<$Res, _$_PlacardInfo>
    implements _$$_PlacardInfoCopyWith<$Res> {
  __$$_PlacardInfoCopyWithImpl(
      _$_PlacardInfo _value, $Res Function(_$_PlacardInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personName = null,
    Object? countryDialCode = null,
    Object? mobileNumber = null,
    Object? specialInstruction = null,
    Object? porterName = null,
    Object? baggageCount = null,
  }) {
    return _then(_$_PlacardInfo(
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
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      porterName: null == porterName
          ? _value.porterName
          : porterName // ignore: cast_nullable_to_non_nullable
              as String,
      baggageCount: null == baggageCount
          ? _value.baggageCount
          : baggageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PlacardInfo implements _PlacardInfo {
  const _$_PlacardInfo(
      {@JsonKey(name: 'personName') this.personName = const PersonNameModel(),
      @JsonKey(name: 'countryDialCode') this.countryDialCode = '',
      @JsonKey(name: 'mobileNumber') this.mobileNumber = '',
      @JsonKey(name: 'specialInstruction') this.specialInstruction = '',
      @JsonKey(name: 'porterName') this.porterName = '',
      @JsonKey(name: 'baggageCount') this.baggageCount = 0});

  factory _$_PlacardInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PlacardInfoFromJson(json);

  @override
  @JsonKey(name: 'personName')
  final PersonNameModel personName;
  @override
  @JsonKey(name: 'countryDialCode')
  final String countryDialCode;
  @override
  @JsonKey(name: 'mobileNumber')
  final String mobileNumber;
  @override
  @JsonKey(name: 'specialInstruction')
  final String specialInstruction;
  @override
  @JsonKey(name: 'porterName')
  final String porterName;
  @override
  @JsonKey(name: 'baggageCount')
  final int baggageCount;

  @override
  String toString() {
    return 'PlacardInfo(personName: $personName, countryDialCode: $countryDialCode, mobileNumber: $mobileNumber, specialInstruction: $specialInstruction, porterName: $porterName, baggageCount: $baggageCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlacardInfo &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.countryDialCode, countryDialCode) ||
                other.countryDialCode == countryDialCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.specialInstruction, specialInstruction) ||
                other.specialInstruction == specialInstruction) &&
            (identical(other.porterName, porterName) ||
                other.porterName == porterName) &&
            (identical(other.baggageCount, baggageCount) ||
                other.baggageCount == baggageCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personName, countryDialCode,
      mobileNumber, specialInstruction, porterName, baggageCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlacardInfoCopyWith<_$_PlacardInfo> get copyWith =>
      __$$_PlacardInfoCopyWithImpl<_$_PlacardInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacardInfoToJson(
      this,
    );
  }
}

abstract class _PlacardInfo implements PlacardInfo {
  const factory _PlacardInfo(
      {@JsonKey(name: 'personName') final PersonNameModel personName,
      @JsonKey(name: 'countryDialCode') final String countryDialCode,
      @JsonKey(name: 'mobileNumber') final String mobileNumber,
      @JsonKey(name: 'specialInstruction') final String specialInstruction,
      @JsonKey(name: 'porterName') final String porterName,
      @JsonKey(name: 'baggageCount') final int baggageCount}) = _$_PlacardInfo;

  factory _PlacardInfo.fromJson(Map<String, dynamic> json) =
      _$_PlacardInfo.fromJson;

  @override
  @JsonKey(name: 'personName')
  PersonNameModel get personName;
  @override
  @JsonKey(name: 'countryDialCode')
  String get countryDialCode;
  @override
  @JsonKey(name: 'mobileNumber')
  String get mobileNumber;
  @override
  @JsonKey(name: 'specialInstruction')
  String get specialInstruction;
  @override
  @JsonKey(name: 'porterName')
  String get porterName;
  @override
  @JsonKey(name: 'baggageCount')
  int get baggageCount;
  @override
  @JsonKey(ignore: true)
  _$$_PlacardInfoCopyWith<_$_PlacardInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
