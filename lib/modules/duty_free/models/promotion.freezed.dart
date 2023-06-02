// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return _Promotions.fromJson(json);
}

/// @nodoc
mixin _$Promotion {
  int get promotionType => throw _privateConstructorUsedError;
  int get promotionQty => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String get offer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionCopyWith<Promotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionCopyWith<$Res> {
  factory $PromotionCopyWith(Promotion value, $Res Function(Promotion) then) =
      _$PromotionCopyWithImpl<$Res, Promotion>;
  @useResult
  $Res call({int promotionType, int promotionQty, int type, String offer});
}

/// @nodoc
class _$PromotionCopyWithImpl<$Res, $Val extends Promotion>
    implements $PromotionCopyWith<$Res> {
  _$PromotionCopyWithImpl(this._value, this._then);

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
    Object? offer = null,
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
      offer: null == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromotionsCopyWith<$Res>
    implements $PromotionCopyWith<$Res> {
  factory _$$_PromotionsCopyWith(
          _$_Promotions value, $Res Function(_$_Promotions) then) =
      __$$_PromotionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int promotionType, int promotionQty, int type, String offer});
}

/// @nodoc
class __$$_PromotionsCopyWithImpl<$Res>
    extends _$PromotionCopyWithImpl<$Res, _$_Promotions>
    implements _$$_PromotionsCopyWith<$Res> {
  __$$_PromotionsCopyWithImpl(
      _$_Promotions _value, $Res Function(_$_Promotions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionType = null,
    Object? promotionQty = null,
    Object? type = null,
    Object? offer = null,
  }) {
    return _then(_$_Promotions(
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
      offer: null == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Promotions implements _Promotions {
  const _$_Promotions(
      {this.promotionType = 0,
      this.promotionQty = 0,
      this.type = 0,
      this.offer = ''});

  factory _$_Promotions.fromJson(Map<String, dynamic> json) =>
      _$$_PromotionsFromJson(json);

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
  @JsonKey()
  final String offer;

  @override
  String toString() {
    return 'Promotion(promotionType: $promotionType, promotionQty: $promotionQty, type: $type, offer: $offer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Promotions &&
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
  _$$_PromotionsCopyWith<_$_Promotions> get copyWith =>
      __$$_PromotionsCopyWithImpl<_$_Promotions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromotionsToJson(
      this,
    );
  }
}

abstract class _Promotions implements Promotion {
  const factory _Promotions(
      {final int promotionType,
      final int promotionQty,
      final int type,
      final String offer}) = _$_Promotions;

  factory _Promotions.fromJson(Map<String, dynamic> json) =
      _$_Promotions.fromJson;

  @override
  int get promotionType;
  @override
  int get promotionQty;
  @override
  int get type;
  @override
  String get offer;
  @override
  @JsonKey(ignore: true)
  _$$_PromotionsCopyWith<_$_Promotions> get copyWith =>
      throw _privateConstructorUsedError;
}
