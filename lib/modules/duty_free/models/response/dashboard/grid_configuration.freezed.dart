// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GridConfiguration _$GridConfigurationFromJson(Map<String, dynamic> json) {
  return _GridConfiguration.fromJson(json);
}

/// @nodoc
mixin _$GridConfiguration {
  double get crossAxisSpacing => throw _privateConstructorUsedError;
  double get mainAxisSpacing => throw _privateConstructorUsedError;
  double get itemVisibility => throw _privateConstructorUsedError;
  bool get horizontalGrid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GridConfigurationCopyWith<GridConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridConfigurationCopyWith<$Res> {
  factory $GridConfigurationCopyWith(
          GridConfiguration value, $Res Function(GridConfiguration) then) =
      _$GridConfigurationCopyWithImpl<$Res, GridConfiguration>;
  @useResult
  $Res call(
      {double crossAxisSpacing,
      double mainAxisSpacing,
      double itemVisibility,
      bool horizontalGrid});
}

/// @nodoc
class _$GridConfigurationCopyWithImpl<$Res, $Val extends GridConfiguration>
    implements $GridConfigurationCopyWith<$Res> {
  _$GridConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crossAxisSpacing = null,
    Object? mainAxisSpacing = null,
    Object? itemVisibility = null,
    Object? horizontalGrid = null,
  }) {
    return _then(_value.copyWith(
      crossAxisSpacing: null == crossAxisSpacing
          ? _value.crossAxisSpacing
          : crossAxisSpacing // ignore: cast_nullable_to_non_nullable
              as double,
      mainAxisSpacing: null == mainAxisSpacing
          ? _value.mainAxisSpacing
          : mainAxisSpacing // ignore: cast_nullable_to_non_nullable
              as double,
      itemVisibility: null == itemVisibility
          ? _value.itemVisibility
          : itemVisibility // ignore: cast_nullable_to_non_nullable
              as double,
      horizontalGrid: null == horizontalGrid
          ? _value.horizontalGrid
          : horizontalGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GridConfigurationCopyWith<$Res>
    implements $GridConfigurationCopyWith<$Res> {
  factory _$$_GridConfigurationCopyWith(_$_GridConfiguration value,
          $Res Function(_$_GridConfiguration) then) =
      __$$_GridConfigurationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double crossAxisSpacing,
      double mainAxisSpacing,
      double itemVisibility,
      bool horizontalGrid});
}

/// @nodoc
class __$$_GridConfigurationCopyWithImpl<$Res>
    extends _$GridConfigurationCopyWithImpl<$Res, _$_GridConfiguration>
    implements _$$_GridConfigurationCopyWith<$Res> {
  __$$_GridConfigurationCopyWithImpl(
      _$_GridConfiguration _value, $Res Function(_$_GridConfiguration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crossAxisSpacing = null,
    Object? mainAxisSpacing = null,
    Object? itemVisibility = null,
    Object? horizontalGrid = null,
  }) {
    return _then(_$_GridConfiguration(
      crossAxisSpacing: null == crossAxisSpacing
          ? _value.crossAxisSpacing
          : crossAxisSpacing // ignore: cast_nullable_to_non_nullable
              as double,
      mainAxisSpacing: null == mainAxisSpacing
          ? _value.mainAxisSpacing
          : mainAxisSpacing // ignore: cast_nullable_to_non_nullable
              as double,
      itemVisibility: null == itemVisibility
          ? _value.itemVisibility
          : itemVisibility // ignore: cast_nullable_to_non_nullable
              as double,
      horizontalGrid: null == horizontalGrid
          ? _value.horizontalGrid
          : horizontalGrid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GridConfiguration implements _GridConfiguration {
  const _$_GridConfiguration(
      {this.crossAxisSpacing = 0,
      this.mainAxisSpacing = 0,
      this.itemVisibility = 1,
      this.horizontalGrid = false});

  factory _$_GridConfiguration.fromJson(Map<String, dynamic> json) =>
      _$$_GridConfigurationFromJson(json);

  @override
  @JsonKey()
  final double crossAxisSpacing;
  @override
  @JsonKey()
  final double mainAxisSpacing;
  @override
  @JsonKey()
  final double itemVisibility;
  @override
  @JsonKey()
  final bool horizontalGrid;

  @override
  String toString() {
    return 'GridConfiguration(crossAxisSpacing: $crossAxisSpacing, mainAxisSpacing: $mainAxisSpacing, itemVisibility: $itemVisibility, horizontalGrid: $horizontalGrid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GridConfiguration &&
            (identical(other.crossAxisSpacing, crossAxisSpacing) ||
                other.crossAxisSpacing == crossAxisSpacing) &&
            (identical(other.mainAxisSpacing, mainAxisSpacing) ||
                other.mainAxisSpacing == mainAxisSpacing) &&
            (identical(other.itemVisibility, itemVisibility) ||
                other.itemVisibility == itemVisibility) &&
            (identical(other.horizontalGrid, horizontalGrid) ||
                other.horizontalGrid == horizontalGrid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, crossAxisSpacing,
      mainAxisSpacing, itemVisibility, horizontalGrid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GridConfigurationCopyWith<_$_GridConfiguration> get copyWith =>
      __$$_GridConfigurationCopyWithImpl<_$_GridConfiguration>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GridConfigurationToJson(
      this,
    );
  }
}

abstract class _GridConfiguration implements GridConfiguration {
  const factory _GridConfiguration(
      {final double crossAxisSpacing,
      final double mainAxisSpacing,
      final double itemVisibility,
      final bool horizontalGrid}) = _$_GridConfiguration;

  factory _GridConfiguration.fromJson(Map<String, dynamic> json) =
      _$_GridConfiguration.fromJson;

  @override
  double get crossAxisSpacing;
  @override
  double get mainAxisSpacing;
  @override
  double get itemVisibility;
  @override
  bool get horizontalGrid;
  @override
  @JsonKey(ignore: true)
  _$$_GridConfigurationCopyWith<_$_GridConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}
