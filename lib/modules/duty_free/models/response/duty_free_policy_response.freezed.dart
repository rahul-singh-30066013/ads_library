// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_policy_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreePolicyResponse _$DutyFreePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return _DutyFreePolicyResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreePolicyResponse {
  String? get title => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<String>? get lines => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreePolicyResponseCopyWith<DutyFreePolicyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreePolicyResponseCopyWith<$Res> {
  factory $DutyFreePolicyResponseCopyWith(DutyFreePolicyResponse value,
          $Res Function(DutyFreePolicyResponse) then) =
      _$DutyFreePolicyResponseCopyWithImpl<$Res, DutyFreePolicyResponse>;
  @useResult
  $Res call({String? title, String? text, List<String>? lines});
}

/// @nodoc
class _$DutyFreePolicyResponseCopyWithImpl<$Res,
        $Val extends DutyFreePolicyResponse>
    implements $DutyFreePolicyResponseCopyWith<$Res> {
  _$DutyFreePolicyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
    Object? lines = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      lines: freezed == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreePolicyResponseCopyWith<$Res>
    implements $DutyFreePolicyResponseCopyWith<$Res> {
  factory _$$_DutyFreePolicyResponseCopyWith(_$_DutyFreePolicyResponse value,
          $Res Function(_$_DutyFreePolicyResponse) then) =
      __$$_DutyFreePolicyResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? text, List<String>? lines});
}

/// @nodoc
class __$$_DutyFreePolicyResponseCopyWithImpl<$Res>
    extends _$DutyFreePolicyResponseCopyWithImpl<$Res,
        _$_DutyFreePolicyResponse>
    implements _$$_DutyFreePolicyResponseCopyWith<$Res> {
  __$$_DutyFreePolicyResponseCopyWithImpl(_$_DutyFreePolicyResponse _value,
      $Res Function(_$_DutyFreePolicyResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
    Object? lines = freezed,
  }) {
    return _then(_$_DutyFreePolicyResponse(
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreePolicyResponse implements _DutyFreePolicyResponse {
  const _$_DutyFreePolicyResponse(this.title, this.text, this.lines);

  factory _$_DutyFreePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreePolicyResponseFromJson(json);

  @override
  final String? title;
  @override
  final String? text;
  @override
  final List<String>? lines;

  @override
  String toString() {
    return 'DutyFreePolicyResponse(title: $title, text: $text, lines: $lines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreePolicyResponse &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.lines, lines));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, text, const DeepCollectionEquality().hash(lines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreePolicyResponseCopyWith<_$_DutyFreePolicyResponse> get copyWith =>
      __$$_DutyFreePolicyResponseCopyWithImpl<_$_DutyFreePolicyResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreePolicyResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreePolicyResponse implements DutyFreePolicyResponse {
  const factory _DutyFreePolicyResponse(
          final String? title, final String? text, final List<String>? lines) =
      _$_DutyFreePolicyResponse;

  factory _DutyFreePolicyResponse.fromJson(Map<String, dynamic> json) =
      _$_DutyFreePolicyResponse.fromJson;

  @override
  String? get title;
  @override
  String? get text;
  @override
  List<String>? get lines;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreePolicyResponseCopyWith<_$_DutyFreePolicyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
