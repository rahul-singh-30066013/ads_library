// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TabConfiguration _$TabConfigurationFromJson(Map<String, dynamic> json) {
  return _TabConfiguration.fromJson(json);
}

/// @nodoc
mixin _$TabConfiguration {
  String get tabColor => throw _privateConstructorUsedError;
  String get tabSelectedColor => throw _privateConstructorUsedError;
  String get tabTextSelectedColor => throw _privateConstructorUsedError;
  String get tabTextColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabConfigurationCopyWith<TabConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabConfigurationCopyWith<$Res> {
  factory $TabConfigurationCopyWith(
          TabConfiguration value, $Res Function(TabConfiguration) then) =
      _$TabConfigurationCopyWithImpl<$Res, TabConfiguration>;
  @useResult
  $Res call(
      {String tabColor,
      String tabSelectedColor,
      String tabTextSelectedColor,
      String tabTextColor});
}

/// @nodoc
class _$TabConfigurationCopyWithImpl<$Res, $Val extends TabConfiguration>
    implements $TabConfigurationCopyWith<$Res> {
  _$TabConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabColor = null,
    Object? tabSelectedColor = null,
    Object? tabTextSelectedColor = null,
    Object? tabTextColor = null,
  }) {
    return _then(_value.copyWith(
      tabColor: null == tabColor
          ? _value.tabColor
          : tabColor // ignore: cast_nullable_to_non_nullable
              as String,
      tabSelectedColor: null == tabSelectedColor
          ? _value.tabSelectedColor
          : tabSelectedColor // ignore: cast_nullable_to_non_nullable
              as String,
      tabTextSelectedColor: null == tabTextSelectedColor
          ? _value.tabTextSelectedColor
          : tabTextSelectedColor // ignore: cast_nullable_to_non_nullable
              as String,
      tabTextColor: null == tabTextColor
          ? _value.tabTextColor
          : tabTextColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabConfigurationCopyWith<$Res>
    implements $TabConfigurationCopyWith<$Res> {
  factory _$$_TabConfigurationCopyWith(
          _$_TabConfiguration value, $Res Function(_$_TabConfiguration) then) =
      __$$_TabConfigurationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tabColor,
      String tabSelectedColor,
      String tabTextSelectedColor,
      String tabTextColor});
}

/// @nodoc
class __$$_TabConfigurationCopyWithImpl<$Res>
    extends _$TabConfigurationCopyWithImpl<$Res, _$_TabConfiguration>
    implements _$$_TabConfigurationCopyWith<$Res> {
  __$$_TabConfigurationCopyWithImpl(
      _$_TabConfiguration _value, $Res Function(_$_TabConfiguration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabColor = null,
    Object? tabSelectedColor = null,
    Object? tabTextSelectedColor = null,
    Object? tabTextColor = null,
  }) {
    return _then(_$_TabConfiguration(
      tabColor: null == tabColor
          ? _value.tabColor
          : tabColor // ignore: cast_nullable_to_non_nullable
              as String,
      tabSelectedColor: null == tabSelectedColor
          ? _value.tabSelectedColor
          : tabSelectedColor // ignore: cast_nullable_to_non_nullable
              as String,
      tabTextSelectedColor: null == tabTextSelectedColor
          ? _value.tabTextSelectedColor
          : tabTextSelectedColor // ignore: cast_nullable_to_non_nullable
              as String,
      tabTextColor: null == tabTextColor
          ? _value.tabTextColor
          : tabTextColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabConfiguration implements _TabConfiguration {
  const _$_TabConfiguration(
      {this.tabColor = '',
      this.tabSelectedColor = '',
      this.tabTextSelectedColor = '',
      this.tabTextColor = ''});

  factory _$_TabConfiguration.fromJson(Map<String, dynamic> json) =>
      _$$_TabConfigurationFromJson(json);

  @override
  @JsonKey()
  final String tabColor;
  @override
  @JsonKey()
  final String tabSelectedColor;
  @override
  @JsonKey()
  final String tabTextSelectedColor;
  @override
  @JsonKey()
  final String tabTextColor;

  @override
  String toString() {
    return 'TabConfiguration(tabColor: $tabColor, tabSelectedColor: $tabSelectedColor, tabTextSelectedColor: $tabTextSelectedColor, tabTextColor: $tabTextColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabConfiguration &&
            (identical(other.tabColor, tabColor) ||
                other.tabColor == tabColor) &&
            (identical(other.tabSelectedColor, tabSelectedColor) ||
                other.tabSelectedColor == tabSelectedColor) &&
            (identical(other.tabTextSelectedColor, tabTextSelectedColor) ||
                other.tabTextSelectedColor == tabTextSelectedColor) &&
            (identical(other.tabTextColor, tabTextColor) ||
                other.tabTextColor == tabTextColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tabColor, tabSelectedColor,
      tabTextSelectedColor, tabTextColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabConfigurationCopyWith<_$_TabConfiguration> get copyWith =>
      __$$_TabConfigurationCopyWithImpl<_$_TabConfiguration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabConfigurationToJson(
      this,
    );
  }
}

abstract class _TabConfiguration implements TabConfiguration {
  const factory _TabConfiguration(
      {final String tabColor,
      final String tabSelectedColor,
      final String tabTextSelectedColor,
      final String tabTextColor}) = _$_TabConfiguration;

  factory _TabConfiguration.fromJson(Map<String, dynamic> json) =
      _$_TabConfiguration.fromJson;

  @override
  String get tabColor;
  @override
  String get tabSelectedColor;
  @override
  String get tabTextSelectedColor;
  @override
  String get tabTextColor;
  @override
  @JsonKey(ignore: true)
  _$$_TabConfigurationCopyWith<_$_TabConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}
