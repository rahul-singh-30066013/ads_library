// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_filter_base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeFilterBaseResponse _$DutyFreeFilterBaseResponseFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeFilterBaseResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeFilterBaseResponse {
  int get count => throw _privateConstructorUsedError;
  DutyFreeFilterResultModel get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeFilterBaseResponseCopyWith<DutyFreeFilterBaseResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeFilterBaseResponseCopyWith<$Res> {
  factory $DutyFreeFilterBaseResponseCopyWith(DutyFreeFilterBaseResponse value,
          $Res Function(DutyFreeFilterBaseResponse) then) =
      _$DutyFreeFilterBaseResponseCopyWithImpl<$Res,
          DutyFreeFilterBaseResponse>;
  @useResult
  $Res call({int count, DutyFreeFilterResultModel result});

  $DutyFreeFilterResultModelCopyWith<$Res> get result;
}

/// @nodoc
class _$DutyFreeFilterBaseResponseCopyWithImpl<$Res,
        $Val extends DutyFreeFilterBaseResponse>
    implements $DutyFreeFilterBaseResponseCopyWith<$Res> {
  _$DutyFreeFilterBaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as DutyFreeFilterResultModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DutyFreeFilterResultModelCopyWith<$Res> get result {
    return $DutyFreeFilterResultModelCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DutyFreeFilterBaseResponseCopyWith<$Res>
    implements $DutyFreeFilterBaseResponseCopyWith<$Res> {
  factory _$$_DutyFreeFilterBaseResponseCopyWith(
          _$_DutyFreeFilterBaseResponse value,
          $Res Function(_$_DutyFreeFilterBaseResponse) then) =
      __$$_DutyFreeFilterBaseResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, DutyFreeFilterResultModel result});

  @override
  $DutyFreeFilterResultModelCopyWith<$Res> get result;
}

/// @nodoc
class __$$_DutyFreeFilterBaseResponseCopyWithImpl<$Res>
    extends _$DutyFreeFilterBaseResponseCopyWithImpl<$Res,
        _$_DutyFreeFilterBaseResponse>
    implements _$$_DutyFreeFilterBaseResponseCopyWith<$Res> {
  __$$_DutyFreeFilterBaseResponseCopyWithImpl(
      _$_DutyFreeFilterBaseResponse _value,
      $Res Function(_$_DutyFreeFilterBaseResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? result = null,
  }) {
    return _then(_$_DutyFreeFilterBaseResponse(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as DutyFreeFilterResultModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeFilterBaseResponse implements _DutyFreeFilterBaseResponse {
  const _$_DutyFreeFilterBaseResponse(
      {this.count = 0, this.result = const DutyFreeFilterResultModel()});

  factory _$_DutyFreeFilterBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeFilterBaseResponseFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final DutyFreeFilterResultModel result;

  @override
  String toString() {
    return 'DutyFreeFilterBaseResponse(count: $count, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeFilterBaseResponse &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeFilterBaseResponseCopyWith<_$_DutyFreeFilterBaseResponse>
      get copyWith => __$$_DutyFreeFilterBaseResponseCopyWithImpl<
          _$_DutyFreeFilterBaseResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeFilterBaseResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreeFilterBaseResponse
    implements DutyFreeFilterBaseResponse {
  const factory _DutyFreeFilterBaseResponse(
      {final int count,
      final DutyFreeFilterResultModel result}) = _$_DutyFreeFilterBaseResponse;

  factory _DutyFreeFilterBaseResponse.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeFilterBaseResponse.fromJson;

  @override
  int get count;
  @override
  DutyFreeFilterResultModel get result;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeFilterBaseResponseCopyWith<_$_DutyFreeFilterBaseResponse>
      get copyWith => throw _privateConstructorUsedError;
}
