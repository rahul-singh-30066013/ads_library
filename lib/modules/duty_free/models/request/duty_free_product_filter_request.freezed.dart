// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_product_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeProductFilterRequest _$DutyFreeProductFilterRequestFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeProductFilterRequest.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeProductFilterRequest {
  String get materialGroup => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  bool get restricted => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  String get storeType => throw _privateConstructorUsedError;
  String get airportCode => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeProductFilterRequestCopyWith<DutyFreeProductFilterRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeProductFilterRequestCopyWith<$Res> {
  factory $DutyFreeProductFilterRequestCopyWith(
          DutyFreeProductFilterRequest value,
          $Res Function(DutyFreeProductFilterRequest) then) =
      _$DutyFreeProductFilterRequestCopyWithImpl<$Res,
          DutyFreeProductFilterRequest>;
  @useResult
  $Res call(
      {String materialGroup,
      String language,
      bool restricted,
      String channel,
      String storeType,
      String airportCode,
      String? slug});
}

/// @nodoc
class _$DutyFreeProductFilterRequestCopyWithImpl<$Res,
        $Val extends DutyFreeProductFilterRequest>
    implements $DutyFreeProductFilterRequestCopyWith<$Res> {
  _$DutyFreeProductFilterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialGroup = null,
    Object? language = null,
    Object? restricted = null,
    Object? channel = null,
    Object? storeType = null,
    Object? airportCode = null,
    Object? slug = freezed,
  }) {
    return _then(_value.copyWith(
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      airportCode: null == airportCode
          ? _value.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeProductFilterRequestCopyWith<$Res>
    implements $DutyFreeProductFilterRequestCopyWith<$Res> {
  factory _$$_DutyFreeProductFilterRequestCopyWith(
          _$_DutyFreeProductFilterRequest value,
          $Res Function(_$_DutyFreeProductFilterRequest) then) =
      __$$_DutyFreeProductFilterRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String materialGroup,
      String language,
      bool restricted,
      String channel,
      String storeType,
      String airportCode,
      String? slug});
}

/// @nodoc
class __$$_DutyFreeProductFilterRequestCopyWithImpl<$Res>
    extends _$DutyFreeProductFilterRequestCopyWithImpl<$Res,
        _$_DutyFreeProductFilterRequest>
    implements _$$_DutyFreeProductFilterRequestCopyWith<$Res> {
  __$$_DutyFreeProductFilterRequestCopyWithImpl(
      _$_DutyFreeProductFilterRequest _value,
      $Res Function(_$_DutyFreeProductFilterRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialGroup = null,
    Object? language = null,
    Object? restricted = null,
    Object? channel = null,
    Object? storeType = null,
    Object? airportCode = null,
    Object? slug = freezed,
  }) {
    return _then(_$_DutyFreeProductFilterRequest(
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      airportCode: null == airportCode
          ? _value.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeProductFilterRequest implements _DutyFreeProductFilterRequest {
  const _$_DutyFreeProductFilterRequest(
      {this.materialGroup = 'Liquor',
      this.language = 'en',
      this.restricted = false,
      this.channel = 'app',
      this.storeType = '',
      this.airportCode = '',
      this.slug});

  factory _$_DutyFreeProductFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeProductFilterRequestFromJson(json);

  @override
  @JsonKey()
  final String materialGroup;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final bool restricted;
  @override
  @JsonKey()
  final String channel;
  @override
  @JsonKey()
  final String storeType;
  @override
  @JsonKey()
  final String airportCode;
  @override
  final String? slug;

  @override
  String toString() {
    return 'DutyFreeProductFilterRequest(materialGroup: $materialGroup, language: $language, restricted: $restricted, channel: $channel, storeType: $storeType, airportCode: $airportCode, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeProductFilterRequest &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.restricted, restricted) ||
                other.restricted == restricted) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.airportCode, airportCode) ||
                other.airportCode == airportCode) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialGroup, language,
      restricted, channel, storeType, airportCode, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeProductFilterRequestCopyWith<_$_DutyFreeProductFilterRequest>
      get copyWith => __$$_DutyFreeProductFilterRequestCopyWithImpl<
          _$_DutyFreeProductFilterRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeProductFilterRequestToJson(
      this,
    );
  }
}

abstract class _DutyFreeProductFilterRequest
    implements DutyFreeProductFilterRequest {
  const factory _DutyFreeProductFilterRequest(
      {final String materialGroup,
      final String language,
      final bool restricted,
      final String channel,
      final String storeType,
      final String airportCode,
      final String? slug}) = _$_DutyFreeProductFilterRequest;

  factory _DutyFreeProductFilterRequest.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeProductFilterRequest.fromJson;

  @override
  String get materialGroup;
  @override
  String get language;
  @override
  bool get restricted;
  @override
  String get channel;
  @override
  String get storeType;
  @override
  String get airportCode;
  @override
  String? get slug;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeProductFilterRequestCopyWith<_$_DutyFreeProductFilterRequest>
      get copyWith => throw _privateConstructorUsedError;
}
