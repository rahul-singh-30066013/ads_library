// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_coupon_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeCouponResponse _$DutyFreeCouponResponseFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeCouponResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeCouponResponse {
  List<CouponDataItem> get coupons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeCouponResponseCopyWith<DutyFreeCouponResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeCouponResponseCopyWith<$Res> {
  factory $DutyFreeCouponResponseCopyWith(DutyFreeCouponResponse value,
          $Res Function(DutyFreeCouponResponse) then) =
      _$DutyFreeCouponResponseCopyWithImpl<$Res, DutyFreeCouponResponse>;
  @useResult
  $Res call({List<CouponDataItem> coupons});
}

/// @nodoc
class _$DutyFreeCouponResponseCopyWithImpl<$Res,
        $Val extends DutyFreeCouponResponse>
    implements $DutyFreeCouponResponseCopyWith<$Res> {
  _$DutyFreeCouponResponseCopyWithImpl(this._value, this._then);

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
              as List<CouponDataItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeCouponResponseCopyWith<$Res>
    implements $DutyFreeCouponResponseCopyWith<$Res> {
  factory _$$_DutyFreeCouponResponseCopyWith(_$_DutyFreeCouponResponse value,
          $Res Function(_$_DutyFreeCouponResponse) then) =
      __$$_DutyFreeCouponResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CouponDataItem> coupons});
}

/// @nodoc
class __$$_DutyFreeCouponResponseCopyWithImpl<$Res>
    extends _$DutyFreeCouponResponseCopyWithImpl<$Res,
        _$_DutyFreeCouponResponse>
    implements _$$_DutyFreeCouponResponseCopyWith<$Res> {
  __$$_DutyFreeCouponResponseCopyWithImpl(_$_DutyFreeCouponResponse _value,
      $Res Function(_$_DutyFreeCouponResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupons = null,
  }) {
    return _then(_$_DutyFreeCouponResponse(
      null == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as List<CouponDataItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeCouponResponse implements _DutyFreeCouponResponse {
  const _$_DutyFreeCouponResponse(this.coupons);

  factory _$_DutyFreeCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeCouponResponseFromJson(json);

  @override
  final List<CouponDataItem> coupons;

  @override
  String toString() {
    return 'DutyFreeCouponResponse(coupons: $coupons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeCouponResponse &&
            const DeepCollectionEquality().equals(other.coupons, coupons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(coupons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeCouponResponseCopyWith<_$_DutyFreeCouponResponse> get copyWith =>
      __$$_DutyFreeCouponResponseCopyWithImpl<_$_DutyFreeCouponResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeCouponResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreeCouponResponse implements DutyFreeCouponResponse {
  const factory _DutyFreeCouponResponse(final List<CouponDataItem> coupons) =
      _$_DutyFreeCouponResponse;

  factory _DutyFreeCouponResponse.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeCouponResponse.fromJson;

  @override
  List<CouponDataItem> get coupons;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeCouponResponseCopyWith<_$_DutyFreeCouponResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

CouponDataItem _$CouponDataItemFromJson(Map<String, dynamic> json) {
  return _CouponDataItem.fromJson(json);
}

/// @nodoc
mixin _$CouponDataItem {
  int get promoId => throw _privateConstructorUsedError;
  String get promoName => throw _privateConstructorUsedError;
  String get promoDescription => throw _privateConstructorUsedError;
  String get promoStatus => throw _privateConstructorUsedError;
  String get promoStaticPromoCode => throw _privateConstructorUsedError;
  int get pcmPercentage => throw _privateConstructorUsedError;
  String get promoTermsAndCondition => throw _privateConstructorUsedError;
  bool? get eligible => throw _privateConstructorUsedError;
  String get pcmPromoImgUrl => throw _privateConstructorUsedError;
  String get promoExpiryDate => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  Recommendations get recommendations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponDataItemCopyWith<CouponDataItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponDataItemCopyWith<$Res> {
  factory $CouponDataItemCopyWith(
          CouponDataItem value, $Res Function(CouponDataItem) then) =
      _$CouponDataItemCopyWithImpl<$Res, CouponDataItem>;
  @useResult
  $Res call(
      {int promoId,
      String promoName,
      String promoDescription,
      String promoStatus,
      String promoStaticPromoCode,
      int pcmPercentage,
      String promoTermsAndCondition,
      bool? eligible,
      String pcmPromoImgUrl,
      String promoExpiryDate,
      bool? isSelected,
      Recommendations recommendations});

  $RecommendationsCopyWith<$Res> get recommendations;
}

/// @nodoc
class _$CouponDataItemCopyWithImpl<$Res, $Val extends CouponDataItem>
    implements $CouponDataItemCopyWith<$Res> {
  _$CouponDataItemCopyWithImpl(this._value, this._then);

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
              as int,
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
abstract class _$$_CouponDataItemCopyWith<$Res>
    implements $CouponDataItemCopyWith<$Res> {
  factory _$$_CouponDataItemCopyWith(
          _$_CouponDataItem value, $Res Function(_$_CouponDataItem) then) =
      __$$_CouponDataItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int promoId,
      String promoName,
      String promoDescription,
      String promoStatus,
      String promoStaticPromoCode,
      int pcmPercentage,
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
class __$$_CouponDataItemCopyWithImpl<$Res>
    extends _$CouponDataItemCopyWithImpl<$Res, _$_CouponDataItem>
    implements _$$_CouponDataItemCopyWith<$Res> {
  __$$_CouponDataItemCopyWithImpl(
      _$_CouponDataItem _value, $Res Function(_$_CouponDataItem) _then)
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
    return _then(_$_CouponDataItem(
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
              as int,
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
class _$_CouponDataItem implements _CouponDataItem {
  const _$_CouponDataItem(
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

  factory _$_CouponDataItem.fromJson(Map<String, dynamic> json) =>
      _$$_CouponDataItemFromJson(json);

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
  final int pcmPercentage;
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
    return 'CouponDataItem(promoId: $promoId, promoName: $promoName, promoDescription: $promoDescription, promoStatus: $promoStatus, promoStaticPromoCode: $promoStaticPromoCode, pcmPercentage: $pcmPercentage, promoTermsAndCondition: $promoTermsAndCondition, eligible: $eligible, pcmPromoImgUrl: $pcmPromoImgUrl, promoExpiryDate: $promoExpiryDate, isSelected: $isSelected, recommendations: $recommendations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponDataItem &&
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
  _$$_CouponDataItemCopyWith<_$_CouponDataItem> get copyWith =>
      __$$_CouponDataItemCopyWithImpl<_$_CouponDataItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponDataItemToJson(
      this,
    );
  }
}

abstract class _CouponDataItem implements CouponDataItem {
  const factory _CouponDataItem(
      {final int promoId,
      final String promoName,
      final String promoDescription,
      final String promoStatus,
      final String promoStaticPromoCode,
      final int pcmPercentage,
      final String promoTermsAndCondition,
      final bool? eligible,
      final String pcmPromoImgUrl,
      final String promoExpiryDate,
      final bool? isSelected,
      final Recommendations recommendations}) = _$_CouponDataItem;

  factory _CouponDataItem.fromJson(Map<String, dynamic> json) =
      _$_CouponDataItem.fromJson;

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
  int get pcmPercentage;
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
  _$$_CouponDataItemCopyWith<_$_CouponDataItem> get copyWith =>
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
