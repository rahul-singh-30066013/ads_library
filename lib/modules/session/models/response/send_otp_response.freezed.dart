// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) {
  return _SendOtpResponse.fromJson(json);
}

/// @nodoc
mixin _$SendOtpResponse {
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool get isRegistered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendOtpResponseCopyWith<SendOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpResponseCopyWith<$Res> {
  factory $SendOtpResponseCopyWith(
          SendOtpResponse value, $Res Function(SendOtpResponse) then) =
      _$SendOtpResponseCopyWithImpl<$Res, SendOtpResponse>;
  @useResult
  $Res call({String phoneNumber, String? email, bool isRegistered});
}

/// @nodoc
class _$SendOtpResponseCopyWithImpl<$Res, $Val extends SendOtpResponse>
    implements $SendOtpResponseCopyWith<$Res> {
  _$SendOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? isRegistered = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendOtpResponseCopyWith<$Res>
    implements $SendOtpResponseCopyWith<$Res> {
  factory _$$_SendOtpResponseCopyWith(
          _$_SendOtpResponse value, $Res Function(_$_SendOtpResponse) then) =
      __$$_SendOtpResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String? email, bool isRegistered});
}

/// @nodoc
class __$$_SendOtpResponseCopyWithImpl<$Res>
    extends _$SendOtpResponseCopyWithImpl<$Res, _$_SendOtpResponse>
    implements _$$_SendOtpResponseCopyWith<$Res> {
  __$$_SendOtpResponseCopyWithImpl(
      _$_SendOtpResponse _value, $Res Function(_$_SendOtpResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? isRegistered = null,
  }) {
    return _then(_$_SendOtpResponse(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendOtpResponse implements _SendOtpResponse {
  const _$_SendOtpResponse(
      {required this.phoneNumber, this.email, required this.isRegistered});

  factory _$_SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SendOtpResponseFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String? email;
  @override
  final bool isRegistered;

  @override
  String toString() {
    return 'SendOtpResponse(phoneNumber: $phoneNumber, email: $email, isRegistered: $isRegistered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendOtpResponse &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, email, isRegistered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendOtpResponseCopyWith<_$_SendOtpResponse> get copyWith =>
      __$$_SendOtpResponseCopyWithImpl<_$_SendOtpResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendOtpResponseToJson(
      this,
    );
  }
}

abstract class _SendOtpResponse implements SendOtpResponse {
  const factory _SendOtpResponse(
      {required final String phoneNumber,
      final String? email,
      required final bool isRegistered}) = _$_SendOtpResponse;

  factory _SendOtpResponse.fromJson(Map<String, dynamic> json) =
      _$_SendOtpResponse.fromJson;

  @override
  String get phoneNumber;
  @override
  String? get email;
  @override
  bool get isRegistered;
  @override
  @JsonKey(ignore: true)
  _$$_SendOtpResponseCopyWith<_$_SendOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
