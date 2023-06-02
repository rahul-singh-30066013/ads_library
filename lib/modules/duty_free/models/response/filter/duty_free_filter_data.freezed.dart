// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_filter_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeFilterData _$DutyFreeFilterDataFromJson(Map<String, dynamic> json) {
  return _DutyFreeFilterData.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeFilterData {
  String get title => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get imageSrc => throw _privateConstructorUsedError;
  bool get filterSelected => throw _privateConstructorUsedError;
  String get filterValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeFilterDataCopyWith<DutyFreeFilterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeFilterDataCopyWith<$Res> {
  factory $DutyFreeFilterDataCopyWith(
          DutyFreeFilterData value, $Res Function(DutyFreeFilterData) then) =
      _$DutyFreeFilterDataCopyWithImpl<$Res, DutyFreeFilterData>;
  @useResult
  $Res call(
      {String title,
      String code,
      String imageSrc,
      bool filterSelected,
      String filterValue});
}

/// @nodoc
class _$DutyFreeFilterDataCopyWithImpl<$Res, $Val extends DutyFreeFilterData>
    implements $DutyFreeFilterDataCopyWith<$Res> {
  _$DutyFreeFilterDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? code = null,
    Object? imageSrc = null,
    Object? filterSelected = null,
    Object? filterValue = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      filterSelected: null == filterSelected
          ? _value.filterSelected
          : filterSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      filterValue: null == filterValue
          ? _value.filterValue
          : filterValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeFilterDataCopyWith<$Res>
    implements $DutyFreeFilterDataCopyWith<$Res> {
  factory _$$_DutyFreeFilterDataCopyWith(_$_DutyFreeFilterData value,
          $Res Function(_$_DutyFreeFilterData) then) =
      __$$_DutyFreeFilterDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String code,
      String imageSrc,
      bool filterSelected,
      String filterValue});
}

/// @nodoc
class __$$_DutyFreeFilterDataCopyWithImpl<$Res>
    extends _$DutyFreeFilterDataCopyWithImpl<$Res, _$_DutyFreeFilterData>
    implements _$$_DutyFreeFilterDataCopyWith<$Res> {
  __$$_DutyFreeFilterDataCopyWithImpl(
      _$_DutyFreeFilterData _value, $Res Function(_$_DutyFreeFilterData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? code = null,
    Object? imageSrc = null,
    Object? filterSelected = null,
    Object? filterValue = null,
  }) {
    return _then(_$_DutyFreeFilterData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      filterSelected: null == filterSelected
          ? _value.filterSelected
          : filterSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      filterValue: null == filterValue
          ? _value.filterValue
          : filterValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeFilterData implements _DutyFreeFilterData {
  const _$_DutyFreeFilterData(
      {this.title = '',
      this.code = '',
      this.imageSrc = '',
      this.filterSelected = false,
      this.filterValue = ''});

  factory _$_DutyFreeFilterData.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeFilterDataFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String imageSrc;
  @override
  @JsonKey()
  final bool filterSelected;
  @override
  @JsonKey()
  final String filterValue;

  @override
  String toString() {
    return 'DutyFreeFilterData(title: $title, code: $code, imageSrc: $imageSrc, filterSelected: $filterSelected, filterValue: $filterValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeFilterData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.imageSrc, imageSrc) ||
                other.imageSrc == imageSrc) &&
            (identical(other.filterSelected, filterSelected) ||
                other.filterSelected == filterSelected) &&
            (identical(other.filterValue, filterValue) ||
                other.filterValue == filterValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, code, imageSrc, filterSelected, filterValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeFilterDataCopyWith<_$_DutyFreeFilterData> get copyWith =>
      __$$_DutyFreeFilterDataCopyWithImpl<_$_DutyFreeFilterData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeFilterDataToJson(
      this,
    );
  }
}

abstract class _DutyFreeFilterData implements DutyFreeFilterData {
  const factory _DutyFreeFilterData(
      {final String title,
      final String code,
      final String imageSrc,
      final bool filterSelected,
      final String filterValue}) = _$_DutyFreeFilterData;

  factory _DutyFreeFilterData.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeFilterData.fromJson;

  @override
  String get title;
  @override
  String get code;
  @override
  String get imageSrc;
  @override
  bool get filterSelected;
  @override
  String get filterValue;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeFilterDataCopyWith<_$_DutyFreeFilterData> get copyWith =>
      throw _privateConstructorUsedError;
}
