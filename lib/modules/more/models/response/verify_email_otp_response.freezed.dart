// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyEmailOtpResponse _$VerifyEmailOtpResponseFromJson(
    Map<String, dynamic> json) {
  return _VerifyEmailOtpResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyEmailOtpResponse {
  bool? get isSuccess => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyEmailOtpResponseCopyWith<VerifyEmailOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailOtpResponseCopyWith<$Res> {
  factory $VerifyEmailOtpResponseCopyWith(VerifyEmailOtpResponse value,
          $Res Function(VerifyEmailOtpResponse) then) =
      _$VerifyEmailOtpResponseCopyWithImpl<$Res, VerifyEmailOtpResponse>;
  @useResult
  $Res call({bool? isSuccess, String? successMessage});
}

/// @nodoc
class _$VerifyEmailOtpResponseCopyWithImpl<$Res,
        $Val extends VerifyEmailOtpResponse>
    implements $VerifyEmailOtpResponseCopyWith<$Res> {
  _$VerifyEmailOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyEmailOtpResponseCopyWith<$Res>
    implements $VerifyEmailOtpResponseCopyWith<$Res> {
  factory _$$_VerifyEmailOtpResponseCopyWith(_$_VerifyEmailOtpResponse value,
          $Res Function(_$_VerifyEmailOtpResponse) then) =
      __$$_VerifyEmailOtpResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isSuccess, String? successMessage});
}

/// @nodoc
class __$$_VerifyEmailOtpResponseCopyWithImpl<$Res>
    extends _$VerifyEmailOtpResponseCopyWithImpl<$Res,
        _$_VerifyEmailOtpResponse>
    implements _$$_VerifyEmailOtpResponseCopyWith<$Res> {
  __$$_VerifyEmailOtpResponseCopyWithImpl(_$_VerifyEmailOtpResponse _value,
      $Res Function(_$_VerifyEmailOtpResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_$_VerifyEmailOtpResponse(
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerifyEmailOtpResponse implements _VerifyEmailOtpResponse {
  const _$_VerifyEmailOtpResponse({this.isSuccess, this.successMessage});

  factory _$_VerifyEmailOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$$_VerifyEmailOtpResponseFromJson(json);

  @override
  final bool? isSuccess;
  @override
  final String? successMessage;

  @override
  String toString() {
    return 'VerifyEmailOtpResponse(isSuccess: $isSuccess, successMessage: $successMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyEmailOtpResponse &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, successMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyEmailOtpResponseCopyWith<_$_VerifyEmailOtpResponse> get copyWith =>
      __$$_VerifyEmailOtpResponseCopyWithImpl<_$_VerifyEmailOtpResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerifyEmailOtpResponseToJson(
      this,
    );
  }
}

abstract class _VerifyEmailOtpResponse implements VerifyEmailOtpResponse {
  const factory _VerifyEmailOtpResponse(
      {final bool? isSuccess,
      final String? successMessage}) = _$_VerifyEmailOtpResponse;

  factory _VerifyEmailOtpResponse.fromJson(Map<String, dynamic> json) =
      _$_VerifyEmailOtpResponse.fromJson;

  @override
  bool? get isSuccess;
  @override
  String? get successMessage;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyEmailOtpResponseCopyWith<_$_VerifyEmailOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
