// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RescheduleResponse _$RescheduleResponseFromJson(Map<String, dynamic> json) {
  return _RescheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$RescheduleResponse {
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RescheduleResponseCopyWith<RescheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleResponseCopyWith<$Res> {
  factory $RescheduleResponseCopyWith(
          RescheduleResponse value, $Res Function(RescheduleResponse) then) =
      _$RescheduleResponseCopyWithImpl<$Res, RescheduleResponse>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$RescheduleResponseCopyWithImpl<$Res, $Val extends RescheduleResponse>
    implements $RescheduleResponseCopyWith<$Res> {
  _$RescheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RescheduleResponseCopyWith<$Res>
    implements $RescheduleResponseCopyWith<$Res> {
  factory _$$_RescheduleResponseCopyWith(_$_RescheduleResponse value,
          $Res Function(_$_RescheduleResponse) then) =
      __$$_RescheduleResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$_RescheduleResponseCopyWithImpl<$Res>
    extends _$RescheduleResponseCopyWithImpl<$Res, _$_RescheduleResponse>
    implements _$$_RescheduleResponseCopyWith<$Res> {
  __$$_RescheduleResponseCopyWithImpl(
      _$_RescheduleResponse _value, $Res Function(_$_RescheduleResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$_RescheduleResponse(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RescheduleResponse implements _RescheduleResponse {
  const _$_RescheduleResponse({this.description = ''});

  factory _$_RescheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RescheduleResponseFromJson(json);

  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'RescheduleResponse(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduleResponse &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduleResponseCopyWith<_$_RescheduleResponse> get copyWith =>
      __$$_RescheduleResponseCopyWithImpl<_$_RescheduleResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduleResponseToJson(
      this,
    );
  }
}

abstract class _RescheduleResponse implements RescheduleResponse {
  const factory _RescheduleResponse({final String description}) =
      _$_RescheduleResponse;

  factory _RescheduleResponse.fromJson(Map<String, dynamic> json) =
      _$_RescheduleResponse.fromJson;

  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduleResponseCopyWith<_$_RescheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
