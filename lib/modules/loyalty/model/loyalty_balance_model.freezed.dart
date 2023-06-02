// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyBalanceModel _$LoyaltyBalanceModelFromJson(Map<String, dynamic> json) {
  return _LoyaltyBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyBalanceModel {
  int get availableBalancePoints => throw _privateConstructorUsedError;
  int get totalPendingPoints => throw _privateConstructorUsedError;
  int get lifetimeEarnedPoints => throw _privateConstructorUsedError;
  int get lifetimeBurnedPoints => throw _privateConstructorUsedError;
  num get lifetimeGtv => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyBalanceModelCopyWith<LoyaltyBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyBalanceModelCopyWith<$Res> {
  factory $LoyaltyBalanceModelCopyWith(
          LoyaltyBalanceModel value, $Res Function(LoyaltyBalanceModel) then) =
      _$LoyaltyBalanceModelCopyWithImpl<$Res, LoyaltyBalanceModel>;
  @useResult
  $Res call(
      {int availableBalancePoints,
      int totalPendingPoints,
      int lifetimeEarnedPoints,
      int lifetimeBurnedPoints,
      num lifetimeGtv});
}

/// @nodoc
class _$LoyaltyBalanceModelCopyWithImpl<$Res, $Val extends LoyaltyBalanceModel>
    implements $LoyaltyBalanceModelCopyWith<$Res> {
  _$LoyaltyBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalancePoints = null,
    Object? totalPendingPoints = null,
    Object? lifetimeEarnedPoints = null,
    Object? lifetimeBurnedPoints = null,
    Object? lifetimeGtv = null,
  }) {
    return _then(_value.copyWith(
      availableBalancePoints: null == availableBalancePoints
          ? _value.availableBalancePoints
          : availableBalancePoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPendingPoints: null == totalPendingPoints
          ? _value.totalPendingPoints
          : totalPendingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimeEarnedPoints: null == lifetimeEarnedPoints
          ? _value.lifetimeEarnedPoints
          : lifetimeEarnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimeBurnedPoints: null == lifetimeBurnedPoints
          ? _value.lifetimeBurnedPoints
          : lifetimeBurnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimeGtv: null == lifetimeGtv
          ? _value.lifetimeGtv
          : lifetimeGtv // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyBalanceModelCopyWith<$Res>
    implements $LoyaltyBalanceModelCopyWith<$Res> {
  factory _$$_LoyaltyBalanceModelCopyWith(_$_LoyaltyBalanceModel value,
          $Res Function(_$_LoyaltyBalanceModel) then) =
      __$$_LoyaltyBalanceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int availableBalancePoints,
      int totalPendingPoints,
      int lifetimeEarnedPoints,
      int lifetimeBurnedPoints,
      num lifetimeGtv});
}

/// @nodoc
class __$$_LoyaltyBalanceModelCopyWithImpl<$Res>
    extends _$LoyaltyBalanceModelCopyWithImpl<$Res, _$_LoyaltyBalanceModel>
    implements _$$_LoyaltyBalanceModelCopyWith<$Res> {
  __$$_LoyaltyBalanceModelCopyWithImpl(_$_LoyaltyBalanceModel _value,
      $Res Function(_$_LoyaltyBalanceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalancePoints = null,
    Object? totalPendingPoints = null,
    Object? lifetimeEarnedPoints = null,
    Object? lifetimeBurnedPoints = null,
    Object? lifetimeGtv = null,
  }) {
    return _then(_$_LoyaltyBalanceModel(
      availableBalancePoints: null == availableBalancePoints
          ? _value.availableBalancePoints
          : availableBalancePoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPendingPoints: null == totalPendingPoints
          ? _value.totalPendingPoints
          : totalPendingPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimeEarnedPoints: null == lifetimeEarnedPoints
          ? _value.lifetimeEarnedPoints
          : lifetimeEarnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimeBurnedPoints: null == lifetimeBurnedPoints
          ? _value.lifetimeBurnedPoints
          : lifetimeBurnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lifetimeGtv: null == lifetimeGtv
          ? _value.lifetimeGtv
          : lifetimeGtv // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyBalanceModel implements _LoyaltyBalanceModel {
  const _$_LoyaltyBalanceModel(
      {this.availableBalancePoints = 0,
      this.totalPendingPoints = 0,
      this.lifetimeEarnedPoints = 0,
      this.lifetimeBurnedPoints = 0,
      this.lifetimeGtv = 0});

  factory _$_LoyaltyBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyBalanceModelFromJson(json);

  @override
  @JsonKey()
  final int availableBalancePoints;
  @override
  @JsonKey()
  final int totalPendingPoints;
  @override
  @JsonKey()
  final int lifetimeEarnedPoints;
  @override
  @JsonKey()
  final int lifetimeBurnedPoints;
  @override
  @JsonKey()
  final num lifetimeGtv;

  @override
  String toString() {
    return 'LoyaltyBalanceModel(availableBalancePoints: $availableBalancePoints, totalPendingPoints: $totalPendingPoints, lifetimeEarnedPoints: $lifetimeEarnedPoints, lifetimeBurnedPoints: $lifetimeBurnedPoints, lifetimeGtv: $lifetimeGtv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyBalanceModel &&
            (identical(other.availableBalancePoints, availableBalancePoints) ||
                other.availableBalancePoints == availableBalancePoints) &&
            (identical(other.totalPendingPoints, totalPendingPoints) ||
                other.totalPendingPoints == totalPendingPoints) &&
            (identical(other.lifetimeEarnedPoints, lifetimeEarnedPoints) ||
                other.lifetimeEarnedPoints == lifetimeEarnedPoints) &&
            (identical(other.lifetimeBurnedPoints, lifetimeBurnedPoints) ||
                other.lifetimeBurnedPoints == lifetimeBurnedPoints) &&
            (identical(other.lifetimeGtv, lifetimeGtv) ||
                other.lifetimeGtv == lifetimeGtv));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      availableBalancePoints,
      totalPendingPoints,
      lifetimeEarnedPoints,
      lifetimeBurnedPoints,
      lifetimeGtv);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyBalanceModelCopyWith<_$_LoyaltyBalanceModel> get copyWith =>
      __$$_LoyaltyBalanceModelCopyWithImpl<_$_LoyaltyBalanceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyBalanceModelToJson(
      this,
    );
  }
}

abstract class _LoyaltyBalanceModel implements LoyaltyBalanceModel {
  const factory _LoyaltyBalanceModel(
      {final int availableBalancePoints,
      final int totalPendingPoints,
      final int lifetimeEarnedPoints,
      final int lifetimeBurnedPoints,
      final num lifetimeGtv}) = _$_LoyaltyBalanceModel;

  factory _LoyaltyBalanceModel.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyBalanceModel.fromJson;

  @override
  int get availableBalancePoints;
  @override
  int get totalPendingPoints;
  @override
  int get lifetimeEarnedPoints;
  @override
  int get lifetimeBurnedPoints;
  @override
  num get lifetimeGtv;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyBalanceModelCopyWith<_$_LoyaltyBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
