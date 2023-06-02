// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_order_cancellation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeOrderCancellationResponse _$DutyFreeOrderCancellationResponseFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeOrderCancellationResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeOrderCancellationResponse {
  String? get message => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeOrderCancellationResponseCopyWith<DutyFreeOrderCancellationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeOrderCancellationResponseCopyWith<$Res> {
  factory $DutyFreeOrderCancellationResponseCopyWith(
          DutyFreeOrderCancellationResponse value,
          $Res Function(DutyFreeOrderCancellationResponse) then) =
      _$DutyFreeOrderCancellationResponseCopyWithImpl<$Res,
          DutyFreeOrderCancellationResponse>;
  @useResult
  $Res call({String? message, String? status});
}

/// @nodoc
class _$DutyFreeOrderCancellationResponseCopyWithImpl<$Res,
        $Val extends DutyFreeOrderCancellationResponse>
    implements $DutyFreeOrderCancellationResponseCopyWith<$Res> {
  _$DutyFreeOrderCancellationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeOrderCancellationResponseCopyWith<$Res>
    implements $DutyFreeOrderCancellationResponseCopyWith<$Res> {
  factory _$$_DutyFreeOrderCancellationResponseCopyWith(
          _$_DutyFreeOrderCancellationResponse value,
          $Res Function(_$_DutyFreeOrderCancellationResponse) then) =
      __$$_DutyFreeOrderCancellationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? status});
}

/// @nodoc
class __$$_DutyFreeOrderCancellationResponseCopyWithImpl<$Res>
    extends _$DutyFreeOrderCancellationResponseCopyWithImpl<$Res,
        _$_DutyFreeOrderCancellationResponse>
    implements _$$_DutyFreeOrderCancellationResponseCopyWith<$Res> {
  __$$_DutyFreeOrderCancellationResponseCopyWithImpl(
      _$_DutyFreeOrderCancellationResponse _value,
      $Res Function(_$_DutyFreeOrderCancellationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_DutyFreeOrderCancellationResponse(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeOrderCancellationResponse
    implements _DutyFreeOrderCancellationResponse {
  const _$_DutyFreeOrderCancellationResponse({this.message, this.status});

  factory _$_DutyFreeOrderCancellationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_DutyFreeOrderCancellationResponseFromJson(json);

  @override
  final String? message;
  @override
  final String? status;

  @override
  String toString() {
    return 'DutyFreeOrderCancellationResponse(message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeOrderCancellationResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeOrderCancellationResponseCopyWith<
          _$_DutyFreeOrderCancellationResponse>
      get copyWith => __$$_DutyFreeOrderCancellationResponseCopyWithImpl<
          _$_DutyFreeOrderCancellationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeOrderCancellationResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreeOrderCancellationResponse
    implements DutyFreeOrderCancellationResponse {
  const factory _DutyFreeOrderCancellationResponse(
      {final String? message,
      final String? status}) = _$_DutyFreeOrderCancellationResponse;

  factory _DutyFreeOrderCancellationResponse.fromJson(
          Map<String, dynamic> json) =
      _$_DutyFreeOrderCancellationResponse.fromJson;

  @override
  String? get message;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeOrderCancellationResponseCopyWith<
          _$_DutyFreeOrderCancellationResponse>
      get copyWith => throw _privateConstructorUsedError;
}
