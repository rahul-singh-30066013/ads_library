// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromoCodeResponse _$PromoCodeResponseFromJson(Map<String, dynamic> json) {
  return _PromoCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$PromoCodeResponse {
  String? get promoCode => throw _privateConstructorUsedError;
  double? get offerValue => throw _privateConstructorUsedError;
  String? get promoValueType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromoCodeResponseCopyWith<PromoCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeResponseCopyWith<$Res> {
  factory $PromoCodeResponseCopyWith(
          PromoCodeResponse value, $Res Function(PromoCodeResponse) then) =
      _$PromoCodeResponseCopyWithImpl<$Res, PromoCodeResponse>;
  @useResult
  $Res call({String? promoCode, double? offerValue, String? promoValueType});
}

/// @nodoc
class _$PromoCodeResponseCopyWithImpl<$Res, $Val extends PromoCodeResponse>
    implements $PromoCodeResponseCopyWith<$Res> {
  _$PromoCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = freezed,
    Object? offerValue = freezed,
    Object? promoValueType = freezed,
  }) {
    return _then(_value.copyWith(
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      offerValue: freezed == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as double?,
      promoValueType: freezed == promoValueType
          ? _value.promoValueType
          : promoValueType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromoCodeResponseCopyWith<$Res>
    implements $PromoCodeResponseCopyWith<$Res> {
  factory _$$_PromoCodeResponseCopyWith(_$_PromoCodeResponse value,
          $Res Function(_$_PromoCodeResponse) then) =
      __$$_PromoCodeResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? promoCode, double? offerValue, String? promoValueType});
}

/// @nodoc
class __$$_PromoCodeResponseCopyWithImpl<$Res>
    extends _$PromoCodeResponseCopyWithImpl<$Res, _$_PromoCodeResponse>
    implements _$$_PromoCodeResponseCopyWith<$Res> {
  __$$_PromoCodeResponseCopyWithImpl(
      _$_PromoCodeResponse _value, $Res Function(_$_PromoCodeResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = freezed,
    Object? offerValue = freezed,
    Object? promoValueType = freezed,
  }) {
    return _then(_$_PromoCodeResponse(
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      offerValue: freezed == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as double?,
      promoValueType: freezed == promoValueType
          ? _value.promoValueType
          : promoValueType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromoCodeResponse implements _PromoCodeResponse {
  const _$_PromoCodeResponse(
      {this.promoCode, this.offerValue, this.promoValueType});

  factory _$_PromoCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PromoCodeResponseFromJson(json);

  @override
  final String? promoCode;
  @override
  final double? offerValue;
  @override
  final String? promoValueType;

  @override
  String toString() {
    return 'PromoCodeResponse(promoCode: $promoCode, offerValue: $offerValue, promoValueType: $promoValueType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromoCodeResponse &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.offerValue, offerValue) ||
                other.offerValue == offerValue) &&
            (identical(other.promoValueType, promoValueType) ||
                other.promoValueType == promoValueType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promoCode, offerValue, promoValueType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromoCodeResponseCopyWith<_$_PromoCodeResponse> get copyWith =>
      __$$_PromoCodeResponseCopyWithImpl<_$_PromoCodeResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromoCodeResponseToJson(
      this,
    );
  }
}

abstract class _PromoCodeResponse implements PromoCodeResponse {
  const factory _PromoCodeResponse(
      {final String? promoCode,
      final double? offerValue,
      final String? promoValueType}) = _$_PromoCodeResponse;

  factory _PromoCodeResponse.fromJson(Map<String, dynamic> json) =
      _$_PromoCodeResponse.fromJson;

  @override
  String? get promoCode;
  @override
  double? get offerValue;
  @override
  String? get promoValueType;
  @override
  @JsonKey(ignore: true)
  _$$_PromoCodeResponseCopyWith<_$_PromoCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
