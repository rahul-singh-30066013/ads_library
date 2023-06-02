// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_coupon_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplyCouponResponse _$ApplyCouponResponseFromJson(Map<String, dynamic> json) {
  return _ApplyCouponResponse.fromJson(json);
}

/// @nodoc
mixin _$ApplyCouponResponse {
  List<Coupon> get coupons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplyCouponResponseCopyWith<ApplyCouponResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyCouponResponseCopyWith<$Res> {
  factory $ApplyCouponResponseCopyWith(
          ApplyCouponResponse value, $Res Function(ApplyCouponResponse) then) =
      _$ApplyCouponResponseCopyWithImpl<$Res, ApplyCouponResponse>;
  @useResult
  $Res call({List<Coupon> coupons});
}

/// @nodoc
class _$ApplyCouponResponseCopyWithImpl<$Res, $Val extends ApplyCouponResponse>
    implements $ApplyCouponResponseCopyWith<$Res> {
  _$ApplyCouponResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupons = null,
  }) {
    return _then(_value.copyWith(
      coupons: null == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as List<Coupon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApplyCouponResponseCopyWith<$Res>
    implements $ApplyCouponResponseCopyWith<$Res> {
  factory _$$_ApplyCouponResponseCopyWith(_$_ApplyCouponResponse value,
          $Res Function(_$_ApplyCouponResponse) then) =
      __$$_ApplyCouponResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Coupon> coupons});
}

/// @nodoc
class __$$_ApplyCouponResponseCopyWithImpl<$Res>
    extends _$ApplyCouponResponseCopyWithImpl<$Res, _$_ApplyCouponResponse>
    implements _$$_ApplyCouponResponseCopyWith<$Res> {
  __$$_ApplyCouponResponseCopyWithImpl(_$_ApplyCouponResponse _value,
      $Res Function(_$_ApplyCouponResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupons = null,
  }) {
    return _then(_$_ApplyCouponResponse(
      coupons: null == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as List<Coupon>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplyCouponResponse implements _ApplyCouponResponse {
  const _$_ApplyCouponResponse({this.coupons = const []});

  factory _$_ApplyCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ApplyCouponResponseFromJson(json);

  @override
  @JsonKey()
  final List<Coupon> coupons;

  @override
  String toString() {
    return 'ApplyCouponResponse(coupons: $coupons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplyCouponResponse &&
            const DeepCollectionEquality().equals(other.coupons, coupons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(coupons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplyCouponResponseCopyWith<_$_ApplyCouponResponse> get copyWith =>
      __$$_ApplyCouponResponseCopyWithImpl<_$_ApplyCouponResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplyCouponResponseToJson(
      this,
    );
  }
}

abstract class _ApplyCouponResponse implements ApplyCouponResponse {
  const factory _ApplyCouponResponse({final List<Coupon> coupons}) =
      _$_ApplyCouponResponse;

  factory _ApplyCouponResponse.fromJson(Map<String, dynamic> json) =
      _$_ApplyCouponResponse.fromJson;

  @override
  List<Coupon> get coupons;
  @override
  @JsonKey(ignore: true)
  _$$_ApplyCouponResponseCopyWith<_$_ApplyCouponResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
mixin _$Coupon {
  int get id => throw _privateConstructorUsedError;
  int get originAirportId => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  int get couponTypeId => throw _privateConstructorUsedError;
  String get promoTermsAndCondition => throw _privateConstructorUsedError;
  String get promoName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String get bookingEndDate => throw _privateConstructorUsedError;
  num get discountValue => throw _privateConstructorUsedError;
  num get maxDiscountAmount => throw _privateConstructorUsedError;
  num get minimumBillingAmount => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  bool get isMerchantFunded => throw _privateConstructorUsedError;
  num get pcmPercentage => throw _privateConstructorUsedError;
  String get pcmPromoImgUrl => throw _privateConstructorUsedError;
  Recommendations get recommendations => throw _privateConstructorUsedError;
  bool? get eligible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call(
      {int id,
      int originAirportId,
      String couponCode,
      int couponTypeId,
      String promoTermsAndCondition,
      String promoName,
      String description,
      String? startDate,
      String? endDate,
      String bookingEndDate,
      num discountValue,
      num maxDiscountAmount,
      num minimumBillingAmount,
      bool isActive,
      bool isSelected,
      bool isMerchantFunded,
      num pcmPercentage,
      String pcmPromoImgUrl,
      Recommendations recommendations,
      bool? eligible});

  $RecommendationsCopyWith<$Res> get recommendations;
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originAirportId = null,
    Object? couponCode = null,
    Object? couponTypeId = null,
    Object? promoTermsAndCondition = null,
    Object? promoName = null,
    Object? description = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? bookingEndDate = null,
    Object? discountValue = null,
    Object? maxDiscountAmount = null,
    Object? minimumBillingAmount = null,
    Object? isActive = null,
    Object? isSelected = null,
    Object? isMerchantFunded = null,
    Object? pcmPercentage = null,
    Object? pcmPromoImgUrl = null,
    Object? recommendations = null,
    Object? eligible = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originAirportId: null == originAirportId
          ? _value.originAirportId
          : originAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      couponTypeId: null == couponTypeId
          ? _value.couponTypeId
          : couponTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      promoTermsAndCondition: null == promoTermsAndCondition
          ? _value.promoTermsAndCondition
          : promoTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingEndDate: null == bookingEndDate
          ? _value.bookingEndDate
          : bookingEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as num,
      maxDiscountAmount: null == maxDiscountAmount
          ? _value.maxDiscountAmount
          : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      minimumBillingAmount: null == minimumBillingAmount
          ? _value.minimumBillingAmount
          : minimumBillingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isMerchantFunded: null == isMerchantFunded
          ? _value.isMerchantFunded
          : isMerchantFunded // ignore: cast_nullable_to_non_nullable
              as bool,
      pcmPercentage: null == pcmPercentage
          ? _value.pcmPercentage
          : pcmPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      pcmPromoImgUrl: null == pcmPromoImgUrl
          ? _value.pcmPromoImgUrl
          : pcmPromoImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as Recommendations,
      eligible: freezed == eligible
          ? _value.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecommendationsCopyWith<$Res> get recommendations {
    return $RecommendationsCopyWith<$Res>(_value.recommendations, (value) {
      return _then(_value.copyWith(recommendations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CouponCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$_CouponCopyWith(_$_Coupon value, $Res Function(_$_Coupon) then) =
      __$$_CouponCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int originAirportId,
      String couponCode,
      int couponTypeId,
      String promoTermsAndCondition,
      String promoName,
      String description,
      String? startDate,
      String? endDate,
      String bookingEndDate,
      num discountValue,
      num maxDiscountAmount,
      num minimumBillingAmount,
      bool isActive,
      bool isSelected,
      bool isMerchantFunded,
      num pcmPercentage,
      String pcmPromoImgUrl,
      Recommendations recommendations,
      bool? eligible});

  @override
  $RecommendationsCopyWith<$Res> get recommendations;
}

/// @nodoc
class __$$_CouponCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$_Coupon>
    implements _$$_CouponCopyWith<$Res> {
  __$$_CouponCopyWithImpl(_$_Coupon _value, $Res Function(_$_Coupon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originAirportId = null,
    Object? couponCode = null,
    Object? couponTypeId = null,
    Object? promoTermsAndCondition = null,
    Object? promoName = null,
    Object? description = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? bookingEndDate = null,
    Object? discountValue = null,
    Object? maxDiscountAmount = null,
    Object? minimumBillingAmount = null,
    Object? isActive = null,
    Object? isSelected = null,
    Object? isMerchantFunded = null,
    Object? pcmPercentage = null,
    Object? pcmPromoImgUrl = null,
    Object? recommendations = null,
    Object? eligible = freezed,
  }) {
    return _then(_$_Coupon(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originAirportId: null == originAirportId
          ? _value.originAirportId
          : originAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      couponTypeId: null == couponTypeId
          ? _value.couponTypeId
          : couponTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      promoTermsAndCondition: null == promoTermsAndCondition
          ? _value.promoTermsAndCondition
          : promoTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingEndDate: null == bookingEndDate
          ? _value.bookingEndDate
          : bookingEndDate // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as num,
      maxDiscountAmount: null == maxDiscountAmount
          ? _value.maxDiscountAmount
          : maxDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      minimumBillingAmount: null == minimumBillingAmount
          ? _value.minimumBillingAmount
          : minimumBillingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isMerchantFunded: null == isMerchantFunded
          ? _value.isMerchantFunded
          : isMerchantFunded // ignore: cast_nullable_to_non_nullable
              as bool,
      pcmPercentage: null == pcmPercentage
          ? _value.pcmPercentage
          : pcmPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      pcmPromoImgUrl: null == pcmPromoImgUrl
          ? _value.pcmPromoImgUrl
          : pcmPromoImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as Recommendations,
      eligible: freezed == eligible
          ? _value.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coupon implements _Coupon {
  const _$_Coupon(
      {this.id = 0,
      this.originAirportId = 0,
      this.couponCode = '',
      this.couponTypeId = 0,
      this.promoTermsAndCondition = '',
      this.promoName = '',
      this.description = '',
      this.startDate,
      this.endDate,
      this.bookingEndDate = '',
      this.discountValue = 0,
      this.maxDiscountAmount = 0,
      this.minimumBillingAmount = 0,
      this.isActive = false,
      this.isSelected = false,
      this.isMerchantFunded = false,
      this.pcmPercentage = 0,
      this.pcmPromoImgUrl = '',
      this.recommendations = const Recommendations(),
      this.eligible = false});

  factory _$_Coupon.fromJson(Map<String, dynamic> json) =>
      _$$_CouponFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int originAirportId;
  @override
  @JsonKey()
  final String couponCode;
  @override
  @JsonKey()
  final int couponTypeId;
  @override
  @JsonKey()
  final String promoTermsAndCondition;
  @override
  @JsonKey()
  final String promoName;
  @override
  @JsonKey()
  final String description;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  @JsonKey()
  final String bookingEndDate;
  @override
  @JsonKey()
  final num discountValue;
  @override
  @JsonKey()
  final num maxDiscountAmount;
  @override
  @JsonKey()
  final num minimumBillingAmount;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final bool isMerchantFunded;
  @override
  @JsonKey()
  final num pcmPercentage;
  @override
  @JsonKey()
  final String pcmPromoImgUrl;
  @override
  @JsonKey()
  final Recommendations recommendations;
  @override
  @JsonKey()
  final bool? eligible;

  @override
  String toString() {
    return 'Coupon(id: $id, originAirportId: $originAirportId, couponCode: $couponCode, couponTypeId: $couponTypeId, promoTermsAndCondition: $promoTermsAndCondition, promoName: $promoName, description: $description, startDate: $startDate, endDate: $endDate, bookingEndDate: $bookingEndDate, discountValue: $discountValue, maxDiscountAmount: $maxDiscountAmount, minimumBillingAmount: $minimumBillingAmount, isActive: $isActive, isSelected: $isSelected, isMerchantFunded: $isMerchantFunded, pcmPercentage: $pcmPercentage, pcmPromoImgUrl: $pcmPromoImgUrl, recommendations: $recommendations, eligible: $eligible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coupon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originAirportId, originAirportId) ||
                other.originAirportId == originAirportId) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.couponTypeId, couponTypeId) ||
                other.couponTypeId == couponTypeId) &&
            (identical(other.promoTermsAndCondition, promoTermsAndCondition) ||
                other.promoTermsAndCondition == promoTermsAndCondition) &&
            (identical(other.promoName, promoName) ||
                other.promoName == promoName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.bookingEndDate, bookingEndDate) ||
                other.bookingEndDate == bookingEndDate) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.maxDiscountAmount, maxDiscountAmount) ||
                other.maxDiscountAmount == maxDiscountAmount) &&
            (identical(other.minimumBillingAmount, minimumBillingAmount) ||
                other.minimumBillingAmount == minimumBillingAmount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isMerchantFunded, isMerchantFunded) ||
                other.isMerchantFunded == isMerchantFunded) &&
            (identical(other.pcmPercentage, pcmPercentage) ||
                other.pcmPercentage == pcmPercentage) &&
            (identical(other.pcmPromoImgUrl, pcmPromoImgUrl) ||
                other.pcmPromoImgUrl == pcmPromoImgUrl) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        originAirportId,
        couponCode,
        couponTypeId,
        promoTermsAndCondition,
        promoName,
        description,
        startDate,
        endDate,
        bookingEndDate,
        discountValue,
        maxDiscountAmount,
        minimumBillingAmount,
        isActive,
        isSelected,
        isMerchantFunded,
        pcmPercentage,
        pcmPromoImgUrl,
        recommendations,
        eligible
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      __$$_CouponCopyWithImpl<_$_Coupon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponToJson(
      this,
    );
  }
}

abstract class _Coupon implements Coupon {
  const factory _Coupon(
      {final int id,
      final int originAirportId,
      final String couponCode,
      final int couponTypeId,
      final String promoTermsAndCondition,
      final String promoName,
      final String description,
      final String? startDate,
      final String? endDate,
      final String bookingEndDate,
      final num discountValue,
      final num maxDiscountAmount,
      final num minimumBillingAmount,
      final bool isActive,
      final bool isSelected,
      final bool isMerchantFunded,
      final num pcmPercentage,
      final String pcmPromoImgUrl,
      final Recommendations recommendations,
      final bool? eligible}) = _$_Coupon;

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$_Coupon.fromJson;

  @override
  int get id;
  @override
  int get originAirportId;
  @override
  String get couponCode;
  @override
  int get couponTypeId;
  @override
  String get promoTermsAndCondition;
  @override
  String get promoName;
  @override
  String get description;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String get bookingEndDate;
  @override
  num get discountValue;
  @override
  num get maxDiscountAmount;
  @override
  num get minimumBillingAmount;
  @override
  bool get isActive;
  @override
  bool get isSelected;
  @override
  bool get isMerchantFunded;
  @override
  num get pcmPercentage;
  @override
  String get pcmPromoImgUrl;
  @override
  Recommendations get recommendations;
  @override
  bool? get eligible;
  @override
  @JsonKey(ignore: true)
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      throw _privateConstructorUsedError;
}

Recommendations _$RecommendationsFromJson(Map<String, dynamic> json) {
  return _Recommendations.fromJson(json);
}

/// @nodoc
mixin _$Recommendations {
  String get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendationsCopyWith<Recommendations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationsCopyWith<$Res> {
  factory $RecommendationsCopyWith(
          Recommendations value, $Res Function(Recommendations) then) =
      _$RecommendationsCopyWithImpl<$Res, Recommendations>;
  @useResult
  $Res call({String amount});
}

/// @nodoc
class _$RecommendationsCopyWithImpl<$Res, $Val extends Recommendations>
    implements $RecommendationsCopyWith<$Res> {
  _$RecommendationsCopyWithImpl(this._value, this._then);

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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecommendationsCopyWith<$Res>
    implements $RecommendationsCopyWith<$Res> {
  factory _$$_RecommendationsCopyWith(
          _$_Recommendations value, $Res Function(_$_Recommendations) then) =
      __$$_RecommendationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String amount});
}

/// @nodoc
class __$$_RecommendationsCopyWithImpl<$Res>
    extends _$RecommendationsCopyWithImpl<$Res, _$_Recommendations>
    implements _$$_RecommendationsCopyWith<$Res> {
  __$$_RecommendationsCopyWithImpl(
      _$_Recommendations _value, $Res Function(_$_Recommendations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$_Recommendations(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recommendations implements _Recommendations {
  const _$_Recommendations({this.amount = ''});

  factory _$_Recommendations.fromJson(Map<String, dynamic> json) =>
      _$$_RecommendationsFromJson(json);

  @override
  @JsonKey()
  final String amount;

  @override
  String toString() {
    return 'Recommendations(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recommendations &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecommendationsCopyWith<_$_Recommendations> get copyWith =>
      __$$_RecommendationsCopyWithImpl<_$_Recommendations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecommendationsToJson(
      this,
    );
  }
}

abstract class _Recommendations implements Recommendations {
  const factory _Recommendations({final String amount}) = _$_Recommendations;

  factory _Recommendations.fromJson(Map<String, dynamic> json) =
      _$_Recommendations.fromJson;

  @override
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendationsCopyWith<_$_Recommendations> get copyWith =>
      throw _privateConstructorUsedError;
}
