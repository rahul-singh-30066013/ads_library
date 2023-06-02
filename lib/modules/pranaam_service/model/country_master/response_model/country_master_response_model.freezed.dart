// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_master_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryMasterResponseModel _$CountryMasterResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CountryMasterResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CountryMasterResponseModel {
  @JsonKey(name: 'countryMasters')
  List<CountryMasters> get countryMasters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryMasterResponseModelCopyWith<CountryMasterResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryMasterResponseModelCopyWith<$Res> {
  factory $CountryMasterResponseModelCopyWith(CountryMasterResponseModel value,
          $Res Function(CountryMasterResponseModel) then) =
      _$CountryMasterResponseModelCopyWithImpl<$Res,
          CountryMasterResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'countryMasters') List<CountryMasters> countryMasters});
}

/// @nodoc
class _$CountryMasterResponseModelCopyWithImpl<$Res,
        $Val extends CountryMasterResponseModel>
    implements $CountryMasterResponseModelCopyWith<$Res> {
  _$CountryMasterResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryMasters = null,
  }) {
    return _then(_value.copyWith(
      countryMasters: null == countryMasters
          ? _value.countryMasters
          : countryMasters // ignore: cast_nullable_to_non_nullable
              as List<CountryMasters>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryMasterResponseModelCopyWith<$Res>
    implements $CountryMasterResponseModelCopyWith<$Res> {
  factory _$$_CountryMasterResponseModelCopyWith(
          _$_CountryMasterResponseModel value,
          $Res Function(_$_CountryMasterResponseModel) then) =
      __$$_CountryMasterResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'countryMasters') List<CountryMasters> countryMasters});
}

/// @nodoc
class __$$_CountryMasterResponseModelCopyWithImpl<$Res>
    extends _$CountryMasterResponseModelCopyWithImpl<$Res,
        _$_CountryMasterResponseModel>
    implements _$$_CountryMasterResponseModelCopyWith<$Res> {
  __$$_CountryMasterResponseModelCopyWithImpl(
      _$_CountryMasterResponseModel _value,
      $Res Function(_$_CountryMasterResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryMasters = null,
  }) {
    return _then(_$_CountryMasterResponseModel(
      countryMasters: null == countryMasters
          ? _value.countryMasters
          : countryMasters // ignore: cast_nullable_to_non_nullable
              as List<CountryMasters>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryMasterResponseModel implements _CountryMasterResponseModel {
  const _$_CountryMasterResponseModel(
      {@JsonKey(name: 'countryMasters') this.countryMasters = const []});

  factory _$_CountryMasterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CountryMasterResponseModelFromJson(json);

  @override
  @JsonKey(name: 'countryMasters')
  final List<CountryMasters> countryMasters;

  @override
  String toString() {
    return 'CountryMasterResponseModel(countryMasters: $countryMasters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryMasterResponseModel &&
            const DeepCollectionEquality()
                .equals(other.countryMasters, countryMasters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(countryMasters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryMasterResponseModelCopyWith<_$_CountryMasterResponseModel>
      get copyWith => __$$_CountryMasterResponseModelCopyWithImpl<
          _$_CountryMasterResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryMasterResponseModelToJson(
      this,
    );
  }
}

abstract class _CountryMasterResponseModel
    implements CountryMasterResponseModel {
  const factory _CountryMasterResponseModel(
          {@JsonKey(name: 'countryMasters')
              final List<CountryMasters> countryMasters}) =
      _$_CountryMasterResponseModel;

  factory _CountryMasterResponseModel.fromJson(Map<String, dynamic> json) =
      _$_CountryMasterResponseModel.fromJson;

  @override
  @JsonKey(name: 'countryMasters')
  List<CountryMasters> get countryMasters;
  @override
  @JsonKey(ignore: true)
  _$$_CountryMasterResponseModelCopyWith<_$_CountryMasterResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
