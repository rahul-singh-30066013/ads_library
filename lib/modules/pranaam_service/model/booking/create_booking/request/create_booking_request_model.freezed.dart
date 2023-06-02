// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_booking_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateBookingRequestModel _$CreateBookingRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateBookingRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateBookingRequestModel {
  @JsonKey(name: 'cartId')
  String get cartId => throw _privateConstructorUsedError;
  @JsonKey(name: 'BookingStatus')
  String get bookingStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookedOn')
  String get bookedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsGSTEnable')
  bool get isGSTEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'travelers')
  List<TravellersModel> get travellers => throw _privateConstructorUsedError;
  @JsonKey(name: 'placardInfo')
  PlacardInfo? get placardInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'billingInfo')
  BillingInfo? get billingInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBookingRequestModelCopyWith<CreateBookingRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingRequestModelCopyWith<$Res> {
  factory $CreateBookingRequestModelCopyWith(CreateBookingRequestModel value,
          $Res Function(CreateBookingRequestModel) then) =
      _$CreateBookingRequestModelCopyWithImpl<$Res, CreateBookingRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cartId') String cartId,
      @JsonKey(name: 'BookingStatus') String bookingStatusId,
      @JsonKey(name: 'bookedOn') String bookedOn,
      @JsonKey(name: 'IsGSTEnable') bool isGSTEnable,
      @JsonKey(name: 'travelers') List<TravellersModel> travellers,
      @JsonKey(name: 'placardInfo') PlacardInfo? placardInfo,
      @JsonKey(name: 'billingInfo') BillingInfo? billingInfo});

  $PlacardInfoCopyWith<$Res>? get placardInfo;
  $BillingInfoCopyWith<$Res>? get billingInfo;
}

/// @nodoc
class _$CreateBookingRequestModelCopyWithImpl<$Res,
        $Val extends CreateBookingRequestModel>
    implements $CreateBookingRequestModelCopyWith<$Res> {
  _$CreateBookingRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? bookingStatusId = null,
    Object? bookedOn = null,
    Object? isGSTEnable = null,
    Object? travellers = null,
    Object? placardInfo = freezed,
    Object? billingInfo = freezed,
  }) {
    return _then(_value.copyWith(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStatusId: null == bookingStatusId
          ? _value.bookingStatusId
          : bookingStatusId // ignore: cast_nullable_to_non_nullable
              as String,
      bookedOn: null == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String,
      isGSTEnable: null == isGSTEnable
          ? _value.isGSTEnable
          : isGSTEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      travellers: null == travellers
          ? _value.travellers
          : travellers // ignore: cast_nullable_to_non_nullable
              as List<TravellersModel>,
      placardInfo: freezed == placardInfo
          ? _value.placardInfo
          : placardInfo // ignore: cast_nullable_to_non_nullable
              as PlacardInfo?,
      billingInfo: freezed == billingInfo
          ? _value.billingInfo
          : billingInfo // ignore: cast_nullable_to_non_nullable
              as BillingInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlacardInfoCopyWith<$Res>? get placardInfo {
    if (_value.placardInfo == null) {
      return null;
    }

    return $PlacardInfoCopyWith<$Res>(_value.placardInfo!, (value) {
      return _then(_value.copyWith(placardInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BillingInfoCopyWith<$Res>? get billingInfo {
    if (_value.billingInfo == null) {
      return null;
    }

    return $BillingInfoCopyWith<$Res>(_value.billingInfo!, (value) {
      return _then(_value.copyWith(billingInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateBookingRequestModelCopyWith<$Res>
    implements $CreateBookingRequestModelCopyWith<$Res> {
  factory _$$_CreateBookingRequestModelCopyWith(
          _$_CreateBookingRequestModel value,
          $Res Function(_$_CreateBookingRequestModel) then) =
      __$$_CreateBookingRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cartId') String cartId,
      @JsonKey(name: 'BookingStatus') String bookingStatusId,
      @JsonKey(name: 'bookedOn') String bookedOn,
      @JsonKey(name: 'IsGSTEnable') bool isGSTEnable,
      @JsonKey(name: 'travelers') List<TravellersModel> travellers,
      @JsonKey(name: 'placardInfo') PlacardInfo? placardInfo,
      @JsonKey(name: 'billingInfo') BillingInfo? billingInfo});

  @override
  $PlacardInfoCopyWith<$Res>? get placardInfo;
  @override
  $BillingInfoCopyWith<$Res>? get billingInfo;
}

/// @nodoc
class __$$_CreateBookingRequestModelCopyWithImpl<$Res>
    extends _$CreateBookingRequestModelCopyWithImpl<$Res,
        _$_CreateBookingRequestModel>
    implements _$$_CreateBookingRequestModelCopyWith<$Res> {
  __$$_CreateBookingRequestModelCopyWithImpl(
      _$_CreateBookingRequestModel _value,
      $Res Function(_$_CreateBookingRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? bookingStatusId = null,
    Object? bookedOn = null,
    Object? isGSTEnable = null,
    Object? travellers = null,
    Object? placardInfo = freezed,
    Object? billingInfo = freezed,
  }) {
    return _then(_$_CreateBookingRequestModel(
      cartId: null == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStatusId: null == bookingStatusId
          ? _value.bookingStatusId
          : bookingStatusId // ignore: cast_nullable_to_non_nullable
              as String,
      bookedOn: null == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String,
      isGSTEnable: null == isGSTEnable
          ? _value.isGSTEnable
          : isGSTEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      travellers: null == travellers
          ? _value.travellers
          : travellers // ignore: cast_nullable_to_non_nullable
              as List<TravellersModel>,
      placardInfo: freezed == placardInfo
          ? _value.placardInfo
          : placardInfo // ignore: cast_nullable_to_non_nullable
              as PlacardInfo?,
      billingInfo: freezed == billingInfo
          ? _value.billingInfo
          : billingInfo // ignore: cast_nullable_to_non_nullable
              as BillingInfo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CreateBookingRequestModel implements _CreateBookingRequestModel {
  const _$_CreateBookingRequestModel(
      {@JsonKey(name: 'cartId') this.cartId = '0',
      @JsonKey(name: 'BookingStatus') this.bookingStatusId = '0',
      @JsonKey(name: 'bookedOn') this.bookedOn = '0',
      @JsonKey(name: 'IsGSTEnable') this.isGSTEnable = false,
      @JsonKey(name: 'travelers') this.travellers = const [],
      @JsonKey(name: 'placardInfo') this.placardInfo,
      @JsonKey(name: 'billingInfo') this.billingInfo});

  factory _$_CreateBookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreateBookingRequestModelFromJson(json);

  @override
  @JsonKey(name: 'cartId')
  final String cartId;
  @override
  @JsonKey(name: 'BookingStatus')
  final String bookingStatusId;
  @override
  @JsonKey(name: 'bookedOn')
  final String bookedOn;
  @override
  @JsonKey(name: 'IsGSTEnable')
  final bool isGSTEnable;
  @override
  @JsonKey(name: 'travelers')
  final List<TravellersModel> travellers;
  @override
  @JsonKey(name: 'placardInfo')
  final PlacardInfo? placardInfo;
  @override
  @JsonKey(name: 'billingInfo')
  final BillingInfo? billingInfo;

  @override
  String toString() {
    return 'CreateBookingRequestModel(cartId: $cartId, bookingStatusId: $bookingStatusId, bookedOn: $bookedOn, isGSTEnable: $isGSTEnable, travellers: $travellers, placardInfo: $placardInfo, billingInfo: $billingInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateBookingRequestModel &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.bookingStatusId, bookingStatusId) ||
                other.bookingStatusId == bookingStatusId) &&
            (identical(other.bookedOn, bookedOn) ||
                other.bookedOn == bookedOn) &&
            (identical(other.isGSTEnable, isGSTEnable) ||
                other.isGSTEnable == isGSTEnable) &&
            const DeepCollectionEquality()
                .equals(other.travellers, travellers) &&
            (identical(other.placardInfo, placardInfo) ||
                other.placardInfo == placardInfo) &&
            (identical(other.billingInfo, billingInfo) ||
                other.billingInfo == billingInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cartId,
      bookingStatusId,
      bookedOn,
      isGSTEnable,
      const DeepCollectionEquality().hash(travellers),
      placardInfo,
      billingInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateBookingRequestModelCopyWith<_$_CreateBookingRequestModel>
      get copyWith => __$$_CreateBookingRequestModelCopyWithImpl<
          _$_CreateBookingRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateBookingRequestModelToJson(
      this,
    );
  }
}

abstract class _CreateBookingRequestModel implements CreateBookingRequestModel {
  const factory _CreateBookingRequestModel(
          {@JsonKey(name: 'cartId') final String cartId,
          @JsonKey(name: 'BookingStatus') final String bookingStatusId,
          @JsonKey(name: 'bookedOn') final String bookedOn,
          @JsonKey(name: 'IsGSTEnable') final bool isGSTEnable,
          @JsonKey(name: 'travelers') final List<TravellersModel> travellers,
          @JsonKey(name: 'placardInfo') final PlacardInfo? placardInfo,
          @JsonKey(name: 'billingInfo') final BillingInfo? billingInfo}) =
      _$_CreateBookingRequestModel;

  factory _CreateBookingRequestModel.fromJson(Map<String, dynamic> json) =
      _$_CreateBookingRequestModel.fromJson;

  @override
  @JsonKey(name: 'cartId')
  String get cartId;
  @override
  @JsonKey(name: 'BookingStatus')
  String get bookingStatusId;
  @override
  @JsonKey(name: 'bookedOn')
  String get bookedOn;
  @override
  @JsonKey(name: 'IsGSTEnable')
  bool get isGSTEnable;
  @override
  @JsonKey(name: 'travelers')
  List<TravellersModel> get travellers;
  @override
  @JsonKey(name: 'placardInfo')
  PlacardInfo? get placardInfo;
  @override
  @JsonKey(name: 'billingInfo')
  BillingInfo? get billingInfo;
  @override
  @JsonKey(ignore: true)
  _$$_CreateBookingRequestModelCopyWith<_$_CreateBookingRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
