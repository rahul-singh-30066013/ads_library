// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartPromotion _$CartPromotionFromJson(Map<String, dynamic> json) {
  return _CartPromotion.fromJson(json);
}

/// @nodoc
mixin _$CartPromotion {
  int get promotionType => throw _privateConstructorUsedError;
  int get promotionQty => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  num? get offer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartPromotionCopyWith<CartPromotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartPromotionCopyWith<$Res> {
  factory $CartPromotionCopyWith(
          CartPromotion value, $Res Function(CartPromotion) then) =
      _$CartPromotionCopyWithImpl<$Res, CartPromotion>;
  @useResult
  $Res call({int promotionType, int promotionQty, int type, num? offer});
}

/// @nodoc
class _$CartPromotionCopyWithImpl<$Res, $Val extends CartPromotion>
    implements $CartPromotionCopyWith<$Res> {
  _$CartPromotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionType = null,
    Object? promotionQty = null,
    Object? type = null,
    Object? offer = freezed,
  }) {
    return _then(_value.copyWith(
      promotionType: null == promotionType
          ? _value.promotionType
          : promotionType // ignore: cast_nullable_to_non_nullable
              as int,
      promotionQty: null == promotionQty
          ? _value.promotionQty
          : promotionQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartPromotionCopyWith<$Res>
    implements $CartPromotionCopyWith<$Res> {
  factory _$$_CartPromotionCopyWith(
          _$_CartPromotion value, $Res Function(_$_CartPromotion) then) =
      __$$_CartPromotionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int promotionType, int promotionQty, int type, num? offer});
}

/// @nodoc
class __$$_CartPromotionCopyWithImpl<$Res>
    extends _$CartPromotionCopyWithImpl<$Res, _$_CartPromotion>
    implements _$$_CartPromotionCopyWith<$Res> {
  __$$_CartPromotionCopyWithImpl(
      _$_CartPromotion _value, $Res Function(_$_CartPromotion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionType = null,
    Object? promotionQty = null,
    Object? type = null,
    Object? offer = freezed,
  }) {
    return _then(_$_CartPromotion(
      promotionType: null == promotionType
          ? _value.promotionType
          : promotionType // ignore: cast_nullable_to_non_nullable
              as int,
      promotionQty: null == promotionQty
          ? _value.promotionQty
          : promotionQty // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartPromotion implements _CartPromotion {
  const _$_CartPromotion(
      {this.promotionType = 0,
      this.promotionQty = 0,
      this.type = 0,
      this.offer});

  factory _$_CartPromotion.fromJson(Map<String, dynamic> json) =>
      _$$_CartPromotionFromJson(json);

  @override
  @JsonKey()
  final int promotionType;
  @override
  @JsonKey()
  final int promotionQty;
  @override
  @JsonKey()
  final int type;
  @override
  final num? offer;

  @override
  String toString() {
    return 'CartPromotion(promotionType: $promotionType, promotionQty: $promotionQty, type: $type, offer: $offer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartPromotion &&
            (identical(other.promotionType, promotionType) ||
                other.promotionType == promotionType) &&
            (identical(other.promotionQty, promotionQty) ||
                other.promotionQty == promotionQty) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.offer, offer) || other.offer == offer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promotionType, promotionQty, type, offer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartPromotionCopyWith<_$_CartPromotion> get copyWith =>
      __$$_CartPromotionCopyWithImpl<_$_CartPromotion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartPromotionToJson(
      this,
    );
  }
}

abstract class _CartPromotion implements CartPromotion {
  const factory _CartPromotion(
      {final int promotionType,
      final int promotionQty,
      final int type,
      final num? offer}) = _$_CartPromotion;

  factory _CartPromotion.fromJson(Map<String, dynamic> json) =
      _$_CartPromotion.fromJson;

  @override
  int get promotionType;
  @override
  int get promotionQty;
  @override
  int get type;
  @override
  num? get offer;
  @override
  @JsonKey(ignore: true)
  _$$_CartPromotionCopyWith<_$_CartPromotion> get copyWith =>
      throw _privateConstructorUsedError;
}