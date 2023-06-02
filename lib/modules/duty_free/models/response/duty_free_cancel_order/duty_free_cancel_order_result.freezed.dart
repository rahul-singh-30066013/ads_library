// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_cancel_order_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeCancelOrderResult _$DutyFreeCancelOrderResultFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeCancelOrderResult.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeCancelOrderResult {
  List<DutyFreeCancelOrderSKUDetails> get skuDetail =>
      throw _privateConstructorUsedError;
  List<PassengerDetailsResponse> get passengerDetail =>
      throw _privateConstructorUsedError;
  PromoCodeResponse get promoCoupon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeCancelOrderResultCopyWith<DutyFreeCancelOrderResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeCancelOrderResultCopyWith<$Res> {
  factory $DutyFreeCancelOrderResultCopyWith(DutyFreeCancelOrderResult value,
          $Res Function(DutyFreeCancelOrderResult) then) =
      _$DutyFreeCancelOrderResultCopyWithImpl<$Res, DutyFreeCancelOrderResult>;
  @useResult
  $Res call(
      {List<DutyFreeCancelOrderSKUDetails> skuDetail,
      List<PassengerDetailsResponse> passengerDetail,
      PromoCodeResponse promoCoupon});

  $PromoCodeResponseCopyWith<$Res> get promoCoupon;
}

/// @nodoc
class _$DutyFreeCancelOrderResultCopyWithImpl<$Res,
        $Val extends DutyFreeCancelOrderResult>
    implements $DutyFreeCancelOrderResultCopyWith<$Res> {
  _$DutyFreeCancelOrderResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skuDetail = null,
    Object? passengerDetail = null,
    Object? promoCoupon = null,
  }) {
    return _then(_value.copyWith(
      skuDetail: null == skuDetail
          ? _value.skuDetail
          : skuDetail // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeCancelOrderSKUDetails>,
      passengerDetail: null == passengerDetail
          ? _value.passengerDetail
          : passengerDetail // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetailsResponse>,
      promoCoupon: null == promoCoupon
          ? _value.promoCoupon
          : promoCoupon // ignore: cast_nullable_to_non_nullable
              as PromoCodeResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromoCodeResponseCopyWith<$Res> get promoCoupon {
    return $PromoCodeResponseCopyWith<$Res>(_value.promoCoupon, (value) {
      return _then(_value.copyWith(promoCoupon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DutyFreeCancelOrderResultCopyWith<$Res>
    implements $DutyFreeCancelOrderResultCopyWith<$Res> {
  factory _$$_DutyFreeCancelOrderResultCopyWith(
          _$_DutyFreeCancelOrderResult value,
          $Res Function(_$_DutyFreeCancelOrderResult) then) =
      __$$_DutyFreeCancelOrderResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DutyFreeCancelOrderSKUDetails> skuDetail,
      List<PassengerDetailsResponse> passengerDetail,
      PromoCodeResponse promoCoupon});

  @override
  $PromoCodeResponseCopyWith<$Res> get promoCoupon;
}

/// @nodoc
class __$$_DutyFreeCancelOrderResultCopyWithImpl<$Res>
    extends _$DutyFreeCancelOrderResultCopyWithImpl<$Res,
        _$_DutyFreeCancelOrderResult>
    implements _$$_DutyFreeCancelOrderResultCopyWith<$Res> {
  __$$_DutyFreeCancelOrderResultCopyWithImpl(
      _$_DutyFreeCancelOrderResult _value,
      $Res Function(_$_DutyFreeCancelOrderResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skuDetail = null,
    Object? passengerDetail = null,
    Object? promoCoupon = null,
  }) {
    return _then(_$_DutyFreeCancelOrderResult(
      skuDetail: null == skuDetail
          ? _value.skuDetail
          : skuDetail // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeCancelOrderSKUDetails>,
      passengerDetail: null == passengerDetail
          ? _value.passengerDetail
          : passengerDetail // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetailsResponse>,
      promoCoupon: null == promoCoupon
          ? _value.promoCoupon
          : promoCoupon // ignore: cast_nullable_to_non_nullable
              as PromoCodeResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeCancelOrderResult
    with DiagnosticableTreeMixin
    implements _DutyFreeCancelOrderResult {
  const _$_DutyFreeCancelOrderResult(
      {this.skuDetail = const [],
      this.passengerDetail = const [],
      this.promoCoupon = const PromoCodeResponse()});

  factory _$_DutyFreeCancelOrderResult.fromJson(Map<String, dynamic> json) =>
      _$$_DutyFreeCancelOrderResultFromJson(json);

  @override
  @JsonKey()
  final List<DutyFreeCancelOrderSKUDetails> skuDetail;
  @override
  @JsonKey()
  final List<PassengerDetailsResponse> passengerDetail;
  @override
  @JsonKey()
  final PromoCodeResponse promoCoupon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DutyFreeCancelOrderResult(skuDetail: $skuDetail, passengerDetail: $passengerDetail, promoCoupon: $promoCoupon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DutyFreeCancelOrderResult'))
      ..add(DiagnosticsProperty('skuDetail', skuDetail))
      ..add(DiagnosticsProperty('passengerDetail', passengerDetail))
      ..add(DiagnosticsProperty('promoCoupon', promoCoupon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeCancelOrderResult &&
            const DeepCollectionEquality().equals(other.skuDetail, skuDetail) &&
            const DeepCollectionEquality()
                .equals(other.passengerDetail, passengerDetail) &&
            (identical(other.promoCoupon, promoCoupon) ||
                other.promoCoupon == promoCoupon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(skuDetail),
      const DeepCollectionEquality().hash(passengerDetail),
      promoCoupon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeCancelOrderResultCopyWith<_$_DutyFreeCancelOrderResult>
      get copyWith => __$$_DutyFreeCancelOrderResultCopyWithImpl<
          _$_DutyFreeCancelOrderResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeCancelOrderResultToJson(
      this,
    );
  }
}

abstract class _DutyFreeCancelOrderResult implements DutyFreeCancelOrderResult {
  const factory _DutyFreeCancelOrderResult(
      {final List<DutyFreeCancelOrderSKUDetails> skuDetail,
      final List<PassengerDetailsResponse> passengerDetail,
      final PromoCodeResponse promoCoupon}) = _$_DutyFreeCancelOrderResult;

  factory _DutyFreeCancelOrderResult.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeCancelOrderResult.fromJson;

  @override
  List<DutyFreeCancelOrderSKUDetails> get skuDetail;
  @override
  List<PassengerDetailsResponse> get passengerDetail;
  @override
  PromoCodeResponse get promoCoupon;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeCancelOrderResultCopyWith<_$_DutyFreeCancelOrderResult>
      get copyWith => throw _privateConstructorUsedError;
}
