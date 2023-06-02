// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_item_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubItemColors _$SubItemColorsFromJson(Map<String, dynamic> json) {
  return _SubItemColors.fromJson(json);
}

/// @nodoc
mixin _$SubItemColors {
  String get titleColor => throw _privateConstructorUsedError;
  String get subTitleColor => throw _privateConstructorUsedError;
  String get descriptionColor => throw _privateConstructorUsedError;
  String get ctaColor => throw _privateConstructorUsedError;
  String get backGroundColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubItemColorsCopyWith<SubItemColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubItemColorsCopyWith<$Res> {
  factory $SubItemColorsCopyWith(
          SubItemColors value, $Res Function(SubItemColors) then) =
      _$SubItemColorsCopyWithImpl<$Res, SubItemColors>;
  @useResult
  $Res call(
      {String titleColor,
      String subTitleColor,
      String descriptionColor,
      String ctaColor,
      String backGroundColor});
}

/// @nodoc
class _$SubItemColorsCopyWithImpl<$Res, $Val extends SubItemColors>
    implements $SubItemColorsCopyWith<$Res> {
  _$SubItemColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleColor = null,
    Object? subTitleColor = null,
    Object? descriptionColor = null,
    Object? ctaColor = null,
    Object? backGroundColor = null,
  }) {
    return _then(_value.copyWith(
      titleColor: null == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String,
      subTitleColor: null == subTitleColor
          ? _value.subTitleColor
          : subTitleColor // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionColor: null == descriptionColor
          ? _value.descriptionColor
          : descriptionColor // ignore: cast_nullable_to_non_nullable
              as String,
      ctaColor: null == ctaColor
          ? _value.ctaColor
          : ctaColor // ignore: cast_nullable_to_non_nullable
              as String,
      backGroundColor: null == backGroundColor
          ? _value.backGroundColor
          : backGroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubItemColorsCopyWith<$Res>
    implements $SubItemColorsCopyWith<$Res> {
  factory _$$_SubItemColorsCopyWith(
          _$_SubItemColors value, $Res Function(_$_SubItemColors) then) =
      __$$_SubItemColorsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String titleColor,
      String subTitleColor,
      String descriptionColor,
      String ctaColor,
      String backGroundColor});
}

/// @nodoc
class __$$_SubItemColorsCopyWithImpl<$Res>
    extends _$SubItemColorsCopyWithImpl<$Res, _$_SubItemColors>
    implements _$$_SubItemColorsCopyWith<$Res> {
  __$$_SubItemColorsCopyWithImpl(
      _$_SubItemColors _value, $Res Function(_$_SubItemColors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? titleColor = null,
    Object? subTitleColor = null,
    Object? descriptionColor = null,
    Object? ctaColor = null,
    Object? backGroundColor = null,
  }) {
    return _then(_$_SubItemColors(
      titleColor: null == titleColor
          ? _value.titleColor
          : titleColor // ignore: cast_nullable_to_non_nullable
              as String,
      subTitleColor: null == subTitleColor
          ? _value.subTitleColor
          : subTitleColor // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionColor: null == descriptionColor
          ? _value.descriptionColor
          : descriptionColor // ignore: cast_nullable_to_non_nullable
              as String,
      ctaColor: null == ctaColor
          ? _value.ctaColor
          : ctaColor // ignore: cast_nullable_to_non_nullable
              as String,
      backGroundColor: null == backGroundColor
          ? _value.backGroundColor
          : backGroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubItemColors implements _SubItemColors {
  const _$_SubItemColors(
      {this.titleColor = '0xffffffff',
      this.subTitleColor = '0xffffffff',
      this.descriptionColor = '0xffffffff',
      this.ctaColor = '0xffffffff',
      this.backGroundColor = ''});

  factory _$_SubItemColors.fromJson(Map<String, dynamic> json) =>
      _$$_SubItemColorsFromJson(json);

  @override
  @JsonKey()
  final String titleColor;
  @override
  @JsonKey()
  final String subTitleColor;
  @override
  @JsonKey()
  final String descriptionColor;
  @override
  @JsonKey()
  final String ctaColor;
  @override
  @JsonKey()
  final String backGroundColor;

  @override
  String toString() {
    return 'SubItemColors(titleColor: $titleColor, subTitleColor: $subTitleColor, descriptionColor: $descriptionColor, ctaColor: $ctaColor, backGroundColor: $backGroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubItemColors &&
            (identical(other.titleColor, titleColor) ||
                other.titleColor == titleColor) &&
            (identical(other.subTitleColor, subTitleColor) ||
                other.subTitleColor == subTitleColor) &&
            (identical(other.descriptionColor, descriptionColor) ||
                other.descriptionColor == descriptionColor) &&
            (identical(other.ctaColor, ctaColor) ||
                other.ctaColor == ctaColor) &&
            (identical(other.backGroundColor, backGroundColor) ||
                other.backGroundColor == backGroundColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, titleColor, subTitleColor,
      descriptionColor, ctaColor, backGroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubItemColorsCopyWith<_$_SubItemColors> get copyWith =>
      __$$_SubItemColorsCopyWithImpl<_$_SubItemColors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubItemColorsToJson(
      this,
    );
  }
}

abstract class _SubItemColors implements SubItemColors {
  const factory _SubItemColors(
      {final String titleColor,
      final String subTitleColor,
      final String descriptionColor,
      final String ctaColor,
      final String backGroundColor}) = _$_SubItemColors;

  factory _SubItemColors.fromJson(Map<String, dynamic> json) =
      _$_SubItemColors.fromJson;

  @override
  String get titleColor;
  @override
  String get subTitleColor;
  @override
  String get descriptionColor;
  @override
  String get ctaColor;
  @override
  String get backGroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_SubItemColorsCopyWith<_$_SubItemColors> get copyWith =>
      throw _privateConstructorUsedError;
}
