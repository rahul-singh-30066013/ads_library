// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SendOtpRequest _$SendOtpRequestFromJson(Map<String, dynamic> json) {
  return _SendOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$SendOtpRequest {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  bool get isWhatsapp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendOtpRequestCopyWith<SendOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpRequestCopyWith<$Res> {
  factory $SendOtpRequestCopyWith(
          SendOtpRequest value, $Res Function(SendOtpRequest) then) =
      _$SendOtpRequestCopyWithImpl<$Res, SendOtpRequest>;
  @useResult
  $Res call({String phoneNumber, String countryCode, bool isWhatsapp});
}

/// @nodoc
class _$SendOtpRequestCopyWithImpl<$Res, $Val extends SendOtpRequest>
    implements $SendOtpRequestCopyWith<$Res> {
  _$SendOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? countryCode = null,
    Object? isWhatsapp = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      isWhatsapp: null == isWhatsapp
          ? _value.isWhatsapp
          : isWhatsapp // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendOtpRequestCopyWith<$Res>
    implements $SendOtpRequestCopyWith<$Res> {
  factory _$$_SendOtpRequestCopyWith(
          _$_SendOtpRequest value, $Res Function(_$_SendOtpRequest) then) =
      __$$_SendOtpRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String countryCode, bool isWhatsapp});
}

/// @nodoc
class __$$_SendOtpRequestCopyWithImpl<$Res>
    extends _$SendOtpRequestCopyWithImpl<$Res, _$_SendOtpRequest>
    implements _$$_SendOtpRequestCopyWith<$Res> {
  __$$_SendOtpRequestCopyWithImpl(
      _$_SendOtpRequest _value, $Res Function(_$_SendOtpRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? countryCode = null,
    Object? isWhatsapp = null,
  }) {
    return _then(_$_SendOtpRequest(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      isWhatsapp: null == isWhatsapp
          ? _value.isWhatsapp
          : isWhatsapp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendOtpRequest implements _SendOtpRequest {
  const _$_SendOtpRequest(this.phoneNumber, this.countryCode,
      {this.isWhatsapp = false});

  factory _$_SendOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SendOtpRequestFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String countryCode;
  @override
  @JsonKey()
  final bool isWhatsapp;

  @override
  String toString() {
    return 'SendOtpRequest(phoneNumber: $phoneNumber, countryCode: $countryCode, isWhatsapp: $isWhatsapp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendOtpRequest &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.isWhatsapp, isWhatsapp) ||
                other.isWhatsapp == isWhatsapp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, countryCode, isWhatsapp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendOtpRequestCopyWith<_$_SendOtpRequest> get copyWith =>
      __$$_SendOtpRequestCopyWithImpl<_$_SendOtpRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendOtpRequestToJson(
      this,
    );
  }
}

abstract class _SendOtpRequest implements SendOtpRequest {
  const factory _SendOtpRequest(
      final String phoneNumber, final String countryCode,
      {final bool isWhatsapp}) = _$_SendOtpRequest;

  factory _SendOtpRequest.fromJson(Map<String, dynamic> json) =
      _$_SendOtpRequest.fromJson;

  @override
  String get phoneNumber;
  @override
  String get countryCode;
  @override
  bool get isWhatsapp;
  @override
  @JsonKey(ignore: true)
  _$$_SendOtpRequestCopyWith<_$_SendOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
