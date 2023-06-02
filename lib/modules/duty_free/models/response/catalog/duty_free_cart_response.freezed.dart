// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeCartResponse _$DutyFreeCartResponseFromJson(Map<String, dynamic> json) {
  return _DutyFreeCartResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeCartResponse {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get airportCode => throw _privateConstructorUsedError;
  List<ItemDetailResponse> get itemDetails =>
      throw _privateConstructorUsedError;
  List<PassengerDetailsResponse> get passengerDetail =>
      throw _privateConstructorUsedError;
  PriceDetailResponse? get totalAmount => throw _privateConstructorUsedError;
  PriceDetailResponse? get finalAmount => throw _privateConstructorUsedError;
  PriceDetailResponse? get preOrderDiscount =>
      throw _privateConstructorUsedError;
  PriceDetailResponse? get unitPriceResponse =>
      throw _privateConstructorUsedError;
  PriceDetailResponse? get discountPrice => throw _privateConstructorUsedError;
  PromoCodeResponse? get promoCoupon => throw _privateConstructorUsedError;
  num get loyaltyPotentialPoint => throw _privateConstructorUsedError;
  String get collectionPoint => throw _privateConstructorUsedError;
  String get store => throw _privateConstructorUsedError;
  num get totalDiscountedPrice => throw _privateConstructorUsedError;
  num get totalUnitPrice => throw _privateConstructorUsedError;
  List<PreOrderDiscountBreakup> get preOrderDiscountBreakup =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeCartResponseCopyWith<DutyFreeCartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeCartResponseCopyWith<$Res> {
  factory $DutyFreeCartResponseCopyWith(DutyFreeCartResponse value,
          $Res Function(DutyFreeCartResponse) then) =
      _$DutyFreeCartResponseCopyWithImpl<$Res, DutyFreeCartResponse>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      String airportCode,
      List<ItemDetailResponse> itemDetails,
      List<PassengerDetailsResponse> passengerDetail,
      PriceDetailResponse? totalAmount,
      PriceDetailResponse? finalAmount,
      PriceDetailResponse? preOrderDiscount,
      PriceDetailResponse? unitPriceResponse,
      PriceDetailResponse? discountPrice,
      PromoCodeResponse? promoCoupon,
      num loyaltyPotentialPoint,
      String collectionPoint,
      String store,
      num totalDiscountedPrice,
      num totalUnitPrice,
      List<PreOrderDiscountBreakup> preOrderDiscountBreakup});

  $PriceDetailResponseCopyWith<$Res>? get totalAmount;
  $PriceDetailResponseCopyWith<$Res>? get finalAmount;
  $PriceDetailResponseCopyWith<$Res>? get preOrderDiscount;
  $PriceDetailResponseCopyWith<$Res>? get unitPriceResponse;
  $PriceDetailResponseCopyWith<$Res>? get discountPrice;
  $PromoCodeResponseCopyWith<$Res>? get promoCoupon;
}

/// @nodoc
class _$DutyFreeCartResponseCopyWithImpl<$Res,
        $Val extends DutyFreeCartResponse>
    implements $DutyFreeCartResponseCopyWith<$Res> {
  _$DutyFreeCartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? airportCode = null,
    Object? itemDetails = null,
    Object? passengerDetail = null,
    Object? totalAmount = freezed,
    Object? finalAmount = freezed,
    Object? preOrderDiscount = freezed,
    Object? unitPriceResponse = freezed,
    Object? discountPrice = freezed,
    Object? promoCoupon = freezed,
    Object? loyaltyPotentialPoint = null,
    Object? collectionPoint = null,
    Object? store = null,
    Object? totalDiscountedPrice = null,
    Object? totalUnitPrice = null,
    Object? preOrderDiscountBreakup = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      airportCode: null == airportCode
          ? _value.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemDetails: null == itemDetails
          ? _value.itemDetails
          : itemDetails // ignore: cast_nullable_to_non_nullable
              as List<ItemDetailResponse>,
      passengerDetail: null == passengerDetail
          ? _value.passengerDetail
          : passengerDetail // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetailsResponse>,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      preOrderDiscount: freezed == preOrderDiscount
          ? _value.preOrderDiscount
          : preOrderDiscount // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      unitPriceResponse: freezed == unitPriceResponse
          ? _value.unitPriceResponse
          : unitPriceResponse // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      promoCoupon: freezed == promoCoupon
          ? _value.promoCoupon
          : promoCoupon // ignore: cast_nullable_to_non_nullable
              as PromoCodeResponse?,
      loyaltyPotentialPoint: null == loyaltyPotentialPoint
          ? _value.loyaltyPotentialPoint
          : loyaltyPotentialPoint // ignore: cast_nullable_to_non_nullable
              as num,
      collectionPoint: null == collectionPoint
          ? _value.collectionPoint
          : collectionPoint // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      totalDiscountedPrice: null == totalDiscountedPrice
          ? _value.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as num,
      totalUnitPrice: null == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as num,
      preOrderDiscountBreakup: null == preOrderDiscountBreakup
          ? _value.preOrderDiscountBreakup
          : preOrderDiscountBreakup // ignore: cast_nullable_to_non_nullable
              as List<PreOrderDiscountBreakup>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceDetailResponseCopyWith<$Res>? get totalAmount {
    if (_value.totalAmount == null) {
      return null;
    }

    return $PriceDetailResponseCopyWith<$Res>(_value.totalAmount!, (value) {
      return _then(_value.copyWith(totalAmount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceDetailResponseCopyWith<$Res>? get finalAmount {
    if (_value.finalAmount == null) {
      return null;
    }

    return $PriceDetailResponseCopyWith<$Res>(_value.finalAmount!, (value) {
      return _then(_value.copyWith(finalAmount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceDetailResponseCopyWith<$Res>? get preOrderDiscount {
    if (_value.preOrderDiscount == null) {
      return null;
    }

    return $PriceDetailResponseCopyWith<$Res>(_value.preOrderDiscount!,
        (value) {
      return _then(_value.copyWith(preOrderDiscount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceDetailResponseCopyWith<$Res>? get unitPriceResponse {
    if (_value.unitPriceResponse == null) {
      return null;
    }

    return $PriceDetailResponseCopyWith<$Res>(_value.unitPriceResponse!,
        (value) {
      return _then(_value.copyWith(unitPriceResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceDetailResponseCopyWith<$Res>? get discountPrice {
    if (_value.discountPrice == null) {
      return null;
    }

    return $PriceDetailResponseCopyWith<$Res>(_value.discountPrice!, (value) {
      return _then(_value.copyWith(discountPrice: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PromoCodeResponseCopyWith<$Res>? get promoCoupon {
    if (_value.promoCoupon == null) {
      return null;
    }

    return $PromoCodeResponseCopyWith<$Res>(_value.promoCoupon!, (value) {
      return _then(_value.copyWith(promoCoupon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DutyFreeCartResponseCopyWith<$Res>
    implements $DutyFreeCartResponseCopyWith<$Res> {
  factory _$$_DutyFreeCartResponseCopyWith(_$_DutyFreeCartResponse value,
          $Res Function(_$_DutyFreeCartResponse) then) =
      __$$_DutyFreeCartResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      String airportCode,
      List<ItemDetailResponse> itemDetails,
      List<PassengerDetailsResponse> passengerDetail,
      PriceDetailResponse? totalAmount,
      PriceDetailResponse? finalAmount,
      PriceDetailResponse? preOrderDiscount,
      PriceDetailResponse? unitPriceResponse,
      PriceDetailResponse? discountPrice,
      PromoCodeResponse? promoCoupon,
      num loyaltyPotentialPoint,
      String collectionPoint,
      String store,
      num totalDiscountedPrice,
      num totalUnitPrice,
      List<PreOrderDiscountBreakup> preOrderDiscountBreakup});

  @override
  $PriceDetailResponseCopyWith<$Res>? get totalAmount;
  @override
  $PriceDetailResponseCopyWith<$Res>? get finalAmount;
  @override
  $PriceDetailResponseCopyWith<$Res>? get preOrderDiscount;
  @override
  $PriceDetailResponseCopyWith<$Res>? get unitPriceResponse;
  @override
  $PriceDetailResponseCopyWith<$Res>? get discountPrice;
  @override
  $PromoCodeResponseCopyWith<$Res>? get promoCoupon;
}

/// @nodoc
class __$$_DutyFreeCartResponseCopyWithImpl<$Res>
    extends _$DutyFreeCartResponseCopyWithImpl<$Res, _$_DutyFreeCartResponse>
    implements _$$_DutyFreeCartResponseCopyWith<$Res> {
  __$$_DutyFreeCartResponseCopyWithImpl(_$_DutyFreeCartResponse _value,
      $Res Function(_$_DutyFreeCartResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? airportCode = null,
    Object? itemDetails = null,
    Object? passengerDetail = null,
    Object? totalAmount = freezed,
    Object? finalAmount = freezed,
    Object? preOrderDiscount = freezed,
    Object? unitPriceResponse = freezed,
    Object? discountPrice = freezed,
    Object? promoCoupon = freezed,
    Object? loyaltyPotentialPoint = null,
    Object? collectionPoint = null,
    Object? store = null,
    Object? totalDiscountedPrice = null,
    Object? totalUnitPrice = null,
    Object? preOrderDiscountBreakup = null,
  }) {
    return _then(_$_DutyFreeCartResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      airportCode: null == airportCode
          ? _value.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String,
      itemDetails: null == itemDetails
          ? _value.itemDetails
          : itemDetails // ignore: cast_nullable_to_non_nullable
              as List<ItemDetailResponse>,
      passengerDetail: null == passengerDetail
          ? _value.passengerDetail
          : passengerDetail // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetailsResponse>,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      preOrderDiscount: freezed == preOrderDiscount
          ? _value.preOrderDiscount
          : preOrderDiscount // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      unitPriceResponse: freezed == unitPriceResponse
          ? _value.unitPriceResponse
          : unitPriceResponse // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as PriceDetailResponse?,
      promoCoupon: freezed == promoCoupon
          ? _value.promoCoupon
          : promoCoupon // ignore: cast_nullable_to_non_nullable
              as PromoCodeResponse?,
      loyaltyPotentialPoint: null == loyaltyPotentialPoint
          ? _value.loyaltyPotentialPoint
          : loyaltyPotentialPoint // ignore: cast_nullable_to_non_nullable
              as num,
      collectionPoint: null == collectionPoint
          ? _value.collectionPoint
          : collectionPoint // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      totalDiscountedPrice: null == totalDiscountedPrice
          ? _value.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as num,
      totalUnitPrice: null == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as num,
      preOrderDiscountBreakup: null == preOrderDiscountBreakup
          ? _value.preOrderDiscountBreakup
          : preOrderDiscountBreakup // ignore: cast_nullable_to_non_nullable
              as List<PreOrderDiscountBreakup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeCartResponse implements _DutyFreeCartResponse {
  const _$_DutyFreeCartResponse(
      {this.id = '0',
      this.customerId = '',
      this.airportCode = '',
      this.itemDetails = const [],
      this.passengerDetail = const [],
      this.totalAmount,
      this.finalAmount,
      this.preOrderDiscount,
      this.unitPriceResponse,
      this.discountPrice,
      this.promoCoupon,
      this.loyaltyPotentialPoint = 0,
      this.collectionPoint = '',
      this.store = '',
      this.totalDiscountedPrice = 0,
      this.totalUnitPrice = 0,
      this.preOrderDiscountBreakup = const []});

  factory _$_DutyFreeCartResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeCartResponseFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String customerId;
  @override
  @JsonKey()
  final String airportCode;
  @override
  @JsonKey()
  final List<ItemDetailResponse> itemDetails;
  @override
  @JsonKey()
  final List<PassengerDetailsResponse> passengerDetail;
  @override
  final PriceDetailResponse? totalAmount;
  @override
  final PriceDetailResponse? finalAmount;
  @override
  final PriceDetailResponse? preOrderDiscount;
  @override
  final PriceDetailResponse? unitPriceResponse;
  @override
  final PriceDetailResponse? discountPrice;
  @override
  final PromoCodeResponse? promoCoupon;
  @override
  @JsonKey()
  final num loyaltyPotentialPoint;
  @override
  @JsonKey()
  final String collectionPoint;
  @override
  @JsonKey()
  final String store;
  @override
  @JsonKey()
  final num totalDiscountedPrice;
  @override
  @JsonKey()
  final num totalUnitPrice;
  @override
  @JsonKey()
  final List<PreOrderDiscountBreakup> preOrderDiscountBreakup;

  @override
  String toString() {
    return 'DutyFreeCartResponse(id: $id, customerId: $customerId, airportCode: $airportCode, itemDetails: $itemDetails, passengerDetail: $passengerDetail, totalAmount: $totalAmount, finalAmount: $finalAmount, preOrderDiscount: $preOrderDiscount, unitPriceResponse: $unitPriceResponse, discountPrice: $discountPrice, promoCoupon: $promoCoupon, loyaltyPotentialPoint: $loyaltyPotentialPoint, collectionPoint: $collectionPoint, store: $store, totalDiscountedPrice: $totalDiscountedPrice, totalUnitPrice: $totalUnitPrice, preOrderDiscountBreakup: $preOrderDiscountBreakup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeCartResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.airportCode, airportCode) ||
                other.airportCode == airportCode) &&
            const DeepCollectionEquality()
                .equals(other.itemDetails, itemDetails) &&
            const DeepCollectionEquality()
                .equals(other.passengerDetail, passengerDetail) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.preOrderDiscount, preOrderDiscount) ||
                other.preOrderDiscount == preOrderDiscount) &&
            (identical(other.unitPriceResponse, unitPriceResponse) ||
                other.unitPriceResponse == unitPriceResponse) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.promoCoupon, promoCoupon) ||
                other.promoCoupon == promoCoupon) &&
            (identical(other.loyaltyPotentialPoint, loyaltyPotentialPoint) ||
                other.loyaltyPotentialPoint == loyaltyPotentialPoint) &&
            (identical(other.collectionPoint, collectionPoint) ||
                other.collectionPoint == collectionPoint) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice) &&
            (identical(other.totalUnitPrice, totalUnitPrice) ||
                other.totalUnitPrice == totalUnitPrice) &&
            const DeepCollectionEquality().equals(
                other.preOrderDiscountBreakup, preOrderDiscountBreakup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      airportCode,
      const DeepCollectionEquality().hash(itemDetails),
      const DeepCollectionEquality().hash(passengerDetail),
      totalAmount,
      finalAmount,
      preOrderDiscount,
      unitPriceResponse,
      discountPrice,
      promoCoupon,
      loyaltyPotentialPoint,
      collectionPoint,
      store,
      totalDiscountedPrice,
      totalUnitPrice,
      const DeepCollectionEquality().hash(preOrderDiscountBreakup));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeCartResponseCopyWith<_$_DutyFreeCartResponse> get copyWith =>
      __$$_DutyFreeCartResponseCopyWithImpl<_$_DutyFreeCartResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeCartResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreeCartResponse implements DutyFreeCartResponse {
  const factory _DutyFreeCartResponse(
          {final String id,
          final String customerId,
          final String airportCode,
          final List<ItemDetailResponse> itemDetails,
          final List<PassengerDetailsResponse> passengerDetail,
          final PriceDetailResponse? totalAmount,
          final PriceDetailResponse? finalAmount,
          final PriceDetailResponse? preOrderDiscount,
          final PriceDetailResponse? unitPriceResponse,
          final PriceDetailResponse? discountPrice,
          final PromoCodeResponse? promoCoupon,
          final num loyaltyPotentialPoint,
          final String collectionPoint,
          final String store,
          final num totalDiscountedPrice,
          final num totalUnitPrice,
          final List<PreOrderDiscountBreakup> preOrderDiscountBreakup}) =
      _$_DutyFreeCartResponse;

  factory _DutyFreeCartResponse.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeCartResponse.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  String get airportCode;
  @override
  List<ItemDetailResponse> get itemDetails;
  @override
  List<PassengerDetailsResponse> get passengerDetail;
  @override
  PriceDetailResponse? get totalAmount;
  @override
  PriceDetailResponse? get finalAmount;
  @override
  PriceDetailResponse? get preOrderDiscount;
  @override
  PriceDetailResponse? get unitPriceResponse;
  @override
  PriceDetailResponse? get discountPrice;
  @override
  PromoCodeResponse? get promoCoupon;
  @override
  num get loyaltyPotentialPoint;
  @override
  String get collectionPoint;
  @override
  String get store;
  @override
  num get totalDiscountedPrice;
  @override
  num get totalUnitPrice;
  @override
  List<PreOrderDiscountBreakup> get preOrderDiscountBreakup;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeCartResponseCopyWith<_$_DutyFreeCartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
