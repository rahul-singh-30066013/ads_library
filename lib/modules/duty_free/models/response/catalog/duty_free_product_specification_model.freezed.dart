// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_product_specification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeProductSpecificationModel _$DutyFreeProductSpecificationModelFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeProductSpecificationModel.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeProductSpecificationModel {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeProductSpecificationModelCopyWith<DutyFreeProductSpecificationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeProductSpecificationModelCopyWith<$Res> {
  factory $DutyFreeProductSpecificationModelCopyWith(
          DutyFreeProductSpecificationModel value,
          $Res Function(DutyFreeProductSpecificationModel) then) =
      _$DutyFreeProductSpecificationModelCopyWithImpl<$Res,
          DutyFreeProductSpecificationModel>;
  @useResult
  $Res call({String key, String value});
}

/// @nodoc
class _$DutyFreeProductSpecificationModelCopyWithImpl<$Res,
        $Val extends DutyFreeProductSpecificationModel>
    implements $DutyFreeProductSpecificationModelCopyWith<$Res> {
  _$DutyFreeProductSpecificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeProductSpecificationModelCopyWith<$Res>
    implements $DutyFreeProductSpecificationModelCopyWith<$Res> {
  factory _$$_DutyFreeProductSpecificationModelCopyWith(
          _$_DutyFreeProductSpecificationModel value,
          $Res Function(_$_DutyFreeProductSpecificationModel) then) =
      __$$_DutyFreeProductSpecificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String value});
}

/// @nodoc
class __$$_DutyFreeProductSpecificationModelCopyWithImpl<$Res>
    extends _$DutyFreeProductSpecificationModelCopyWithImpl<$Res,
        _$_DutyFreeProductSpecificationModel>
    implements _$$_DutyFreeProductSpecificationModelCopyWith<$Res> {
  __$$_DutyFreeProductSpecificationModelCopyWithImpl(
      _$_DutyFreeProductSpecificationModel _value,
      $Res Function(_$_DutyFreeProductSpecificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
  }) {
    return _then(_$_DutyFreeProductSpecificationModel(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeProductSpecificationModel
    implements _DutyFreeProductSpecificationModel {
  const _$_DutyFreeProductSpecificationModel({this.key = '', this.value = ''});

  factory _$_DutyFreeProductSpecificationModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_DutyFreeProductSpecificationModelFromJson(json);

  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'DutyFreeProductSpecificationModel(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeProductSpecificationModel &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeProductSpecificationModelCopyWith<
          _$_DutyFreeProductSpecificationModel>
      get copyWith => __$$_DutyFreeProductSpecificationModelCopyWithImpl<
          _$_DutyFreeProductSpecificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeProductSpecificationModelToJson(
      this,
    );
  }
}

abstract class _DutyFreeProductSpecificationModel
    implements DutyFreeProductSpecificationModel {
  const factory _DutyFreeProductSpecificationModel(
      {final String key,
      final String value}) = _$_DutyFreeProductSpecificationModel;

  factory _DutyFreeProductSpecificationModel.fromJson(
          Map<String, dynamic> json) =
      _$_DutyFreeProductSpecificationModel.fromJson;

  @override
  String get key;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeProductSpecificationModelCopyWith<
          _$_DutyFreeProductSpecificationModel>
      get copyWith => throw _privateConstructorUsedError;
}
