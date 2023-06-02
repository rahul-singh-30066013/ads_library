// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cab_booking_coupon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CabBookingCouponRequest _$CabBookingCouponRequestFromJson(
    Map<String, dynamic> json) {
  return _CabBookingCouponRequest.fromJson(json);
}

/// @nodoc
mixin _$CabBookingCouponRequest {
  num get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabBookingCouponRequestCopyWith<CabBookingCouponRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CabBookingCouponRequestCopyWith<$Res> {
  factory $CabBookingCouponRequestCopyWith(CabBookingCouponRequest value,
          $Res Function(CabBookingCouponRequest) then) =
      _$CabBookingCouponRequestCopyWithImpl<$Res, CabBookingCouponRequest>;
  @useResult
  $Res call({num amount});
}

/// @nodoc
class _$CabBookingCouponRequestCopyWithImpl<$Res,
        $Val extends CabBookingCouponRequest>
    implements $CabBookingCouponRequestCopyWith<$Res> {
  _$CabBookingCouponRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CabBookingCouponRequestCopyWith<$Res>
    implements $CabBookingCouponRequestCopyWith<$Res> {
  factory _$$_CabBookingCouponRequestCopyWith(_$_CabBookingCouponRequest value,
          $Res Function(_$_CabBookingCouponRequest) then) =
      __$$_CabBookingCouponRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num amount});
}

/// @nodoc
class __$$_CabBookingCouponRequestCopyWithImpl<$Res>
    extends _$CabBookingCouponRequestCopyWithImpl<$Res,
        _$_CabBookingCouponRequest>
    implements _$$_CabBookingCouponRequestCopyWith<$Res> {
  __$$_CabBookingCouponRequestCopyWithImpl(_$_CabBookingCouponRequest _value,
      $Res Function(_$_CabBookingCouponRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$_CabBookingCouponRequest(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CabBookingCouponRequest implements _CabBookingCouponRequest {
  const _$_CabBookingCouponRequest({this.amount = 0});

  factory _$_CabBookingCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CabBookingCouponRequestFromJson(json);

  @override
  @JsonKey()
  final num amount;

  @override
  String toString() {
    return 'CabBookingCouponRequest(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CabBookingCouponRequest &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CabBookingCouponRequestCopyWith<_$_CabBookingCouponRequest>
      get copyWith =>
          __$$_CabBookingCouponRequestCopyWithImpl<_$_CabBookingCouponRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabBookingCouponRequestToJson(
      this,
    );
  }
}

abstract class _CabBookingCouponRequest implements CabBookingCouponRequest {
  const factory _CabBookingCouponRequest({final num amount}) =
      _$_CabBookingCouponRequest;

  factory _CabBookingCouponRequest.fromJson(Map<String, dynamic> json) =
      _$_CabBookingCouponRequest.fromJson;

  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$_CabBookingCouponRequestCopyWith<_$_CabBookingCouponRequest>
      get copyWith => throw _privateConstructorUsedError;
}
