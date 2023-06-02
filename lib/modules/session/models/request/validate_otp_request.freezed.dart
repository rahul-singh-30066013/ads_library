// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidateOtpRequest _$ValidateOtpRequestFromJson(Map<String, dynamic> json) {
  return _ValidateOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$ValidateOtpRequest {
  String get source => throw _privateConstructorUsedError;
  String get otpCode => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidateOtpRequestCopyWith<ValidateOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidateOtpRequestCopyWith<$Res> {
  factory $ValidateOtpRequestCopyWith(
          ValidateOtpRequest value, $Res Function(ValidateOtpRequest) then) =
      _$ValidateOtpRequestCopyWithImpl<$Res, ValidateOtpRequest>;
  @useResult
  $Res call({String source, String otpCode, String? referralCode});
}

/// @nodoc
class _$ValidateOtpRequestCopyWithImpl<$Res, $Val extends ValidateOtpRequest>
    implements $ValidateOtpRequestCopyWith<$Res> {
  _$ValidateOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? otpCode = null,
    Object? referralCode = freezed,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidateOtpRequestCopyWith<$Res>
    implements $ValidateOtpRequestCopyWith<$Res> {
  factory _$$_ValidateOtpRequestCopyWith(_$_ValidateOtpRequest value,
          $Res Function(_$_ValidateOtpRequest) then) =
      __$$_ValidateOtpRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, String otpCode, String? referralCode});
}

/// @nodoc
class __$$_ValidateOtpRequestCopyWithImpl<$Res>
    extends _$ValidateOtpRequestCopyWithImpl<$Res, _$_ValidateOtpRequest>
    implements _$$_ValidateOtpRequestCopyWith<$Res> {
  __$$_ValidateOtpRequestCopyWithImpl(
      _$_ValidateOtpRequest _value, $Res Function(_$_ValidateOtpRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? otpCode = null,
    Object? referralCode = freezed,
  }) {
    return _then(_$_ValidateOtpRequest(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidateOtpRequest
    with DiagnosticableTreeMixin
    implements _ValidateOtpRequest {
  const _$_ValidateOtpRequest(this.source, this.otpCode, this.referralCode);

  factory _$_ValidateOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ValidateOtpRequestFromJson(json);

  @override
  final String source;
  @override
  final String otpCode;
  @override
  final String? referralCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValidateOtpRequest(source: $source, otpCode: $otpCode, referralCode: $referralCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValidateOtpRequest'))
      ..add(DiagnosticsProperty('source', source))
      ..add(DiagnosticsProperty('otpCode', otpCode))
      ..add(DiagnosticsProperty('referralCode', referralCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidateOtpRequest &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, source, otpCode, referralCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidateOtpRequestCopyWith<_$_ValidateOtpRequest> get copyWith =>
      __$$_ValidateOtpRequestCopyWithImpl<_$_ValidateOtpRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidateOtpRequestToJson(
      this,
    );
  }
}

abstract class _ValidateOtpRequest implements ValidateOtpRequest {
  const factory _ValidateOtpRequest(final String source, final String otpCode,
      final String? referralCode) = _$_ValidateOtpRequest;

  factory _ValidateOtpRequest.fromJson(Map<String, dynamic> json) =
      _$_ValidateOtpRequest.fromJson;

  @override
  String get source;
  @override
  String get otpCode;
  @override
  String? get referralCode;
  @override
  @JsonKey(ignore: true)
  _$$_ValidateOtpRequestCopyWith<_$_ValidateOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
