// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cab_booking_apply_coupon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CabBookingApplyCouponRequest _$CabBookingApplyCouponRequestFromJson(
    Map<String, dynamic> json) {
  return _CabBookingApplyCouponRequest.fromJson(json);
}

/// @nodoc
mixin _$CabBookingApplyCouponRequest {
  String get promoCode => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabBookingApplyCouponRequestCopyWith<CabBookingApplyCouponRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CabBookingApplyCouponRequestCopyWith<$Res> {
  factory $CabBookingApplyCouponRequestCopyWith(
          CabBookingApplyCouponRequest value,
          $Res Function(CabBookingApplyCouponRequest) then) =
      _$CabBookingApplyCouponRequestCopyWithImpl<$Res,
          CabBookingApplyCouponRequest>;
  @useResult
  $Res call({String promoCode, num amount});
}

/// @nodoc
class _$CabBookingApplyCouponRequestCopyWithImpl<$Res,
        $Val extends CabBookingApplyCouponRequest>
    implements $CabBookingApplyCouponRequestCopyWith<$Res> {
  _$CabBookingApplyCouponRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CabBookingApplyCouponRequestCopyWith<$Res>
    implements $CabBookingApplyCouponRequestCopyWith<$Res> {
  factory _$$_CabBookingApplyCouponRequestCopyWith(
          _$_CabBookingApplyCouponRequest value,
          $Res Function(_$_CabBookingApplyCouponRequest) then) =
      __$$_CabBookingApplyCouponRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String promoCode, num amount});
}

/// @nodoc
class __$$_CabBookingApplyCouponRequestCopyWithImpl<$Res>
    extends _$CabBookingApplyCouponRequestCopyWithImpl<$Res,
        _$_CabBookingApplyCouponRequest>
    implements _$$_CabBookingApplyCouponRequestCopyWith<$Res> {
  __$$_CabBookingApplyCouponRequestCopyWithImpl(
      _$_CabBookingApplyCouponRequest _value,
      $Res Function(_$_CabBookingApplyCouponRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
    Object? amount = null,
  }) {
    return _then(_$_CabBookingApplyCouponRequest(
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CabBookingApplyCouponRequest implements _CabBookingApplyCouponRequest {
  const _$_CabBookingApplyCouponRequest({this.promoCode = '', this.amount = 0});

  factory _$_CabBookingApplyCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CabBookingApplyCouponRequestFromJson(json);

  @override
  @JsonKey()
  final String promoCode;
  @override
  @JsonKey()
  final num amount;

  @override
  String toString() {
    return 'CabBookingApplyCouponRequest(promoCode: $promoCode, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CabBookingApplyCouponRequest &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promoCode, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CabBookingApplyCouponRequestCopyWith<_$_CabBookingApplyCouponRequest>
      get copyWith => __$$_CabBookingApplyCouponRequestCopyWithImpl<
          _$_CabBookingApplyCouponRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabBookingApplyCouponRequestToJson(
      this,
    );
  }
}

abstract class _CabBookingApplyCouponRequest
    implements CabBookingApplyCouponRequest {
  const factory _CabBookingApplyCouponRequest(
      {final String promoCode,
      final num amount}) = _$_CabBookingApplyCouponRequest;

  factory _CabBookingApplyCouponRequest.fromJson(Map<String, dynamic> json) =
      _$_CabBookingApplyCouponRequest.fromJson;

  @override
  String get promoCode;
  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$_CabBookingApplyCouponRequestCopyWith<_$_CabBookingApplyCouponRequest>
      get copyWith => throw _privateConstructorUsedError;
}
