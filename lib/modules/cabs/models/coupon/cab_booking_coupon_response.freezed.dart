// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cab_booking_coupon_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CabBookingCouponResponse _$CabBookingCouponResponseFromJson(
    Map<String, dynamic> json) {
  return _CabBookingCouponResponse.fromJson(json);
}

/// @nodoc
mixin _$CabBookingCouponResponse {
  List<CabBookingCoupon> get promoDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabBookingCouponResponseCopyWith<CabBookingCouponResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CabBookingCouponResponseCopyWith<$Res> {
  factory $CabBookingCouponResponseCopyWith(CabBookingCouponResponse value,
          $Res Function(CabBookingCouponResponse) then) =
      _$CabBookingCouponResponseCopyWithImpl<$Res, CabBookingCouponResponse>;
  @useResult
  $Res call({List<CabBookingCoupon> promoDetails});
}

/// @nodoc
class _$CabBookingCouponResponseCopyWithImpl<$Res,
        $Val extends CabBookingCouponResponse>
    implements $CabBookingCouponResponseCopyWith<$Res> {
  _$CabBookingCouponResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoDetails = null,
  }) {
    return _then(_value.copyWith(
      promoDetails: null == promoDetails
          ? _value.promoDetails
          : promoDetails // ignore: cast_nullable_to_non_nullable
              as List<CabBookingCoupon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CabBookingCouponResponseCopyWith<$Res>
    implements $CabBookingCouponResponseCopyWith<$Res> {
  factory _$$_CabBookingCouponResponseCopyWith(
          _$_CabBookingCouponResponse value,
          $Res Function(_$_CabBookingCouponResponse) then) =
      __$$_CabBookingCouponResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CabBookingCoupon> promoDetails});
}

/// @nodoc
class __$$_CabBookingCouponResponseCopyWithImpl<$Res>
    extends _$CabBookingCouponResponseCopyWithImpl<$Res,
        _$_CabBookingCouponResponse>
    implements _$$_CabBookingCouponResponseCopyWith<$Res> {
  __$$_CabBookingCouponResponseCopyWithImpl(_$_CabBookingCouponResponse _value,
      $Res Function(_$_CabBookingCouponResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoDetails = null,
  }) {
    return _then(_$_CabBookingCouponResponse(
      null == promoDetails
          ? _value.promoDetails
          : promoDetails // ignore: cast_nullable_to_non_nullable
              as List<CabBookingCoupon>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CabBookingCouponResponse implements _CabBookingCouponResponse {
  const _$_CabBookingCouponResponse(this.promoDetails);

  factory _$_CabBookingCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CabBookingCouponResponseFromJson(json);

  @override
  final List<CabBookingCoupon> promoDetails;

  @override
  String toString() {
    return 'CabBookingCouponResponse(promoDetails: $promoDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CabBookingCouponResponse &&
            const DeepCollectionEquality()
                .equals(other.promoDetails, promoDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(promoDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CabBookingCouponResponseCopyWith<_$_CabBookingCouponResponse>
      get copyWith => __$$_CabBookingCouponResponseCopyWithImpl<
          _$_CabBookingCouponResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabBookingCouponResponseToJson(
      this,
    );
  }
}

abstract class _CabBookingCouponResponse implements CabBookingCouponResponse {
  const factory _CabBookingCouponResponse(
      final List<CabBookingCoupon> promoDetails) = _$_CabBookingCouponResponse;

  factory _CabBookingCouponResponse.fromJson(Map<String, dynamic> json) =
      _$_CabBookingCouponResponse.fromJson;

  @override
  List<CabBookingCoupon> get promoDetails;
  @override
  @JsonKey(ignore: true)
  _$$_CabBookingCouponResponseCopyWith<_$_CabBookingCouponResponse>
      get copyWith => throw _privateConstructorUsedError;
}

CabBookingCoupon _$CabBookingCouponFromJson(Map<String, dynamic> json) {
  return _CabBookingCoupon.fromJson(json);
}

/// @nodoc
mixin _$CabBookingCoupon {
  int get promoId => throw _privateConstructorUsedError;
  String get promoName => throw _privateConstructorUsedError;
  String get promoDescription => throw _privateConstructorUsedError;
  String get promoStatus => throw _privateConstructorUsedError;
  String get promoStaticPromoCode => throw _privateConstructorUsedError;
  num get pcmPercentage => throw _privateConstructorUsedError;
  String get promoTermsAndCondition => throw _privateConstructorUsedError;
  bool? get eligible => throw _privateConstructorUsedError;
  String get pcmPromoImgUrl => throw _privateConstructorUsedError;
  String get promoExpiryDate => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  Recommendations get recommendations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabBookingCouponCopyWith<CabBookingCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CabBookingCouponCopyWith<$Res> {
  factory $CabBookingCouponCopyWith(
          CabBookingCoupon value, $Res Function(CabBookingCoupon) then) =
      _$CabBookingCouponCopyWithImpl<$Res, CabBookingCoupon>;
  @useResult
  $Res call(
      {int promoId,
      String promoName,
      String promoDescription,
      String promoStatus,
      String promoStaticPromoCode,
      num pcmPercentage,
      String promoTermsAndCondition,
      bool? eligible,
      String pcmPromoImgUrl,
      String promoExpiryDate,
      bool? isSelected,
      Recommendations recommendations});

  $RecommendationsCopyWith<$Res> get recommendations;
}

/// @nodoc
class _$CabBookingCouponCopyWithImpl<$Res, $Val extends CabBookingCoupon>
    implements $CabBookingCouponCopyWith<$Res> {
  _$CabBookingCouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoId = null,
    Object? promoName = null,
    Object? promoDescription = null,
    Object? promoStatus = null,
    Object? promoStaticPromoCode = null,
    Object? pcmPercentage = null,
    Object? promoTermsAndCondition = null,
    Object? eligible = freezed,
    Object? pcmPromoImgUrl = null,
    Object? promoExpiryDate = null,
    Object? isSelected = freezed,
    Object? recommendations = null,
  }) {
    return _then(_value.copyWith(
      promoId: null == promoId
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as int,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      promoDescription: null == promoDescription
          ? _value.promoDescription
          : promoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as String,
      promoStaticPromoCode: null == promoStaticPromoCode
          ? _value.promoStaticPromoCode
          : promoStaticPromoCode // ignore: cast_nullable_to_non_nullable
              as String,
      pcmPercentage: null == pcmPercentage
          ? _value.pcmPercentage
          : pcmPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      promoTermsAndCondition: null == promoTermsAndCondition
          ? _value.promoTermsAndCondition
          : promoTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      eligible: freezed == eligible
          ? _value.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool?,
      pcmPromoImgUrl: null == pcmPromoImgUrl
          ? _value.pcmPromoImgUrl
          : pcmPromoImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      promoExpiryDate: null == promoExpiryDate
          ? _value.promoExpiryDate
          : promoExpiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as Recommendations,
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
abstract class _$$_CabBookingCouponCopyWith<$Res>
    implements $CabBookingCouponCopyWith<$Res> {
  factory _$$_CabBookingCouponCopyWith(
          _$_CabBookingCoupon value, $Res Function(_$_CabBookingCoupon) then) =
      __$$_CabBookingCouponCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int promoId,
      String promoName,
      String promoDescription,
      String promoStatus,
      String promoStaticPromoCode,
      num pcmPercentage,
      String promoTermsAndCondition,
      bool? eligible,
      String pcmPromoImgUrl,
      String promoExpiryDate,
      bool? isSelected,
      Recommendations recommendations});

  @override
  $RecommendationsCopyWith<$Res> get recommendations;
}

/// @nodoc
class __$$_CabBookingCouponCopyWithImpl<$Res>
    extends _$CabBookingCouponCopyWithImpl<$Res, _$_CabBookingCoupon>
    implements _$$_CabBookingCouponCopyWith<$Res> {
  __$$_CabBookingCouponCopyWithImpl(
      _$_CabBookingCoupon _value, $Res Function(_$_CabBookingCoupon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoId = null,
    Object? promoName = null,
    Object? promoDescription = null,
    Object? promoStatus = null,
    Object? promoStaticPromoCode = null,
    Object? pcmPercentage = null,
    Object? promoTermsAndCondition = null,
    Object? eligible = freezed,
    Object? pcmPromoImgUrl = null,
    Object? promoExpiryDate = null,
    Object? isSelected = freezed,
    Object? recommendations = null,
  }) {
    return _then(_$_CabBookingCoupon(
      promoId: null == promoId
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as int,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      promoDescription: null == promoDescription
          ? _value.promoDescription
          : promoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as String,
      promoStaticPromoCode: null == promoStaticPromoCode
          ? _value.promoStaticPromoCode
          : promoStaticPromoCode // ignore: cast_nullable_to_non_nullable
              as String,
      pcmPercentage: null == pcmPercentage
          ? _value.pcmPercentage
          : pcmPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      promoTermsAndCondition: null == promoTermsAndCondition
          ? _value.promoTermsAndCondition
          : promoTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      eligible: freezed == eligible
          ? _value.eligible
          : eligible // ignore: cast_nullable_to_non_nullable
              as bool?,
      pcmPromoImgUrl: null == pcmPromoImgUrl
          ? _value.pcmPromoImgUrl
          : pcmPromoImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      promoExpiryDate: null == promoExpiryDate
          ? _value.promoExpiryDate
          : promoExpiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as Recommendations,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CabBookingCoupon implements _CabBookingCoupon {
  const _$_CabBookingCoupon(
      {this.promoId = 0,
      this.promoName = '',
      this.promoDescription = '',
      this.promoStatus = '',
      this.promoStaticPromoCode = '',
      this.pcmPercentage = 0,
      this.promoTermsAndCondition = '',
      this.eligible = false,
      this.pcmPromoImgUrl = '',
      this.promoExpiryDate = '',
      this.isSelected = false,
      this.recommendations = const Recommendations()});

  factory _$_CabBookingCoupon.fromJson(Map<String, dynamic> json) =>
      _$$_CabBookingCouponFromJson(json);

  @override
  @JsonKey()
  final int promoId;
  @override
  @JsonKey()
  final String promoName;
  @override
  @JsonKey()
  final String promoDescription;
  @override
  @JsonKey()
  final String promoStatus;
  @override
  @JsonKey()
  final String promoStaticPromoCode;
  @override
  @JsonKey()
  final num pcmPercentage;
  @override
  @JsonKey()
  final String promoTermsAndCondition;
  @override
  @JsonKey()
  final bool? eligible;
  @override
  @JsonKey()
  final String pcmPromoImgUrl;
  @override
  @JsonKey()
  final String promoExpiryDate;
  @override
  @JsonKey()
  final bool? isSelected;
  @override
  @JsonKey()
  final Recommendations recommendations;

  @override
  String toString() {
    return 'CabBookingCoupon(promoId: $promoId, promoName: $promoName, promoDescription: $promoDescription, promoStatus: $promoStatus, promoStaticPromoCode: $promoStaticPromoCode, pcmPercentage: $pcmPercentage, promoTermsAndCondition: $promoTermsAndCondition, eligible: $eligible, pcmPromoImgUrl: $pcmPromoImgUrl, promoExpiryDate: $promoExpiryDate, isSelected: $isSelected, recommendations: $recommendations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CabBookingCoupon &&
            (identical(other.promoId, promoId) || other.promoId == promoId) &&
            (identical(other.promoName, promoName) ||
                other.promoName == promoName) &&
            (identical(other.promoDescription, promoDescription) ||
                other.promoDescription == promoDescription) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.promoStaticPromoCode, promoStaticPromoCode) ||
                other.promoStaticPromoCode == promoStaticPromoCode) &&
            (identical(other.pcmPercentage, pcmPercentage) ||
                other.pcmPercentage == pcmPercentage) &&
            (identical(other.promoTermsAndCondition, promoTermsAndCondition) ||
                other.promoTermsAndCondition == promoTermsAndCondition) &&
            (identical(other.eligible, eligible) ||
                other.eligible == eligible) &&
            (identical(other.pcmPromoImgUrl, pcmPromoImgUrl) ||
                other.pcmPromoImgUrl == pcmPromoImgUrl) &&
            (identical(other.promoExpiryDate, promoExpiryDate) ||
                other.promoExpiryDate == promoExpiryDate) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      promoId,
      promoName,
      promoDescription,
      promoStatus,
      promoStaticPromoCode,
      pcmPercentage,
      promoTermsAndCondition,
      eligible,
      pcmPromoImgUrl,
      promoExpiryDate,
      isSelected,
      recommendations);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CabBookingCouponCopyWith<_$_CabBookingCoupon> get copyWith =>
      __$$_CabBookingCouponCopyWithImpl<_$_CabBookingCoupon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabBookingCouponToJson(
      this,
    );
  }
}

abstract class _CabBookingCoupon implements CabBookingCoupon {
  const factory _CabBookingCoupon(
      {final int promoId,
      final String promoName,
      final String promoDescription,
      final String promoStatus,
      final String promoStaticPromoCode,
      final num pcmPercentage,
      final String promoTermsAndCondition,
      final bool? eligible,
      final String pcmPromoImgUrl,
      final String promoExpiryDate,
      final bool? isSelected,
      final Recommendations recommendations}) = _$_CabBookingCoupon;

  factory _CabBookingCoupon.fromJson(Map<String, dynamic> json) =
      _$_CabBookingCoupon.fromJson;

  @override
  int get promoId;
  @override
  String get promoName;
  @override
  String get promoDescription;
  @override
  String get promoStatus;
  @override
  String get promoStaticPromoCode;
  @override
  num get pcmPercentage;
  @override
  String get promoTermsAndCondition;
  @override
  bool? get eligible;
  @override
  String get pcmPromoImgUrl;
  @override
  String get promoExpiryDate;
  @override
  bool? get isSelected;
  @override
  Recommendations get recommendations;
  @override
  @JsonKey(ignore: true)
  _$$_CabBookingCouponCopyWith<_$_CabBookingCoupon> get copyWith =>
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
