// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cart_item_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddCartItemRequestModel _$AddCartItemRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AddCartItemRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AddCartItemRequestModel {
  @JsonKey(name: 'travelSectorId')
  int get travelSectorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceTypeId')
  int get serviceTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceType')
  String get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'travelSector')
  String get travelSector => throw _privateConstructorUsedError;
  @JsonKey(name: 'PranaamBookingType')
  String get pranaamBookingType => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldBookingId')
  int get oldBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldBookingReferenceId')
  String get oldBookingReferenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cartNumber')
  String get cartNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'adultCount')
  int get adultCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'childCount')
  int get childCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'infantCount')
  int get infantCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'packageDetail')
  PackageDetail? get packageDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'tripDetail')
  TripDetail get tripDetail =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'pranaamBookingType') @Default('') String pranaamBookingType,
  @JsonKey(name: 'standaloneProductDetails')
  StandaloneProductDetails? get standaloneProductDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddCartItemRequestModelCopyWith<AddCartItemRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCartItemRequestModelCopyWith<$Res> {
  factory $AddCartItemRequestModelCopyWith(AddCartItemRequestModel value,
          $Res Function(AddCartItemRequestModel) then) =
      _$AddCartItemRequestModelCopyWithImpl<$Res, AddCartItemRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'travelSectorId')
          int travelSectorId,
      @JsonKey(name: 'serviceTypeId')
          int serviceTypeId,
      @JsonKey(name: 'serviceType')
          String serviceType,
      @JsonKey(name: 'travelSector')
          String travelSector,
      @JsonKey(name: 'PranaamBookingType')
          String pranaamBookingType,
      @JsonKey(name: 'OldBookingId')
          int oldBookingId,
      @JsonKey(name: 'OldBookingReferenceId')
          String oldBookingReferenceId,
      @JsonKey(name: 'cartNumber')
          String cartNumber,
      @JsonKey(name: 'adultCount')
          int adultCount,
      @JsonKey(name: 'childCount')
          int childCount,
      @JsonKey(name: 'infantCount')
          int infantCount,
      @JsonKey(name: 'createdBy')
          String createdBy,
      @JsonKey(name: 'packageDetail')
          PackageDetail? packageDetail,
      @JsonKey(name: 'tripDetail')
          TripDetail tripDetail,
      @JsonKey(name: 'standaloneProductDetails')
          StandaloneProductDetails? standaloneProductDetails});

  $PackageDetailCopyWith<$Res>? get packageDetail;
  $TripDetailCopyWith<$Res> get tripDetail;
  $StandaloneProductDetailsCopyWith<$Res>? get standaloneProductDetails;
}

/// @nodoc
class _$AddCartItemRequestModelCopyWithImpl<$Res,
        $Val extends AddCartItemRequestModel>
    implements $AddCartItemRequestModelCopyWith<$Res> {
  _$AddCartItemRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelSectorId = null,
    Object? serviceTypeId = null,
    Object? serviceType = null,
    Object? travelSector = null,
    Object? pranaamBookingType = null,
    Object? oldBookingId = null,
    Object? oldBookingReferenceId = null,
    Object? cartNumber = null,
    Object? adultCount = null,
    Object? childCount = null,
    Object? infantCount = null,
    Object? createdBy = null,
    Object? packageDetail = freezed,
    Object? tripDetail = null,
    Object? standaloneProductDetails = freezed,
  }) {
    return _then(_value.copyWith(
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as String,
      pranaamBookingType: null == pranaamBookingType
          ? _value.pranaamBookingType
          : pranaamBookingType // ignore: cast_nullable_to_non_nullable
              as String,
      oldBookingId: null == oldBookingId
          ? _value.oldBookingId
          : oldBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      oldBookingReferenceId: null == oldBookingReferenceId
          ? _value.oldBookingReferenceId
          : oldBookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      cartNumber: null == cartNumber
          ? _value.cartNumber
          : cartNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adultCount: null == adultCount
          ? _value.adultCount
          : adultCount // ignore: cast_nullable_to_non_nullable
              as int,
      childCount: null == childCount
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as int,
      infantCount: null == infantCount
          ? _value.infantCount
          : infantCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      packageDetail: freezed == packageDetail
          ? _value.packageDetail
          : packageDetail // ignore: cast_nullable_to_non_nullable
              as PackageDetail?,
      tripDetail: null == tripDetail
          ? _value.tripDetail
          : tripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      standaloneProductDetails: freezed == standaloneProductDetails
          ? _value.standaloneProductDetails
          : standaloneProductDetails // ignore: cast_nullable_to_non_nullable
              as StandaloneProductDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PackageDetailCopyWith<$Res>? get packageDetail {
    if (_value.packageDetail == null) {
      return null;
    }

    return $PackageDetailCopyWith<$Res>(_value.packageDetail!, (value) {
      return _then(_value.copyWith(packageDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TripDetailCopyWith<$Res> get tripDetail {
    return $TripDetailCopyWith<$Res>(_value.tripDetail, (value) {
      return _then(_value.copyWith(tripDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StandaloneProductDetailsCopyWith<$Res>? get standaloneProductDetails {
    if (_value.standaloneProductDetails == null) {
      return null;
    }

    return $StandaloneProductDetailsCopyWith<$Res>(
        _value.standaloneProductDetails!, (value) {
      return _then(_value.copyWith(standaloneProductDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddCartItemRequestModelCopyWith<$Res>
    implements $AddCartItemRequestModelCopyWith<$Res> {
  factory _$$_AddCartItemRequestModelCopyWith(_$_AddCartItemRequestModel value,
          $Res Function(_$_AddCartItemRequestModel) then) =
      __$$_AddCartItemRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'travelSectorId')
          int travelSectorId,
      @JsonKey(name: 'serviceTypeId')
          int serviceTypeId,
      @JsonKey(name: 'serviceType')
          String serviceType,
      @JsonKey(name: 'travelSector')
          String travelSector,
      @JsonKey(name: 'PranaamBookingType')
          String pranaamBookingType,
      @JsonKey(name: 'OldBookingId')
          int oldBookingId,
      @JsonKey(name: 'OldBookingReferenceId')
          String oldBookingReferenceId,
      @JsonKey(name: 'cartNumber')
          String cartNumber,
      @JsonKey(name: 'adultCount')
          int adultCount,
      @JsonKey(name: 'childCount')
          int childCount,
      @JsonKey(name: 'infantCount')
          int infantCount,
      @JsonKey(name: 'createdBy')
          String createdBy,
      @JsonKey(name: 'packageDetail')
          PackageDetail? packageDetail,
      @JsonKey(name: 'tripDetail')
          TripDetail tripDetail,
      @JsonKey(name: 'standaloneProductDetails')
          StandaloneProductDetails? standaloneProductDetails});

  @override
  $PackageDetailCopyWith<$Res>? get packageDetail;
  @override
  $TripDetailCopyWith<$Res> get tripDetail;
  @override
  $StandaloneProductDetailsCopyWith<$Res>? get standaloneProductDetails;
}

/// @nodoc
class __$$_AddCartItemRequestModelCopyWithImpl<$Res>
    extends _$AddCartItemRequestModelCopyWithImpl<$Res,
        _$_AddCartItemRequestModel>
    implements _$$_AddCartItemRequestModelCopyWith<$Res> {
  __$$_AddCartItemRequestModelCopyWithImpl(_$_AddCartItemRequestModel _value,
      $Res Function(_$_AddCartItemRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelSectorId = null,
    Object? serviceTypeId = null,
    Object? serviceType = null,
    Object? travelSector = null,
    Object? pranaamBookingType = null,
    Object? oldBookingId = null,
    Object? oldBookingReferenceId = null,
    Object? cartNumber = null,
    Object? adultCount = null,
    Object? childCount = null,
    Object? infantCount = null,
    Object? createdBy = null,
    Object? packageDetail = freezed,
    Object? tripDetail = null,
    Object? standaloneProductDetails = freezed,
  }) {
    return _then(_$_AddCartItemRequestModel(
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as String,
      pranaamBookingType: null == pranaamBookingType
          ? _value.pranaamBookingType
          : pranaamBookingType // ignore: cast_nullable_to_non_nullable
              as String,
      oldBookingId: null == oldBookingId
          ? _value.oldBookingId
          : oldBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      oldBookingReferenceId: null == oldBookingReferenceId
          ? _value.oldBookingReferenceId
          : oldBookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      cartNumber: null == cartNumber
          ? _value.cartNumber
          : cartNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adultCount: null == adultCount
          ? _value.adultCount
          : adultCount // ignore: cast_nullable_to_non_nullable
              as int,
      childCount: null == childCount
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as int,
      infantCount: null == infantCount
          ? _value.infantCount
          : infantCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      packageDetail: freezed == packageDetail
          ? _value.packageDetail
          : packageDetail // ignore: cast_nullable_to_non_nullable
              as PackageDetail?,
      tripDetail: null == tripDetail
          ? _value.tripDetail
          : tripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      standaloneProductDetails: freezed == standaloneProductDetails
          ? _value.standaloneProductDetails
          : standaloneProductDetails // ignore: cast_nullable_to_non_nullable
              as StandaloneProductDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddCartItemRequestModel implements _AddCartItemRequestModel {
  const _$_AddCartItemRequestModel(
      {@JsonKey(name: 'travelSectorId')
          required this.travelSectorId,
      @JsonKey(name: 'serviceTypeId')
          required this.serviceTypeId,
      @JsonKey(name: 'serviceType')
          required this.serviceType,
      @JsonKey(name: 'travelSector')
          required this.travelSector,
      @JsonKey(name: 'PranaamBookingType')
          required this.pranaamBookingType,
      @JsonKey(name: 'OldBookingId')
          this.oldBookingId = 0,
      @JsonKey(name: 'OldBookingReferenceId')
          this.oldBookingReferenceId = '',
      @JsonKey(name: 'cartNumber')
          this.cartNumber = '',
      @JsonKey(name: 'adultCount')
          this.adultCount = 0,
      @JsonKey(name: 'childCount')
          this.childCount = 0,
      @JsonKey(name: 'infantCount')
          this.infantCount = 0,
      @JsonKey(name: 'createdBy')
          this.createdBy = '',
      @JsonKey(name: 'packageDetail')
          this.packageDetail,
      @JsonKey(name: 'tripDetail')
          required this.tripDetail,
      @JsonKey(name: 'standaloneProductDetails')
          this.standaloneProductDetails});

  factory _$_AddCartItemRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddCartItemRequestModelFromJson(json);

  @override
  @JsonKey(name: 'travelSectorId')
  final int travelSectorId;
  @override
  @JsonKey(name: 'serviceTypeId')
  final int serviceTypeId;
  @override
  @JsonKey(name: 'serviceType')
  final String serviceType;
  @override
  @JsonKey(name: 'travelSector')
  final String travelSector;
  @override
  @JsonKey(name: 'PranaamBookingType')
  final String pranaamBookingType;
  @override
  @JsonKey(name: 'OldBookingId')
  final int oldBookingId;
  @override
  @JsonKey(name: 'OldBookingReferenceId')
  final String oldBookingReferenceId;
  @override
  @JsonKey(name: 'cartNumber')
  final String cartNumber;
  @override
  @JsonKey(name: 'adultCount')
  final int adultCount;
  @override
  @JsonKey(name: 'childCount')
  final int childCount;
  @override
  @JsonKey(name: 'infantCount')
  final int infantCount;
  @override
  @JsonKey(name: 'createdBy')
  final String createdBy;
  @override
  @JsonKey(name: 'packageDetail')
  final PackageDetail? packageDetail;
  @override
  @JsonKey(name: 'tripDetail')
  final TripDetail tripDetail;
// @JsonKey(name: 'pranaamBookingType') @Default('') String pranaamBookingType,
  @override
  @JsonKey(name: 'standaloneProductDetails')
  final StandaloneProductDetails? standaloneProductDetails;

  @override
  String toString() {
    return 'AddCartItemRequestModel(travelSectorId: $travelSectorId, serviceTypeId: $serviceTypeId, serviceType: $serviceType, travelSector: $travelSector, pranaamBookingType: $pranaamBookingType, oldBookingId: $oldBookingId, oldBookingReferenceId: $oldBookingReferenceId, cartNumber: $cartNumber, adultCount: $adultCount, childCount: $childCount, infantCount: $infantCount, createdBy: $createdBy, packageDetail: $packageDetail, tripDetail: $tripDetail, standaloneProductDetails: $standaloneProductDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCartItemRequestModel &&
            (identical(other.travelSectorId, travelSectorId) ||
                other.travelSectorId == travelSectorId) &&
            (identical(other.serviceTypeId, serviceTypeId) ||
                other.serviceTypeId == serviceTypeId) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.travelSector, travelSector) ||
                other.travelSector == travelSector) &&
            (identical(other.pranaamBookingType, pranaamBookingType) ||
                other.pranaamBookingType == pranaamBookingType) &&
            (identical(other.oldBookingId, oldBookingId) ||
                other.oldBookingId == oldBookingId) &&
            (identical(other.oldBookingReferenceId, oldBookingReferenceId) ||
                other.oldBookingReferenceId == oldBookingReferenceId) &&
            (identical(other.cartNumber, cartNumber) ||
                other.cartNumber == cartNumber) &&
            (identical(other.adultCount, adultCount) ||
                other.adultCount == adultCount) &&
            (identical(other.childCount, childCount) ||
                other.childCount == childCount) &&
            (identical(other.infantCount, infantCount) ||
                other.infantCount == infantCount) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.packageDetail, packageDetail) ||
                other.packageDetail == packageDetail) &&
            (identical(other.tripDetail, tripDetail) ||
                other.tripDetail == tripDetail) &&
            (identical(
                    other.standaloneProductDetails, standaloneProductDetails) ||
                other.standaloneProductDetails == standaloneProductDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      travelSectorId,
      serviceTypeId,
      serviceType,
      travelSector,
      pranaamBookingType,
      oldBookingId,
      oldBookingReferenceId,
      cartNumber,
      adultCount,
      childCount,
      infantCount,
      createdBy,
      packageDetail,
      tripDetail,
      standaloneProductDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCartItemRequestModelCopyWith<_$_AddCartItemRequestModel>
      get copyWith =>
          __$$_AddCartItemRequestModelCopyWithImpl<_$_AddCartItemRequestModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddCartItemRequestModelToJson(
      this,
    );
  }
}

abstract class _AddCartItemRequestModel implements AddCartItemRequestModel {
  const factory _AddCartItemRequestModel(
          {@JsonKey(name: 'travelSectorId')
              required final int travelSectorId,
          @JsonKey(name: 'serviceTypeId')
              required final int serviceTypeId,
          @JsonKey(name: 'serviceType')
              required final String serviceType,
          @JsonKey(name: 'travelSector')
              required final String travelSector,
          @JsonKey(name: 'PranaamBookingType')
              required final String pranaamBookingType,
          @JsonKey(name: 'OldBookingId')
              final int oldBookingId,
          @JsonKey(name: 'OldBookingReferenceId')
              final String oldBookingReferenceId,
          @JsonKey(name: 'cartNumber')
              final String cartNumber,
          @JsonKey(name: 'adultCount')
              final int adultCount,
          @JsonKey(name: 'childCount')
              final int childCount,
          @JsonKey(name: 'infantCount')
              final int infantCount,
          @JsonKey(name: 'createdBy')
              final String createdBy,
          @JsonKey(name: 'packageDetail')
              final PackageDetail? packageDetail,
          @JsonKey(name: 'tripDetail')
              required final TripDetail tripDetail,
          @JsonKey(name: 'standaloneProductDetails')
              final StandaloneProductDetails? standaloneProductDetails}) =
      _$_AddCartItemRequestModel;

  factory _AddCartItemRequestModel.fromJson(Map<String, dynamic> json) =
      _$_AddCartItemRequestModel.fromJson;

  @override
  @JsonKey(name: 'travelSectorId')
  int get travelSectorId;
  @override
  @JsonKey(name: 'serviceTypeId')
  int get serviceTypeId;
  @override
  @JsonKey(name: 'serviceType')
  String get serviceType;
  @override
  @JsonKey(name: 'travelSector')
  String get travelSector;
  @override
  @JsonKey(name: 'PranaamBookingType')
  String get pranaamBookingType;
  @override
  @JsonKey(name: 'OldBookingId')
  int get oldBookingId;
  @override
  @JsonKey(name: 'OldBookingReferenceId')
  String get oldBookingReferenceId;
  @override
  @JsonKey(name: 'cartNumber')
  String get cartNumber;
  @override
  @JsonKey(name: 'adultCount')
  int get adultCount;
  @override
  @JsonKey(name: 'childCount')
  int get childCount;
  @override
  @JsonKey(name: 'infantCount')
  int get infantCount;
  @override
  @JsonKey(name: 'createdBy')
  String get createdBy;
  @override
  @JsonKey(name: 'packageDetail')
  PackageDetail? get packageDetail;
  @override
  @JsonKey(name: 'tripDetail')
  TripDetail get tripDetail;
  @override // @JsonKey(name: 'pranaamBookingType') @Default('') String pranaamBookingType,
  @JsonKey(name: 'standaloneProductDetails')
  StandaloneProductDetails? get standaloneProductDetails;
  @override
  @JsonKey(ignore: true)
  _$$_AddCartItemRequestModelCopyWith<_$_AddCartItemRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

StandaloneProductDetails _$StandaloneProductDetailsFromJson(
    Map<String, dynamic> json) {
  return _StandaloneProductDetails.fromJson(json);
}

/// @nodoc
mixin _$StandaloneProductDetails {
  @JsonKey(name: 'pricingInfo')
  PricingInfo get pricingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemCount')
  int get itemCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StandaloneProductDetailsCopyWith<StandaloneProductDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandaloneProductDetailsCopyWith<$Res> {
  factory $StandaloneProductDetailsCopyWith(StandaloneProductDetails value,
          $Res Function(StandaloneProductDetails) then) =
      _$StandaloneProductDetailsCopyWithImpl<$Res, StandaloneProductDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pricingInfo') PricingInfo pricingInfo,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'itemCount') int itemCount});

  $PricingInfoCopyWith<$Res> get pricingInfo;
}

/// @nodoc
class _$StandaloneProductDetailsCopyWithImpl<$Res,
        $Val extends StandaloneProductDetails>
    implements $StandaloneProductDetailsCopyWith<$Res> {
  _$StandaloneProductDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricingInfo = null,
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? itemCount = null,
  }) {
    return _then(_value.copyWith(
      pricingInfo: null == pricingInfo
          ? _value.pricingInfo
          : pricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PricingInfoCopyWith<$Res> get pricingInfo {
    return $PricingInfoCopyWith<$Res>(_value.pricingInfo, (value) {
      return _then(_value.copyWith(pricingInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StandaloneProductDetailsCopyWith<$Res>
    implements $StandaloneProductDetailsCopyWith<$Res> {
  factory _$$_StandaloneProductDetailsCopyWith(
          _$_StandaloneProductDetails value,
          $Res Function(_$_StandaloneProductDetails) then) =
      __$$_StandaloneProductDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pricingInfo') PricingInfo pricingInfo,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'itemCount') int itemCount});

  @override
  $PricingInfoCopyWith<$Res> get pricingInfo;
}

/// @nodoc
class __$$_StandaloneProductDetailsCopyWithImpl<$Res>
    extends _$StandaloneProductDetailsCopyWithImpl<$Res,
        _$_StandaloneProductDetails>
    implements _$$_StandaloneProductDetailsCopyWith<$Res> {
  __$$_StandaloneProductDetailsCopyWithImpl(_$_StandaloneProductDetails _value,
      $Res Function(_$_StandaloneProductDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pricingInfo = null,
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? itemCount = null,
  }) {
    return _then(_$_StandaloneProductDetails(
      pricingInfo: null == pricingInfo
          ? _value.pricingInfo
          : pricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StandaloneProductDetails implements _StandaloneProductDetails {
  const _$_StandaloneProductDetails(
      {@JsonKey(name: 'pricingInfo') this.pricingInfo = const PricingInfo(),
      @JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'itemCount') this.itemCount = 0});

  factory _$_StandaloneProductDetails.fromJson(Map<String, dynamic> json) =>
      _$$_StandaloneProductDetailsFromJson(json);

  @override
  @JsonKey(name: 'pricingInfo')
  final PricingInfo pricingInfo;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'itemCount')
  final int itemCount;

  @override
  String toString() {
    return 'StandaloneProductDetails(pricingInfo: $pricingInfo, id: $id, name: $name, description: $description, itemCount: $itemCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StandaloneProductDetails &&
            (identical(other.pricingInfo, pricingInfo) ||
                other.pricingInfo == pricingInfo) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pricingInfo, id, name, description, itemCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StandaloneProductDetailsCopyWith<_$_StandaloneProductDetails>
      get copyWith => __$$_StandaloneProductDetailsCopyWithImpl<
          _$_StandaloneProductDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StandaloneProductDetailsToJson(
      this,
    );
  }
}

abstract class _StandaloneProductDetails implements StandaloneProductDetails {
  const factory _StandaloneProductDetails(
          {@JsonKey(name: 'pricingInfo') final PricingInfo pricingInfo,
          @JsonKey(name: 'id') final int id,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'description') final String description,
          @JsonKey(name: 'itemCount') final int itemCount}) =
      _$_StandaloneProductDetails;

  factory _StandaloneProductDetails.fromJson(Map<String, dynamic> json) =
      _$_StandaloneProductDetails.fromJson;

  @override
  @JsonKey(name: 'pricingInfo')
  PricingInfo get pricingInfo;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'itemCount')
  int get itemCount;
  @override
  @JsonKey(ignore: true)
  _$$_StandaloneProductDetailsCopyWith<_$_StandaloneProductDetails>
      get copyWith => throw _privateConstructorUsedError;
}
