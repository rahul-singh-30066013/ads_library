// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_apply_coupon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeApplyCouponRequest _$DutyFreeApplyCouponRequestFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeApplyCouponRequest.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeApplyCouponRequest {
  String? get promoCode => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeApplyCouponRequestCopyWith<DutyFreeApplyCouponRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeApplyCouponRequestCopyWith<$Res> {
  factory $DutyFreeApplyCouponRequestCopyWith(DutyFreeApplyCouponRequest value,
          $Res Function(DutyFreeApplyCouponRequest) then) =
      _$DutyFreeApplyCouponRequestCopyWithImpl<$Res,
          DutyFreeApplyCouponRequest>;
  @useResult
  $Res call({String? promoCode, num amount});
}

/// @nodoc
class _$DutyFreeApplyCouponRequestCopyWithImpl<$Res,
        $Val extends DutyFreeApplyCouponRequest>
    implements $DutyFreeApplyCouponRequestCopyWith<$Res> {
  _$DutyFreeApplyCouponRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = freezed,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeApplyCouponRequestCopyWith<$Res>
    implements $DutyFreeApplyCouponRequestCopyWith<$Res> {
  factory _$$_DutyFreeApplyCouponRequestCopyWith(
          _$_DutyFreeApplyCouponRequest value,
          $Res Function(_$_DutyFreeApplyCouponRequest) then) =
      __$$_DutyFreeApplyCouponRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? promoCode, num amount});
}

/// @nodoc
class __$$_DutyFreeApplyCouponRequestCopyWithImpl<$Res>
    extends _$DutyFreeApplyCouponRequestCopyWithImpl<$Res,
        _$_DutyFreeApplyCouponRequest>
    implements _$$_DutyFreeApplyCouponRequestCopyWith<$Res> {
  __$$_DutyFreeApplyCouponRequestCopyWithImpl(
      _$_DutyFreeApplyCouponRequest _value,
      $Res Function(_$_DutyFreeApplyCouponRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = freezed,
    Object? amount = null,
  }) {
    return _then(_$_DutyFreeApplyCouponRequest(
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeApplyCouponRequest implements _DutyFreeApplyCouponRequest {
  const _$_DutyFreeApplyCouponRequest({this.promoCode, this.amount = 0});

  factory _$_DutyFreeApplyCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeApplyCouponRequestFromJson(json);

  @override
  final String? promoCode;
  @override
  @JsonKey()
  final num amount;

  @override
  String toString() {
    return 'DutyFreeApplyCouponRequest(promoCode: $promoCode, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeApplyCouponRequest &&
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
  _$$_DutyFreeApplyCouponRequestCopyWith<_$_DutyFreeApplyCouponRequest>
      get copyWith => __$$_DutyFreeApplyCouponRequestCopyWithImpl<
          _$_DutyFreeApplyCouponRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeApplyCouponRequestToJson(
      this,
    );
  }
}

abstract class _DutyFreeApplyCouponRequest
    implements DutyFreeApplyCouponRequest {
  const factory _DutyFreeApplyCouponRequest(
      {final String? promoCode,
      final num amount}) = _$_DutyFreeApplyCouponRequest;

  factory _DutyFreeApplyCouponRequest.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeApplyCouponRequest.fromJson;

  @override
  String? get promoCode;
  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeApplyCouponRequestCopyWith<_$_DutyFreeApplyCouponRequest>
      get copyWith => throw _privateConstructorUsedError;
}
