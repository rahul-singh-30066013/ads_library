// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponListResponse _$CouponListResponseFromJson(Map<String, dynamic> json) {
  return _CouponListResponse.fromJson(json);
}

/// @nodoc
mixin _$CouponListResponse {
  List<CouponDetails> get elgibleOfferInfo =>
      throw _privateConstructorUsedError;
  List<CouponDetails> get promoList => throw _privateConstructorUsedError;
  List<CouponDetails> get promoDetails => throw _privateConstructorUsedError;
  List<CouponDetails> get promoCodes => throw _privateConstructorUsedError;
  List<CouponDetails> get earningPercentage =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponListResponseCopyWith<CouponListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponListResponseCopyWith<$Res> {
  factory $CouponListResponseCopyWith(
          CouponListResponse value, $Res Function(CouponListResponse) then) =
      _$CouponListResponseCopyWithImpl<$Res, CouponListResponse>;
  @useResult
  $Res call(
      {List<CouponDetails> elgibleOfferInfo,
      List<CouponDetails> promoList,
      List<CouponDetails> promoDetails,
      List<CouponDetails> promoCodes,
      List<CouponDetails> earningPercentage});
}

/// @nodoc
class _$CouponListResponseCopyWithImpl<$Res, $Val extends CouponListResponse>
    implements $CouponListResponseCopyWith<$Res> {
  _$CouponListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elgibleOfferInfo = null,
    Object? promoList = null,
    Object? promoDetails = null,
    Object? promoCodes = null,
    Object? earningPercentage = null,
  }) {
    return _then(_value.copyWith(
      elgibleOfferInfo: null == elgibleOfferInfo
          ? _value.elgibleOfferInfo
          : elgibleOfferInfo // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      promoList: null == promoList
          ? _value.promoList
          : promoList // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      promoDetails: null == promoDetails
          ? _value.promoDetails
          : promoDetails // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      promoCodes: null == promoCodes
          ? _value.promoCodes
          : promoCodes // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      earningPercentage: null == earningPercentage
          ? _value.earningPercentage
          : earningPercentage // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponListResponseCopyWith<$Res>
    implements $CouponListResponseCopyWith<$Res> {
  factory _$$_CouponListResponseCopyWith(_$_CouponListResponse value,
          $Res Function(_$_CouponListResponse) then) =
      __$$_CouponListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CouponDetails> elgibleOfferInfo,
      List<CouponDetails> promoList,
      List<CouponDetails> promoDetails,
      List<CouponDetails> promoCodes,
      List<CouponDetails> earningPercentage});
}

/// @nodoc
class __$$_CouponListResponseCopyWithImpl<$Res>
    extends _$CouponListResponseCopyWithImpl<$Res, _$_CouponListResponse>
    implements _$$_CouponListResponseCopyWith<$Res> {
  __$$_CouponListResponseCopyWithImpl(
      _$_CouponListResponse _value, $Res Function(_$_CouponListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elgibleOfferInfo = null,
    Object? promoList = null,
    Object? promoDetails = null,
    Object? promoCodes = null,
    Object? earningPercentage = null,
  }) {
    return _then(_$_CouponListResponse(
      elgibleOfferInfo: null == elgibleOfferInfo
          ? _value.elgibleOfferInfo
          : elgibleOfferInfo // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      promoList: null == promoList
          ? _value.promoList
          : promoList // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      promoDetails: null == promoDetails
          ? _value.promoDetails
          : promoDetails // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      promoCodes: null == promoCodes
          ? _value.promoCodes
          : promoCodes // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
      earningPercentage: null == earningPercentage
          ? _value.earningPercentage
          : earningPercentage // ignore: cast_nullable_to_non_nullable
              as List<CouponDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponListResponse implements _CouponListResponse {
  const _$_CouponListResponse(
      {this.elgibleOfferInfo = const [],
      this.promoList = const [],
      this.promoDetails = const [],
      this.promoCodes = const [],
      this.earningPercentage = const []});

  factory _$_CouponListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CouponListResponseFromJson(json);

  @override
  @JsonKey()
  final List<CouponDetails> elgibleOfferInfo;
  @override
  @JsonKey()
  final List<CouponDetails> promoList;
  @override
  @JsonKey()
  final List<CouponDetails> promoDetails;
  @override
  @JsonKey()
  final List<CouponDetails> promoCodes;
  @override
  @JsonKey()
  final List<CouponDetails> earningPercentage;

  @override
  String toString() {
    return 'CouponListResponse(elgibleOfferInfo: $elgibleOfferInfo, promoList: $promoList, promoDetails: $promoDetails, promoCodes: $promoCodes, earningPercentage: $earningPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponListResponse &&
            const DeepCollectionEquality()
                .equals(other.elgibleOfferInfo, elgibleOfferInfo) &&
            const DeepCollectionEquality().equals(other.promoList, promoList) &&
            const DeepCollectionEquality()
                .equals(other.promoDetails, promoDetails) &&
            const DeepCollectionEquality()
                .equals(other.promoCodes, promoCodes) &&
            const DeepCollectionEquality()
                .equals(other.earningPercentage, earningPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(elgibleOfferInfo),
      const DeepCollectionEquality().hash(promoList),
      const DeepCollectionEquality().hash(promoDetails),
      const DeepCollectionEquality().hash(promoCodes),
      const DeepCollectionEquality().hash(earningPercentage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponListResponseCopyWith<_$_CouponListResponse> get copyWith =>
      __$$_CouponListResponseCopyWithImpl<_$_CouponListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponListResponseToJson(
      this,
    );
  }
}

abstract class _CouponListResponse implements CouponListResponse {
  const factory _CouponListResponse(
      {final List<CouponDetails> elgibleOfferInfo,
      final List<CouponDetails> promoList,
      final List<CouponDetails> promoDetails,
      final List<CouponDetails> promoCodes,
      final List<CouponDetails> earningPercentage}) = _$_CouponListResponse;

  factory _CouponListResponse.fromJson(Map<String, dynamic> json) =
      _$_CouponListResponse.fromJson;

  @override
  List<CouponDetails> get elgibleOfferInfo;
  @override
  List<CouponDetails> get promoList;
  @override
  List<CouponDetails> get promoDetails;
  @override
  List<CouponDetails> get promoCodes;
  @override
  List<CouponDetails> get earningPercentage;
  @override
  @JsonKey(ignore: true)
  _$$_CouponListResponseCopyWith<_$_CouponListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

CouponDetails _$CouponDetailsFromJson(Map<String, dynamic> json) {
  return _CouponDetails.fromJson(json);
}

/// @nodoc
mixin _$CouponDetails {
  int get id => throw _privateConstructorUsedError;
  String get promoName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get promoStatus => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  num get discountPercentage => throw _privateConstructorUsedError;
  num get maximumDiscountAmount => throw _privateConstructorUsedError;
  num get minimumBillingAmount => throw _privateConstructorUsedError;
  num get caculationBasedOnAmount => throw _privateConstructorUsedError;
  String get promoTermsAndConditions => throw _privateConstructorUsedError;
  String get eligibilityAmount => throw _privateConstructorUsedError;
  bool? get eligible => throw _privateConstructorUsedError;
  bool? get isInstantDiscount => throw _privateConstructorUsedError;
  String get promoImgUrl => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  String get promoType => throw _privateConstructorUsedError;
  Recommendations get recommendations => throw _privateConstructorUsedError;
  String get narration => throw _privateConstructorUsedError;
  String get promoCode => throw _privateConstructorUsedError;
  String get promoDescription => throw _privateConstructorUsedError;
  String get promoCategory => throw _privateConstructorUsedError;
  num get promoPriority => throw _privateConstructorUsedError;
  bool? get international => throw _privateConstructorUsedError;
  String get promoTermsAndCondition => throw _privateConstructorUsedError;
  num get earningPercentage => throw _privateConstructorUsedError;
  String get earningPercentageLob => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponDetailsCopyWith<CouponDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponDetailsCopyWith<$Res> {
  factory $CouponDetailsCopyWith(
          CouponDetails value, $Res Function(CouponDetails) then) =
      _$CouponDetailsCopyWithImpl<$Res, CouponDetails>;
  @useResult
  $Res call(
      {int id,
      String promoName,
      String description,
      String promoStatus,
      String couponCode,
      num discountPercentage,
      num maximumDiscountAmount,
      num minimumBillingAmount,
      num caculationBasedOnAmount,
      String promoTermsAndConditions,
      String eligibilityAmount,
      bool? eligible,
      bool? isInstantDiscount,
      String promoImgUrl,
      String endDate,
      String startDate,
      bool? isSelected,
      String promoType,
      Recommendations recommendations,
      String narration,
      String promoCode,
      String promoDescription,
      String promoCategory,
      num promoPriority,
      bool? international,
      String promoTermsAndCondition,
      num earningPercentage,
      String earningPercentageLob});

  $RecommendationsCopyWith<$Res> get recommendations;
}

/// @nodoc
class _$CouponDetailsCopyWithImpl<$Res, $Val extends CouponDetails>
    implements $CouponDetailsCopyWith<$Res> {
  _$CouponDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? promoName = null,
    Object? description = null,
    Object? promoStatus = null,
    Object? couponCode = null,
    Object? discountPercentage = null,
    Object? maximumDiscountAmount = null,
    Object? minimumBillingAmount = null,
    Object? caculationBasedOnAmount = null,
    Object? promoTermsAndConditions = null,
    Object? eligibilityAmount = null,
    Object? eligible = freezed,
    Object? isInstantDiscount = freezed,
    Object? promoImgUrl = null,
    Object? endDate = null,
    Object? startDate = null,
    Object? isSelected = freezed,
    Object? promoType = null,
    Object? recommendations = null,
    Object? narration = null,
    Object? promoCode = null,
    Object? promoDescription = null,
    Object? promoCategory = null,
    Object? promoPriority = null,
    Object? international = freezed,
    Object? promoTermsAndCondition = null,
    Object? earningPercentage = null,
    Object? earningPercentageLob = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      maximumDiscountAmount: null == maximumDiscountAmount
          ? _value.maximumDiscountAmount
          : maximumDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      minimumBillingAmount: null == minimumBillingAmount
          ? _value.minimumBillingAmount
          : minimumBillingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      caculationBasedOnAmount: null == caculationBasedOnAmount
          ? _value.caculationBasedOnAmount
          : caculationBasedOnAmount // ignore: cast_nullable_to_non_nullable
              as num,
      promoTermsAndConditions: null == promoTermsAndConditions
          ? _value.promoTermsAndConditions
          : promoTermsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      eligibilityAmount: null == eligibilityAmount
          ? _value.eligibilityAmount
          : eligibilityAmount // ignore: cast_nullable_to_non_nullable
              as String,
      eligible: freezed == eligible
          ? _value.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInstantDiscount: freezed == isInstantDiscount
          ? _value.isInstantDiscount
          : isInstantDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
      promoImgUrl: null == promoImgUrl
          ? _value.promoImgUrl
          : promoImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as Recommendations,
      narration: null == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String,
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      promoDescription: null == promoDescription
          ? _value.promoDescription
          : promoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promoCategory: null == promoCategory
          ? _value.promoCategory
          : promoCategory // ignore: cast_nullable_to_non_nullable
              as String,
      promoPriority: null == promoPriority
          ? _value.promoPriority
          : promoPriority // ignore: cast_nullable_to_non_nullable
              as num,
      international: freezed == international
          ? _value.international
          : international // ignore: cast_nullable_to_non_nullable
              as bool?,
      promoTermsAndCondition: null == promoTermsAndCondition
          ? _value.promoTermsAndCondition
          : promoTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      earningPercentage: null == earningPercentage
          ? _value.earningPercentage
          : earningPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      earningPercentageLob: null == earningPercentageLob
          ? _value.earningPercentageLob
          : earningPercentageLob // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_CouponDetailsCopyWith<$Res>
    implements $CouponDetailsCopyWith<$Res> {
  factory _$$_CouponDetailsCopyWith(
          _$_CouponDetails value, $Res Function(_$_CouponDetails) then) =
      __$$_CouponDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String promoName,
      String description,
      String promoStatus,
      String couponCode,
      num discountPercentage,
      num maximumDiscountAmount,
      num minimumBillingAmount,
      num caculationBasedOnAmount,
      String promoTermsAndConditions,
      String eligibilityAmount,
      bool? eligible,
      bool? isInstantDiscount,
      String promoImgUrl,
      String endDate,
      String startDate,
      bool? isSelected,
      String promoType,
      Recommendations recommendations,
      String narration,
      String promoCode,
      String promoDescription,
      String promoCategory,
      num promoPriority,
      bool? international,
      String promoTermsAndCondition,
      num earningPercentage,
      String earningPercentageLob});

  @override
  $RecommendationsCopyWith<$Res> get recommendations;
}

/// @nodoc
class __$$_CouponDetailsCopyWithImpl<$Res>
    extends _$CouponDetailsCopyWithImpl<$Res, _$_CouponDetails>
    implements _$$_CouponDetailsCopyWith<$Res> {
  __$$_CouponDetailsCopyWithImpl(
      _$_CouponDetails _value, $Res Function(_$_CouponDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? promoName = null,
    Object? description = null,
    Object? promoStatus = null,
    Object? couponCode = null,
    Object? discountPercentage = null,
    Object? maximumDiscountAmount = null,
    Object? minimumBillingAmount = null,
    Object? caculationBasedOnAmount = null,
    Object? promoTermsAndConditions = null,
    Object? eligibilityAmount = null,
    Object? eligible = freezed,
    Object? isInstantDiscount = freezed,
    Object? promoImgUrl = null,
    Object? endDate = null,
    Object? startDate = null,
    Object? isSelected = freezed,
    Object? promoType = null,
    Object? recommendations = null,
    Object? narration = null,
    Object? promoCode = null,
    Object? promoDescription = null,
    Object? promoCategory = null,
    Object? promoPriority = null,
    Object? international = freezed,
    Object? promoTermsAndCondition = null,
    Object? earningPercentage = null,
    Object? earningPercentageLob = null,
  }) {
    return _then(_$_CouponDetails(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      maximumDiscountAmount: null == maximumDiscountAmount
          ? _value.maximumDiscountAmount
          : maximumDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      minimumBillingAmount: null == minimumBillingAmount
          ? _value.minimumBillingAmount
          : minimumBillingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      caculationBasedOnAmount: null == caculationBasedOnAmount
          ? _value.caculationBasedOnAmount
          : caculationBasedOnAmount // ignore: cast_nullable_to_non_nullable
              as num,
      promoTermsAndConditions: null == promoTermsAndConditions
          ? _value.promoTermsAndConditions
          : promoTermsAndConditions // ignore: cast_nullable_to_non_nullable
              as String,
      eligibilityAmount: null == eligibilityAmount
          ? _value.eligibilityAmount
          : eligibilityAmount // ignore: cast_nullable_to_non_nullable
              as String,
      eligible: freezed == eligible
          ? _value.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isInstantDiscount: freezed == isInstantDiscount
          ? _value.isInstantDiscount
          : isInstantDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
      promoImgUrl: null == promoImgUrl
          ? _value.promoImgUrl
          : promoImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as Recommendations,
      narration: null == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String,
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      promoDescription: null == promoDescription
          ? _value.promoDescription
          : promoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promoCategory: null == promoCategory
          ? _value.promoCategory
          : promoCategory // ignore: cast_nullable_to_non_nullable
              as String,
      promoPriority: null == promoPriority
          ? _value.promoPriority
          : promoPriority // ignore: cast_nullable_to_non_nullable
              as num,
      international: freezed == international
          ? _value.international
          : international // ignore: cast_nullable_to_non_nullable
              as bool?,
      promoTermsAndCondition: null == promoTermsAndCondition
          ? _value.promoTermsAndCondition
          : promoTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      earningPercentage: null == earningPercentage
          ? _value.earningPercentage
          : earningPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      earningPercentageLob: null == earningPercentageLob
          ? _value.earningPercentageLob
          : earningPercentageLob // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponDetails implements _CouponDetails {
  const _$_CouponDetails(
      {this.id = 0,
      this.promoName = '',
      this.description = '',
      this.promoStatus = '',
      this.couponCode = '',
      this.discountPercentage = 0,
      this.maximumDiscountAmount = 0,
      this.minimumBillingAmount = 0,
      this.caculationBasedOnAmount = 0,
      this.promoTermsAndConditions = '',
      this.eligibilityAmount = '',
      this.eligible = false,
      this.isInstantDiscount = false,
      this.promoImgUrl = '',
      this.endDate = '',
      this.startDate = '',
      this.isSelected = false,
      this.promoType = '',
      this.recommendations = const Recommendations(),
      this.narration = '',
      this.promoCode = '',
      this.promoDescription = '',
      this.promoCategory = '',
      this.promoPriority = 0,
      this.international = false,
      this.promoTermsAndCondition = '',
      this.earningPercentage = 0,
      this.earningPercentageLob = ''});

  factory _$_CouponDetails.fromJson(Map<String, dynamic> json) =>
      _$$_CouponDetailsFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String promoName;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String promoStatus;
  @override
  @JsonKey()
  final String couponCode;
  @override
  @JsonKey()
  final num discountPercentage;
  @override
  @JsonKey()
  final num maximumDiscountAmount;
  @override
  @JsonKey()
  final num minimumBillingAmount;
  @override
  @JsonKey()
  final num caculationBasedOnAmount;
  @override
  @JsonKey()
  final String promoTermsAndConditions;
  @override
  @JsonKey()
  final String eligibilityAmount;
  @override
  @JsonKey()
  final bool? eligible;
  @override
  @JsonKey()
  final bool? isInstantDiscount;
  @override
  @JsonKey()
  final String promoImgUrl;
  @override
  @JsonKey()
  final String endDate;
  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final bool? isSelected;
  @override
  @JsonKey()
  final String promoType;
  @override
  @JsonKey()
  final Recommendations recommendations;
  @override
  @JsonKey()
  final String narration;
  @override
  @JsonKey()
  final String promoCode;
  @override
  @JsonKey()
  final String promoDescription;
  @override
  @JsonKey()
  final String promoCategory;
  @override
  @JsonKey()
  final num promoPriority;
  @override
  @JsonKey()
  final bool? international;
  @override
  @JsonKey()
  final String promoTermsAndCondition;
  @override
  @JsonKey()
  final num earningPercentage;
  @override
  @JsonKey()
  final String earningPercentageLob;

  @override
  String toString() {
    return 'CouponDetails(id: $id, promoName: $promoName, description: $description, promoStatus: $promoStatus, couponCode: $couponCode, discountPercentage: $discountPercentage, maximumDiscountAmount: $maximumDiscountAmount, minimumBillingAmount: $minimumBillingAmount, caculationBasedOnAmount: $caculationBasedOnAmount, promoTermsAndConditions: $promoTermsAndConditions, eligibilityAmount: $eligibilityAmount, eligible: $eligible, isInstantDiscount: $isInstantDiscount, promoImgUrl: $promoImgUrl, endDate: $endDate, startDate: $startDate, isSelected: $isSelected, promoType: $promoType, recommendations: $recommendations, narration: $narration, promoCode: $promoCode, promoDescription: $promoDescription, promoCategory: $promoCategory, promoPriority: $promoPriority, international: $international, promoTermsAndCondition: $promoTermsAndCondition, earningPercentage: $earningPercentage, earningPercentageLob: $earningPercentageLob)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponDetails &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.promoName, promoName) ||
                other.promoName == promoName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.maximumDiscountAmount, maximumDiscountAmount) ||
                other.maximumDiscountAmount == maximumDiscountAmount) &&
            (identical(other.minimumBillingAmount, minimumBillingAmount) ||
                other.minimumBillingAmount == minimumBillingAmount) &&
            (identical(
                    other.caculationBasedOnAmount, caculationBasedOnAmount) ||
                other.caculationBasedOnAmount == caculationBasedOnAmount) &&
            (identical(
                    other.promoTermsAndConditions, promoTermsAndConditions) ||
                other.promoTermsAndConditions == promoTermsAndConditions) &&
            (identical(other.eligibilityAmount, eligibilityAmount) ||
                other.eligibilityAmount == eligibilityAmount) &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible) &&
            (identical(other.isInstantDiscount, isInstantDiscount) ||
                other.isInstantDiscount == isInstantDiscount) &&
            (identical(other.promoImgUrl, promoImgUrl) ||
                other.promoImgUrl == promoImgUrl) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.promoType, promoType) ||
                other.promoType == promoType) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            (identical(other.narration, narration) ||
                other.narration == narration) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.promoDescription, promoDescription) ||
                other.promoDescription == promoDescription) &&
            (identical(other.promoCategory, promoCategory) ||
                other.promoCategory == promoCategory) &&
            (identical(other.promoPriority, promoPriority) ||
                other.promoPriority == promoPriority) &&
            (identical(other.international, international) ||
                other.international == international) &&
            (identical(other.promoTermsAndCondition, promoTermsAndCondition) ||
                other.promoTermsAndCondition == promoTermsAndCondition) &&
            (identical(other.earningPercentage, earningPercentage) ||
                other.earningPercentage == earningPercentage) &&
            (identical(other.earningPercentageLob, earningPercentageLob) ||
                other.earningPercentageLob == earningPercentageLob));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        promoName,
        description,
        promoStatus,
        couponCode,
        discountPercentage,
        maximumDiscountAmount,
        minimumBillingAmount,
        caculationBasedOnAmount,
        promoTermsAndConditions,
        eligibilityAmount,
        eligible,
        isInstantDiscount,
        promoImgUrl,
        endDate,
        startDate,
        isSelected,
        promoType,
        recommendations,
        narration,
        promoCode,
        promoDescription,
        promoCategory,
        promoPriority,
        international,
        promoTermsAndCondition,
        earningPercentage,
        earningPercentageLob
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponDetailsCopyWith<_$_CouponDetails> get copyWith =>
      __$$_CouponDetailsCopyWithImpl<_$_CouponDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponDetailsToJson(
      this,
    );
  }
}

abstract class _CouponDetails implements CouponDetails {
  const factory _CouponDetails(
      {final int id,
      final String promoName,
      final String description,
      final String promoStatus,
      final String couponCode,
      final num discountPercentage,
      final num maximumDiscountAmount,
      final num minimumBillingAmount,
      final num caculationBasedOnAmount,
      final String promoTermsAndConditions,
      final String eligibilityAmount,
      final bool? eligible,
      final bool? isInstantDiscount,
      final String promoImgUrl,
      final String endDate,
      final String startDate,
      final bool? isSelected,
      final String promoType,
      final Recommendations recommendations,
      final String narration,
      final String promoCode,
      final String promoDescription,
      final String promoCategory,
      final num promoPriority,
      final bool? international,
      final String promoTermsAndCondition,
      final num earningPercentage,
      final String earningPercentageLob}) = _$_CouponDetails;

  factory _CouponDetails.fromJson(Map<String, dynamic> json) =
      _$_CouponDetails.fromJson;

  @override
  int get id;
  @override
  String get promoName;
  @override
  String get description;
  @override
  String get promoStatus;
  @override
  String get couponCode;
  @override
  num get discountPercentage;
  @override
  num get maximumDiscountAmount;
  @override
  num get minimumBillingAmount;
  @override
  num get caculationBasedOnAmount;
  @override
  String get promoTermsAndConditions;
  @override
  String get eligibilityAmount;
  @override
  bool? get eligible;
  @override
  bool? get isInstantDiscount;
  @override
  String get promoImgUrl;
  @override
  String get endDate;
  @override
  String get startDate;
  @override
  bool? get isSelected;
  @override
  String get promoType;
  @override
  Recommendations get recommendations;
  @override
  String get narration;
  @override
  String get promoCode;
  @override
  String get promoDescription;
  @override
  String get promoCategory;
  @override
  num get promoPriority;
  @override
  bool? get international;
  @override
  String get promoTermsAndCondition;
  @override
  num get earningPercentage;
  @override
  String get earningPercentageLob;
  @override
  @JsonKey(ignore: true)
  _$$_CouponDetailsCopyWith<_$_CouponDetails> get copyWith =>
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
