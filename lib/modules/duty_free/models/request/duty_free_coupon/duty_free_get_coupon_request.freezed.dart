// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_get_coupon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeGetCouponRequest _$DutyFreeGetCouponRequestFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeGetCouponRequest.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeGetCouponRequest {
  double get amount => throw _privateConstructorUsedError;
  List<SKUItemRequest> get skuItemList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeGetCouponRequestCopyWith<DutyFreeGetCouponRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeGetCouponRequestCopyWith<$Res> {
  factory $DutyFreeGetCouponRequestCopyWith(DutyFreeGetCouponRequest value,
          $Res Function(DutyFreeGetCouponRequest) then) =
      _$DutyFreeGetCouponRequestCopyWithImpl<$Res, DutyFreeGetCouponRequest>;
  @useResult
  $Res call({double amount, List<SKUItemRequest> skuItemList});
}

/// @nodoc
class _$DutyFreeGetCouponRequestCopyWithImpl<$Res,
        $Val extends DutyFreeGetCouponRequest>
    implements $DutyFreeGetCouponRequestCopyWith<$Res> {
  _$DutyFreeGetCouponRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? skuItemList = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      skuItemList: null == skuItemList
          ? _value.skuItemList
          : skuItemList // ignore: cast_nullable_to_non_nullable
              as List<SKUItemRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeGetCouponRequestCopyWith<$Res>
    implements $DutyFreeGetCouponRequestCopyWith<$Res> {
  factory _$$_DutyFreeGetCouponRequestCopyWith(
          _$_DutyFreeGetCouponRequest value,
          $Res Function(_$_DutyFreeGetCouponRequest) then) =
      __$$_DutyFreeGetCouponRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, List<SKUItemRequest> skuItemList});
}

/// @nodoc
class __$$_DutyFreeGetCouponRequestCopyWithImpl<$Res>
    extends _$DutyFreeGetCouponRequestCopyWithImpl<$Res,
        _$_DutyFreeGetCouponRequest>
    implements _$$_DutyFreeGetCouponRequestCopyWith<$Res> {
  __$$_DutyFreeGetCouponRequestCopyWithImpl(_$_DutyFreeGetCouponRequest _value,
      $Res Function(_$_DutyFreeGetCouponRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? skuItemList = null,
  }) {
    return _then(_$_DutyFreeGetCouponRequest(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      skuItemList: null == skuItemList
          ? _value.skuItemList
          : skuItemList // ignore: cast_nullable_to_non_nullable
              as List<SKUItemRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeGetCouponRequest implements _DutyFreeGetCouponRequest {
  const _$_DutyFreeGetCouponRequest(
      {this.amount = 0, this.skuItemList = const []});

  factory _$_DutyFreeGetCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeGetCouponRequestFromJson(json);

  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final List<SKUItemRequest> skuItemList;

  @override
  String toString() {
    return 'DutyFreeGetCouponRequest(amount: $amount, skuItemList: $skuItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeGetCouponRequest &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other.skuItemList, skuItemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, const DeepCollectionEquality().hash(skuItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeGetCouponRequestCopyWith<_$_DutyFreeGetCouponRequest>
      get copyWith => __$$_DutyFreeGetCouponRequestCopyWithImpl<
          _$_DutyFreeGetCouponRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeGetCouponRequestToJson(
      this,
    );
  }
}

abstract class _DutyFreeGetCouponRequest implements DutyFreeGetCouponRequest {
  const factory _DutyFreeGetCouponRequest(
      {final double amount,
      final List<SKUItemRequest> skuItemList}) = _$_DutyFreeGetCouponRequest;

  factory _DutyFreeGetCouponRequest.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeGetCouponRequest.fromJson;

  @override
  double get amount;
  @override
  List<SKUItemRequest> get skuItemList;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeGetCouponRequestCopyWith<_$_DutyFreeGetCouponRequest>
      get copyWith => throw _privateConstructorUsedError;
}

SKUItemRequest _$SKUItemRequestFromJson(Map<String, dynamic> json) {
  return _SKUItemRequest.fromJson(json);
}

/// @nodoc
mixin _$SKUItemRequest {
  String? get promoSkuCode => throw _privateConstructorUsedError;
  String? get promoSkuCategoryCode => throw _privateConstructorUsedError;
  String? get promoSkuBrandCode => throw _privateConstructorUsedError;
  int? get promoSkuQty => throw _privateConstructorUsedError;
  String? get promoSkuPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SKUItemRequestCopyWith<SKUItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SKUItemRequestCopyWith<$Res> {
  factory $SKUItemRequestCopyWith(
          SKUItemRequest value, $Res Function(SKUItemRequest) then) =
      _$SKUItemRequestCopyWithImpl<$Res, SKUItemRequest>;
  @useResult
  $Res call(
      {String? promoSkuCode,
      String? promoSkuCategoryCode,
      String? promoSkuBrandCode,
      int? promoSkuQty,
      String? promoSkuPrice});
}

/// @nodoc
class _$SKUItemRequestCopyWithImpl<$Res, $Val extends SKUItemRequest>
    implements $SKUItemRequestCopyWith<$Res> {
  _$SKUItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoSkuCode = freezed,
    Object? promoSkuCategoryCode = freezed,
    Object? promoSkuBrandCode = freezed,
    Object? promoSkuQty = freezed,
    Object? promoSkuPrice = freezed,
  }) {
    return _then(_value.copyWith(
      promoSkuCode: freezed == promoSkuCode
          ? _value.promoSkuCode
          : promoSkuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      promoSkuCategoryCode: freezed == promoSkuCategoryCode
          ? _value.promoSkuCategoryCode
          : promoSkuCategoryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      promoSkuBrandCode: freezed == promoSkuBrandCode
          ? _value.promoSkuBrandCode
          : promoSkuBrandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      promoSkuQty: freezed == promoSkuQty
          ? _value.promoSkuQty
          : promoSkuQty // ignore: cast_nullable_to_non_nullable
              as int?,
      promoSkuPrice: freezed == promoSkuPrice
          ? _value.promoSkuPrice
          : promoSkuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SKUItemRequestCopyWith<$Res>
    implements $SKUItemRequestCopyWith<$Res> {
  factory _$$_SKUItemRequestCopyWith(
          _$_SKUItemRequest value, $Res Function(_$_SKUItemRequest) then) =
      __$$_SKUItemRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? promoSkuCode,
      String? promoSkuCategoryCode,
      String? promoSkuBrandCode,
      int? promoSkuQty,
      String? promoSkuPrice});
}

/// @nodoc
class __$$_SKUItemRequestCopyWithImpl<$Res>
    extends _$SKUItemRequestCopyWithImpl<$Res, _$_SKUItemRequest>
    implements _$$_SKUItemRequestCopyWith<$Res> {
  __$$_SKUItemRequestCopyWithImpl(
      _$_SKUItemRequest _value, $Res Function(_$_SKUItemRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoSkuCode = freezed,
    Object? promoSkuCategoryCode = freezed,
    Object? promoSkuBrandCode = freezed,
    Object? promoSkuQty = freezed,
    Object? promoSkuPrice = freezed,
  }) {
    return _then(_$_SKUItemRequest(
      freezed == promoSkuCode
          ? _value.promoSkuCode
          : promoSkuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == promoSkuCategoryCode
          ? _value.promoSkuCategoryCode
          : promoSkuCategoryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == promoSkuBrandCode
          ? _value.promoSkuBrandCode
          : promoSkuBrandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == promoSkuQty
          ? _value.promoSkuQty
          : promoSkuQty // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == promoSkuPrice
          ? _value.promoSkuPrice
          : promoSkuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SKUItemRequest implements _SKUItemRequest {
  const _$_SKUItemRequest(this.promoSkuCode, this.promoSkuCategoryCode,
      this.promoSkuBrandCode, this.promoSkuQty, this.promoSkuPrice);

  factory _$_SKUItemRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SKUItemRequestFromJson(json);

  @override
  final String? promoSkuCode;
  @override
  final String? promoSkuCategoryCode;
  @override
  final String? promoSkuBrandCode;
  @override
  final int? promoSkuQty;
  @override
  final String? promoSkuPrice;

  @override
  String toString() {
    return 'SKUItemRequest(promoSkuCode: $promoSkuCode, promoSkuCategoryCode: $promoSkuCategoryCode, promoSkuBrandCode: $promoSkuBrandCode, promoSkuQty: $promoSkuQty, promoSkuPrice: $promoSkuPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SKUItemRequest &&
            (identical(other.promoSkuCode, promoSkuCode) ||
                other.promoSkuCode == promoSkuCode) &&
            (identical(other.promoSkuCategoryCode, promoSkuCategoryCode) ||
                other.promoSkuCategoryCode == promoSkuCategoryCode) &&
            (identical(other.promoSkuBrandCode, promoSkuBrandCode) ||
                other.promoSkuBrandCode == promoSkuBrandCode) &&
            (identical(other.promoSkuQty, promoSkuQty) ||
                other.promoSkuQty == promoSkuQty) &&
            (identical(other.promoSkuPrice, promoSkuPrice) ||
                other.promoSkuPrice == promoSkuPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promoSkuCode,
      promoSkuCategoryCode, promoSkuBrandCode, promoSkuQty, promoSkuPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SKUItemRequestCopyWith<_$_SKUItemRequest> get copyWith =>
      __$$_SKUItemRequestCopyWithImpl<_$_SKUItemRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SKUItemRequestToJson(
      this,
    );
  }
}

abstract class _SKUItemRequest implements SKUItemRequest {
  const factory _SKUItemRequest(
      final String? promoSkuCode,
      final String? promoSkuCategoryCode,
      final String? promoSkuBrandCode,
      final int? promoSkuQty,
      final String? promoSkuPrice) = _$_SKUItemRequest;

  factory _SKUItemRequest.fromJson(Map<String, dynamic> json) =
      _$_SKUItemRequest.fromJson;

  @override
  String? get promoSkuCode;
  @override
  String? get promoSkuCategoryCode;
  @override
  String? get promoSkuBrandCode;
  @override
  int? get promoSkuQty;
  @override
  String? get promoSkuPrice;
  @override
  @JsonKey(ignore: true)
  _$$_SKUItemRequestCopyWith<_$_SKUItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
