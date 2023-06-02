// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateOtpResponse _$ValidateOtpResponseFromJson(Map<String, dynamic> json) {
  return _ValidateOtpResponse.fromJson(json);
}

/// @nodoc
mixin _$ValidateOtpResponse {
  bool get isRegistered => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get expiry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateOtpResponseCopyWith<ValidateOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateOtpResponseCopyWith<$Res> {
  factory $ValidateOtpResponseCopyWith(
          ValidateOtpResponse value, $Res Function(ValidateOtpResponse) then) =
      _$ValidateOtpResponseCopyWithImpl<$Res, ValidateOtpResponse>;
  @useResult
  $Res call(
      {bool isRegistered, String accessToken, String refreshToken, int expiry});
}

/// @nodoc
class _$ValidateOtpResponseCopyWithImpl<$Res, $Val extends ValidateOtpResponse>
    implements $ValidateOtpResponseCopyWith<$Res> {
  _$ValidateOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRegistered = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiry = null,
  }) {
    return _then(_value.copyWith(
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidateOtpResponseCopyWith<$Res>
    implements $ValidateOtpResponseCopyWith<$Res> {
  factory _$$_ValidateOtpResponseCopyWith(_$_ValidateOtpResponse value,
          $Res Function(_$_ValidateOtpResponse) then) =
      __$$_ValidateOtpResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isRegistered, String accessToken, String refreshToken, int expiry});
}

/// @nodoc
class __$$_ValidateOtpResponseCopyWithImpl<$Res>
    extends _$ValidateOtpResponseCopyWithImpl<$Res, _$_ValidateOtpResponse>
    implements _$$_ValidateOtpResponseCopyWith<$Res> {
  __$$_ValidateOtpResponseCopyWithImpl(_$_ValidateOtpResponse _value,
      $Res Function(_$_ValidateOtpResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRegistered = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiry = null,
  }) {
    return _then(_$_ValidateOtpResponse(
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidateOtpResponse implements _ValidateOtpResponse {
  const _$_ValidateOtpResponse(
      {required this.isRegistered,
      required this.accessToken,
      required this.refreshToken,
      required this.expiry});

  factory _$_ValidateOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ValidateOtpResponseFromJson(json);

  @override
  final bool isRegistered;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final int expiry;

  @override
  String toString() {
    return 'ValidateOtpResponse(isRegistered: $isRegistered, accessToken: $accessToken, refreshToken: $refreshToken, expiry: $expiry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidateOtpResponse &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiry, expiry) || other.expiry == expiry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isRegistered, accessToken, refreshToken, expiry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidateOtpResponseCopyWith<_$_ValidateOtpResponse> get copyWith =>
      __$$_ValidateOtpResponseCopyWithImpl<_$_ValidateOtpResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidateOtpResponseToJson(
      this,
    );
  }
}

abstract class _ValidateOtpResponse implements ValidateOtpResponse {
  const factory _ValidateOtpResponse(
      {required final bool isRegistered,
      required final String accessToken,
      required final String refreshToken,
      required final int expiry}) = _$_ValidateOtpResponse;

  factory _ValidateOtpResponse.fromJson(Map<String, dynamic> json) =
      _$_ValidateOtpResponse.fromJson;

  @override
  bool get isRegistered;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  int get expiry;
  @override
  @JsonKey(ignore: true)
  _$$_ValidateOtpResponseCopyWith<_$_ValidateOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
