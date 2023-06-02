// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pre_order_discount_breakup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PreOrderDiscountBreakup _$PreOrderDiscountBreakupFromJson(
    Map<String, dynamic> json) {
  return _PreOrderDiscountBreakup.fromJson(json);
}

/// @nodoc
mixin _$PreOrderDiscountBreakup {
  String get material => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreOrderDiscountBreakupCopyWith<PreOrderDiscountBreakup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreOrderDiscountBreakupCopyWith<$Res> {
  factory $PreOrderDiscountBreakupCopyWith(PreOrderDiscountBreakup value,
          $Res Function(PreOrderDiscountBreakup) then) =
      _$PreOrderDiscountBreakupCopyWithImpl<$Res, PreOrderDiscountBreakup>;
  @useResult
  $Res call({String material, double amount});
}

/// @nodoc
class _$PreOrderDiscountBreakupCopyWithImpl<$Res,
        $Val extends PreOrderDiscountBreakup>
    implements $PreOrderDiscountBreakupCopyWith<$Res> {
  _$PreOrderDiscountBreakupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PreOrderDiscountBreakupCopyWith<$Res>
    implements $PreOrderDiscountBreakupCopyWith<$Res> {
  factory _$$_PreOrderDiscountBreakupCopyWith(_$_PreOrderDiscountBreakup value,
          $Res Function(_$_PreOrderDiscountBreakup) then) =
      __$$_PreOrderDiscountBreakupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String material, double amount});
}

/// @nodoc
class __$$_PreOrderDiscountBreakupCopyWithImpl<$Res>
    extends _$PreOrderDiscountBreakupCopyWithImpl<$Res,
        _$_PreOrderDiscountBreakup>
    implements _$$_PreOrderDiscountBreakupCopyWith<$Res> {
  __$$_PreOrderDiscountBreakupCopyWithImpl(_$_PreOrderDiscountBreakup _value,
      $Res Function(_$_PreOrderDiscountBreakup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
    Object? amount = null,
  }) {
    return _then(_$_PreOrderDiscountBreakup(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PreOrderDiscountBreakup implements _PreOrderDiscountBreakup {
  const _$_PreOrderDiscountBreakup({this.material = '', this.amount = 0});

  factory _$_PreOrderDiscountBreakup.fromJson(Map<String, dynamic> json) =>
      _$$_PreOrderDiscountBreakupFromJson(json);

  @override
  @JsonKey()
  final String material;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'PreOrderDiscountBreakup(material: $material, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreOrderDiscountBreakup &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, material, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreOrderDiscountBreakupCopyWith<_$_PreOrderDiscountBreakup>
      get copyWith =>
          __$$_PreOrderDiscountBreakupCopyWithImpl<_$_PreOrderDiscountBreakup>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreOrderDiscountBreakupToJson(
      this,
    );
  }
}

abstract class _PreOrderDiscountBreakup implements PreOrderDiscountBreakup {
  const factory _PreOrderDiscountBreakup(
      {final String material,
      final double amount}) = _$_PreOrderDiscountBreakup;

  factory _PreOrderDiscountBreakup.fromJson(Map<String, dynamic> json) =
      _$_PreOrderDiscountBreakup.fromJson;

  @override
  String get material;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_PreOrderDiscountBreakupCopyWith<_$_PreOrderDiscountBreakup>
      get copyWith => throw _privateConstructorUsedError;
}
