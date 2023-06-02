// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_offer_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInOfferListResponse _$SignInOfferListResponseFromJson(
    Map<String, dynamic> json) {
  return _SignInOfferListResponse.fromJson(json);
}

/// @nodoc
mixin _$SignInOfferListResponse {
  List<SignInOffer> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInOfferListResponseCopyWith<SignInOfferListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInOfferListResponseCopyWith<$Res> {
  factory $SignInOfferListResponseCopyWith(SignInOfferListResponse value,
          $Res Function(SignInOfferListResponse) then) =
      _$SignInOfferListResponseCopyWithImpl<$Res, SignInOfferListResponse>;
  @useResult
  $Res call({List<SignInOffer> data});
}

/// @nodoc
class _$SignInOfferListResponseCopyWithImpl<$Res,
        $Val extends SignInOfferListResponse>
    implements $SignInOfferListResponseCopyWith<$Res> {
  _$SignInOfferListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SignInOffer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInOfferListResponseCopyWith<$Res>
    implements $SignInOfferListResponseCopyWith<$Res> {
  factory _$$_SignInOfferListResponseCopyWith(_$_SignInOfferListResponse value,
          $Res Function(_$_SignInOfferListResponse) then) =
      __$$_SignInOfferListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SignInOffer> data});
}

/// @nodoc
class __$$_SignInOfferListResponseCopyWithImpl<$Res>
    extends _$SignInOfferListResponseCopyWithImpl<$Res,
        _$_SignInOfferListResponse>
    implements _$$_SignInOfferListResponseCopyWith<$Res> {
  __$$_SignInOfferListResponseCopyWithImpl(_$_SignInOfferListResponse _value,
      $Res Function(_$_SignInOfferListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_SignInOfferListResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SignInOffer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInOfferListResponse implements _SignInOfferListResponse {
  const _$_SignInOfferListResponse({this.data = const []});

  factory _$_SignInOfferListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SignInOfferListResponseFromJson(json);

  @override
  @JsonKey()
  final List<SignInOffer> data;

  @override
  String toString() {
    return 'SignInOfferListResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInOfferListResponse &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInOfferListResponseCopyWith<_$_SignInOfferListResponse>
      get copyWith =>
          __$$_SignInOfferListResponseCopyWithImpl<_$_SignInOfferListResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInOfferListResponseToJson(
      this,
    );
  }
}

abstract class _SignInOfferListResponse implements SignInOfferListResponse {
  const factory _SignInOfferListResponse({final List<SignInOffer> data}) =
      _$_SignInOfferListResponse;

  factory _SignInOfferListResponse.fromJson(Map<String, dynamic> json) =
      _$_SignInOfferListResponse.fromJson;

  @override
  List<SignInOffer> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SignInOfferListResponseCopyWith<_$_SignInOfferListResponse>
      get copyWith => throw _privateConstructorUsedError;
}

SignInOffer _$SignInOfferFromJson(Map<String, dynamic> json) {
  return _SignInOffer.fromJson(json);
}

/// @nodoc
mixin _$SignInOffer {
  String get promoCode => throw _privateConstructorUsedError;
  String get promoName => throw _privateConstructorUsedError;
  String get promoDescription => throw _privateConstructorUsedError;
  num get promoPercentage => throw _privateConstructorUsedError;
  num get promoCappingValue => throw _privateConstructorUsedError;
  String get promoCategory => throw _privateConstructorUsedError;
  num get promoPriority => throw _privateConstructorUsedError;
  bool? get isInternational => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInOfferCopyWith<SignInOffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInOfferCopyWith<$Res> {
  factory $SignInOfferCopyWith(
          SignInOffer value, $Res Function(SignInOffer) then) =
      _$SignInOfferCopyWithImpl<$Res, SignInOffer>;
  @useResult
  $Res call(
      {String promoCode,
      String promoName,
      String promoDescription,
      num promoPercentage,
      num promoCappingValue,
      String promoCategory,
      num promoPriority,
      bool? isInternational});
}

/// @nodoc
class _$SignInOfferCopyWithImpl<$Res, $Val extends SignInOffer>
    implements $SignInOfferCopyWith<$Res> {
  _$SignInOfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
    Object? promoName = null,
    Object? promoDescription = null,
    Object? promoPercentage = null,
    Object? promoCappingValue = null,
    Object? promoCategory = null,
    Object? promoPriority = null,
    Object? isInternational = freezed,
  }) {
    return _then(_value.copyWith(
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      promoDescription: null == promoDescription
          ? _value.promoDescription
          : promoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promoPercentage: null == promoPercentage
          ? _value.promoPercentage
          : promoPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      promoCappingValue: null == promoCappingValue
          ? _value.promoCappingValue
          : promoCappingValue // ignore: cast_nullable_to_non_nullable
              as num,
      promoCategory: null == promoCategory
          ? _value.promoCategory
          : promoCategory // ignore: cast_nullable_to_non_nullable
              as String,
      promoPriority: null == promoPriority
          ? _value.promoPriority
          : promoPriority // ignore: cast_nullable_to_non_nullable
              as num,
      isInternational: freezed == isInternational
          ? _value.isInternational
          : isInternational // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInOfferCopyWith<$Res>
    implements $SignInOfferCopyWith<$Res> {
  factory _$$_SignInOfferCopyWith(
          _$_SignInOffer value, $Res Function(_$_SignInOffer) then) =
      __$$_SignInOfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String promoCode,
      String promoName,
      String promoDescription,
      num promoPercentage,
      num promoCappingValue,
      String promoCategory,
      num promoPriority,
      bool? isInternational});
}

/// @nodoc
class __$$_SignInOfferCopyWithImpl<$Res>
    extends _$SignInOfferCopyWithImpl<$Res, _$_SignInOffer>
    implements _$$_SignInOfferCopyWith<$Res> {
  __$$_SignInOfferCopyWithImpl(
      _$_SignInOffer _value, $Res Function(_$_SignInOffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
    Object? promoName = null,
    Object? promoDescription = null,
    Object? promoPercentage = null,
    Object? promoCappingValue = null,
    Object? promoCategory = null,
    Object? promoPriority = null,
    Object? isInternational = freezed,
  }) {
    return _then(_$_SignInOffer(
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      promoName: null == promoName
          ? _value.promoName
          : promoName // ignore: cast_nullable_to_non_nullable
              as String,
      promoDescription: null == promoDescription
          ? _value.promoDescription
          : promoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promoPercentage: null == promoPercentage
          ? _value.promoPercentage
          : promoPercentage // ignore: cast_nullable_to_non_nullable
              as num,
      promoCappingValue: null == promoCappingValue
          ? _value.promoCappingValue
          : promoCappingValue // ignore: cast_nullable_to_non_nullable
              as num,
      promoCategory: null == promoCategory
          ? _value.promoCategory
          : promoCategory // ignore: cast_nullable_to_non_nullable
              as String,
      promoPriority: null == promoPriority
          ? _value.promoPriority
          : promoPriority // ignore: cast_nullable_to_non_nullable
              as num,
      isInternational: freezed == isInternational
          ? _value.isInternational
          : isInternational // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInOffer implements _SignInOffer {
  const _$_SignInOffer(
      {this.promoCode = '',
      this.promoName = '',
      this.promoDescription = '',
      this.promoPercentage = 0,
      this.promoCappingValue = 0,
      this.promoCategory = '',
      this.promoPriority = 0,
      this.isInternational = false});

  factory _$_SignInOffer.fromJson(Map<String, dynamic> json) =>
      _$$_SignInOfferFromJson(json);

  @override
  @JsonKey()
  final String promoCode;
  @override
  @JsonKey()
  final String promoName;
  @override
  @JsonKey()
  final String promoDescription;
  @override
  @JsonKey()
  final num promoPercentage;
  @override
  @JsonKey()
  final num promoCappingValue;
  @override
  @JsonKey()
  final String promoCategory;
  @override
  @JsonKey()
  final num promoPriority;
  @override
  @JsonKey()
  final bool? isInternational;

  @override
  String toString() {
    return 'SignInOffer(promoCode: $promoCode, promoName: $promoName, promoDescription: $promoDescription, promoPercentage: $promoPercentage, promoCappingValue: $promoCappingValue, promoCategory: $promoCategory, promoPriority: $promoPriority, isInternational: $isInternational)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInOffer &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.promoName, promoName) ||
                other.promoName == promoName) &&
            (identical(other.promoDescription, promoDescription) ||
                other.promoDescription == promoDescription) &&
            (identical(other.promoPercentage, promoPercentage) ||
                other.promoPercentage == promoPercentage) &&
            (identical(other.promoCappingValue, promoCappingValue) ||
                other.promoCappingValue == promoCappingValue) &&
            (identical(other.promoCategory, promoCategory) ||
                other.promoCategory == promoCategory) &&
            (identical(other.promoPriority, promoPriority) ||
                other.promoPriority == promoPriority) &&
            (identical(other.isInternational, isInternational) ||
                other.isInternational == isInternational));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      promoCode,
      promoName,
      promoDescription,
      promoPercentage,
      promoCappingValue,
      promoCategory,
      promoPriority,
      isInternational);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInOfferCopyWith<_$_SignInOffer> get copyWith =>
      __$$_SignInOfferCopyWithImpl<_$_SignInOffer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInOfferToJson(
      this,
    );
  }
}

abstract class _SignInOffer implements SignInOffer {
  const factory _SignInOffer(
      {final String promoCode,
      final String promoName,
      final String promoDescription,
      final num promoPercentage,
      final num promoCappingValue,
      final String promoCategory,
      final num promoPriority,
      final bool? isInternational}) = _$_SignInOffer;

  factory _SignInOffer.fromJson(Map<String, dynamic> json) =
      _$_SignInOffer.fromJson;

  @override
  String get promoCode;
  @override
  String get promoName;
  @override
  String get promoDescription;
  @override
  num get promoPercentage;
  @override
  num get promoCappingValue;
  @override
  String get promoCategory;
  @override
  num get promoPriority;
  @override
  bool? get isInternational;
  @override
  @JsonKey(ignore: true)
  _$$_SignInOfferCopyWith<_$_SignInOffer> get copyWith =>
      throw _privateConstructorUsedError;
}
