// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gradient_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GradientConfiguration _$GradientConfigurationFromJson(
    Map<String, dynamic> json) {
  return _GradientConfiguration.fromJson(json);
}

/// @nodoc
mixin _$GradientConfiguration {
  List<String> get gradientColors => throw _privateConstructorUsedError;
  String get gradientBegin => throw _privateConstructorUsedError;
  String get gradientEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GradientConfigurationCopyWith<GradientConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradientConfigurationCopyWith<$Res> {
  factory $GradientConfigurationCopyWith(GradientConfiguration value,
          $Res Function(GradientConfiguration) then) =
      _$GradientConfigurationCopyWithImpl<$Res, GradientConfiguration>;
  @useResult
  $Res call(
      {List<String> gradientColors, String gradientBegin, String gradientEnd});
}

/// @nodoc
class _$GradientConfigurationCopyWithImpl<$Res,
        $Val extends GradientConfiguration>
    implements $GradientConfigurationCopyWith<$Res> {
  _$GradientConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gradientColors = null,
    Object? gradientBegin = null,
    Object? gradientEnd = null,
  }) {
    return _then(_value.copyWith(
      gradientColors: null == gradientColors
          ? _value.gradientColors
          : gradientColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gradientBegin: null == gradientBegin
          ? _value.gradientBegin
          : gradientBegin // ignore: cast_nullable_to_non_nullable
              as String,
      gradientEnd: null == gradientEnd
          ? _value.gradientEnd
          : gradientEnd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GradientConfigurationCopyWith<$Res>
    implements $GradientConfigurationCopyWith<$Res> {
  factory _$$_GradientConfigurationCopyWith(_$_GradientConfiguration value,
          $Res Function(_$_GradientConfiguration) then) =
      __$$_GradientConfigurationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> gradientColors, String gradientBegin, String gradientEnd});
}

/// @nodoc
class __$$_GradientConfigurationCopyWithImpl<$Res>
    extends _$GradientConfigurationCopyWithImpl<$Res, _$_GradientConfiguration>
    implements _$$_GradientConfigurationCopyWith<$Res> {
  __$$_GradientConfigurationCopyWithImpl(_$_GradientConfiguration _value,
      $Res Function(_$_GradientConfiguration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gradientColors = null,
    Object? gradientBegin = null,
    Object? gradientEnd = null,
  }) {
    return _then(_$_GradientConfiguration(
      gradientColors: null == gradientColors
          ? _value.gradientColors
          : gradientColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gradientBegin: null == gradientBegin
          ? _value.gradientBegin
          : gradientBegin // ignore: cast_nullable_to_non_nullable
              as String,
      gradientEnd: null == gradientEnd
          ? _value.gradientEnd
          : gradientEnd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GradientConfiguration implements _GradientConfiguration {
  const _$_GradientConfiguration(
      {this.gradientColors = const [],
      this.gradientBegin = '',
      this.gradientEnd = ''});

  factory _$_GradientConfiguration.fromJson(Map<String, dynamic> json) =>
      _$$_GradientConfigurationFromJson(json);

  @override
  @JsonKey()
  final List<String> gradientColors;
  @override
  @JsonKey()
  final String gradientBegin;
  @override
  @JsonKey()
  final String gradientEnd;

  @override
  String toString() {
    return 'GradientConfiguration(gradientColors: $gradientColors, gradientBegin: $gradientBegin, gradientEnd: $gradientEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GradientConfiguration &&
            const DeepCollectionEquality()
                .equals(other.gradientColors, gradientColors) &&
            (identical(other.gradientBegin, gradientBegin) ||
                other.gradientBegin == gradientBegin) &&
            (identical(other.gradientEnd, gradientEnd) ||
                other.gradientEnd == gradientEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gradientColors),
      gradientBegin,
      gradientEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GradientConfigurationCopyWith<_$_GradientConfiguration> get copyWith =>
      __$$_GradientConfigurationCopyWithImpl<_$_GradientConfiguration>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GradientConfigurationToJson(
      this,
    );
  }
}

abstract class _GradientConfiguration implements GradientConfiguration {
  const factory _GradientConfiguration(
      {final List<String> gradientColors,
      final String gradientBegin,
      final String gradientEnd}) = _$_GradientConfiguration;

  factory _GradientConfiguration.fromJson(Map<String, dynamic> json) =
      _$_GradientConfiguration.fromJson;

  @override
  List<String> get gradientColors;
  @override
  String get gradientBegin;
  @override
  String get gradientEnd;
  @override
  @JsonKey(ignore: true)
  _$$_GradientConfigurationCopyWith<_$_GradientConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}
