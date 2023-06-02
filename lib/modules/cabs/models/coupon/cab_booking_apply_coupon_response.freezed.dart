// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cab_booking_apply_coupon_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CabBookingApplyCouponResponse _$CabBookingApplyCouponResponseFromJson(
    Map<String, dynamic> json) {
  return _CabBookingApplyCouponResponse.fromJson(json);
}

/// @nodoc
mixin _$CabBookingApplyCouponResponse {
  CartDetail? get cartDetail => throw _privateConstructorUsedError;
  String? get cartID => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabBookingApplyCouponResponseCopyWith<CabBookingApplyCouponResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CabBookingApplyCouponResponseCopyWith<$Res> {
  factory $CabBookingApplyCouponResponseCopyWith(
          CabBookingApplyCouponResponse value,
          $Res Function(CabBookingApplyCouponResponse) then) =
      _$CabBookingApplyCouponResponseCopyWithImpl<$Res,
          CabBookingApplyCouponResponse>;
  @useResult
  $Res call({CartDetail? cartDetail, String? cartID, String? currencyCode});
}

/// @nodoc
class _$CabBookingApplyCouponResponseCopyWithImpl<$Res,
        $Val extends CabBookingApplyCouponResponse>
    implements $CabBookingApplyCouponResponseCopyWith<$Res> {
  _$CabBookingApplyCouponResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartDetail = freezed,
    Object? cartID = freezed,
    Object? currencyCode = freezed,
  }) {
    return _then(_value.copyWith(
      cartDetail: freezed == cartDetail
          ? _value.cartDetail
          : cartDetail // ignore: cast_nullable_to_non_nullable
              as CartDetail?,
      cartID: freezed == cartID
          ? _value.cartID
          : cartID // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CabBookingApplyCouponResponseCopyWith<$Res>
    implements $CabBookingApplyCouponResponseCopyWith<$Res> {
  factory _$$_CabBookingApplyCouponResponseCopyWith(
          _$_CabBookingApplyCouponResponse value,
          $Res Function(_$_CabBookingApplyCouponResponse) then) =
      __$$_CabBookingApplyCouponResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CartDetail? cartDetail, String? cartID, String? currencyCode});
}

/// @nodoc
class __$$_CabBookingApplyCouponResponseCopyWithImpl<$Res>
    extends _$CabBookingApplyCouponResponseCopyWithImpl<$Res,
        _$_CabBookingApplyCouponResponse>
    implements _$$_CabBookingApplyCouponResponseCopyWith<$Res> {
  __$$_CabBookingApplyCouponResponseCopyWithImpl(
      _$_CabBookingApplyCouponResponse _value,
      $Res Function(_$_CabBookingApplyCouponResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartDetail = freezed,
    Object? cartID = freezed,
    Object? currencyCode = freezed,
  }) {
    return _then(_$_CabBookingApplyCouponResponse(
      cartDetail: freezed == cartDetail
          ? _value.cartDetail
          : cartDetail // ignore: cast_nullable_to_non_nullable
              as CartDetail?,
      cartID: freezed == cartID
          ? _value.cartID
          : cartID // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CabBookingApplyCouponResponse
    implements _CabBookingApplyCouponResponse {
  const _$_CabBookingApplyCouponResponse(
      {this.cartDetail, this.cartID, this.currencyCode});

  factory _$_CabBookingApplyCouponResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_CabBookingApplyCouponResponseFromJson(json);

  @override
  final CartDetail? cartDetail;
  @override
  final String? cartID;
  @override
  final String? currencyCode;

  @override
  String toString() {
    return 'CabBookingApplyCouponResponse(cartDetail: $cartDetail, cartID: $cartID, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CabBookingApplyCouponResponse &&
            (identical(other.cartDetail, cartDetail) ||
                other.cartDetail == cartDetail) &&
            (identical(other.cartID, cartID) || other.cartID == cartID) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cartDetail, cartID, currencyCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CabBookingApplyCouponResponseCopyWith<_$_CabBookingApplyCouponResponse>
      get copyWith => __$$_CabBookingApplyCouponResponseCopyWithImpl<
          _$_CabBookingApplyCouponResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabBookingApplyCouponResponseToJson(
      this,
    );
  }
}

abstract class _CabBookingApplyCouponResponse
    implements CabBookingApplyCouponResponse {
  const factory _CabBookingApplyCouponResponse(
      {final CartDetail? cartDetail,
      final String? cartID,
      final String? currencyCode}) = _$_CabBookingApplyCouponResponse;

  factory _CabBookingApplyCouponResponse.fromJson(Map<String, dynamic> json) =
      _$_CabBookingApplyCouponResponse.fromJson;

  @override
  CartDetail? get cartDetail;
  @override
  String? get cartID;
  @override
  String? get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$_CabBookingApplyCouponResponseCopyWith<_$_CabBookingApplyCouponResponse>
      get copyWith => throw _privateConstructorUsedError;
}
