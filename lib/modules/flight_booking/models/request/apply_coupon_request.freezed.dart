// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_coupon_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplyCouponRequest _$ApplyCouponRequestFromJson(Map<String, dynamic> json) {
  return _ApplyCouponRequest.fromJson(json);
}

/// @nodoc
mixin _$ApplyCouponRequest {
  String get itineraryId => throw _privateConstructorUsedError;
  String get promoCode => throw _privateConstructorUsedError;
  bool get isCCFRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplyCouponRequestCopyWith<ApplyCouponRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyCouponRequestCopyWith<$Res> {
  factory $ApplyCouponRequestCopyWith(
          ApplyCouponRequest value, $Res Function(ApplyCouponRequest) then) =
      _$ApplyCouponRequestCopyWithImpl<$Res, ApplyCouponRequest>;
  @useResult
  $Res call({String itineraryId, String promoCode, bool isCCFRequired});
}

/// @nodoc
class _$ApplyCouponRequestCopyWithImpl<$Res, $Val extends ApplyCouponRequest>
    implements $ApplyCouponRequestCopyWith<$Res> {
  _$ApplyCouponRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itineraryId = null,
    Object? promoCode = null,
    Object? isCCFRequired = null,
  }) {
    return _then(_value.copyWith(
      itineraryId: null == itineraryId
          ? _value.itineraryId
          : itineraryId // ignore: cast_nullable_to_non_nullable
              as String,
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      isCCFRequired: null == isCCFRequired
          ? _value.isCCFRequired
          : isCCFRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApplyCouponRequestCopyWith<$Res>
    implements $ApplyCouponRequestCopyWith<$Res> {
  factory _$$_ApplyCouponRequestCopyWith(_$_ApplyCouponRequest value,
          $Res Function(_$_ApplyCouponRequest) then) =
      __$$_ApplyCouponRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String itineraryId, String promoCode, bool isCCFRequired});
}

/// @nodoc
class __$$_ApplyCouponRequestCopyWithImpl<$Res>
    extends _$ApplyCouponRequestCopyWithImpl<$Res, _$_ApplyCouponRequest>
    implements _$$_ApplyCouponRequestCopyWith<$Res> {
  __$$_ApplyCouponRequestCopyWithImpl(
      _$_ApplyCouponRequest _value, $Res Function(_$_ApplyCouponRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itineraryId = null,
    Object? promoCode = null,
    Object? isCCFRequired = null,
  }) {
    return _then(_$_ApplyCouponRequest(
      null == itineraryId
          ? _value.itineraryId
          : itineraryId // ignore: cast_nullable_to_non_nullable
              as String,
      null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
      isCCFRequired: null == isCCFRequired
          ? _value.isCCFRequired
          : isCCFRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplyCouponRequest implements _ApplyCouponRequest {
  const _$_ApplyCouponRequest(this.itineraryId, this.promoCode,
      {this.isCCFRequired = false});

  factory _$_ApplyCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ApplyCouponRequestFromJson(json);

  @override
  final String itineraryId;
  @override
  final String promoCode;
  @override
  @JsonKey()
  final bool isCCFRequired;

  @override
  String toString() {
    return 'ApplyCouponRequest(itineraryId: $itineraryId, promoCode: $promoCode, isCCFRequired: $isCCFRequired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplyCouponRequest &&
            (identical(other.itineraryId, itineraryId) ||
                other.itineraryId == itineraryId) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.isCCFRequired, isCCFRequired) ||
                other.isCCFRequired == isCCFRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, itineraryId, promoCode, isCCFRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplyCouponRequestCopyWith<_$_ApplyCouponRequest> get copyWith =>
      __$$_ApplyCouponRequestCopyWithImpl<_$_ApplyCouponRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplyCouponRequestToJson(
      this,
    );
  }
}

abstract class _ApplyCouponRequest implements ApplyCouponRequest {
  const factory _ApplyCouponRequest(
      final String itineraryId, final String promoCode,
      {final bool isCCFRequired}) = _$_ApplyCouponRequest;

  factory _ApplyCouponRequest.fromJson(Map<String, dynamic> json) =
      _$_ApplyCouponRequest.fromJson;

  @override
  String get itineraryId;
  @override
  String get promoCode;
  @override
  bool get isCCFRequired;
  @override
  @JsonKey(ignore: true)
  _$$_ApplyCouponRequestCopyWith<_$_ApplyCouponRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
