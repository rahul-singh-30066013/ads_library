// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentDetailsResponse _$PaymentDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetailsResponse {
  String get transactionMode => throw _privateConstructorUsedError;
  String get transactionCode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsResponseCopyWith<PaymentDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsResponseCopyWith<$Res> {
  factory $PaymentDetailsResponseCopyWith(PaymentDetailsResponse value,
          $Res Function(PaymentDetailsResponse) then) =
      _$PaymentDetailsResponseCopyWithImpl<$Res, PaymentDetailsResponse>;
  @useResult
  $Res call({String transactionMode, String transactionCode, String status});
}

/// @nodoc
class _$PaymentDetailsResponseCopyWithImpl<$Res,
        $Val extends PaymentDetailsResponse>
    implements $PaymentDetailsResponseCopyWith<$Res> {
  _$PaymentDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionMode = null,
    Object? transactionCode = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      transactionMode: null == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCode: null == transactionCode
          ? _value.transactionCode
          : transactionCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDetailsResponseCopyWith<$Res>
    implements $PaymentDetailsResponseCopyWith<$Res> {
  factory _$$_PaymentDetailsResponseCopyWith(_$_PaymentDetailsResponse value,
          $Res Function(_$_PaymentDetailsResponse) then) =
      __$$_PaymentDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String transactionMode, String transactionCode, String status});
}

/// @nodoc
class __$$_PaymentDetailsResponseCopyWithImpl<$Res>
    extends _$PaymentDetailsResponseCopyWithImpl<$Res,
        _$_PaymentDetailsResponse>
    implements _$$_PaymentDetailsResponseCopyWith<$Res> {
  __$$_PaymentDetailsResponseCopyWithImpl(_$_PaymentDetailsResponse _value,
      $Res Function(_$_PaymentDetailsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionMode = null,
    Object? transactionCode = null,
    Object? status = null,
  }) {
    return _then(_$_PaymentDetailsResponse(
      transactionMode: null == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCode: null == transactionCode
          ? _value.transactionCode
          : transactionCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentDetailsResponse implements _PaymentDetailsResponse {
  const _$_PaymentDetailsResponse(
      {this.transactionMode = '', this.transactionCode = '', this.status = ''});

  factory _$_PaymentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentDetailsResponseFromJson(json);

  @override
  @JsonKey()
  final String transactionMode;
  @override
  @JsonKey()
  final String transactionCode;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'PaymentDetailsResponse(transactionMode: $transactionMode, transactionCode: $transactionCode, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentDetailsResponse &&
            (identical(other.transactionMode, transactionMode) ||
                other.transactionMode == transactionMode) &&
            (identical(other.transactionCode, transactionCode) ||
                other.transactionCode == transactionCode) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transactionMode, transactionCode, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDetailsResponseCopyWith<_$_PaymentDetailsResponse> get copyWith =>
      __$$_PaymentDetailsResponseCopyWithImpl<_$_PaymentDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDetailsResponseToJson(
      this,
    );
  }
}

abstract class _PaymentDetailsResponse implements PaymentDetailsResponse {
  const factory _PaymentDetailsResponse(
      {final String transactionMode,
      final String transactionCode,
      final String status}) = _$_PaymentDetailsResponse;

  factory _PaymentDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_PaymentDetailsResponse.fromJson;

  @override
  String get transactionMode;
  @override
  String get transactionCode;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDetailsResponseCopyWith<_$_PaymentDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
