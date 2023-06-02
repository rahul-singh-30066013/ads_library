// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyPoint _$LoyaltyPointFromJson(Map<String, dynamic> json) {
  return _LoyaltyPoint.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyPoint {
  num get pendingRewardPoints => throw _privateConstructorUsedError;
  num get earnedRewardPoints => throw _privateConstructorUsedError;
  num get burnedRewardPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyPointCopyWith<LoyaltyPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyPointCopyWith<$Res> {
  factory $LoyaltyPointCopyWith(
          LoyaltyPoint value, $Res Function(LoyaltyPoint) then) =
      _$LoyaltyPointCopyWithImpl<$Res, LoyaltyPoint>;
  @useResult
  $Res call(
      {num pendingRewardPoints,
      num earnedRewardPoints,
      num burnedRewardPoints});
}

/// @nodoc
class _$LoyaltyPointCopyWithImpl<$Res, $Val extends LoyaltyPoint>
    implements $LoyaltyPointCopyWith<$Res> {
  _$LoyaltyPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingRewardPoints = null,
    Object? earnedRewardPoints = null,
    Object? burnedRewardPoints = null,
  }) {
    return _then(_value.copyWith(
      pendingRewardPoints: null == pendingRewardPoints
          ? _value.pendingRewardPoints
          : pendingRewardPoints // ignore: cast_nullable_to_non_nullable
              as num,
      earnedRewardPoints: null == earnedRewardPoints
          ? _value.earnedRewardPoints
          : earnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as num,
      burnedRewardPoints: null == burnedRewardPoints
          ? _value.burnedRewardPoints
          : burnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyPointCopyWith<$Res>
    implements $LoyaltyPointCopyWith<$Res> {
  factory _$$_LoyaltyPointCopyWith(
          _$_LoyaltyPoint value, $Res Function(_$_LoyaltyPoint) then) =
      __$$_LoyaltyPointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num pendingRewardPoints,
      num earnedRewardPoints,
      num burnedRewardPoints});
}

/// @nodoc
class __$$_LoyaltyPointCopyWithImpl<$Res>
    extends _$LoyaltyPointCopyWithImpl<$Res, _$_LoyaltyPoint>
    implements _$$_LoyaltyPointCopyWith<$Res> {
  __$$_LoyaltyPointCopyWithImpl(
      _$_LoyaltyPoint _value, $Res Function(_$_LoyaltyPoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingRewardPoints = null,
    Object? earnedRewardPoints = null,
    Object? burnedRewardPoints = null,
  }) {
    return _then(_$_LoyaltyPoint(
      pendingRewardPoints: null == pendingRewardPoints
          ? _value.pendingRewardPoints
          : pendingRewardPoints // ignore: cast_nullable_to_non_nullable
              as num,
      earnedRewardPoints: null == earnedRewardPoints
          ? _value.earnedRewardPoints
          : earnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as num,
      burnedRewardPoints: null == burnedRewardPoints
          ? _value.burnedRewardPoints
          : burnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyPoint implements _LoyaltyPoint {
  const _$_LoyaltyPoint(
      {this.pendingRewardPoints = 0,
      this.earnedRewardPoints = 0,
      this.burnedRewardPoints = 0});

  factory _$_LoyaltyPoint.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyPointFromJson(json);

  @override
  @JsonKey()
  final num pendingRewardPoints;
  @override
  @JsonKey()
  final num earnedRewardPoints;
  @override
  @JsonKey()
  final num burnedRewardPoints;

  @override
  String toString() {
    return 'LoyaltyPoint(pendingRewardPoints: $pendingRewardPoints, earnedRewardPoints: $earnedRewardPoints, burnedRewardPoints: $burnedRewardPoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyPoint &&
            (identical(other.pendingRewardPoints, pendingRewardPoints) ||
                other.pendingRewardPoints == pendingRewardPoints) &&
            (identical(other.earnedRewardPoints, earnedRewardPoints) ||
                other.earnedRewardPoints == earnedRewardPoints) &&
            (identical(other.burnedRewardPoints, burnedRewardPoints) ||
                other.burnedRewardPoints == burnedRewardPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pendingRewardPoints, earnedRewardPoints, burnedRewardPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyPointCopyWith<_$_LoyaltyPoint> get copyWith =>
      __$$_LoyaltyPointCopyWithImpl<_$_LoyaltyPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyPointToJson(
      this,
    );
  }
}

abstract class _LoyaltyPoint implements LoyaltyPoint {
  const factory _LoyaltyPoint(
      {final num pendingRewardPoints,
      final num earnedRewardPoints,
      final num burnedRewardPoints}) = _$_LoyaltyPoint;

  factory _LoyaltyPoint.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyPoint.fromJson;

  @override
  num get pendingRewardPoints;
  @override
  num get earnedRewardPoints;
  @override
  num get burnedRewardPoints;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyPointCopyWith<_$_LoyaltyPoint> get copyWith =>
      throw _privateConstructorUsedError;
}
