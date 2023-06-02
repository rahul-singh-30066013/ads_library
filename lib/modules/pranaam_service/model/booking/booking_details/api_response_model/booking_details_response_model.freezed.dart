// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_details_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingDetailsResponseModel _$BookingDetailsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _BookingDetailsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BookingDetailsResponseModel {
  @JsonKey(name: 'createBooking')
  CreateBooking get createBooking => throw _privateConstructorUsedError;
  @JsonKey(name: 'packageDeatil')
  PackageDetail get packageDeatil => throw _privateConstructorUsedError;
  @JsonKey(name: 'standAloneProductDetails')
  PackageDetail get standAloneProductDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDetailsResponseModelCopyWith<BookingDetailsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDetailsResponseModelCopyWith<$Res> {
  factory $BookingDetailsResponseModelCopyWith(
          BookingDetailsResponseModel value,
          $Res Function(BookingDetailsResponseModel) then) =
      _$BookingDetailsResponseModelCopyWithImpl<$Res,
          BookingDetailsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'createBooking')
          CreateBooking createBooking,
      @JsonKey(name: 'packageDeatil')
          PackageDetail packageDeatil,
      @JsonKey(name: 'standAloneProductDetails')
          PackageDetail standAloneProductDetails});

  $CreateBookingCopyWith<$Res> get createBooking;
  $PackageDetailCopyWith<$Res> get packageDeatil;
  $PackageDetailCopyWith<$Res> get standAloneProductDetails;
}

/// @nodoc
class _$BookingDetailsResponseModelCopyWithImpl<$Res,
        $Val extends BookingDetailsResponseModel>
    implements $BookingDetailsResponseModelCopyWith<$Res> {
  _$BookingDetailsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createBooking = null,
    Object? packageDeatil = null,
    Object? standAloneProductDetails = null,
  }) {
    return _then(_value.copyWith(
      createBooking: null == createBooking
          ? _value.createBooking
          : createBooking // ignore: cast_nullable_to_non_nullable
              as CreateBooking,
      packageDeatil: null == packageDeatil
          ? _value.packageDeatil
          : packageDeatil // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
      standAloneProductDetails: null == standAloneProductDetails
          ? _value.standAloneProductDetails
          : standAloneProductDetails // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateBookingCopyWith<$Res> get createBooking {
    return $CreateBookingCopyWith<$Res>(_value.createBooking, (value) {
      return _then(_value.copyWith(createBooking: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PackageDetailCopyWith<$Res> get packageDeatil {
    return $PackageDetailCopyWith<$Res>(_value.packageDeatil, (value) {
      return _then(_value.copyWith(packageDeatil: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PackageDetailCopyWith<$Res> get standAloneProductDetails {
    return $PackageDetailCopyWith<$Res>(_value.standAloneProductDetails,
        (value) {
      return _then(_value.copyWith(standAloneProductDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookingDetailsResponseModelCopyWith<$Res>
    implements $BookingDetailsResponseModelCopyWith<$Res> {
  factory _$$_BookingDetailsResponseModelCopyWith(
          _$_BookingDetailsResponseModel value,
          $Res Function(_$_BookingDetailsResponseModel) then) =
      __$$_BookingDetailsResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'createBooking')
          CreateBooking createBooking,
      @JsonKey(name: 'packageDeatil')
          PackageDetail packageDeatil,
      @JsonKey(name: 'standAloneProductDetails')
          PackageDetail standAloneProductDetails});

  @override
  $CreateBookingCopyWith<$Res> get createBooking;
  @override
  $PackageDetailCopyWith<$Res> get packageDeatil;
  @override
  $PackageDetailCopyWith<$Res> get standAloneProductDetails;
}

/// @nodoc
class __$$_BookingDetailsResponseModelCopyWithImpl<$Res>
    extends _$BookingDetailsResponseModelCopyWithImpl<$Res,
        _$_BookingDetailsResponseModel>
    implements _$$_BookingDetailsResponseModelCopyWith<$Res> {
  __$$_BookingDetailsResponseModelCopyWithImpl(
      _$_BookingDetailsResponseModel _value,
      $Res Function(_$_BookingDetailsResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createBooking = null,
    Object? packageDeatil = null,
    Object? standAloneProductDetails = null,
  }) {
    return _then(_$_BookingDetailsResponseModel(
      createBooking: null == createBooking
          ? _value.createBooking
          : createBooking // ignore: cast_nullable_to_non_nullable
              as CreateBooking,
      packageDeatil: null == packageDeatil
          ? _value.packageDeatil
          : packageDeatil // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
      standAloneProductDetails: null == standAloneProductDetails
          ? _value.standAloneProductDetails
          : standAloneProductDetails // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingDetailsResponseModel implements _BookingDetailsResponseModel {
  const _$_BookingDetailsResponseModel(
      {@JsonKey(name: 'createBooking')
          required this.createBooking,
      @JsonKey(name: 'packageDeatil')
          this.packageDeatil = const PackageDetail(),
      @JsonKey(name: 'standAloneProductDetails')
          this.standAloneProductDetails = const PackageDetail()});

  factory _$_BookingDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookingDetailsResponseModelFromJson(json);

  @override
  @JsonKey(name: 'createBooking')
  final CreateBooking createBooking;
  @override
  @JsonKey(name: 'packageDeatil')
  final PackageDetail packageDeatil;
  @override
  @JsonKey(name: 'standAloneProductDetails')
  final PackageDetail standAloneProductDetails;

  @override
  String toString() {
    return 'BookingDetailsResponseModel(createBooking: $createBooking, packageDeatil: $packageDeatil, standAloneProductDetails: $standAloneProductDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingDetailsResponseModel &&
            (identical(other.createBooking, createBooking) ||
                other.createBooking == createBooking) &&
            (identical(other.packageDeatil, packageDeatil) ||
                other.packageDeatil == packageDeatil) &&
            (identical(
                    other.standAloneProductDetails, standAloneProductDetails) ||
                other.standAloneProductDetails == standAloneProductDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createBooking, packageDeatil, standAloneProductDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingDetailsResponseModelCopyWith<_$_BookingDetailsResponseModel>
      get copyWith => __$$_BookingDetailsResponseModelCopyWithImpl<
          _$_BookingDetailsResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingDetailsResponseModelToJson(
      this,
    );
  }
}

abstract class _BookingDetailsResponseModel
    implements BookingDetailsResponseModel {
  const factory _BookingDetailsResponseModel(
          {@JsonKey(name: 'createBooking')
              required final CreateBooking createBooking,
          @JsonKey(name: 'packageDeatil')
              final PackageDetail packageDeatil,
          @JsonKey(name: 'standAloneProductDetails')
              final PackageDetail standAloneProductDetails}) =
      _$_BookingDetailsResponseModel;

  factory _BookingDetailsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_BookingDetailsResponseModel.fromJson;

  @override
  @JsonKey(name: 'createBooking')
  CreateBooking get createBooking;
  @override
  @JsonKey(name: 'packageDeatil')
  PackageDetail get packageDeatil;
  @override
  @JsonKey(name: 'standAloneProductDetails')
  PackageDetail get standAloneProductDetails;
  @override
  @JsonKey(ignore: true)
  _$$_BookingDetailsResponseModelCopyWith<_$_BookingDetailsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

CreateBooking _$CreateBookingFromJson(Map<String, dynamic> json) {
  return _CreateBooking.fromJson(json);
}

/// @nodoc
mixin _$CreateBooking {
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderId')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transctionID')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'travelSectorId')
  int get travelSectorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceTypeId')
  int get serviceTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookedOn')
  String get bookedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'numberOfAdult')
  int get numberOfAdult => throw _privateConstructorUsedError;
  @JsonKey(name: 'numberOfChild')
  int get numberOfChild => throw _privateConstructorUsedError;
  @JsonKey(name: 'numberOfInfant')
  int get numberOfInfant => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingStatusId')
  int get bookingStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'packageId')
  int get packageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tripDetail')
  TripDetail get tripDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'roundTripDetail')
  TripDetail get roundTripDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice')
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'travelers')
  List<TravellersModel> get travelers => throw _privateConstructorUsedError;
  @JsonKey(name: 'overallStatus')
  OverallStatus? get overallStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPartialCancell')
  bool get isPartialCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'isUpgradeAvailable')
  bool get isUpgradeAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'isGroupPackage')
  bool get isGroupPackage =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'pranaamBookingType') String? pranaamBookingType,
  @JsonKey(name: 'placardInfo')
  PlacardInfo get placardInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'billingInfo')
  BillingInfo get billingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOnsList')
  List<AddOnsListModel> get addOnsList => throw _privateConstructorUsedError;
  @JsonKey(name: 'loyaltyPoint')
  LoyaltyPoint? get loyaltyPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentDetails')
  List<PaymentDetails> get paymentDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'refundDetails')
  List<PaymentDetails> get refundDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleDetail')
  RescheduleDetail get rescheduleDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalFare')
  TotalFare get totalFare => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTax')
  TotalFare get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFullfilled')
  bool get isFullfilled => throw _privateConstructorUsedError;
  @JsonKey(name: 'pranaamBookingType')
  String get pranaamBookingType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBookingCopyWith<CreateBooking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingCopyWith<$Res> {
  factory $CreateBookingCopyWith(
          CreateBooking value, $Res Function(CreateBooking) then) =
      _$CreateBookingCopyWithImpl<$Res, CreateBooking>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'orderId') String orderId,
      @JsonKey(name: 'transctionID') String transactionId,
      @JsonKey(name: 'travelSectorId') int travelSectorId,
      @JsonKey(name: 'serviceTypeId') int serviceTypeId,
      @JsonKey(name: 'bookedOn') String bookedOn,
      @JsonKey(name: 'numberOfAdult') int numberOfAdult,
      @JsonKey(name: 'numberOfChild') int numberOfChild,
      @JsonKey(name: 'numberOfInfant') int numberOfInfant,
      @JsonKey(name: 'bookingStatusId') int bookingStatusId,
      @JsonKey(name: 'packageId') int packageId,
      @JsonKey(name: 'tripDetail') TripDetail tripDetail,
      @JsonKey(name: 'roundTripDetail') TripDetail roundTripDetail,
      @JsonKey(name: 'totalPrice') double totalPrice,
      @JsonKey(name: 'travelers') List<TravellersModel> travelers,
      @JsonKey(name: 'overallStatus') OverallStatus? overallStatus,
      @JsonKey(name: 'isPartialCancell') bool isPartialCancel,
      @JsonKey(name: 'isUpgradeAvailable') bool isUpgradeAvailable,
      @JsonKey(name: 'isGroupPackage') bool isGroupPackage,
      @JsonKey(name: 'placardInfo') PlacardInfo placardInfo,
      @JsonKey(name: 'billingInfo') BillingInfo billingInfo,
      @JsonKey(name: 'addOnsList') List<AddOnsListModel> addOnsList,
      @JsonKey(name: 'loyaltyPoint') LoyaltyPoint? loyaltyPoint,
      @JsonKey(name: 'paymentDetails') List<PaymentDetails> paymentDetails,
      @JsonKey(name: 'refundDetails') List<PaymentDetails> refundDetails,
      @JsonKey(name: 'rescheduleDetail') RescheduleDetail rescheduleDetail,
      @JsonKey(name: 'totalFare') TotalFare totalFare,
      @JsonKey(name: 'totalTax') TotalFare totalTax,
      @JsonKey(name: 'isFullfilled') bool isFullfilled,
      @JsonKey(name: 'pranaamBookingType') String pranaamBookingType});

  $TripDetailCopyWith<$Res> get tripDetail;
  $TripDetailCopyWith<$Res> get roundTripDetail;
  $OverallStatusCopyWith<$Res>? get overallStatus;
  $PlacardInfoCopyWith<$Res> get placardInfo;
  $BillingInfoCopyWith<$Res> get billingInfo;
  $LoyaltyPointCopyWith<$Res>? get loyaltyPoint;
  $RescheduleDetailCopyWith<$Res> get rescheduleDetail;
  $TotalFareCopyWith<$Res> get totalFare;
  $TotalFareCopyWith<$Res> get totalTax;
}

/// @nodoc
class _$CreateBookingCopyWithImpl<$Res, $Val extends CreateBooking>
    implements $CreateBookingCopyWith<$Res> {
  _$CreateBookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? orderId = null,
    Object? transactionId = null,
    Object? travelSectorId = null,
    Object? serviceTypeId = null,
    Object? bookedOn = null,
    Object? numberOfAdult = null,
    Object? numberOfChild = null,
    Object? numberOfInfant = null,
    Object? bookingStatusId = null,
    Object? packageId = null,
    Object? tripDetail = null,
    Object? roundTripDetail = null,
    Object? totalPrice = null,
    Object? travelers = null,
    Object? overallStatus = freezed,
    Object? isPartialCancel = null,
    Object? isUpgradeAvailable = null,
    Object? isGroupPackage = null,
    Object? placardInfo = null,
    Object? billingInfo = null,
    Object? addOnsList = null,
    Object? loyaltyPoint = freezed,
    Object? paymentDetails = null,
    Object? refundDetails = null,
    Object? rescheduleDetail = null,
    Object? totalFare = null,
    Object? totalTax = null,
    Object? isFullfilled = null,
    Object? pranaamBookingType = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      bookedOn: null == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAdult: null == numberOfAdult
          ? _value.numberOfAdult
          : numberOfAdult // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfChild: null == numberOfChild
          ? _value.numberOfChild
          : numberOfChild // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfInfant: null == numberOfInfant
          ? _value.numberOfInfant
          : numberOfInfant // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStatusId: null == bookingStatusId
          ? _value.bookingStatusId
          : bookingStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int,
      tripDetail: null == tripDetail
          ? _value.tripDetail
          : tripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      roundTripDetail: null == roundTripDetail
          ? _value.roundTripDetail
          : roundTripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      travelers: null == travelers
          ? _value.travelers
          : travelers // ignore: cast_nullable_to_non_nullable
              as List<TravellersModel>,
      overallStatus: freezed == overallStatus
          ? _value.overallStatus
          : overallStatus // ignore: cast_nullable_to_non_nullable
              as OverallStatus?,
      isPartialCancel: null == isPartialCancel
          ? _value.isPartialCancel
          : isPartialCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpgradeAvailable: null == isUpgradeAvailable
          ? _value.isUpgradeAvailable
          : isUpgradeAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isGroupPackage: null == isGroupPackage
          ? _value.isGroupPackage
          : isGroupPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      placardInfo: null == placardInfo
          ? _value.placardInfo
          : placardInfo // ignore: cast_nullable_to_non_nullable
              as PlacardInfo,
      billingInfo: null == billingInfo
          ? _value.billingInfo
          : billingInfo // ignore: cast_nullable_to_non_nullable
              as BillingInfo,
      addOnsList: null == addOnsList
          ? _value.addOnsList
          : addOnsList // ignore: cast_nullable_to_non_nullable
              as List<AddOnsListModel>,
      loyaltyPoint: freezed == loyaltyPoint
          ? _value.loyaltyPoint
          : loyaltyPoint // ignore: cast_nullable_to_non_nullable
              as LoyaltyPoint?,
      paymentDetails: null == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as List<PaymentDetails>,
      refundDetails: null == refundDetails
          ? _value.refundDetails
          : refundDetails // ignore: cast_nullable_to_non_nullable
              as List<PaymentDetails>,
      rescheduleDetail: null == rescheduleDetail
          ? _value.rescheduleDetail
          : rescheduleDetail // ignore: cast_nullable_to_non_nullable
              as RescheduleDetail,
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      isFullfilled: null == isFullfilled
          ? _value.isFullfilled
          : isFullfilled // ignore: cast_nullable_to_non_nullable
              as bool,
      pranaamBookingType: null == pranaamBookingType
          ? _value.pranaamBookingType
          : pranaamBookingType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  $TripDetailCopyWith<$Res> get roundTripDetail {
    return $TripDetailCopyWith<$Res>(_value.roundTripDetail, (value) {
      return _then(_value.copyWith(roundTripDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OverallStatusCopyWith<$Res>? get overallStatus {
    if (_value.overallStatus == null) {
      return null;
    }

    return $OverallStatusCopyWith<$Res>(_value.overallStatus!, (value) {
      return _then(_value.copyWith(overallStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlacardInfoCopyWith<$Res> get placardInfo {
    return $PlacardInfoCopyWith<$Res>(_value.placardInfo, (value) {
      return _then(_value.copyWith(placardInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BillingInfoCopyWith<$Res> get billingInfo {
    return $BillingInfoCopyWith<$Res>(_value.billingInfo, (value) {
      return _then(_value.copyWith(billingInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LoyaltyPointCopyWith<$Res>? get loyaltyPoint {
    if (_value.loyaltyPoint == null) {
      return null;
    }

    return $LoyaltyPointCopyWith<$Res>(_value.loyaltyPoint!, (value) {
      return _then(_value.copyWith(loyaltyPoint: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RescheduleDetailCopyWith<$Res> get rescheduleDetail {
    return $RescheduleDetailCopyWith<$Res>(_value.rescheduleDetail, (value) {
      return _then(_value.copyWith(rescheduleDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalFareCopyWith<$Res> get totalFare {
    return $TotalFareCopyWith<$Res>(_value.totalFare, (value) {
      return _then(_value.copyWith(totalFare: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalFareCopyWith<$Res> get totalTax {
    return $TotalFareCopyWith<$Res>(_value.totalTax, (value) {
      return _then(_value.copyWith(totalTax: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateBookingCopyWith<$Res>
    implements $CreateBookingCopyWith<$Res> {
  factory _$$_CreateBookingCopyWith(
          _$_CreateBooking value, $Res Function(_$_CreateBooking) then) =
      __$$_CreateBookingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'orderId') String orderId,
      @JsonKey(name: 'transctionID') String transactionId,
      @JsonKey(name: 'travelSectorId') int travelSectorId,
      @JsonKey(name: 'serviceTypeId') int serviceTypeId,
      @JsonKey(name: 'bookedOn') String bookedOn,
      @JsonKey(name: 'numberOfAdult') int numberOfAdult,
      @JsonKey(name: 'numberOfChild') int numberOfChild,
      @JsonKey(name: 'numberOfInfant') int numberOfInfant,
      @JsonKey(name: 'bookingStatusId') int bookingStatusId,
      @JsonKey(name: 'packageId') int packageId,
      @JsonKey(name: 'tripDetail') TripDetail tripDetail,
      @JsonKey(name: 'roundTripDetail') TripDetail roundTripDetail,
      @JsonKey(name: 'totalPrice') double totalPrice,
      @JsonKey(name: 'travelers') List<TravellersModel> travelers,
      @JsonKey(name: 'overallStatus') OverallStatus? overallStatus,
      @JsonKey(name: 'isPartialCancell') bool isPartialCancel,
      @JsonKey(name: 'isUpgradeAvailable') bool isUpgradeAvailable,
      @JsonKey(name: 'isGroupPackage') bool isGroupPackage,
      @JsonKey(name: 'placardInfo') PlacardInfo placardInfo,
      @JsonKey(name: 'billingInfo') BillingInfo billingInfo,
      @JsonKey(name: 'addOnsList') List<AddOnsListModel> addOnsList,
      @JsonKey(name: 'loyaltyPoint') LoyaltyPoint? loyaltyPoint,
      @JsonKey(name: 'paymentDetails') List<PaymentDetails> paymentDetails,
      @JsonKey(name: 'refundDetails') List<PaymentDetails> refundDetails,
      @JsonKey(name: 'rescheduleDetail') RescheduleDetail rescheduleDetail,
      @JsonKey(name: 'totalFare') TotalFare totalFare,
      @JsonKey(name: 'totalTax') TotalFare totalTax,
      @JsonKey(name: 'isFullfilled') bool isFullfilled,
      @JsonKey(name: 'pranaamBookingType') String pranaamBookingType});

  @override
  $TripDetailCopyWith<$Res> get tripDetail;
  @override
  $TripDetailCopyWith<$Res> get roundTripDetail;
  @override
  $OverallStatusCopyWith<$Res>? get overallStatus;
  @override
  $PlacardInfoCopyWith<$Res> get placardInfo;
  @override
  $BillingInfoCopyWith<$Res> get billingInfo;
  @override
  $LoyaltyPointCopyWith<$Res>? get loyaltyPoint;
  @override
  $RescheduleDetailCopyWith<$Res> get rescheduleDetail;
  @override
  $TotalFareCopyWith<$Res> get totalFare;
  @override
  $TotalFareCopyWith<$Res> get totalTax;
}

/// @nodoc
class __$$_CreateBookingCopyWithImpl<$Res>
    extends _$CreateBookingCopyWithImpl<$Res, _$_CreateBooking>
    implements _$$_CreateBookingCopyWith<$Res> {
  __$$_CreateBookingCopyWithImpl(
      _$_CreateBooking _value, $Res Function(_$_CreateBooking) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? orderId = null,
    Object? transactionId = null,
    Object? travelSectorId = null,
    Object? serviceTypeId = null,
    Object? bookedOn = null,
    Object? numberOfAdult = null,
    Object? numberOfChild = null,
    Object? numberOfInfant = null,
    Object? bookingStatusId = null,
    Object? packageId = null,
    Object? tripDetail = null,
    Object? roundTripDetail = null,
    Object? totalPrice = null,
    Object? travelers = null,
    Object? overallStatus = freezed,
    Object? isPartialCancel = null,
    Object? isUpgradeAvailable = null,
    Object? isGroupPackage = null,
    Object? placardInfo = null,
    Object? billingInfo = null,
    Object? addOnsList = null,
    Object? loyaltyPoint = freezed,
    Object? paymentDetails = null,
    Object? refundDetails = null,
    Object? rescheduleDetail = null,
    Object? totalFare = null,
    Object? totalTax = null,
    Object? isFullfilled = null,
    Object? pranaamBookingType = null,
  }) {
    return _then(_$_CreateBooking(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      bookedOn: null == bookedOn
          ? _value.bookedOn
          : bookedOn // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAdult: null == numberOfAdult
          ? _value.numberOfAdult
          : numberOfAdult // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfChild: null == numberOfChild
          ? _value.numberOfChild
          : numberOfChild // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfInfant: null == numberOfInfant
          ? _value.numberOfInfant
          : numberOfInfant // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStatusId: null == bookingStatusId
          ? _value.bookingStatusId
          : bookingStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int,
      tripDetail: null == tripDetail
          ? _value.tripDetail
          : tripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      roundTripDetail: null == roundTripDetail
          ? _value.roundTripDetail
          : roundTripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      travelers: null == travelers
          ? _value.travelers
          : travelers // ignore: cast_nullable_to_non_nullable
              as List<TravellersModel>,
      overallStatus: freezed == overallStatus
          ? _value.overallStatus
          : overallStatus // ignore: cast_nullable_to_non_nullable
              as OverallStatus?,
      isPartialCancel: null == isPartialCancel
          ? _value.isPartialCancel
          : isPartialCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpgradeAvailable: null == isUpgradeAvailable
          ? _value.isUpgradeAvailable
          : isUpgradeAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isGroupPackage: null == isGroupPackage
          ? _value.isGroupPackage
          : isGroupPackage // ignore: cast_nullable_to_non_nullable
              as bool,
      placardInfo: null == placardInfo
          ? _value.placardInfo
          : placardInfo // ignore: cast_nullable_to_non_nullable
              as PlacardInfo,
      billingInfo: null == billingInfo
          ? _value.billingInfo
          : billingInfo // ignore: cast_nullable_to_non_nullable
              as BillingInfo,
      addOnsList: null == addOnsList
          ? _value.addOnsList
          : addOnsList // ignore: cast_nullable_to_non_nullable
              as List<AddOnsListModel>,
      loyaltyPoint: freezed == loyaltyPoint
          ? _value.loyaltyPoint
          : loyaltyPoint // ignore: cast_nullable_to_non_nullable
              as LoyaltyPoint?,
      paymentDetails: null == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as List<PaymentDetails>,
      refundDetails: null == refundDetails
          ? _value.refundDetails
          : refundDetails // ignore: cast_nullable_to_non_nullable
              as List<PaymentDetails>,
      rescheduleDetail: null == rescheduleDetail
          ? _value.rescheduleDetail
          : rescheduleDetail // ignore: cast_nullable_to_non_nullable
              as RescheduleDetail,
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      isFullfilled: null == isFullfilled
          ? _value.isFullfilled
          : isFullfilled // ignore: cast_nullable_to_non_nullable
              as bool,
      pranaamBookingType: null == pranaamBookingType
          ? _value.pranaamBookingType
          : pranaamBookingType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateBooking implements _CreateBooking {
  const _$_CreateBooking(
      {@JsonKey(name: 'userId')
          this.userId = '',
      @JsonKey(name: 'orderId')
          this.orderId = '',
      @JsonKey(name: 'transctionID')
          this.transactionId = '',
      @JsonKey(name: 'travelSectorId')
          this.travelSectorId = 0,
      @JsonKey(name: 'serviceTypeId')
          this.serviceTypeId = 0,
      @JsonKey(name: 'bookedOn')
          this.bookedOn = '',
      @JsonKey(name: 'numberOfAdult')
          this.numberOfAdult = 0,
      @JsonKey(name: 'numberOfChild')
          this.numberOfChild = 0,
      @JsonKey(name: 'numberOfInfant')
          this.numberOfInfant = 0,
      @JsonKey(name: 'bookingStatusId')
          this.bookingStatusId = 0,
      @JsonKey(name: 'packageId')
          this.packageId = 0,
      @JsonKey(name: 'tripDetail')
          required this.tripDetail,
      @JsonKey(name: 'roundTripDetail')
          this.roundTripDetail = const TripDetail(),
      @JsonKey(name: 'totalPrice')
          this.totalPrice = 0,
      @JsonKey(name: 'travelers')
          this.travelers = const [],
      @JsonKey(name: 'overallStatus')
          required this.overallStatus,
      @JsonKey(name: 'isPartialCancell')
          this.isPartialCancel = false,
      @JsonKey(name: 'isUpgradeAvailable')
          this.isUpgradeAvailable = false,
      @JsonKey(name: 'isGroupPackage')
          this.isGroupPackage = false,
      @JsonKey(name: 'placardInfo')
          this.placardInfo = const PlacardInfo(),
      @JsonKey(name: 'billingInfo')
          this.billingInfo = const BillingInfo(),
      @JsonKey(name: 'addOnsList')
          this.addOnsList = const [],
      @JsonKey(name: 'loyaltyPoint')
          this.loyaltyPoint = const LoyaltyPoint(),
      @JsonKey(name: 'paymentDetails')
          this.paymentDetails = const [],
      @JsonKey(name: 'refundDetails')
          this.refundDetails = const [],
      @JsonKey(name: 'rescheduleDetail')
          this.rescheduleDetail = const RescheduleDetail(),
      @JsonKey(name: 'totalFare')
          this.totalFare = const TotalFare(),
      @JsonKey(name: 'totalTax')
          this.totalTax = const TotalFare(),
      @JsonKey(name: 'isFullfilled')
          this.isFullfilled = false,
      @JsonKey(name: 'pranaamBookingType')
          this.pranaamBookingType = ''});

  factory _$_CreateBooking.fromJson(Map<String, dynamic> json) =>
      _$$_CreateBookingFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'orderId')
  final String orderId;
  @override
  @JsonKey(name: 'transctionID')
  final String transactionId;
  @override
  @JsonKey(name: 'travelSectorId')
  final int travelSectorId;
  @override
  @JsonKey(name: 'serviceTypeId')
  final int serviceTypeId;
  @override
  @JsonKey(name: 'bookedOn')
  final String bookedOn;
  @override
  @JsonKey(name: 'numberOfAdult')
  final int numberOfAdult;
  @override
  @JsonKey(name: 'numberOfChild')
  final int numberOfChild;
  @override
  @JsonKey(name: 'numberOfInfant')
  final int numberOfInfant;
  @override
  @JsonKey(name: 'bookingStatusId')
  final int bookingStatusId;
  @override
  @JsonKey(name: 'packageId')
  final int packageId;
  @override
  @JsonKey(name: 'tripDetail')
  final TripDetail tripDetail;
  @override
  @JsonKey(name: 'roundTripDetail')
  final TripDetail roundTripDetail;
  @override
  @JsonKey(name: 'totalPrice')
  final double totalPrice;
  @override
  @JsonKey(name: 'travelers')
  final List<TravellersModel> travelers;
  @override
  @JsonKey(name: 'overallStatus')
  final OverallStatus? overallStatus;
  @override
  @JsonKey(name: 'isPartialCancell')
  final bool isPartialCancel;
  @override
  @JsonKey(name: 'isUpgradeAvailable')
  final bool isUpgradeAvailable;
  @override
  @JsonKey(name: 'isGroupPackage')
  final bool isGroupPackage;
// @JsonKey(name: 'pranaamBookingType') String? pranaamBookingType,
  @override
  @JsonKey(name: 'placardInfo')
  final PlacardInfo placardInfo;
  @override
  @JsonKey(name: 'billingInfo')
  final BillingInfo billingInfo;
  @override
  @JsonKey(name: 'addOnsList')
  final List<AddOnsListModel> addOnsList;
  @override
  @JsonKey(name: 'loyaltyPoint')
  final LoyaltyPoint? loyaltyPoint;
  @override
  @JsonKey(name: 'paymentDetails')
  final List<PaymentDetails> paymentDetails;
  @override
  @JsonKey(name: 'refundDetails')
  final List<PaymentDetails> refundDetails;
  @override
  @JsonKey(name: 'rescheduleDetail')
  final RescheduleDetail rescheduleDetail;
  @override
  @JsonKey(name: 'totalFare')
  final TotalFare totalFare;
  @override
  @JsonKey(name: 'totalTax')
  final TotalFare totalTax;
  @override
  @JsonKey(name: 'isFullfilled')
  final bool isFullfilled;
  @override
  @JsonKey(name: 'pranaamBookingType')
  final String pranaamBookingType;

  @override
  String toString() {
    return 'CreateBooking(userId: $userId, orderId: $orderId, transactionId: $transactionId, travelSectorId: $travelSectorId, serviceTypeId: $serviceTypeId, bookedOn: $bookedOn, numberOfAdult: $numberOfAdult, numberOfChild: $numberOfChild, numberOfInfant: $numberOfInfant, bookingStatusId: $bookingStatusId, packageId: $packageId, tripDetail: $tripDetail, roundTripDetail: $roundTripDetail, totalPrice: $totalPrice, travelers: $travelers, overallStatus: $overallStatus, isPartialCancel: $isPartialCancel, isUpgradeAvailable: $isUpgradeAvailable, isGroupPackage: $isGroupPackage, placardInfo: $placardInfo, billingInfo: $billingInfo, addOnsList: $addOnsList, loyaltyPoint: $loyaltyPoint, paymentDetails: $paymentDetails, refundDetails: $refundDetails, rescheduleDetail: $rescheduleDetail, totalFare: $totalFare, totalTax: $totalTax, isFullfilled: $isFullfilled, pranaamBookingType: $pranaamBookingType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateBooking &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.travelSectorId, travelSectorId) ||
                other.travelSectorId == travelSectorId) &&
            (identical(other.serviceTypeId, serviceTypeId) ||
                other.serviceTypeId == serviceTypeId) &&
            (identical(other.bookedOn, bookedOn) ||
                other.bookedOn == bookedOn) &&
            (identical(other.numberOfAdult, numberOfAdult) ||
                other.numberOfAdult == numberOfAdult) &&
            (identical(other.numberOfChild, numberOfChild) ||
                other.numberOfChild == numberOfChild) &&
            (identical(other.numberOfInfant, numberOfInfant) ||
                other.numberOfInfant == numberOfInfant) &&
            (identical(other.bookingStatusId, bookingStatusId) ||
                other.bookingStatusId == bookingStatusId) &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.tripDetail, tripDetail) ||
                other.tripDetail == tripDetail) &&
            (identical(other.roundTripDetail, roundTripDetail) ||
                other.roundTripDetail == roundTripDetail) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(other.travelers, travelers) &&
            (identical(other.overallStatus, overallStatus) ||
                other.overallStatus == overallStatus) &&
            (identical(other.isPartialCancel, isPartialCancel) ||
                other.isPartialCancel == isPartialCancel) &&
            (identical(other.isUpgradeAvailable, isUpgradeAvailable) ||
                other.isUpgradeAvailable == isUpgradeAvailable) &&
            (identical(other.isGroupPackage, isGroupPackage) ||
                other.isGroupPackage == isGroupPackage) &&
            (identical(other.placardInfo, placardInfo) ||
                other.placardInfo == placardInfo) &&
            (identical(other.billingInfo, billingInfo) ||
                other.billingInfo == billingInfo) &&
            const DeepCollectionEquality()
                .equals(other.addOnsList, addOnsList) &&
            (identical(other.loyaltyPoint, loyaltyPoint) ||
                other.loyaltyPoint == loyaltyPoint) &&
            const DeepCollectionEquality()
                .equals(other.paymentDetails, paymentDetails) &&
            const DeepCollectionEquality()
                .equals(other.refundDetails, refundDetails) &&
            (identical(other.rescheduleDetail, rescheduleDetail) ||
                other.rescheduleDetail == rescheduleDetail) &&
            (identical(other.totalFare, totalFare) ||
                other.totalFare == totalFare) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.isFullfilled, isFullfilled) ||
                other.isFullfilled == isFullfilled) &&
            (identical(other.pranaamBookingType, pranaamBookingType) ||
                other.pranaamBookingType == pranaamBookingType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        orderId,
        transactionId,
        travelSectorId,
        serviceTypeId,
        bookedOn,
        numberOfAdult,
        numberOfChild,
        numberOfInfant,
        bookingStatusId,
        packageId,
        tripDetail,
        roundTripDetail,
        totalPrice,
        const DeepCollectionEquality().hash(travelers),
        overallStatus,
        isPartialCancel,
        isUpgradeAvailable,
        isGroupPackage,
        placardInfo,
        billingInfo,
        const DeepCollectionEquality().hash(addOnsList),
        loyaltyPoint,
        const DeepCollectionEquality().hash(paymentDetails),
        const DeepCollectionEquality().hash(refundDetails),
        rescheduleDetail,
        totalFare,
        totalTax,
        isFullfilled,
        pranaamBookingType
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateBookingCopyWith<_$_CreateBooking> get copyWith =>
      __$$_CreateBookingCopyWithImpl<_$_CreateBooking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateBookingToJson(
      this,
    );
  }
}

abstract class _CreateBooking implements CreateBooking {
  const factory _CreateBooking(
      {@JsonKey(name: 'userId')
          final String userId,
      @JsonKey(name: 'orderId')
          final String orderId,
      @JsonKey(name: 'transctionID')
          final String transactionId,
      @JsonKey(name: 'travelSectorId')
          final int travelSectorId,
      @JsonKey(name: 'serviceTypeId')
          final int serviceTypeId,
      @JsonKey(name: 'bookedOn')
          final String bookedOn,
      @JsonKey(name: 'numberOfAdult')
          final int numberOfAdult,
      @JsonKey(name: 'numberOfChild')
          final int numberOfChild,
      @JsonKey(name: 'numberOfInfant')
          final int numberOfInfant,
      @JsonKey(name: 'bookingStatusId')
          final int bookingStatusId,
      @JsonKey(name: 'packageId')
          final int packageId,
      @JsonKey(name: 'tripDetail')
          required final TripDetail tripDetail,
      @JsonKey(name: 'roundTripDetail')
          final TripDetail roundTripDetail,
      @JsonKey(name: 'totalPrice')
          final double totalPrice,
      @JsonKey(name: 'travelers')
          final List<TravellersModel> travelers,
      @JsonKey(name: 'overallStatus')
          required final OverallStatus? overallStatus,
      @JsonKey(name: 'isPartialCancell')
          final bool isPartialCancel,
      @JsonKey(name: 'isUpgradeAvailable')
          final bool isUpgradeAvailable,
      @JsonKey(name: 'isGroupPackage')
          final bool isGroupPackage,
      @JsonKey(name: 'placardInfo')
          final PlacardInfo placardInfo,
      @JsonKey(name: 'billingInfo')
          final BillingInfo billingInfo,
      @JsonKey(name: 'addOnsList')
          final List<AddOnsListModel> addOnsList,
      @JsonKey(name: 'loyaltyPoint')
          final LoyaltyPoint? loyaltyPoint,
      @JsonKey(name: 'paymentDetails')
          final List<PaymentDetails> paymentDetails,
      @JsonKey(name: 'refundDetails')
          final List<PaymentDetails> refundDetails,
      @JsonKey(name: 'rescheduleDetail')
          final RescheduleDetail rescheduleDetail,
      @JsonKey(name: 'totalFare')
          final TotalFare totalFare,
      @JsonKey(name: 'totalTax')
          final TotalFare totalTax,
      @JsonKey(name: 'isFullfilled')
          final bool isFullfilled,
      @JsonKey(name: 'pranaamBookingType')
          final String pranaamBookingType}) = _$_CreateBooking;

  factory _CreateBooking.fromJson(Map<String, dynamic> json) =
      _$_CreateBooking.fromJson;

  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'orderId')
  String get orderId;
  @override
  @JsonKey(name: 'transctionID')
  String get transactionId;
  @override
  @JsonKey(name: 'travelSectorId')
  int get travelSectorId;
  @override
  @JsonKey(name: 'serviceTypeId')
  int get serviceTypeId;
  @override
  @JsonKey(name: 'bookedOn')
  String get bookedOn;
  @override
  @JsonKey(name: 'numberOfAdult')
  int get numberOfAdult;
  @override
  @JsonKey(name: 'numberOfChild')
  int get numberOfChild;
  @override
  @JsonKey(name: 'numberOfInfant')
  int get numberOfInfant;
  @override
  @JsonKey(name: 'bookingStatusId')
  int get bookingStatusId;
  @override
  @JsonKey(name: 'packageId')
  int get packageId;
  @override
  @JsonKey(name: 'tripDetail')
  TripDetail get tripDetail;
  @override
  @JsonKey(name: 'roundTripDetail')
  TripDetail get roundTripDetail;
  @override
  @JsonKey(name: 'totalPrice')
  double get totalPrice;
  @override
  @JsonKey(name: 'travelers')
  List<TravellersModel> get travelers;
  @override
  @JsonKey(name: 'overallStatus')
  OverallStatus? get overallStatus;
  @override
  @JsonKey(name: 'isPartialCancell')
  bool get isPartialCancel;
  @override
  @JsonKey(name: 'isUpgradeAvailable')
  bool get isUpgradeAvailable;
  @override
  @JsonKey(name: 'isGroupPackage')
  bool get isGroupPackage;
  @override // @JsonKey(name: 'pranaamBookingType') String? pranaamBookingType,
  @JsonKey(name: 'placardInfo')
  PlacardInfo get placardInfo;
  @override
  @JsonKey(name: 'billingInfo')
  BillingInfo get billingInfo;
  @override
  @JsonKey(name: 'addOnsList')
  List<AddOnsListModel> get addOnsList;
  @override
  @JsonKey(name: 'loyaltyPoint')
  LoyaltyPoint? get loyaltyPoint;
  @override
  @JsonKey(name: 'paymentDetails')
  List<PaymentDetails> get paymentDetails;
  @override
  @JsonKey(name: 'refundDetails')
  List<PaymentDetails> get refundDetails;
  @override
  @JsonKey(name: 'rescheduleDetail')
  RescheduleDetail get rescheduleDetail;
  @override
  @JsonKey(name: 'totalFare')
  TotalFare get totalFare;
  @override
  @JsonKey(name: 'totalTax')
  TotalFare get totalTax;
  @override
  @JsonKey(name: 'isFullfilled')
  bool get isFullfilled;
  @override
  @JsonKey(name: 'pranaamBookingType')
  String get pranaamBookingType;
  @override
  @JsonKey(ignore: true)
  _$$_CreateBookingCopyWith<_$_CreateBooking> get copyWith =>
      throw _privateConstructorUsedError;
}

RescheduleDetail _$RescheduleDetailFromJson(Map<String, dynamic> json) {
  return _RescheduleDetail.fromJson(json);
}

/// @nodoc
mixin _$RescheduleDetail {
  @JsonKey(name: 'originalBookingId')
  int get originalBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'isReschedule')
  bool get isReschedule => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleAdultCharges')
  double get rescheduleAdultCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleChildCharges')
  double get rescheduleChildCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleInfantCharges')
  double get rescheduleInfantCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleAdultChargesCGST')
  double get rescheduleAdultChargesCgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleChildChargesCGST')
  double get rescheduleChildChargesCgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleInfantChargesCGST')
  double get rescheduleInfantChargesCgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleAdultChargesSGST')
  double get rescheduleAdultChargesSgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleChildChargesSGST')
  double get rescheduleChildChargesSgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleInfantChargesSGST')
  double get rescheduleInfantChargesSgst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RescheduleDetailCopyWith<RescheduleDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleDetailCopyWith<$Res> {
  factory $RescheduleDetailCopyWith(
          RescheduleDetail value, $Res Function(RescheduleDetail) then) =
      _$RescheduleDetailCopyWithImpl<$Res, RescheduleDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'originalBookingId')
          int originalBookingId,
      @JsonKey(name: 'isReschedule')
          bool isReschedule,
      @JsonKey(name: 'rescheduleAdultCharges')
          double rescheduleAdultCharges,
      @JsonKey(name: 'rescheduleChildCharges')
          double rescheduleChildCharges,
      @JsonKey(name: 'rescheduleInfantCharges')
          double rescheduleInfantCharges,
      @JsonKey(name: 'rescheduleAdultChargesCGST')
          double rescheduleAdultChargesCgst,
      @JsonKey(name: 'rescheduleChildChargesCGST')
          double rescheduleChildChargesCgst,
      @JsonKey(name: 'rescheduleInfantChargesCGST')
          double rescheduleInfantChargesCgst,
      @JsonKey(name: 'rescheduleAdultChargesSGST')
          double rescheduleAdultChargesSgst,
      @JsonKey(name: 'rescheduleChildChargesSGST')
          double rescheduleChildChargesSgst,
      @JsonKey(name: 'rescheduleInfantChargesSGST')
          double rescheduleInfantChargesSgst});
}

/// @nodoc
class _$RescheduleDetailCopyWithImpl<$Res, $Val extends RescheduleDetail>
    implements $RescheduleDetailCopyWith<$Res> {
  _$RescheduleDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalBookingId = null,
    Object? isReschedule = null,
    Object? rescheduleAdultCharges = null,
    Object? rescheduleChildCharges = null,
    Object? rescheduleInfantCharges = null,
    Object? rescheduleAdultChargesCgst = null,
    Object? rescheduleChildChargesCgst = null,
    Object? rescheduleInfantChargesCgst = null,
    Object? rescheduleAdultChargesSgst = null,
    Object? rescheduleChildChargesSgst = null,
    Object? rescheduleInfantChargesSgst = null,
  }) {
    return _then(_value.copyWith(
      originalBookingId: null == originalBookingId
          ? _value.originalBookingId
          : originalBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      isReschedule: null == isReschedule
          ? _value.isReschedule
          : isReschedule // ignore: cast_nullable_to_non_nullable
              as bool,
      rescheduleAdultCharges: null == rescheduleAdultCharges
          ? _value.rescheduleAdultCharges
          : rescheduleAdultCharges // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleChildCharges: null == rescheduleChildCharges
          ? _value.rescheduleChildCharges
          : rescheduleChildCharges // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleInfantCharges: null == rescheduleInfantCharges
          ? _value.rescheduleInfantCharges
          : rescheduleInfantCharges // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleAdultChargesCgst: null == rescheduleAdultChargesCgst
          ? _value.rescheduleAdultChargesCgst
          : rescheduleAdultChargesCgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleChildChargesCgst: null == rescheduleChildChargesCgst
          ? _value.rescheduleChildChargesCgst
          : rescheduleChildChargesCgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleInfantChargesCgst: null == rescheduleInfantChargesCgst
          ? _value.rescheduleInfantChargesCgst
          : rescheduleInfantChargesCgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleAdultChargesSgst: null == rescheduleAdultChargesSgst
          ? _value.rescheduleAdultChargesSgst
          : rescheduleAdultChargesSgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleChildChargesSgst: null == rescheduleChildChargesSgst
          ? _value.rescheduleChildChargesSgst
          : rescheduleChildChargesSgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleInfantChargesSgst: null == rescheduleInfantChargesSgst
          ? _value.rescheduleInfantChargesSgst
          : rescheduleInfantChargesSgst // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RescheduleDetailCopyWith<$Res>
    implements $RescheduleDetailCopyWith<$Res> {
  factory _$$_RescheduleDetailCopyWith(
          _$_RescheduleDetail value, $Res Function(_$_RescheduleDetail) then) =
      __$$_RescheduleDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'originalBookingId')
          int originalBookingId,
      @JsonKey(name: 'isReschedule')
          bool isReschedule,
      @JsonKey(name: 'rescheduleAdultCharges')
          double rescheduleAdultCharges,
      @JsonKey(name: 'rescheduleChildCharges')
          double rescheduleChildCharges,
      @JsonKey(name: 'rescheduleInfantCharges')
          double rescheduleInfantCharges,
      @JsonKey(name: 'rescheduleAdultChargesCGST')
          double rescheduleAdultChargesCgst,
      @JsonKey(name: 'rescheduleChildChargesCGST')
          double rescheduleChildChargesCgst,
      @JsonKey(name: 'rescheduleInfantChargesCGST')
          double rescheduleInfantChargesCgst,
      @JsonKey(name: 'rescheduleAdultChargesSGST')
          double rescheduleAdultChargesSgst,
      @JsonKey(name: 'rescheduleChildChargesSGST')
          double rescheduleChildChargesSgst,
      @JsonKey(name: 'rescheduleInfantChargesSGST')
          double rescheduleInfantChargesSgst});
}

/// @nodoc
class __$$_RescheduleDetailCopyWithImpl<$Res>
    extends _$RescheduleDetailCopyWithImpl<$Res, _$_RescheduleDetail>
    implements _$$_RescheduleDetailCopyWith<$Res> {
  __$$_RescheduleDetailCopyWithImpl(
      _$_RescheduleDetail _value, $Res Function(_$_RescheduleDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalBookingId = null,
    Object? isReschedule = null,
    Object? rescheduleAdultCharges = null,
    Object? rescheduleChildCharges = null,
    Object? rescheduleInfantCharges = null,
    Object? rescheduleAdultChargesCgst = null,
    Object? rescheduleChildChargesCgst = null,
    Object? rescheduleInfantChargesCgst = null,
    Object? rescheduleAdultChargesSgst = null,
    Object? rescheduleChildChargesSgst = null,
    Object? rescheduleInfantChargesSgst = null,
  }) {
    return _then(_$_RescheduleDetail(
      originalBookingId: null == originalBookingId
          ? _value.originalBookingId
          : originalBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      isReschedule: null == isReschedule
          ? _value.isReschedule
          : isReschedule // ignore: cast_nullable_to_non_nullable
              as bool,
      rescheduleAdultCharges: null == rescheduleAdultCharges
          ? _value.rescheduleAdultCharges
          : rescheduleAdultCharges // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleChildCharges: null == rescheduleChildCharges
          ? _value.rescheduleChildCharges
          : rescheduleChildCharges // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleInfantCharges: null == rescheduleInfantCharges
          ? _value.rescheduleInfantCharges
          : rescheduleInfantCharges // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleAdultChargesCgst: null == rescheduleAdultChargesCgst
          ? _value.rescheduleAdultChargesCgst
          : rescheduleAdultChargesCgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleChildChargesCgst: null == rescheduleChildChargesCgst
          ? _value.rescheduleChildChargesCgst
          : rescheduleChildChargesCgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleInfantChargesCgst: null == rescheduleInfantChargesCgst
          ? _value.rescheduleInfantChargesCgst
          : rescheduleInfantChargesCgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleAdultChargesSgst: null == rescheduleAdultChargesSgst
          ? _value.rescheduleAdultChargesSgst
          : rescheduleAdultChargesSgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleChildChargesSgst: null == rescheduleChildChargesSgst
          ? _value.rescheduleChildChargesSgst
          : rescheduleChildChargesSgst // ignore: cast_nullable_to_non_nullable
              as double,
      rescheduleInfantChargesSgst: null == rescheduleInfantChargesSgst
          ? _value.rescheduleInfantChargesSgst
          : rescheduleInfantChargesSgst // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RescheduleDetail implements _RescheduleDetail {
  const _$_RescheduleDetail(
      {@JsonKey(name: 'originalBookingId')
          this.originalBookingId = 0,
      @JsonKey(name: 'isReschedule')
          this.isReschedule = false,
      @JsonKey(name: 'rescheduleAdultCharges')
          this.rescheduleAdultCharges = 0.0,
      @JsonKey(name: 'rescheduleChildCharges')
          this.rescheduleChildCharges = 0.0,
      @JsonKey(name: 'rescheduleInfantCharges')
          this.rescheduleInfantCharges = 0.0,
      @JsonKey(name: 'rescheduleAdultChargesCGST')
          this.rescheduleAdultChargesCgst = 0.0,
      @JsonKey(name: 'rescheduleChildChargesCGST')
          this.rescheduleChildChargesCgst = 0.0,
      @JsonKey(name: 'rescheduleInfantChargesCGST')
          this.rescheduleInfantChargesCgst = 0.0,
      @JsonKey(name: 'rescheduleAdultChargesSGST')
          this.rescheduleAdultChargesSgst = 0.0,
      @JsonKey(name: 'rescheduleChildChargesSGST')
          this.rescheduleChildChargesSgst = 0.0,
      @JsonKey(name: 'rescheduleInfantChargesSGST')
          this.rescheduleInfantChargesSgst = 0.0});

  factory _$_RescheduleDetail.fromJson(Map<String, dynamic> json) =>
      _$$_RescheduleDetailFromJson(json);

  @override
  @JsonKey(name: 'originalBookingId')
  final int originalBookingId;
  @override
  @JsonKey(name: 'isReschedule')
  final bool isReschedule;
  @override
  @JsonKey(name: 'rescheduleAdultCharges')
  final double rescheduleAdultCharges;
  @override
  @JsonKey(name: 'rescheduleChildCharges')
  final double rescheduleChildCharges;
  @override
  @JsonKey(name: 'rescheduleInfantCharges')
  final double rescheduleInfantCharges;
  @override
  @JsonKey(name: 'rescheduleAdultChargesCGST')
  final double rescheduleAdultChargesCgst;
  @override
  @JsonKey(name: 'rescheduleChildChargesCGST')
  final double rescheduleChildChargesCgst;
  @override
  @JsonKey(name: 'rescheduleInfantChargesCGST')
  final double rescheduleInfantChargesCgst;
  @override
  @JsonKey(name: 'rescheduleAdultChargesSGST')
  final double rescheduleAdultChargesSgst;
  @override
  @JsonKey(name: 'rescheduleChildChargesSGST')
  final double rescheduleChildChargesSgst;
  @override
  @JsonKey(name: 'rescheduleInfantChargesSGST')
  final double rescheduleInfantChargesSgst;

  @override
  String toString() {
    return 'RescheduleDetail(originalBookingId: $originalBookingId, isReschedule: $isReschedule, rescheduleAdultCharges: $rescheduleAdultCharges, rescheduleChildCharges: $rescheduleChildCharges, rescheduleInfantCharges: $rescheduleInfantCharges, rescheduleAdultChargesCgst: $rescheduleAdultChargesCgst, rescheduleChildChargesCgst: $rescheduleChildChargesCgst, rescheduleInfantChargesCgst: $rescheduleInfantChargesCgst, rescheduleAdultChargesSgst: $rescheduleAdultChargesSgst, rescheduleChildChargesSgst: $rescheduleChildChargesSgst, rescheduleInfantChargesSgst: $rescheduleInfantChargesSgst)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduleDetail &&
            (identical(other.originalBookingId, originalBookingId) ||
                other.originalBookingId == originalBookingId) &&
            (identical(other.isReschedule, isReschedule) ||
                other.isReschedule == isReschedule) &&
            (identical(other.rescheduleAdultCharges, rescheduleAdultCharges) ||
                other.rescheduleAdultCharges == rescheduleAdultCharges) &&
            (identical(other.rescheduleChildCharges, rescheduleChildCharges) ||
                other.rescheduleChildCharges == rescheduleChildCharges) &&
            (identical(other.rescheduleInfantCharges, rescheduleInfantCharges) ||
                other.rescheduleInfantCharges == rescheduleInfantCharges) &&
            (identical(other.rescheduleAdultChargesCgst, rescheduleAdultChargesCgst) ||
                other.rescheduleAdultChargesCgst ==
                    rescheduleAdultChargesCgst) &&
            (identical(other.rescheduleChildChargesCgst, rescheduleChildChargesCgst) ||
                other.rescheduleChildChargesCgst ==
                    rescheduleChildChargesCgst) &&
            (identical(other.rescheduleInfantChargesCgst,
                    rescheduleInfantChargesCgst) ||
                other.rescheduleInfantChargesCgst ==
                    rescheduleInfantChargesCgst) &&
            (identical(other.rescheduleAdultChargesSgst,
                    rescheduleAdultChargesSgst) ||
                other.rescheduleAdultChargesSgst ==
                    rescheduleAdultChargesSgst) &&
            (identical(other.rescheduleChildChargesSgst,
                    rescheduleChildChargesSgst) ||
                other.rescheduleChildChargesSgst ==
                    rescheduleChildChargesSgst) &&
            (identical(other.rescheduleInfantChargesSgst,
                    rescheduleInfantChargesSgst) ||
                other.rescheduleInfantChargesSgst ==
                    rescheduleInfantChargesSgst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      originalBookingId,
      isReschedule,
      rescheduleAdultCharges,
      rescheduleChildCharges,
      rescheduleInfantCharges,
      rescheduleAdultChargesCgst,
      rescheduleChildChargesCgst,
      rescheduleInfantChargesCgst,
      rescheduleAdultChargesSgst,
      rescheduleChildChargesSgst,
      rescheduleInfantChargesSgst);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduleDetailCopyWith<_$_RescheduleDetail> get copyWith =>
      __$$_RescheduleDetailCopyWithImpl<_$_RescheduleDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduleDetailToJson(
      this,
    );
  }
}

abstract class _RescheduleDetail implements RescheduleDetail {
  const factory _RescheduleDetail(
      {@JsonKey(name: 'originalBookingId')
          final int originalBookingId,
      @JsonKey(name: 'isReschedule')
          final bool isReschedule,
      @JsonKey(name: 'rescheduleAdultCharges')
          final double rescheduleAdultCharges,
      @JsonKey(name: 'rescheduleChildCharges')
          final double rescheduleChildCharges,
      @JsonKey(name: 'rescheduleInfantCharges')
          final double rescheduleInfantCharges,
      @JsonKey(name: 'rescheduleAdultChargesCGST')
          final double rescheduleAdultChargesCgst,
      @JsonKey(name: 'rescheduleChildChargesCGST')
          final double rescheduleChildChargesCgst,
      @JsonKey(name: 'rescheduleInfantChargesCGST')
          final double rescheduleInfantChargesCgst,
      @JsonKey(name: 'rescheduleAdultChargesSGST')
          final double rescheduleAdultChargesSgst,
      @JsonKey(name: 'rescheduleChildChargesSGST')
          final double rescheduleChildChargesSgst,
      @JsonKey(name: 'rescheduleInfantChargesSGST')
          final double rescheduleInfantChargesSgst}) = _$_RescheduleDetail;

  factory _RescheduleDetail.fromJson(Map<String, dynamic> json) =
      _$_RescheduleDetail.fromJson;

  @override
  @JsonKey(name: 'originalBookingId')
  int get originalBookingId;
  @override
  @JsonKey(name: 'isReschedule')
  bool get isReschedule;
  @override
  @JsonKey(name: 'rescheduleAdultCharges')
  double get rescheduleAdultCharges;
  @override
  @JsonKey(name: 'rescheduleChildCharges')
  double get rescheduleChildCharges;
  @override
  @JsonKey(name: 'rescheduleInfantCharges')
  double get rescheduleInfantCharges;
  @override
  @JsonKey(name: 'rescheduleAdultChargesCGST')
  double get rescheduleAdultChargesCgst;
  @override
  @JsonKey(name: 'rescheduleChildChargesCGST')
  double get rescheduleChildChargesCgst;
  @override
  @JsonKey(name: 'rescheduleInfantChargesCGST')
  double get rescheduleInfantChargesCgst;
  @override
  @JsonKey(name: 'rescheduleAdultChargesSGST')
  double get rescheduleAdultChargesSgst;
  @override
  @JsonKey(name: 'rescheduleChildChargesSGST')
  double get rescheduleChildChargesSgst;
  @override
  @JsonKey(name: 'rescheduleInfantChargesSGST')
  double get rescheduleInfantChargesSgst;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduleDetailCopyWith<_$_RescheduleDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

OverallStatus _$OverallStatusFromJson(Map<String, dynamic> json) {
  return _OverallStatus.fromJson(json);
}

/// @nodoc
mixin _$OverallStatus {
  List<StatusHistory> get statusHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverallStatusCopyWith<OverallStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverallStatusCopyWith<$Res> {
  factory $OverallStatusCopyWith(
          OverallStatus value, $Res Function(OverallStatus) then) =
      _$OverallStatusCopyWithImpl<$Res, OverallStatus>;
  @useResult
  $Res call({List<StatusHistory> statusHistory});
}

/// @nodoc
class _$OverallStatusCopyWithImpl<$Res, $Val extends OverallStatus>
    implements $OverallStatusCopyWith<$Res> {
  _$OverallStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusHistory = null,
  }) {
    return _then(_value.copyWith(
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<StatusHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OverallStatusCopyWith<$Res>
    implements $OverallStatusCopyWith<$Res> {
  factory _$$_OverallStatusCopyWith(
          _$_OverallStatus value, $Res Function(_$_OverallStatus) then) =
      __$$_OverallStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StatusHistory> statusHistory});
}

/// @nodoc
class __$$_OverallStatusCopyWithImpl<$Res>
    extends _$OverallStatusCopyWithImpl<$Res, _$_OverallStatus>
    implements _$$_OverallStatusCopyWith<$Res> {
  __$$_OverallStatusCopyWithImpl(
      _$_OverallStatus _value, $Res Function(_$_OverallStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusHistory = null,
  }) {
    return _then(_$_OverallStatus(
      null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<StatusHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OverallStatus implements _OverallStatus {
  const _$_OverallStatus(this.statusHistory);

  factory _$_OverallStatus.fromJson(Map<String, dynamic> json) =>
      _$$_OverallStatusFromJson(json);

  @override
  final List<StatusHistory> statusHistory;

  @override
  String toString() {
    return 'OverallStatus(statusHistory: $statusHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverallStatus &&
            const DeepCollectionEquality()
                .equals(other.statusHistory, statusHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(statusHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OverallStatusCopyWith<_$_OverallStatus> get copyWith =>
      __$$_OverallStatusCopyWithImpl<_$_OverallStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OverallStatusToJson(
      this,
    );
  }
}

abstract class _OverallStatus implements OverallStatus {
  const factory _OverallStatus(final List<StatusHistory> statusHistory) =
      _$_OverallStatus;

  factory _OverallStatus.fromJson(Map<String, dynamic> json) =
      _$_OverallStatus.fromJson;

  @override
  List<StatusHistory> get statusHistory;
  @override
  @JsonKey(ignore: true)
  _$$_OverallStatusCopyWith<_$_OverallStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

TripStatus _$TripStatusFromJson(Map<String, dynamic> json) {
  return _TripStatus.fromJson(json);
}

/// @nodoc
mixin _$TripStatus {
  @JsonKey(name: 'statusHistory')
  List<TripStatusStatusHistory> get statusHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripStatusCopyWith<TripStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripStatusCopyWith<$Res> {
  factory $TripStatusCopyWith(
          TripStatus value, $Res Function(TripStatus) then) =
      _$TripStatusCopyWithImpl<$Res, TripStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'statusHistory')
          List<TripStatusStatusHistory> statusHistory});
}

/// @nodoc
class _$TripStatusCopyWithImpl<$Res, $Val extends TripStatus>
    implements $TripStatusCopyWith<$Res> {
  _$TripStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusHistory = null,
  }) {
    return _then(_value.copyWith(
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<TripStatusStatusHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripStatusCopyWith<$Res>
    implements $TripStatusCopyWith<$Res> {
  factory _$$_TripStatusCopyWith(
          _$_TripStatus value, $Res Function(_$_TripStatus) then) =
      __$$_TripStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'statusHistory')
          List<TripStatusStatusHistory> statusHistory});
}

/// @nodoc
class __$$_TripStatusCopyWithImpl<$Res>
    extends _$TripStatusCopyWithImpl<$Res, _$_TripStatus>
    implements _$$_TripStatusCopyWith<$Res> {
  __$$_TripStatusCopyWithImpl(
      _$_TripStatus _value, $Res Function(_$_TripStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusHistory = null,
  }) {
    return _then(_$_TripStatus(
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<TripStatusStatusHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripStatus implements _TripStatus {
  const _$_TripStatus(
      {@JsonKey(name: 'statusHistory') this.statusHistory = const []});

  factory _$_TripStatus.fromJson(Map<String, dynamic> json) =>
      _$$_TripStatusFromJson(json);

  @override
  @JsonKey(name: 'statusHistory')
  final List<TripStatusStatusHistory> statusHistory;

  @override
  String toString() {
    return 'TripStatus(statusHistory: $statusHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripStatus &&
            const DeepCollectionEquality()
                .equals(other.statusHistory, statusHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(statusHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripStatusCopyWith<_$_TripStatus> get copyWith =>
      __$$_TripStatusCopyWithImpl<_$_TripStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripStatusToJson(
      this,
    );
  }
}

abstract class _TripStatus implements TripStatus {
  const factory _TripStatus(
      {@JsonKey(name: 'statusHistory')
          final List<TripStatusStatusHistory> statusHistory}) = _$_TripStatus;

  factory _TripStatus.fromJson(Map<String, dynamic> json) =
      _$_TripStatus.fromJson;

  @override
  @JsonKey(name: 'statusHistory')
  List<TripStatusStatusHistory> get statusHistory;
  @override
  @JsonKey(ignore: true)
  _$$_TripStatusCopyWith<_$_TripStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

TripStatusStatusHistory _$TripStatusStatusHistoryFromJson(
    Map<String, dynamic> json) {
  return _TripStatusStatusHistory.fromJson(json);
}

/// @nodoc
mixin _$TripStatusStatusHistory {
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderStatus')
  String get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'modifiedOn')
  String get modifiedOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripStatusStatusHistoryCopyWith<TripStatusStatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripStatusStatusHistoryCopyWith<$Res> {
  factory $TripStatusStatusHistoryCopyWith(TripStatusStatusHistory value,
          $Res Function(TripStatusStatusHistory) then) =
      _$TripStatusStatusHistoryCopyWithImpl<$Res, TripStatusStatusHistory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'orderStatus') String orderStatus,
      @JsonKey(name: 'modifiedOn') String modifiedOn});
}

/// @nodoc
class _$TripStatusStatusHistoryCopyWithImpl<$Res,
        $Val extends TripStatusStatusHistory>
    implements $TripStatusStatusHistoryCopyWith<$Res> {
  _$TripStatusStatusHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? orderStatus = null,
    Object? modifiedOn = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedOn: null == modifiedOn
          ? _value.modifiedOn
          : modifiedOn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripStatusStatusHistoryCopyWith<$Res>
    implements $TripStatusStatusHistoryCopyWith<$Res> {
  factory _$$_TripStatusStatusHistoryCopyWith(_$_TripStatusStatusHistory value,
          $Res Function(_$_TripStatusStatusHistory) then) =
      __$$_TripStatusStatusHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'orderStatus') String orderStatus,
      @JsonKey(name: 'modifiedOn') String modifiedOn});
}

/// @nodoc
class __$$_TripStatusStatusHistoryCopyWithImpl<$Res>
    extends _$TripStatusStatusHistoryCopyWithImpl<$Res,
        _$_TripStatusStatusHistory>
    implements _$$_TripStatusStatusHistoryCopyWith<$Res> {
  __$$_TripStatusStatusHistoryCopyWithImpl(_$_TripStatusStatusHistory _value,
      $Res Function(_$_TripStatusStatusHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? orderStatus = null,
    Object? modifiedOn = null,
  }) {
    return _then(_$_TripStatusStatusHistory(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedOn: null == modifiedOn
          ? _value.modifiedOn
          : modifiedOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripStatusStatusHistory implements _TripStatusStatusHistory {
  const _$_TripStatusStatusHistory(
      {@JsonKey(name: 'status') this.status = '',
      @JsonKey(name: 'orderStatus') this.orderStatus = '',
      @JsonKey(name: 'modifiedOn') this.modifiedOn = ''});

  factory _$_TripStatusStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$$_TripStatusStatusHistoryFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'orderStatus')
  final String orderStatus;
  @override
  @JsonKey(name: 'modifiedOn')
  final String modifiedOn;

  @override
  String toString() {
    return 'TripStatusStatusHistory(status: $status, orderStatus: $orderStatus, modifiedOn: $modifiedOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripStatusStatusHistory &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.modifiedOn, modifiedOn) ||
                other.modifiedOn == modifiedOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, orderStatus, modifiedOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripStatusStatusHistoryCopyWith<_$_TripStatusStatusHistory>
      get copyWith =>
          __$$_TripStatusStatusHistoryCopyWithImpl<_$_TripStatusStatusHistory>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripStatusStatusHistoryToJson(
      this,
    );
  }
}

abstract class _TripStatusStatusHistory implements TripStatusStatusHistory {
  const factory _TripStatusStatusHistory(
          {@JsonKey(name: 'status') final String status,
          @JsonKey(name: 'orderStatus') final String orderStatus,
          @JsonKey(name: 'modifiedOn') final String modifiedOn}) =
      _$_TripStatusStatusHistory;

  factory _TripStatusStatusHistory.fromJson(Map<String, dynamic> json) =
      _$_TripStatusStatusHistory.fromJson;

  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'orderStatus')
  String get orderStatus;
  @override
  @JsonKey(name: 'modifiedOn')
  String get modifiedOn;
  @override
  @JsonKey(ignore: true)
  _$$_TripStatusStatusHistoryCopyWith<_$_TripStatusStatusHistory>
      get copyWith => throw _privateConstructorUsedError;
}

LoyaltyPoint _$LoyaltyPointFromJson(Map<String, dynamic> json) {
  return _LoyaltyPoint.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyPoint {
  @JsonKey(name: 'loyaltyPointByTransactions')
  LoyaltyPointByTransactions? get loyaltyPointByTransactions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pendingRewardPoints')
  int get pendingRewardPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'earnedRewardPoints')
  int get earnedRewardPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'burnedRewardPoints')
  int get burnedRewardPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyPointCopyWith<LoyaltyPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyPointCopyWith<$Res> {
  factory $LoyaltyPointCopyWith(
          LoyaltyPoint value, $Res Function(LoyaltyPoint) then) =
      _$LoyaltyPointCopyWithImpl<$Res, LoyaltyPoint>;
  @useResult
  $Res call(
      {@JsonKey(name: 'loyaltyPointByTransactions')
          LoyaltyPointByTransactions? loyaltyPointByTransactions,
      @JsonKey(name: 'pendingRewardPoints')
          int pendingRewardPoints,
      @JsonKey(name: 'earnedRewardPoints')
          int earnedRewardPoints,
      @JsonKey(name: 'burnedRewardPoints')
          int burnedRewardPoints});

  $LoyaltyPointByTransactionsCopyWith<$Res>? get loyaltyPointByTransactions;
}

/// @nodoc
class _$LoyaltyPointCopyWithImpl<$Res, $Val extends LoyaltyPoint>
    implements $LoyaltyPointCopyWith<$Res> {
  _$LoyaltyPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyPointByTransactions = freezed,
    Object? pendingRewardPoints = null,
    Object? earnedRewardPoints = null,
    Object? burnedRewardPoints = null,
  }) {
    return _then(_value.copyWith(
      loyaltyPointByTransactions: freezed == loyaltyPointByTransactions
          ? _value.loyaltyPointByTransactions
          : loyaltyPointByTransactions // ignore: cast_nullable_to_non_nullable
              as LoyaltyPointByTransactions?,
      pendingRewardPoints: null == pendingRewardPoints
          ? _value.pendingRewardPoints
          : pendingRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      earnedRewardPoints: null == earnedRewardPoints
          ? _value.earnedRewardPoints
          : earnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      burnedRewardPoints: null == burnedRewardPoints
          ? _value.burnedRewardPoints
          : burnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoyaltyPointByTransactionsCopyWith<$Res>? get loyaltyPointByTransactions {
    if (_value.loyaltyPointByTransactions == null) {
      return null;
    }

    return $LoyaltyPointByTransactionsCopyWith<$Res>(
        _value.loyaltyPointByTransactions!, (value) {
      return _then(_value.copyWith(loyaltyPointByTransactions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoyaltyPointCopyWith<$Res>
    implements $LoyaltyPointCopyWith<$Res> {
  factory _$$_LoyaltyPointCopyWith(
          _$_LoyaltyPoint value, $Res Function(_$_LoyaltyPoint) then) =
      __$$_LoyaltyPointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'loyaltyPointByTransactions')
          LoyaltyPointByTransactions? loyaltyPointByTransactions,
      @JsonKey(name: 'pendingRewardPoints')
          int pendingRewardPoints,
      @JsonKey(name: 'earnedRewardPoints')
          int earnedRewardPoints,
      @JsonKey(name: 'burnedRewardPoints')
          int burnedRewardPoints});

  @override
  $LoyaltyPointByTransactionsCopyWith<$Res>? get loyaltyPointByTransactions;
}

/// @nodoc
class __$$_LoyaltyPointCopyWithImpl<$Res>
    extends _$LoyaltyPointCopyWithImpl<$Res, _$_LoyaltyPoint>
    implements _$$_LoyaltyPointCopyWith<$Res> {
  __$$_LoyaltyPointCopyWithImpl(
      _$_LoyaltyPoint _value, $Res Function(_$_LoyaltyPoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyPointByTransactions = freezed,
    Object? pendingRewardPoints = null,
    Object? earnedRewardPoints = null,
    Object? burnedRewardPoints = null,
  }) {
    return _then(_$_LoyaltyPoint(
      loyaltyPointByTransactions: freezed == loyaltyPointByTransactions
          ? _value.loyaltyPointByTransactions
          : loyaltyPointByTransactions // ignore: cast_nullable_to_non_nullable
              as LoyaltyPointByTransactions?,
      pendingRewardPoints: null == pendingRewardPoints
          ? _value.pendingRewardPoints
          : pendingRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      earnedRewardPoints: null == earnedRewardPoints
          ? _value.earnedRewardPoints
          : earnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      burnedRewardPoints: null == burnedRewardPoints
          ? _value.burnedRewardPoints
          : burnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyPoint implements _LoyaltyPoint {
  const _$_LoyaltyPoint(
      {@JsonKey(name: 'loyaltyPointByTransactions')
          this.loyaltyPointByTransactions,
      @JsonKey(name: 'pendingRewardPoints')
          this.pendingRewardPoints = 0,
      @JsonKey(name: 'earnedRewardPoints')
          this.earnedRewardPoints = 0,
      @JsonKey(name: 'burnedRewardPoints')
          this.burnedRewardPoints = 0});

  factory _$_LoyaltyPoint.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyPointFromJson(json);

  @override
  @JsonKey(name: 'loyaltyPointByTransactions')
  final LoyaltyPointByTransactions? loyaltyPointByTransactions;
  @override
  @JsonKey(name: 'pendingRewardPoints')
  final int pendingRewardPoints;
  @override
  @JsonKey(name: 'earnedRewardPoints')
  final int earnedRewardPoints;
  @override
  @JsonKey(name: 'burnedRewardPoints')
  final int burnedRewardPoints;

  @override
  String toString() {
    return 'LoyaltyPoint(loyaltyPointByTransactions: $loyaltyPointByTransactions, pendingRewardPoints: $pendingRewardPoints, earnedRewardPoints: $earnedRewardPoints, burnedRewardPoints: $burnedRewardPoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyPoint &&
            (identical(other.loyaltyPointByTransactions,
                    loyaltyPointByTransactions) ||
                other.loyaltyPointByTransactions ==
                    loyaltyPointByTransactions) &&
            (identical(other.pendingRewardPoints, pendingRewardPoints) ||
                other.pendingRewardPoints == pendingRewardPoints) &&
            (identical(other.earnedRewardPoints, earnedRewardPoints) ||
                other.earnedRewardPoints == earnedRewardPoints) &&
            (identical(other.burnedRewardPoints, burnedRewardPoints) ||
                other.burnedRewardPoints == burnedRewardPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loyaltyPointByTransactions,
      pendingRewardPoints, earnedRewardPoints, burnedRewardPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyPointCopyWith<_$_LoyaltyPoint> get copyWith =>
      __$$_LoyaltyPointCopyWithImpl<_$_LoyaltyPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyPointToJson(
      this,
    );
  }
}

abstract class _LoyaltyPoint implements LoyaltyPoint {
  const factory _LoyaltyPoint(
      {@JsonKey(name: 'loyaltyPointByTransactions')
          final LoyaltyPointByTransactions? loyaltyPointByTransactions,
      @JsonKey(name: 'pendingRewardPoints')
          final int pendingRewardPoints,
      @JsonKey(name: 'earnedRewardPoints')
          final int earnedRewardPoints,
      @JsonKey(name: 'burnedRewardPoints')
          final int burnedRewardPoints}) = _$_LoyaltyPoint;

  factory _LoyaltyPoint.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyPoint.fromJson;

  @override
  @JsonKey(name: 'loyaltyPointByTransactions')
  LoyaltyPointByTransactions? get loyaltyPointByTransactions;
  @override
  @JsonKey(name: 'pendingRewardPoints')
  int get pendingRewardPoints;
  @override
  @JsonKey(name: 'earnedRewardPoints')
  int get earnedRewardPoints;
  @override
  @JsonKey(name: 'burnedRewardPoints')
  int get burnedRewardPoints;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyPointCopyWith<_$_LoyaltyPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyPointByTransactions _$LoyaltyPointByTransactionsFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyPointByTransactions.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyPointByTransactions {
  @JsonKey(name: 'lastpendingRewardPoints')
  int get lastpendingRewardPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'earnedRewardPoints')
  int get earnedRewardPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastburnedRewardPoints')
  int get lastburnedRewardPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyPointByTransactionsCopyWith<LoyaltyPointByTransactions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyPointByTransactionsCopyWith<$Res> {
  factory $LoyaltyPointByTransactionsCopyWith(LoyaltyPointByTransactions value,
          $Res Function(LoyaltyPointByTransactions) then) =
      _$LoyaltyPointByTransactionsCopyWithImpl<$Res,
          LoyaltyPointByTransactions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lastpendingRewardPoints') int lastpendingRewardPoints,
      @JsonKey(name: 'earnedRewardPoints') int earnedRewardPoints,
      @JsonKey(name: 'lastburnedRewardPoints') int lastburnedRewardPoints});
}

/// @nodoc
class _$LoyaltyPointByTransactionsCopyWithImpl<$Res,
        $Val extends LoyaltyPointByTransactions>
    implements $LoyaltyPointByTransactionsCopyWith<$Res> {
  _$LoyaltyPointByTransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastpendingRewardPoints = null,
    Object? earnedRewardPoints = null,
    Object? lastburnedRewardPoints = null,
  }) {
    return _then(_value.copyWith(
      lastpendingRewardPoints: null == lastpendingRewardPoints
          ? _value.lastpendingRewardPoints
          : lastpendingRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      earnedRewardPoints: null == earnedRewardPoints
          ? _value.earnedRewardPoints
          : earnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lastburnedRewardPoints: null == lastburnedRewardPoints
          ? _value.lastburnedRewardPoints
          : lastburnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyPointByTransactionsCopyWith<$Res>
    implements $LoyaltyPointByTransactionsCopyWith<$Res> {
  factory _$$_LoyaltyPointByTransactionsCopyWith(
          _$_LoyaltyPointByTransactions value,
          $Res Function(_$_LoyaltyPointByTransactions) then) =
      __$$_LoyaltyPointByTransactionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lastpendingRewardPoints') int lastpendingRewardPoints,
      @JsonKey(name: 'earnedRewardPoints') int earnedRewardPoints,
      @JsonKey(name: 'lastburnedRewardPoints') int lastburnedRewardPoints});
}

/// @nodoc
class __$$_LoyaltyPointByTransactionsCopyWithImpl<$Res>
    extends _$LoyaltyPointByTransactionsCopyWithImpl<$Res,
        _$_LoyaltyPointByTransactions>
    implements _$$_LoyaltyPointByTransactionsCopyWith<$Res> {
  __$$_LoyaltyPointByTransactionsCopyWithImpl(
      _$_LoyaltyPointByTransactions _value,
      $Res Function(_$_LoyaltyPointByTransactions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastpendingRewardPoints = null,
    Object? earnedRewardPoints = null,
    Object? lastburnedRewardPoints = null,
  }) {
    return _then(_$_LoyaltyPointByTransactions(
      lastpendingRewardPoints: null == lastpendingRewardPoints
          ? _value.lastpendingRewardPoints
          : lastpendingRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      earnedRewardPoints: null == earnedRewardPoints
          ? _value.earnedRewardPoints
          : earnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lastburnedRewardPoints: null == lastburnedRewardPoints
          ? _value.lastburnedRewardPoints
          : lastburnedRewardPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyPointByTransactions implements _LoyaltyPointByTransactions {
  const _$_LoyaltyPointByTransactions(
      {@JsonKey(name: 'lastpendingRewardPoints')
          this.lastpendingRewardPoints = 0,
      @JsonKey(name: 'earnedRewardPoints')
          this.earnedRewardPoints = 0,
      @JsonKey(name: 'lastburnedRewardPoints')
          this.lastburnedRewardPoints = 0});

  factory _$_LoyaltyPointByTransactions.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyPointByTransactionsFromJson(json);

  @override
  @JsonKey(name: 'lastpendingRewardPoints')
  final int lastpendingRewardPoints;
  @override
  @JsonKey(name: 'earnedRewardPoints')
  final int earnedRewardPoints;
  @override
  @JsonKey(name: 'lastburnedRewardPoints')
  final int lastburnedRewardPoints;

  @override
  String toString() {
    return 'LoyaltyPointByTransactions(lastpendingRewardPoints: $lastpendingRewardPoints, earnedRewardPoints: $earnedRewardPoints, lastburnedRewardPoints: $lastburnedRewardPoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyPointByTransactions &&
            (identical(
                    other.lastpendingRewardPoints, lastpendingRewardPoints) ||
                other.lastpendingRewardPoints == lastpendingRewardPoints) &&
            (identical(other.earnedRewardPoints, earnedRewardPoints) ||
                other.earnedRewardPoints == earnedRewardPoints) &&
            (identical(other.lastburnedRewardPoints, lastburnedRewardPoints) ||
                other.lastburnedRewardPoints == lastburnedRewardPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastpendingRewardPoints,
      earnedRewardPoints, lastburnedRewardPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyPointByTransactionsCopyWith<_$_LoyaltyPointByTransactions>
      get copyWith => __$$_LoyaltyPointByTransactionsCopyWithImpl<
          _$_LoyaltyPointByTransactions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyPointByTransactionsToJson(
      this,
    );
  }
}

abstract class _LoyaltyPointByTransactions
    implements LoyaltyPointByTransactions {
  const factory _LoyaltyPointByTransactions(
      {@JsonKey(name: 'lastpendingRewardPoints')
          final int lastpendingRewardPoints,
      @JsonKey(name: 'earnedRewardPoints')
          final int earnedRewardPoints,
      @JsonKey(name: 'lastburnedRewardPoints')
          final int lastburnedRewardPoints}) = _$_LoyaltyPointByTransactions;

  factory _LoyaltyPointByTransactions.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyPointByTransactions.fromJson;

  @override
  @JsonKey(name: 'lastpendingRewardPoints')
  int get lastpendingRewardPoints;
  @override
  @JsonKey(name: 'earnedRewardPoints')
  int get earnedRewardPoints;
  @override
  @JsonKey(name: 'lastburnedRewardPoints')
  int get lastburnedRewardPoints;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyPointByTransactionsCopyWith<_$_LoyaltyPointByTransactions>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) {
  return _PaymentDetails.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetails {
  String get transactionMode => throw _privateConstructorUsedError;
  String get transactionCode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsCopyWith<PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsCopyWith<$Res> {
  factory $PaymentDetailsCopyWith(
          PaymentDetails value, $Res Function(PaymentDetails) then) =
      _$PaymentDetailsCopyWithImpl<$Res, PaymentDetails>;
  @useResult
  $Res call(
      {String transactionMode,
      String transactionCode,
      String status,
      double amount});
}

/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res, $Val extends PaymentDetails>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionMode = null,
    Object? transactionCode = null,
    Object? status = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      transactionMode: null == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCode: null == transactionCode
          ? _value.transactionCode
          : transactionCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentDetailsCopyWith<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  factory _$$_PaymentDetailsCopyWith(
          _$_PaymentDetails value, $Res Function(_$_PaymentDetails) then) =
      __$$_PaymentDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionMode,
      String transactionCode,
      String status,
      double amount});
}

/// @nodoc
class __$$_PaymentDetailsCopyWithImpl<$Res>
    extends _$PaymentDetailsCopyWithImpl<$Res, _$_PaymentDetails>
    implements _$$_PaymentDetailsCopyWith<$Res> {
  __$$_PaymentDetailsCopyWithImpl(
      _$_PaymentDetails _value, $Res Function(_$_PaymentDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionMode = null,
    Object? transactionCode = null,
    Object? status = null,
    Object? amount = null,
  }) {
    return _then(_$_PaymentDetails(
      transactionMode: null == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCode: null == transactionCode
          ? _value.transactionCode
          : transactionCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentDetails implements _PaymentDetails {
  const _$_PaymentDetails(
      {this.transactionMode = '',
      this.transactionCode = '',
      this.status = '',
      this.amount = 0});

  factory _$_PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentDetailsFromJson(json);

  @override
  @JsonKey()
  final String transactionMode;
  @override
  @JsonKey()
  final String transactionCode;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'PaymentDetails(transactionMode: $transactionMode, transactionCode: $transactionCode, status: $status, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentDetails &&
            (identical(other.transactionMode, transactionMode) ||
                other.transactionMode == transactionMode) &&
            (identical(other.transactionCode, transactionCode) ||
                other.transactionCode == transactionCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, transactionMode, transactionCode, status, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      __$$_PaymentDetailsCopyWithImpl<_$_PaymentDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentDetailsToJson(
      this,
    );
  }
}

abstract class _PaymentDetails implements PaymentDetails {
  const factory _PaymentDetails(
      {final String transactionMode,
      final String transactionCode,
      final String status,
      final double amount}) = _$_PaymentDetails;

  factory _PaymentDetails.fromJson(Map<String, dynamic> json) =
      _$_PaymentDetails.fromJson;

  @override
  String get transactionMode;
  @override
  String get transactionCode;
  @override
  String get status;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentDetailsCopyWith<_$_PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusHistory _$StatusHistoryFromJson(Map<String, dynamic> json) {
  return _StatusHistory.fromJson(json);
}

/// @nodoc
mixin _$StatusHistory {
  String get status => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  String get modifiedOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusHistoryCopyWith<StatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusHistoryCopyWith<$Res> {
  factory $StatusHistoryCopyWith(
          StatusHistory value, $Res Function(StatusHistory) then) =
      _$StatusHistoryCopyWithImpl<$Res, StatusHistory>;
  @useResult
  $Res call({String status, String orderStatus, String modifiedOn});
}

/// @nodoc
class _$StatusHistoryCopyWithImpl<$Res, $Val extends StatusHistory>
    implements $StatusHistoryCopyWith<$Res> {
  _$StatusHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? orderStatus = null,
    Object? modifiedOn = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedOn: null == modifiedOn
          ? _value.modifiedOn
          : modifiedOn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatusHistoryCopyWith<$Res>
    implements $StatusHistoryCopyWith<$Res> {
  factory _$$_StatusHistoryCopyWith(
          _$_StatusHistory value, $Res Function(_$_StatusHistory) then) =
      __$$_StatusHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String orderStatus, String modifiedOn});
}

/// @nodoc
class __$$_StatusHistoryCopyWithImpl<$Res>
    extends _$StatusHistoryCopyWithImpl<$Res, _$_StatusHistory>
    implements _$$_StatusHistoryCopyWith<$Res> {
  __$$_StatusHistoryCopyWithImpl(
      _$_StatusHistory _value, $Res Function(_$_StatusHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? orderStatus = null,
    Object? modifiedOn = null,
  }) {
    return _then(_$_StatusHistory(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedOn: null == modifiedOn
          ? _value.modifiedOn
          : modifiedOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatusHistory implements _StatusHistory {
  const _$_StatusHistory(
      {this.status = '', this.orderStatus = '', this.modifiedOn = ''});

  factory _$_StatusHistory.fromJson(Map<String, dynamic> json) =>
      _$$_StatusHistoryFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String orderStatus;
  @override
  @JsonKey()
  final String modifiedOn;

  @override
  String toString() {
    return 'StatusHistory(status: $status, orderStatus: $orderStatus, modifiedOn: $modifiedOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusHistory &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.modifiedOn, modifiedOn) ||
                other.modifiedOn == modifiedOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, orderStatus, modifiedOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatusHistoryCopyWith<_$_StatusHistory> get copyWith =>
      __$$_StatusHistoryCopyWithImpl<_$_StatusHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusHistoryToJson(
      this,
    );
  }
}

abstract class _StatusHistory implements StatusHistory {
  const factory _StatusHistory(
      {final String status,
      final String orderStatus,
      final String modifiedOn}) = _$_StatusHistory;

  factory _StatusHistory.fromJson(Map<String, dynamic> json) =
      _$_StatusHistory.fromJson;

  @override
  String get status;
  @override
  String get orderStatus;
  @override
  String get modifiedOn;
  @override
  @JsonKey(ignore: true)
  _$$_StatusHistoryCopyWith<_$_StatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
