// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_out_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignOutRequest _$SignOutRequestFromJson(Map<String, dynamic> json) {
  return _SignOutRequest.fromJson(json);
}

/// @nodoc
mixin _$SignOutRequest {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignOutRequestCopyWith<SignOutRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignOutRequestCopyWith<$Res> {
  factory $SignOutRequestCopyWith(
          SignOutRequest value, $Res Function(SignOutRequest) then) =
      _$SignOutRequestCopyWithImpl<$Res, SignOutRequest>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$SignOutRequestCopyWithImpl<$Res, $Val extends SignOutRequest>
    implements $SignOutRequestCopyWith<$Res> {
  _$SignOutRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignOutRequestCopyWith<$Res>
    implements $SignOutRequestCopyWith<$Res> {
  factory _$$_SignOutRequestCopyWith(
          _$_SignOutRequest value, $Res Function(_$_SignOutRequest) then) =
      __$$_SignOutRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$_SignOutRequestCopyWithImpl<$Res>
    extends _$SignOutRequestCopyWithImpl<$Res, _$_SignOutRequest>
    implements _$$_SignOutRequestCopyWith<$Res> {
  __$$_SignOutRequestCopyWithImpl(
      _$_SignOutRequest _value, $Res Function(_$_SignOutRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_SignOutRequest(
      null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignOutRequest implements _SignOutRequest {
  const _$_SignOutRequest(this.accessToken, this.refreshToken);

  factory _$_SignOutRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SignOutRequestFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'SignOutRequest(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignOutRequest &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignOutRequestCopyWith<_$_SignOutRequest> get copyWith =>
      __$$_SignOutRequestCopyWithImpl<_$_SignOutRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignOutRequestToJson(
      this,
    );
  }
}

abstract class _SignOutRequest implements SignOutRequest {
  const factory _SignOutRequest(
      final String accessToken, final String refreshToken) = _$_SignOutRequest;

  factory _SignOutRequest.fromJson(Map<String, dynamic> json) =
      _$_SignOutRequest.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_SignOutRequestCopyWith<_$_SignOutRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
