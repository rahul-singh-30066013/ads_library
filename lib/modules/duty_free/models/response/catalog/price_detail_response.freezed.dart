// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceDetailResponse _$PriceDetailResponseFromJson(Map<String, dynamic> json) {
  return _PriceDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$PriceDetailResponse {
  num get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  num get percentageDiscount => throw _privateConstructorUsedError;
  String get preOrderDiscountTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceDetailResponseCopyWith<PriceDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceDetailResponseCopyWith<$Res> {
  factory $PriceDetailResponseCopyWith(
          PriceDetailResponse value, $Res Function(PriceDetailResponse) then) =
      _$PriceDetailResponseCopyWithImpl<$Res, PriceDetailResponse>;
  @useResult
  $Res call(
      {num amount,
      String currency,
      num percentageDiscount,
      String preOrderDiscountTime});
}

/// @nodoc
class _$PriceDetailResponseCopyWithImpl<$Res, $Val extends PriceDetailResponse>
    implements $PriceDetailResponseCopyWith<$Res> {
  _$PriceDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? percentageDiscount = null,
    Object? preOrderDiscountTime = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      percentageDiscount: null == percentageDiscount
          ? _value.percentageDiscount
          : percentageDiscount // ignore: cast_nullable_to_non_nullable
              as num,
      preOrderDiscountTime: null == preOrderDiscountTime
          ? _value.preOrderDiscountTime
          : preOrderDiscountTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceDetailResponseCopyWith<$Res>
    implements $PriceDetailResponseCopyWith<$Res> {
  factory _$$_PriceDetailResponseCopyWith(_$_PriceDetailResponse value,
          $Res Function(_$_PriceDetailResponse) then) =
      __$$_PriceDetailResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num amount,
      String currency,
      num percentageDiscount,
      String preOrderDiscountTime});
}

/// @nodoc
class __$$_PriceDetailResponseCopyWithImpl<$Res>
    extends _$PriceDetailResponseCopyWithImpl<$Res, _$_PriceDetailResponse>
    implements _$$_PriceDetailResponseCopyWith<$Res> {
  __$$_PriceDetailResponseCopyWithImpl(_$_PriceDetailResponse _value,
      $Res Function(_$_PriceDetailResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? percentageDiscount = null,
    Object? preOrderDiscountTime = null,
  }) {
    return _then(_$_PriceDetailResponse(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      percentageDiscount: null == percentageDiscount
          ? _value.percentageDiscount
          : percentageDiscount // ignore: cast_nullable_to_non_nullable
              as num,
      preOrderDiscountTime: null == preOrderDiscountTime
          ? _value.preOrderDiscountTime
          : preOrderDiscountTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PriceDetailResponse implements _PriceDetailResponse {
  const _$_PriceDetailResponse(
      {this.amount = 0,
      this.currency = '',
      this.percentageDiscount = 0,
      this.preOrderDiscountTime = ''});

  factory _$_PriceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PriceDetailResponseFromJson(json);

  @override
  @JsonKey()
  final num amount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final num percentageDiscount;
  @override
  @JsonKey()
  final String preOrderDiscountTime;

  @override
  String toString() {
    return 'PriceDetailResponse(amount: $amount, currency: $currency, percentageDiscount: $percentageDiscount, preOrderDiscountTime: $preOrderDiscountTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceDetailResponse &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.percentageDiscount, percentageDiscount) ||
                other.percentageDiscount == percentageDiscount) &&
            (identical(other.preOrderDiscountTime, preOrderDiscountTime) ||
                other.preOrderDiscountTime == preOrderDiscountTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, currency, percentageDiscount, preOrderDiscountTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceDetailResponseCopyWith<_$_PriceDetailResponse> get copyWith =>
      __$$_PriceDetailResponseCopyWithImpl<_$_PriceDetailResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceDetailResponseToJson(
      this,
    );
  }
}

abstract class _PriceDetailResponse implements PriceDetailResponse {
  const factory _PriceDetailResponse(
      {final num amount,
      final String currency,
      final num percentageDiscount,
      final String preOrderDiscountTime}) = _$_PriceDetailResponse;

  factory _PriceDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_PriceDetailResponse.fromJson;

  @override
  num get amount;
  @override
  String get currency;
  @override
  num get percentageDiscount;
  @override
  String get preOrderDiscountTime;
  @override
  @JsonKey(ignore: true)
  _$$_PriceDetailResponseCopyWith<_$_PriceDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
