// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_breakup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RefundBreakup _$RefundBreakupFromJson(Map<String, dynamic> json) {
  return _RefundBreakup.fromJson(json);
}

/// @nodoc
mixin _$RefundBreakup {
  double? get bank => throw _privateConstructorUsedError;
  double? get loyalty => throw _privateConstructorUsedError;
  double? get promo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefundBreakupCopyWith<RefundBreakup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundBreakupCopyWith<$Res> {
  factory $RefundBreakupCopyWith(
          RefundBreakup value, $Res Function(RefundBreakup) then) =
      _$RefundBreakupCopyWithImpl<$Res, RefundBreakup>;
  @useResult
  $Res call({double? bank, double? loyalty, double? promo});
}

/// @nodoc
class _$RefundBreakupCopyWithImpl<$Res, $Val extends RefundBreakup>
    implements $RefundBreakupCopyWith<$Res> {
  _$RefundBreakupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = freezed,
    Object? loyalty = freezed,
    Object? promo = freezed,
  }) {
    return _then(_value.copyWith(
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as double?,
      loyalty: freezed == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as double?,
      promo: freezed == promo
          ? _value.promo
          : promo // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RefundBreakupCopyWith<$Res>
    implements $RefundBreakupCopyWith<$Res> {
  factory _$$_RefundBreakupCopyWith(
          _$_RefundBreakup value, $Res Function(_$_RefundBreakup) then) =
      __$$_RefundBreakupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? bank, double? loyalty, double? promo});
}

/// @nodoc
class __$$_RefundBreakupCopyWithImpl<$Res>
    extends _$RefundBreakupCopyWithImpl<$Res, _$_RefundBreakup>
    implements _$$_RefundBreakupCopyWith<$Res> {
  __$$_RefundBreakupCopyWithImpl(
      _$_RefundBreakup _value, $Res Function(_$_RefundBreakup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = freezed,
    Object? loyalty = freezed,
    Object? promo = freezed,
  }) {
    return _then(_$_RefundBreakup(
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as double?,
      loyalty: freezed == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as double?,
      promo: freezed == promo
          ? _value.promo
          : promo // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefundBreakup implements _RefundBreakup {
  const _$_RefundBreakup({this.bank, this.loyalty, this.promo});

  factory _$_RefundBreakup.fromJson(Map<String, dynamic> json) =>
      _$$_RefundBreakupFromJson(json);

  @override
  final double? bank;
  @override
  final double? loyalty;
  @override
  final double? promo;

  @override
  String toString() {
    return 'RefundBreakup(bank: $bank, loyalty: $loyalty, promo: $promo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefundBreakup &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.loyalty, loyalty) || other.loyalty == loyalty) &&
            (identical(other.promo, promo) || other.promo == promo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bank, loyalty, promo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefundBreakupCopyWith<_$_RefundBreakup> get copyWith =>
      __$$_RefundBreakupCopyWithImpl<_$_RefundBreakup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefundBreakupToJson(
      this,
    );
  }
}

abstract class _RefundBreakup implements RefundBreakup {
  const factory _RefundBreakup(
      {final double? bank,
      final double? loyalty,
      final double? promo}) = _$_RefundBreakup;

  factory _RefundBreakup.fromJson(Map<String, dynamic> json) =
      _$_RefundBreakup.fromJson;

  @override
  double? get bank;
  @override
  double? get loyalty;
  @override
  double? get promo;
  @override
  @JsonKey(ignore: true)
  _$$_RefundBreakupCopyWith<_$_RefundBreakup> get copyWith =>
      throw _privateConstructorUsedError;
}
