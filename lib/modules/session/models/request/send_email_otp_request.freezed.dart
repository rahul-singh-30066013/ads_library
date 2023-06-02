// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_email_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendEmailOtpRequest _$SendEmailOtpRequestFromJson(Map<String, dynamic> json) {
  return _SendEmailOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$SendEmailOtpRequest {
  String get emailAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendEmailOtpRequestCopyWith<SendEmailOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendEmailOtpRequestCopyWith<$Res> {
  factory $SendEmailOtpRequestCopyWith(
          SendEmailOtpRequest value, $Res Function(SendEmailOtpRequest) then) =
      _$SendEmailOtpRequestCopyWithImpl<$Res, SendEmailOtpRequest>;
  @useResult
  $Res call({String emailAddress});
}

/// @nodoc
class _$SendEmailOtpRequestCopyWithImpl<$Res, $Val extends SendEmailOtpRequest>
    implements $SendEmailOtpRequestCopyWith<$Res> {
  _$SendEmailOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendEmailOtpRequestCopyWith<$Res>
    implements $SendEmailOtpRequestCopyWith<$Res> {
  factory _$$_SendEmailOtpRequestCopyWith(_$_SendEmailOtpRequest value,
          $Res Function(_$_SendEmailOtpRequest) then) =
      __$$_SendEmailOtpRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String emailAddress});
}

/// @nodoc
class __$$_SendEmailOtpRequestCopyWithImpl<$Res>
    extends _$SendEmailOtpRequestCopyWithImpl<$Res, _$_SendEmailOtpRequest>
    implements _$$_SendEmailOtpRequestCopyWith<$Res> {
  __$$_SendEmailOtpRequestCopyWithImpl(_$_SendEmailOtpRequest _value,
      $Res Function(_$_SendEmailOtpRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
  }) {
    return _then(_$_SendEmailOtpRequest(
      null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendEmailOtpRequest implements _SendEmailOtpRequest {
  const _$_SendEmailOtpRequest(this.emailAddress);

  factory _$_SendEmailOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SendEmailOtpRequestFromJson(json);

  @override
  final String emailAddress;

  @override
  String toString() {
    return 'SendEmailOtpRequest(emailAddress: $emailAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendEmailOtpRequest &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, emailAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendEmailOtpRequestCopyWith<_$_SendEmailOtpRequest> get copyWith =>
      __$$_SendEmailOtpRequestCopyWithImpl<_$_SendEmailOtpRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendEmailOtpRequestToJson(
      this,
    );
  }
}

abstract class _SendEmailOtpRequest implements SendEmailOtpRequest {
  const factory _SendEmailOtpRequest(final String emailAddress) =
      _$_SendEmailOtpRequest;

  factory _SendEmailOtpRequest.fromJson(Map<String, dynamic> json) =
      _$_SendEmailOtpRequest.fromJson;

  @override
  String get emailAddress;
  @override
  @JsonKey(ignore: true)
  _$$_SendEmailOtpRequestCopyWith<_$_SendEmailOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
