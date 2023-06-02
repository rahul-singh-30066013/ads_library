// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_potential_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyPotentialRequestModel _$LoyaltyPotentialRequestModelFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyPotentialRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyPotentialRequestModel {
  String? get businessSubType => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  num? get nonLoyaltyPaymentAmount => throw _privateConstructorUsedError;
  num? get taxableAmount => throw _privateConstructorUsedError;
  num? get grossAmount => throw _privateConstructorUsedError;
  List<SaleItem>? get saleItems => throw _privateConstructorUsedError;
  AdditionalFilters? get additionalFilters =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyPotentialRequestModelCopyWith<LoyaltyPotentialRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyPotentialRequestModelCopyWith<$Res> {
  factory $LoyaltyPotentialRequestModelCopyWith(
          LoyaltyPotentialRequestModel value,
          $Res Function(LoyaltyPotentialRequestModel) then) =
      _$LoyaltyPotentialRequestModelCopyWithImpl<$Res,
          LoyaltyPotentialRequestModel>;
  @useResult
  $Res call(
      {String? businessSubType,
      String? promoCode,
      num? nonLoyaltyPaymentAmount,
      num? taxableAmount,
      num? grossAmount,
      List<SaleItem>? saleItems,
      AdditionalFilters? additionalFilters});

  $AdditionalFiltersCopyWith<$Res>? get additionalFilters;
}

/// @nodoc
class _$LoyaltyPotentialRequestModelCopyWithImpl<$Res,
        $Val extends LoyaltyPotentialRequestModel>
    implements $LoyaltyPotentialRequestModelCopyWith<$Res> {
  _$LoyaltyPotentialRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessSubType = freezed,
    Object? promoCode = freezed,
    Object? nonLoyaltyPaymentAmount = freezed,
    Object? taxableAmount = freezed,
    Object? grossAmount = freezed,
    Object? saleItems = freezed,
    Object? additionalFilters = freezed,
  }) {
    return _then(_value.copyWith(
      businessSubType: freezed == businessSubType
          ? _value.businessSubType
          : businessSubType // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nonLoyaltyPaymentAmount: freezed == nonLoyaltyPaymentAmount
          ? _value.nonLoyaltyPaymentAmount
          : nonLoyaltyPaymentAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      taxableAmount: freezed == taxableAmount
          ? _value.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      grossAmount: freezed == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      saleItems: freezed == saleItems
          ? _value.saleItems
          : saleItems // ignore: cast_nullable_to_non_nullable
              as List<SaleItem>?,
      additionalFilters: freezed == additionalFilters
          ? _value.additionalFilters
          : additionalFilters // ignore: cast_nullable_to_non_nullable
              as AdditionalFilters?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdditionalFiltersCopyWith<$Res>? get additionalFilters {
    if (_value.additionalFilters == null) {
      return null;
    }

    return $AdditionalFiltersCopyWith<$Res>(_value.additionalFilters!, (value) {
      return _then(_value.copyWith(additionalFilters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoyaltyPotentialRequestModelCopyWith<$Res>
    implements $LoyaltyPotentialRequestModelCopyWith<$Res> {
  factory _$$_LoyaltyPotentialRequestModelCopyWith(
          _$_LoyaltyPotentialRequestModel value,
          $Res Function(_$_LoyaltyPotentialRequestModel) then) =
      __$$_LoyaltyPotentialRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? businessSubType,
      String? promoCode,
      num? nonLoyaltyPaymentAmount,
      num? taxableAmount,
      num? grossAmount,
      List<SaleItem>? saleItems,
      AdditionalFilters? additionalFilters});

  @override
  $AdditionalFiltersCopyWith<$Res>? get additionalFilters;
}

/// @nodoc
class __$$_LoyaltyPotentialRequestModelCopyWithImpl<$Res>
    extends _$LoyaltyPotentialRequestModelCopyWithImpl<$Res,
        _$_LoyaltyPotentialRequestModel>
    implements _$$_LoyaltyPotentialRequestModelCopyWith<$Res> {
  __$$_LoyaltyPotentialRequestModelCopyWithImpl(
      _$_LoyaltyPotentialRequestModel _value,
      $Res Function(_$_LoyaltyPotentialRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessSubType = freezed,
    Object? promoCode = freezed,
    Object? nonLoyaltyPaymentAmount = freezed,
    Object? taxableAmount = freezed,
    Object? grossAmount = freezed,
    Object? saleItems = freezed,
    Object? additionalFilters = freezed,
  }) {
    return _then(_$_LoyaltyPotentialRequestModel(
      businessSubType: freezed == businessSubType
          ? _value.businessSubType
          : businessSubType // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nonLoyaltyPaymentAmount: freezed == nonLoyaltyPaymentAmount
          ? _value.nonLoyaltyPaymentAmount
          : nonLoyaltyPaymentAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      taxableAmount: freezed == taxableAmount
          ? _value.taxableAmount
          : taxableAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      grossAmount: freezed == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      saleItems: freezed == saleItems
          ? _value._saleItems
          : saleItems // ignore: cast_nullable_to_non_nullable
              as List<SaleItem>?,
      additionalFilters: freezed == additionalFilters
          ? _value.additionalFilters
          : additionalFilters // ignore: cast_nullable_to_non_nullable
              as AdditionalFilters?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyPotentialRequestModel implements _LoyaltyPotentialRequestModel {
  const _$_LoyaltyPotentialRequestModel(
      {this.businessSubType,
      this.promoCode,
      this.nonLoyaltyPaymentAmount,
      this.taxableAmount,
      this.grossAmount,
      final List<SaleItem>? saleItems,
      this.additionalFilters})
      : _saleItems = saleItems;

  factory _$_LoyaltyPotentialRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyPotentialRequestModelFromJson(json);

  @override
  final String? businessSubType;
  @override
  final String? promoCode;
  @override
  final num? nonLoyaltyPaymentAmount;
  @override
  final num? taxableAmount;
  @override
  final num? grossAmount;
  final List<SaleItem>? _saleItems;
  @override
  List<SaleItem>? get saleItems {
    final value = _saleItems;
    if (value == null) return null;
    if (_saleItems is EqualUnmodifiableListView) return _saleItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AdditionalFilters? additionalFilters;

  @override
  String toString() {
    return 'LoyaltyPotentialRequestModel(businessSubType: $businessSubType, promoCode: $promoCode, nonLoyaltyPaymentAmount: $nonLoyaltyPaymentAmount, taxableAmount: $taxableAmount, grossAmount: $grossAmount, saleItems: $saleItems, additionalFilters: $additionalFilters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyPotentialRequestModel &&
            (identical(other.businessSubType, businessSubType) ||
                other.businessSubType == businessSubType) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(
                    other.nonLoyaltyPaymentAmount, nonLoyaltyPaymentAmount) ||
                other.nonLoyaltyPaymentAmount == nonLoyaltyPaymentAmount) &&
            (identical(other.taxableAmount, taxableAmount) ||
                other.taxableAmount == taxableAmount) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            const DeepCollectionEquality()
                .equals(other._saleItems, _saleItems) &&
            (identical(other.additionalFilters, additionalFilters) ||
                other.additionalFilters == additionalFilters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessSubType,
      promoCode,
      nonLoyaltyPaymentAmount,
      taxableAmount,
      grossAmount,
      const DeepCollectionEquality().hash(_saleItems),
      additionalFilters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyPotentialRequestModelCopyWith<_$_LoyaltyPotentialRequestModel>
      get copyWith => __$$_LoyaltyPotentialRequestModelCopyWithImpl<
          _$_LoyaltyPotentialRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyPotentialRequestModelToJson(
      this,
    );
  }
}

abstract class _LoyaltyPotentialRequestModel
    implements LoyaltyPotentialRequestModel {
  const factory _LoyaltyPotentialRequestModel(
          {final String? businessSubType,
          final String? promoCode,
          final num? nonLoyaltyPaymentAmount,
          final num? taxableAmount,
          final num? grossAmount,
          final List<SaleItem>? saleItems,
          final AdditionalFilters? additionalFilters}) =
      _$_LoyaltyPotentialRequestModel;

  factory _LoyaltyPotentialRequestModel.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyPotentialRequestModel.fromJson;

  @override
  String? get businessSubType;
  @override
  String? get promoCode;
  @override
  num? get nonLoyaltyPaymentAmount;
  @override
  num? get taxableAmount;
  @override
  num? get grossAmount;
  @override
  List<SaleItem>? get saleItems;
  @override
  AdditionalFilters? get additionalFilters;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyPotentialRequestModelCopyWith<_$_LoyaltyPotentialRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

SaleItem _$SaleItemFromJson(Map<String, dynamic> json) {
  return _SaleItem.fromJson(json);
}

/// @nodoc
mixin _$SaleItem {
  String? get productCode => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  num? get unitPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleItemCopyWith<SaleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleItemCopyWith<$Res> {
  factory $SaleItemCopyWith(SaleItem value, $Res Function(SaleItem) then) =
      _$SaleItemCopyWithImpl<$Res, SaleItem>;
  @useResult
  $Res call({String? productCode, int? quantity, num? unitPrice});
}

/// @nodoc
class _$SaleItemCopyWithImpl<$Res, $Val extends SaleItem>
    implements $SaleItemCopyWith<$Res> {
  _$SaleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCode = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
  }) {
    return _then(_value.copyWith(
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaleItemCopyWith<$Res> implements $SaleItemCopyWith<$Res> {
  factory _$$_SaleItemCopyWith(
          _$_SaleItem value, $Res Function(_$_SaleItem) then) =
      __$$_SaleItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? productCode, int? quantity, num? unitPrice});
}

/// @nodoc
class __$$_SaleItemCopyWithImpl<$Res>
    extends _$SaleItemCopyWithImpl<$Res, _$_SaleItem>
    implements _$$_SaleItemCopyWith<$Res> {
  __$$_SaleItemCopyWithImpl(
      _$_SaleItem _value, $Res Function(_$_SaleItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productCode = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
  }) {
    return _then(_$_SaleItem(
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaleItem implements _SaleItem {
  const _$_SaleItem({this.productCode, this.quantity, this.unitPrice});

  factory _$_SaleItem.fromJson(Map<String, dynamic> json) =>
      _$$_SaleItemFromJson(json);

  @override
  final String? productCode;
  @override
  final int? quantity;
  @override
  final num? unitPrice;

  @override
  String toString() {
    return 'SaleItem(productCode: $productCode, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaleItem &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productCode, quantity, unitPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaleItemCopyWith<_$_SaleItem> get copyWith =>
      __$$_SaleItemCopyWithImpl<_$_SaleItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaleItemToJson(
      this,
    );
  }
}

abstract class _SaleItem implements SaleItem {
  const factory _SaleItem(
      {final String? productCode,
      final int? quantity,
      final num? unitPrice}) = _$_SaleItem;

  factory _SaleItem.fromJson(Map<String, dynamic> json) = _$_SaleItem.fromJson;

  @override
  String? get productCode;
  @override
  int? get quantity;
  @override
  num? get unitPrice;
  @override
  @JsonKey(ignore: true)
  _$$_SaleItemCopyWith<_$_SaleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

AdditionalFilters _$AdditionalFiltersFromJson(Map<String, dynamic> json) {
  return _AdditionalFilters.fromJson(json);
}

/// @nodoc
mixin _$AdditionalFilters {
  bool? get isInternational => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdditionalFiltersCopyWith<AdditionalFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalFiltersCopyWith<$Res> {
  factory $AdditionalFiltersCopyWith(
          AdditionalFilters value, $Res Function(AdditionalFilters) then) =
      _$AdditionalFiltersCopyWithImpl<$Res, AdditionalFilters>;
  @useResult
  $Res call({bool? isInternational});
}

/// @nodoc
class _$AdditionalFiltersCopyWithImpl<$Res, $Val extends AdditionalFilters>
    implements $AdditionalFiltersCopyWith<$Res> {
  _$AdditionalFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInternational = freezed,
  }) {
    return _then(_value.copyWith(
      isInternational: freezed == isInternational
          ? _value.isInternational
          : isInternational // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdditionalFiltersCopyWith<$Res>
    implements $AdditionalFiltersCopyWith<$Res> {
  factory _$$_AdditionalFiltersCopyWith(_$_AdditionalFilters value,
          $Res Function(_$_AdditionalFilters) then) =
      __$$_AdditionalFiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isInternational});
}

/// @nodoc
class __$$_AdditionalFiltersCopyWithImpl<$Res>
    extends _$AdditionalFiltersCopyWithImpl<$Res, _$_AdditionalFilters>
    implements _$$_AdditionalFiltersCopyWith<$Res> {
  __$$_AdditionalFiltersCopyWithImpl(
      _$_AdditionalFilters _value, $Res Function(_$_AdditionalFilters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInternational = freezed,
  }) {
    return _then(_$_AdditionalFilters(
      isInternational: freezed == isInternational
          ? _value.isInternational
          : isInternational // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdditionalFilters implements _AdditionalFilters {
  const _$_AdditionalFilters({this.isInternational});

  factory _$_AdditionalFilters.fromJson(Map<String, dynamic> json) =>
      _$$_AdditionalFiltersFromJson(json);

  @override
  final bool? isInternational;

  @override
  String toString() {
    return 'AdditionalFilters(isInternational: $isInternational)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdditionalFilters &&
            (identical(other.isInternational, isInternational) ||
                other.isInternational == isInternational));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isInternational);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdditionalFiltersCopyWith<_$_AdditionalFilters> get copyWith =>
      __$$_AdditionalFiltersCopyWithImpl<_$_AdditionalFilters>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdditionalFiltersToJson(
      this,
    );
  }
}

abstract class _AdditionalFilters implements AdditionalFilters {
  const factory _AdditionalFilters({final bool? isInternational}) =
      _$_AdditionalFilters;

  factory _AdditionalFilters.fromJson(Map<String, dynamic> json) =
      _$_AdditionalFilters.fromJson;

  @override
  bool? get isInternational;
  @override
  @JsonKey(ignore: true)
  _$$_AdditionalFiltersCopyWith<_$_AdditionalFilters> get copyWith =>
      throw _privateConstructorUsedError;
}
