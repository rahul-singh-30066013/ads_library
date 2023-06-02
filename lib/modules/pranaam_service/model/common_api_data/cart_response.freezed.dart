// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return _CartResponse.fromJson(json);
}

/// @nodoc
mixin _$CartResponse {
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldBookingReferenceId')
  String get oldBookingReferenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'packageDetail')
  PackageDetail get packageDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'travelers')
  List<TravellersModel> get travelers => throw _privateConstructorUsedError;
  @JsonKey(name: 'tripDetail')
  TripDetail get tripDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'packageAddOn')
  List<PackageAddOn> get packageAddOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricingInfo')
  PricingInfo get pricingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'upgradePricingInfo')
  PricingInfo get upgradePricingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldpricingInfo')
  OldPricingInfo get oldPricingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'availiableAddOn')
  List<PackageAddOn> get availiableAddOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalFare')
  TotalFare get totalFare => throw _privateConstructorUsedError;
  @JsonKey(name: 'potentialLoyaltyEarning')
  int get potentialLoyaltyEarning => throw _privateConstructorUsedError;
  @JsonKey(name: 'pranaamBookingType')
  String get pranaamBookingType => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingId')
  int get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTax')
  TotalFare get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'standaloneProductDetails')
  PackageDetail get standaloneProductDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartResponseCopyWith<CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
          CartResponse value, $Res Function(CartResponse) then) =
      _$CartResponseCopyWithImpl<$Res, CartResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId')
          String userId,
      @JsonKey(name: 'oldBookingReferenceId')
          String oldBookingReferenceId,
      @JsonKey(name: 'packageDetail')
          PackageDetail packageDetail,
      @JsonKey(name: 'travelers')
          List<TravellersModel> travelers,
      @JsonKey(name: 'tripDetail')
          TripDetail tripDetail,
      @JsonKey(name: 'packageAddOn')
          List<PackageAddOn> packageAddOn,
      @JsonKey(name: 'pricingInfo')
          PricingInfo pricingInfo,
      @JsonKey(name: 'upgradePricingInfo')
          PricingInfo upgradePricingInfo,
      @JsonKey(name: 'oldpricingInfo')
          OldPricingInfo oldPricingInfo,
      @JsonKey(name: 'availiableAddOn')
          List<PackageAddOn> availiableAddOn,
      @JsonKey(name: 'totalFare')
          TotalFare totalFare,
      @JsonKey(name: 'potentialLoyaltyEarning')
          int potentialLoyaltyEarning,
      @JsonKey(name: 'pranaamBookingType')
          String pranaamBookingType,
      @JsonKey(name: 'bookingId')
          int bookingId,
      @JsonKey(name: 'totalTax')
          TotalFare totalTax,
      @JsonKey(name: 'standaloneProductDetails')
          PackageDetail standaloneProductDetails});

  $PackageDetailCopyWith<$Res> get packageDetail;
  $TripDetailCopyWith<$Res> get tripDetail;
  $PricingInfoCopyWith<$Res> get pricingInfo;
  $PricingInfoCopyWith<$Res> get upgradePricingInfo;
  $OldPricingInfoCopyWith<$Res> get oldPricingInfo;
  $TotalFareCopyWith<$Res> get totalFare;
  $TotalFareCopyWith<$Res> get totalTax;
  $PackageDetailCopyWith<$Res> get standaloneProductDetails;
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res, $Val extends CartResponse>
    implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? oldBookingReferenceId = null,
    Object? packageDetail = null,
    Object? travelers = null,
    Object? tripDetail = null,
    Object? packageAddOn = null,
    Object? pricingInfo = null,
    Object? upgradePricingInfo = null,
    Object? oldPricingInfo = null,
    Object? availiableAddOn = null,
    Object? totalFare = null,
    Object? potentialLoyaltyEarning = null,
    Object? pranaamBookingType = null,
    Object? bookingId = null,
    Object? totalTax = null,
    Object? standaloneProductDetails = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      oldBookingReferenceId: null == oldBookingReferenceId
          ? _value.oldBookingReferenceId
          : oldBookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      packageDetail: null == packageDetail
          ? _value.packageDetail
          : packageDetail // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
      travelers: null == travelers
          ? _value.travelers
          : travelers // ignore: cast_nullable_to_non_nullable
              as List<TravellersModel>,
      tripDetail: null == tripDetail
          ? _value.tripDetail
          : tripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      packageAddOn: null == packageAddOn
          ? _value.packageAddOn
          : packageAddOn // ignore: cast_nullable_to_non_nullable
              as List<PackageAddOn>,
      pricingInfo: null == pricingInfo
          ? _value.pricingInfo
          : pricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      upgradePricingInfo: null == upgradePricingInfo
          ? _value.upgradePricingInfo
          : upgradePricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      oldPricingInfo: null == oldPricingInfo
          ? _value.oldPricingInfo
          : oldPricingInfo // ignore: cast_nullable_to_non_nullable
              as OldPricingInfo,
      availiableAddOn: null == availiableAddOn
          ? _value.availiableAddOn
          : availiableAddOn // ignore: cast_nullable_to_non_nullable
              as List<PackageAddOn>,
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      potentialLoyaltyEarning: null == potentialLoyaltyEarning
          ? _value.potentialLoyaltyEarning
          : potentialLoyaltyEarning // ignore: cast_nullable_to_non_nullable
              as int,
      pranaamBookingType: null == pranaamBookingType
          ? _value.pranaamBookingType
          : pranaamBookingType // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      standaloneProductDetails: null == standaloneProductDetails
          ? _value.standaloneProductDetails
          : standaloneProductDetails // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PackageDetailCopyWith<$Res> get packageDetail {
    return $PackageDetailCopyWith<$Res>(_value.packageDetail, (value) {
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
  $PricingInfoCopyWith<$Res> get pricingInfo {
    return $PricingInfoCopyWith<$Res>(_value.pricingInfo, (value) {
      return _then(_value.copyWith(pricingInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PricingInfoCopyWith<$Res> get upgradePricingInfo {
    return $PricingInfoCopyWith<$Res>(_value.upgradePricingInfo, (value) {
      return _then(_value.copyWith(upgradePricingInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OldPricingInfoCopyWith<$Res> get oldPricingInfo {
    return $OldPricingInfoCopyWith<$Res>(_value.oldPricingInfo, (value) {
      return _then(_value.copyWith(oldPricingInfo: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $PackageDetailCopyWith<$Res> get standaloneProductDetails {
    return $PackageDetailCopyWith<$Res>(_value.standaloneProductDetails,
        (value) {
      return _then(_value.copyWith(standaloneProductDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CartResponseCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$$_CartResponseCopyWith(
          _$_CartResponse value, $Res Function(_$_CartResponse) then) =
      __$$_CartResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId')
          String userId,
      @JsonKey(name: 'oldBookingReferenceId')
          String oldBookingReferenceId,
      @JsonKey(name: 'packageDetail')
          PackageDetail packageDetail,
      @JsonKey(name: 'travelers')
          List<TravellersModel> travelers,
      @JsonKey(name: 'tripDetail')
          TripDetail tripDetail,
      @JsonKey(name: 'packageAddOn')
          List<PackageAddOn> packageAddOn,
      @JsonKey(name: 'pricingInfo')
          PricingInfo pricingInfo,
      @JsonKey(name: 'upgradePricingInfo')
          PricingInfo upgradePricingInfo,
      @JsonKey(name: 'oldpricingInfo')
          OldPricingInfo oldPricingInfo,
      @JsonKey(name: 'availiableAddOn')
          List<PackageAddOn> availiableAddOn,
      @JsonKey(name: 'totalFare')
          TotalFare totalFare,
      @JsonKey(name: 'potentialLoyaltyEarning')
          int potentialLoyaltyEarning,
      @JsonKey(name: 'pranaamBookingType')
          String pranaamBookingType,
      @JsonKey(name: 'bookingId')
          int bookingId,
      @JsonKey(name: 'totalTax')
          TotalFare totalTax,
      @JsonKey(name: 'standaloneProductDetails')
          PackageDetail standaloneProductDetails});

  @override
  $PackageDetailCopyWith<$Res> get packageDetail;
  @override
  $TripDetailCopyWith<$Res> get tripDetail;
  @override
  $PricingInfoCopyWith<$Res> get pricingInfo;
  @override
  $PricingInfoCopyWith<$Res> get upgradePricingInfo;
  @override
  $OldPricingInfoCopyWith<$Res> get oldPricingInfo;
  @override
  $TotalFareCopyWith<$Res> get totalFare;
  @override
  $TotalFareCopyWith<$Res> get totalTax;
  @override
  $PackageDetailCopyWith<$Res> get standaloneProductDetails;
}

/// @nodoc
class __$$_CartResponseCopyWithImpl<$Res>
    extends _$CartResponseCopyWithImpl<$Res, _$_CartResponse>
    implements _$$_CartResponseCopyWith<$Res> {
  __$$_CartResponseCopyWithImpl(
      _$_CartResponse _value, $Res Function(_$_CartResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? oldBookingReferenceId = null,
    Object? packageDetail = null,
    Object? travelers = null,
    Object? tripDetail = null,
    Object? packageAddOn = null,
    Object? pricingInfo = null,
    Object? upgradePricingInfo = null,
    Object? oldPricingInfo = null,
    Object? availiableAddOn = null,
    Object? totalFare = null,
    Object? potentialLoyaltyEarning = null,
    Object? pranaamBookingType = null,
    Object? bookingId = null,
    Object? totalTax = null,
    Object? standaloneProductDetails = null,
  }) {
    return _then(_$_CartResponse(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      oldBookingReferenceId: null == oldBookingReferenceId
          ? _value.oldBookingReferenceId
          : oldBookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      packageDetail: null == packageDetail
          ? _value.packageDetail
          : packageDetail // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
      travelers: null == travelers
          ? _value.travelers
          : travelers // ignore: cast_nullable_to_non_nullable
              as List<TravellersModel>,
      tripDetail: null == tripDetail
          ? _value.tripDetail
          : tripDetail // ignore: cast_nullable_to_non_nullable
              as TripDetail,
      packageAddOn: null == packageAddOn
          ? _value.packageAddOn
          : packageAddOn // ignore: cast_nullable_to_non_nullable
              as List<PackageAddOn>,
      pricingInfo: null == pricingInfo
          ? _value.pricingInfo
          : pricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      upgradePricingInfo: null == upgradePricingInfo
          ? _value.upgradePricingInfo
          : upgradePricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      oldPricingInfo: null == oldPricingInfo
          ? _value.oldPricingInfo
          : oldPricingInfo // ignore: cast_nullable_to_non_nullable
              as OldPricingInfo,
      availiableAddOn: null == availiableAddOn
          ? _value.availiableAddOn
          : availiableAddOn // ignore: cast_nullable_to_non_nullable
              as List<PackageAddOn>,
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      potentialLoyaltyEarning: null == potentialLoyaltyEarning
          ? _value.potentialLoyaltyEarning
          : potentialLoyaltyEarning // ignore: cast_nullable_to_non_nullable
              as int,
      pranaamBookingType: null == pranaamBookingType
          ? _value.pranaamBookingType
          : pranaamBookingType // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      standaloneProductDetails: null == standaloneProductDetails
          ? _value.standaloneProductDetails
          : standaloneProductDetails // ignore: cast_nullable_to_non_nullable
              as PackageDetail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartResponse implements _CartResponse {
  const _$_CartResponse(
      {@JsonKey(name: 'userId')
          this.userId = '',
      @JsonKey(name: 'oldBookingReferenceId')
          this.oldBookingReferenceId = '',
      @JsonKey(name: 'packageDetail')
          this.packageDetail = const PackageDetail(),
      @JsonKey(name: 'travelers')
          this.travelers = const [],
      @JsonKey(name: 'tripDetail')
          required this.tripDetail,
      @JsonKey(name: 'packageAddOn')
          this.packageAddOn = const [],
      @JsonKey(name: 'pricingInfo')
          this.pricingInfo = const PricingInfo(),
      @JsonKey(name: 'upgradePricingInfo')
          this.upgradePricingInfo = const PricingInfo(),
      @JsonKey(name: 'oldpricingInfo')
          this.oldPricingInfo = const OldPricingInfo(),
      @JsonKey(name: 'availiableAddOn')
          this.availiableAddOn = const [],
      @JsonKey(name: 'totalFare')
          this.totalFare = const TotalFare(),
      @JsonKey(name: 'potentialLoyaltyEarning')
          this.potentialLoyaltyEarning = 0,
      @JsonKey(name: 'pranaamBookingType')
          this.pranaamBookingType = '',
      @JsonKey(name: 'bookingId')
          this.bookingId = 0,
      @JsonKey(name: 'totalTax')
          this.totalTax = const TotalFare(),
      @JsonKey(name: 'standaloneProductDetails')
          this.standaloneProductDetails = const PackageDetail()});

  factory _$_CartResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CartResponseFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'oldBookingReferenceId')
  final String oldBookingReferenceId;
  @override
  @JsonKey(name: 'packageDetail')
  final PackageDetail packageDetail;
  @override
  @JsonKey(name: 'travelers')
  final List<TravellersModel> travelers;
  @override
  @JsonKey(name: 'tripDetail')
  final TripDetail tripDetail;
  @override
  @JsonKey(name: 'packageAddOn')
  final List<PackageAddOn> packageAddOn;
  @override
  @JsonKey(name: 'pricingInfo')
  final PricingInfo pricingInfo;
  @override
  @JsonKey(name: 'upgradePricingInfo')
  final PricingInfo upgradePricingInfo;
  @override
  @JsonKey(name: 'oldpricingInfo')
  final OldPricingInfo oldPricingInfo;
  @override
  @JsonKey(name: 'availiableAddOn')
  final List<PackageAddOn> availiableAddOn;
  @override
  @JsonKey(name: 'totalFare')
  final TotalFare totalFare;
  @override
  @JsonKey(name: 'potentialLoyaltyEarning')
  final int potentialLoyaltyEarning;
  @override
  @JsonKey(name: 'pranaamBookingType')
  final String pranaamBookingType;
  @override
  @JsonKey(name: 'bookingId')
  final int bookingId;
  @override
  @JsonKey(name: 'totalTax')
  final TotalFare totalTax;
  @override
  @JsonKey(name: 'standaloneProductDetails')
  final PackageDetail standaloneProductDetails;

  @override
  String toString() {
    return 'CartResponse(userId: $userId, oldBookingReferenceId: $oldBookingReferenceId, packageDetail: $packageDetail, travelers: $travelers, tripDetail: $tripDetail, packageAddOn: $packageAddOn, pricingInfo: $pricingInfo, upgradePricingInfo: $upgradePricingInfo, oldPricingInfo: $oldPricingInfo, availiableAddOn: $availiableAddOn, totalFare: $totalFare, potentialLoyaltyEarning: $potentialLoyaltyEarning, pranaamBookingType: $pranaamBookingType, bookingId: $bookingId, totalTax: $totalTax, standaloneProductDetails: $standaloneProductDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartResponse &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.oldBookingReferenceId, oldBookingReferenceId) ||
                other.oldBookingReferenceId == oldBookingReferenceId) &&
            (identical(other.packageDetail, packageDetail) ||
                other.packageDetail == packageDetail) &&
            const DeepCollectionEquality().equals(other.travelers, travelers) &&
            (identical(other.tripDetail, tripDetail) ||
                other.tripDetail == tripDetail) &&
            const DeepCollectionEquality()
                .equals(other.packageAddOn, packageAddOn) &&
            (identical(other.pricingInfo, pricingInfo) ||
                other.pricingInfo == pricingInfo) &&
            (identical(other.upgradePricingInfo, upgradePricingInfo) ||
                other.upgradePricingInfo == upgradePricingInfo) &&
            (identical(other.oldPricingInfo, oldPricingInfo) ||
                other.oldPricingInfo == oldPricingInfo) &&
            const DeepCollectionEquality()
                .equals(other.availiableAddOn, availiableAddOn) &&
            (identical(other.totalFare, totalFare) ||
                other.totalFare == totalFare) &&
            (identical(
                    other.potentialLoyaltyEarning, potentialLoyaltyEarning) ||
                other.potentialLoyaltyEarning == potentialLoyaltyEarning) &&
            (identical(other.pranaamBookingType, pranaamBookingType) ||
                other.pranaamBookingType == pranaamBookingType) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(
                    other.standaloneProductDetails, standaloneProductDetails) ||
                other.standaloneProductDetails == standaloneProductDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      oldBookingReferenceId,
      packageDetail,
      const DeepCollectionEquality().hash(travelers),
      tripDetail,
      const DeepCollectionEquality().hash(packageAddOn),
      pricingInfo,
      upgradePricingInfo,
      oldPricingInfo,
      const DeepCollectionEquality().hash(availiableAddOn),
      totalFare,
      potentialLoyaltyEarning,
      pranaamBookingType,
      bookingId,
      totalTax,
      standaloneProductDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartResponseCopyWith<_$_CartResponse> get copyWith =>
      __$$_CartResponseCopyWithImpl<_$_CartResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartResponseToJson(
      this,
    );
  }
}

abstract class _CartResponse implements CartResponse {
  const factory _CartResponse(
      {@JsonKey(name: 'userId')
          final String userId,
      @JsonKey(name: 'oldBookingReferenceId')
          final String oldBookingReferenceId,
      @JsonKey(name: 'packageDetail')
          final PackageDetail packageDetail,
      @JsonKey(name: 'travelers')
          final List<TravellersModel> travelers,
      @JsonKey(name: 'tripDetail')
          required final TripDetail tripDetail,
      @JsonKey(name: 'packageAddOn')
          final List<PackageAddOn> packageAddOn,
      @JsonKey(name: 'pricingInfo')
          final PricingInfo pricingInfo,
      @JsonKey(name: 'upgradePricingInfo')
          final PricingInfo upgradePricingInfo,
      @JsonKey(name: 'oldpricingInfo')
          final OldPricingInfo oldPricingInfo,
      @JsonKey(name: 'availiableAddOn')
          final List<PackageAddOn> availiableAddOn,
      @JsonKey(name: 'totalFare')
          final TotalFare totalFare,
      @JsonKey(name: 'potentialLoyaltyEarning')
          final int potentialLoyaltyEarning,
      @JsonKey(name: 'pranaamBookingType')
          final String pranaamBookingType,
      @JsonKey(name: 'bookingId')
          final int bookingId,
      @JsonKey(name: 'totalTax')
          final TotalFare totalTax,
      @JsonKey(name: 'standaloneProductDetails')
          final PackageDetail standaloneProductDetails}) = _$_CartResponse;

  factory _CartResponse.fromJson(Map<String, dynamic> json) =
      _$_CartResponse.fromJson;

  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'oldBookingReferenceId')
  String get oldBookingReferenceId;
  @override
  @JsonKey(name: 'packageDetail')
  PackageDetail get packageDetail;
  @override
  @JsonKey(name: 'travelers')
  List<TravellersModel> get travelers;
  @override
  @JsonKey(name: 'tripDetail')
  TripDetail get tripDetail;
  @override
  @JsonKey(name: 'packageAddOn')
  List<PackageAddOn> get packageAddOn;
  @override
  @JsonKey(name: 'pricingInfo')
  PricingInfo get pricingInfo;
  @override
  @JsonKey(name: 'upgradePricingInfo')
  PricingInfo get upgradePricingInfo;
  @override
  @JsonKey(name: 'oldpricingInfo')
  OldPricingInfo get oldPricingInfo;
  @override
  @JsonKey(name: 'availiableAddOn')
  List<PackageAddOn> get availiableAddOn;
  @override
  @JsonKey(name: 'totalFare')
  TotalFare get totalFare;
  @override
  @JsonKey(name: 'potentialLoyaltyEarning')
  int get potentialLoyaltyEarning;
  @override
  @JsonKey(name: 'pranaamBookingType')
  String get pranaamBookingType;
  @override
  @JsonKey(name: 'bookingId')
  int get bookingId;
  @override
  @JsonKey(name: 'totalTax')
  TotalFare get totalTax;
  @override
  @JsonKey(name: 'standaloneProductDetails')
  PackageDetail get standaloneProductDetails;
  @override
  @JsonKey(ignore: true)
  _$$_CartResponseCopyWith<_$_CartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

OldPricingInfo _$OldPricingInfoFromJson(Map<String, dynamic> json) {
  return _OldPricingInfo.fromJson(json);
}

/// @nodoc
mixin _$OldPricingInfo {
  @JsonKey(name: 'totalFare')
  TotalFare get totalFare => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalBaseFare')
  TotalFare get totalBaseFare => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTax')
  TotalTax get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'passengerTypeQuantity')
  PassengerTypeQuantity get passengerTypeQuantity =>
      throw _privateConstructorUsedError;
  TotalExpressFare get totalExpressFare => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OldPricingInfoCopyWith<OldPricingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OldPricingInfoCopyWith<$Res> {
  factory $OldPricingInfoCopyWith(
          OldPricingInfo value, $Res Function(OldPricingInfo) then) =
      _$OldPricingInfoCopyWithImpl<$Res, OldPricingInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalFare')
          TotalFare totalFare,
      @JsonKey(name: 'totalBaseFare')
          TotalFare totalBaseFare,
      @JsonKey(name: 'totalTax')
          TotalTax totalTax,
      @JsonKey(name: 'passengerTypeQuantity')
          PassengerTypeQuantity passengerTypeQuantity,
      TotalExpressFare totalExpressFare});

  $TotalFareCopyWith<$Res> get totalFare;
  $TotalFareCopyWith<$Res> get totalBaseFare;
  $TotalTaxCopyWith<$Res> get totalTax;
  $PassengerTypeQuantityCopyWith<$Res> get passengerTypeQuantity;
  $TotalExpressFareCopyWith<$Res> get totalExpressFare;
}

/// @nodoc
class _$OldPricingInfoCopyWithImpl<$Res, $Val extends OldPricingInfo>
    implements $OldPricingInfoCopyWith<$Res> {
  _$OldPricingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalFare = null,
    Object? totalBaseFare = null,
    Object? totalTax = null,
    Object? passengerTypeQuantity = null,
    Object? totalExpressFare = null,
  }) {
    return _then(_value.copyWith(
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      totalBaseFare: null == totalBaseFare
          ? _value.totalBaseFare
          : totalBaseFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as TotalTax,
      passengerTypeQuantity: null == passengerTypeQuantity
          ? _value.passengerTypeQuantity
          : passengerTypeQuantity // ignore: cast_nullable_to_non_nullable
              as PassengerTypeQuantity,
      totalExpressFare: null == totalExpressFare
          ? _value.totalExpressFare
          : totalExpressFare // ignore: cast_nullable_to_non_nullable
              as TotalExpressFare,
    ) as $Val);
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
  $TotalFareCopyWith<$Res> get totalBaseFare {
    return $TotalFareCopyWith<$Res>(_value.totalBaseFare, (value) {
      return _then(_value.copyWith(totalBaseFare: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalTaxCopyWith<$Res> get totalTax {
    return $TotalTaxCopyWith<$Res>(_value.totalTax, (value) {
      return _then(_value.copyWith(totalTax: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PassengerTypeQuantityCopyWith<$Res> get passengerTypeQuantity {
    return $PassengerTypeQuantityCopyWith<$Res>(_value.passengerTypeQuantity,
        (value) {
      return _then(_value.copyWith(passengerTypeQuantity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TotalExpressFareCopyWith<$Res> get totalExpressFare {
    return $TotalExpressFareCopyWith<$Res>(_value.totalExpressFare, (value) {
      return _then(_value.copyWith(totalExpressFare: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OldPricingInfoCopyWith<$Res>
    implements $OldPricingInfoCopyWith<$Res> {
  factory _$$_OldPricingInfoCopyWith(
          _$_OldPricingInfo value, $Res Function(_$_OldPricingInfo) then) =
      __$$_OldPricingInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalFare')
          TotalFare totalFare,
      @JsonKey(name: 'totalBaseFare')
          TotalFare totalBaseFare,
      @JsonKey(name: 'totalTax')
          TotalTax totalTax,
      @JsonKey(name: 'passengerTypeQuantity')
          PassengerTypeQuantity passengerTypeQuantity,
      TotalExpressFare totalExpressFare});

  @override
  $TotalFareCopyWith<$Res> get totalFare;
  @override
  $TotalFareCopyWith<$Res> get totalBaseFare;
  @override
  $TotalTaxCopyWith<$Res> get totalTax;
  @override
  $PassengerTypeQuantityCopyWith<$Res> get passengerTypeQuantity;
  @override
  $TotalExpressFareCopyWith<$Res> get totalExpressFare;
}

/// @nodoc
class __$$_OldPricingInfoCopyWithImpl<$Res>
    extends _$OldPricingInfoCopyWithImpl<$Res, _$_OldPricingInfo>
    implements _$$_OldPricingInfoCopyWith<$Res> {
  __$$_OldPricingInfoCopyWithImpl(
      _$_OldPricingInfo _value, $Res Function(_$_OldPricingInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalFare = null,
    Object? totalBaseFare = null,
    Object? totalTax = null,
    Object? passengerTypeQuantity = null,
    Object? totalExpressFare = null,
  }) {
    return _then(_$_OldPricingInfo(
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      totalBaseFare: null == totalBaseFare
          ? _value.totalBaseFare
          : totalBaseFare // ignore: cast_nullable_to_non_nullable
              as TotalFare,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as TotalTax,
      passengerTypeQuantity: null == passengerTypeQuantity
          ? _value.passengerTypeQuantity
          : passengerTypeQuantity // ignore: cast_nullable_to_non_nullable
              as PassengerTypeQuantity,
      totalExpressFare: null == totalExpressFare
          ? _value.totalExpressFare
          : totalExpressFare // ignore: cast_nullable_to_non_nullable
              as TotalExpressFare,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OldPricingInfo implements _OldPricingInfo {
  const _$_OldPricingInfo(
      {@JsonKey(name: 'totalFare')
          this.totalFare = const TotalFare(),
      @JsonKey(name: 'totalBaseFare')
          this.totalBaseFare = const TotalFare(),
      @JsonKey(name: 'totalTax')
          this.totalTax = const TotalTax(),
      @JsonKey(name: 'passengerTypeQuantity')
          this.passengerTypeQuantity = const PassengerTypeQuantity(),
      this.totalExpressFare = const TotalExpressFare()});

  factory _$_OldPricingInfo.fromJson(Map<String, dynamic> json) =>
      _$$_OldPricingInfoFromJson(json);

  @override
  @JsonKey(name: 'totalFare')
  final TotalFare totalFare;
  @override
  @JsonKey(name: 'totalBaseFare')
  final TotalFare totalBaseFare;
  @override
  @JsonKey(name: 'totalTax')
  final TotalTax totalTax;
  @override
  @JsonKey(name: 'passengerTypeQuantity')
  final PassengerTypeQuantity passengerTypeQuantity;
  @override
  @JsonKey()
  final TotalExpressFare totalExpressFare;

  @override
  String toString() {
    return 'OldPricingInfo(totalFare: $totalFare, totalBaseFare: $totalBaseFare, totalTax: $totalTax, passengerTypeQuantity: $passengerTypeQuantity, totalExpressFare: $totalExpressFare)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OldPricingInfo &&
            (identical(other.totalFare, totalFare) ||
                other.totalFare == totalFare) &&
            (identical(other.totalBaseFare, totalBaseFare) ||
                other.totalBaseFare == totalBaseFare) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.passengerTypeQuantity, passengerTypeQuantity) ||
                other.passengerTypeQuantity == passengerTypeQuantity) &&
            (identical(other.totalExpressFare, totalExpressFare) ||
                other.totalExpressFare == totalExpressFare));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalFare, totalBaseFare,
      totalTax, passengerTypeQuantity, totalExpressFare);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OldPricingInfoCopyWith<_$_OldPricingInfo> get copyWith =>
      __$$_OldPricingInfoCopyWithImpl<_$_OldPricingInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OldPricingInfoToJson(
      this,
    );
  }
}

abstract class _OldPricingInfo implements OldPricingInfo {
  const factory _OldPricingInfo(
      {@JsonKey(name: 'totalFare')
          final TotalFare totalFare,
      @JsonKey(name: 'totalBaseFare')
          final TotalFare totalBaseFare,
      @JsonKey(name: 'totalTax')
          final TotalTax totalTax,
      @JsonKey(name: 'passengerTypeQuantity')
          final PassengerTypeQuantity passengerTypeQuantity,
      final TotalExpressFare totalExpressFare}) = _$_OldPricingInfo;

  factory _OldPricingInfo.fromJson(Map<String, dynamic> json) =
      _$_OldPricingInfo.fromJson;

  @override
  @JsonKey(name: 'totalFare')
  TotalFare get totalFare;
  @override
  @JsonKey(name: 'totalBaseFare')
  TotalFare get totalBaseFare;
  @override
  @JsonKey(name: 'totalTax')
  TotalTax get totalTax;
  @override
  @JsonKey(name: 'passengerTypeQuantity')
  PassengerTypeQuantity get passengerTypeQuantity;
  @override
  TotalExpressFare get totalExpressFare;
  @override
  @JsonKey(ignore: true)
  _$$_OldPricingInfoCopyWith<_$_OldPricingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

TotalFare _$TotalFareFromJson(Map<String, dynamic> json) {
  return _TotalFare.fromJson(json);
}

/// @nodoc
mixin _$TotalFare {
  @JsonKey(name: 'amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'cgst')
  double get cgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'sgst')
  double get sgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'currencyCode')
  String get currencyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotalFareCopyWith<TotalFare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalFareCopyWith<$Res> {
  factory $TotalFareCopyWith(TotalFare value, $Res Function(TotalFare) then) =
      _$TotalFareCopyWithImpl<$Res, TotalFare>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'cgst') double cgst,
      @JsonKey(name: 'sgst') double sgst,
      @JsonKey(name: 'currencyCode') String currencyCode});
}

/// @nodoc
class _$TotalFareCopyWithImpl<$Res, $Val extends TotalFare>
    implements $TotalFareCopyWith<$Res> {
  _$TotalFareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? currencyCode = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _value.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _value.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TotalFareCopyWith<$Res> implements $TotalFareCopyWith<$Res> {
  factory _$$_TotalFareCopyWith(
          _$_TotalFare value, $Res Function(_$_TotalFare) then) =
      __$$_TotalFareCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'cgst') double cgst,
      @JsonKey(name: 'sgst') double sgst,
      @JsonKey(name: 'currencyCode') String currencyCode});
}

/// @nodoc
class __$$_TotalFareCopyWithImpl<$Res>
    extends _$TotalFareCopyWithImpl<$Res, _$_TotalFare>
    implements _$$_TotalFareCopyWith<$Res> {
  __$$_TotalFareCopyWithImpl(
      _$_TotalFare _value, $Res Function(_$_TotalFare) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? cgst = null,
    Object? sgst = null,
    Object? currencyCode = null,
  }) {
    return _then(_$_TotalFare(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      cgst: null == cgst
          ? _value.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as double,
      sgst: null == sgst
          ? _value.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as double,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TotalFare implements _TotalFare {
  const _$_TotalFare(
      {@JsonKey(name: 'amount') this.amount = 0,
      @JsonKey(name: 'cgst') this.cgst = 0,
      @JsonKey(name: 'sgst') this.sgst = 0,
      @JsonKey(name: 'currencyCode') this.currencyCode = ''});

  factory _$_TotalFare.fromJson(Map<String, dynamic> json) =>
      _$$_TotalFareFromJson(json);

  @override
  @JsonKey(name: 'amount')
  final double amount;
  @override
  @JsonKey(name: 'cgst')
  final double cgst;
  @override
  @JsonKey(name: 'sgst')
  final double sgst;
  @override
  @JsonKey(name: 'currencyCode')
  final String currencyCode;

  @override
  String toString() {
    return 'TotalFare(amount: $amount, cgst: $cgst, sgst: $sgst, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TotalFare &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.cgst, cgst) || other.cgst == cgst) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, cgst, sgst, currencyCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TotalFareCopyWith<_$_TotalFare> get copyWith =>
      __$$_TotalFareCopyWithImpl<_$_TotalFare>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TotalFareToJson(
      this,
    );
  }
}

abstract class _TotalFare implements TotalFare {
  const factory _TotalFare(
      {@JsonKey(name: 'amount') final double amount,
      @JsonKey(name: 'cgst') final double cgst,
      @JsonKey(name: 'sgst') final double sgst,
      @JsonKey(name: 'currencyCode') final String currencyCode}) = _$_TotalFare;

  factory _TotalFare.fromJson(Map<String, dynamic> json) =
      _$_TotalFare.fromJson;

  @override
  @JsonKey(name: 'amount')
  double get amount;
  @override
  @JsonKey(name: 'cgst')
  double get cgst;
  @override
  @JsonKey(name: 'sgst')
  double get sgst;
  @override
  @JsonKey(name: 'currencyCode')
  String get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$_TotalFareCopyWith<_$_TotalFare> get copyWith =>
      throw _privateConstructorUsedError;
}

TotalTax _$TotalTaxFromJson(Map<String, dynamic> json) {
  return _TotalTax.fromJson(json);
}

/// @nodoc
mixin _$TotalTax {
  @JsonKey(name: 'amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'currencyCode')
  String get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'sgst')
  Gst get sgst => throw _privateConstructorUsedError;
  @JsonKey(name: 'cgst')
  Gst get cgst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TotalTaxCopyWith<TotalTax> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalTaxCopyWith<$Res> {
  factory $TotalTaxCopyWith(TotalTax value, $Res Function(TotalTax) then) =
      _$TotalTaxCopyWithImpl<$Res, TotalTax>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'currencyCode') String currencyCode,
      @JsonKey(name: 'sgst') Gst sgst,
      @JsonKey(name: 'cgst') Gst cgst});

  $GstCopyWith<$Res> get sgst;
  $GstCopyWith<$Res> get cgst;
}

/// @nodoc
class _$TotalTaxCopyWithImpl<$Res, $Val extends TotalTax>
    implements $TotalTaxCopyWith<$Res> {
  _$TotalTaxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currencyCode = null,
    Object? sgst = null,
    Object? cgst = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      sgst: null == sgst
          ? _value.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as Gst,
      cgst: null == cgst
          ? _value.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as Gst,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GstCopyWith<$Res> get sgst {
    return $GstCopyWith<$Res>(_value.sgst, (value) {
      return _then(_value.copyWith(sgst: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GstCopyWith<$Res> get cgst {
    return $GstCopyWith<$Res>(_value.cgst, (value) {
      return _then(_value.copyWith(cgst: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TotalTaxCopyWith<$Res> implements $TotalTaxCopyWith<$Res> {
  factory _$$_TotalTaxCopyWith(
          _$_TotalTax value, $Res Function(_$_TotalTax) then) =
      __$$_TotalTaxCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'currencyCode') String currencyCode,
      @JsonKey(name: 'sgst') Gst sgst,
      @JsonKey(name: 'cgst') Gst cgst});

  @override
  $GstCopyWith<$Res> get sgst;
  @override
  $GstCopyWith<$Res> get cgst;
}

/// @nodoc
class __$$_TotalTaxCopyWithImpl<$Res>
    extends _$TotalTaxCopyWithImpl<$Res, _$_TotalTax>
    implements _$$_TotalTaxCopyWith<$Res> {
  __$$_TotalTaxCopyWithImpl(
      _$_TotalTax _value, $Res Function(_$_TotalTax) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currencyCode = null,
    Object? sgst = null,
    Object? cgst = null,
  }) {
    return _then(_$_TotalTax(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      sgst: null == sgst
          ? _value.sgst
          : sgst // ignore: cast_nullable_to_non_nullable
              as Gst,
      cgst: null == cgst
          ? _value.cgst
          : cgst // ignore: cast_nullable_to_non_nullable
              as Gst,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TotalTax implements _TotalTax {
  const _$_TotalTax(
      {@JsonKey(name: 'amount') this.amount = 0,
      @JsonKey(name: 'currencyCode') this.currencyCode = '',
      @JsonKey(name: 'sgst') this.sgst = const Gst(),
      @JsonKey(name: 'cgst') this.cgst = const Gst()});

  factory _$_TotalTax.fromJson(Map<String, dynamic> json) =>
      _$$_TotalTaxFromJson(json);

  @override
  @JsonKey(name: 'amount')
  final double amount;
  @override
  @JsonKey(name: 'currencyCode')
  final String currencyCode;
  @override
  @JsonKey(name: 'sgst')
  final Gst sgst;
  @override
  @JsonKey(name: 'cgst')
  final Gst cgst;

  @override
  String toString() {
    return 'TotalTax(amount: $amount, currencyCode: $currencyCode, sgst: $sgst, cgst: $cgst)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TotalTax &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.sgst, sgst) || other.sgst == sgst) &&
            (identical(other.cgst, cgst) || other.cgst == cgst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, currencyCode, sgst, cgst);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TotalTaxCopyWith<_$_TotalTax> get copyWith =>
      __$$_TotalTaxCopyWithImpl<_$_TotalTax>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TotalTaxToJson(
      this,
    );
  }
}

abstract class _TotalTax implements TotalTax {
  const factory _TotalTax(
      {@JsonKey(name: 'amount') final double amount,
      @JsonKey(name: 'currencyCode') final String currencyCode,
      @JsonKey(name: 'sgst') final Gst sgst,
      @JsonKey(name: 'cgst') final Gst cgst}) = _$_TotalTax;

  factory _TotalTax.fromJson(Map<String, dynamic> json) = _$_TotalTax.fromJson;

  @override
  @JsonKey(name: 'amount')
  double get amount;
  @override
  @JsonKey(name: 'currencyCode')
  String get currencyCode;
  @override
  @JsonKey(name: 'sgst')
  Gst get sgst;
  @override
  @JsonKey(name: 'cgst')
  Gst get cgst;
  @override
  @JsonKey(ignore: true)
  _$$_TotalTaxCopyWith<_$_TotalTax> get copyWith =>
      throw _privateConstructorUsedError;
}

Gst _$GstFromJson(Map<String, dynamic> json) {
  return _Gst.fromJson(json);
}

/// @nodoc
mixin _$Gst {
  @JsonKey(name: 'amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage')
  double get percentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GstCopyWith<Gst> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GstCopyWith<$Res> {
  factory $GstCopyWith(Gst value, $Res Function(Gst) then) =
      _$GstCopyWithImpl<$Res, Gst>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'percentage') double percentage});
}

/// @nodoc
class _$GstCopyWithImpl<$Res, $Val extends Gst> implements $GstCopyWith<$Res> {
  _$GstCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GstCopyWith<$Res> implements $GstCopyWith<$Res> {
  factory _$$_GstCopyWith(_$_Gst value, $Res Function(_$_Gst) then) =
      __$$_GstCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') double amount,
      @JsonKey(name: 'percentage') double percentage});
}

/// @nodoc
class __$$_GstCopyWithImpl<$Res> extends _$GstCopyWithImpl<$Res, _$_Gst>
    implements _$$_GstCopyWith<$Res> {
  __$$_GstCopyWithImpl(_$_Gst _value, $Res Function(_$_Gst) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_$_Gst(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gst implements _Gst {
  const _$_Gst(
      {@JsonKey(name: 'amount') this.amount = 0,
      @JsonKey(name: 'percentage') this.percentage = 0});

  factory _$_Gst.fromJson(Map<String, dynamic> json) => _$$_GstFromJson(json);

  @override
  @JsonKey(name: 'amount')
  final double amount;
  @override
  @JsonKey(name: 'percentage')
  final double percentage;

  @override
  String toString() {
    return 'Gst(amount: $amount, percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gst &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GstCopyWith<_$_Gst> get copyWith =>
      __$$_GstCopyWithImpl<_$_Gst>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GstToJson(
      this,
    );
  }
}

abstract class _Gst implements Gst {
  const factory _Gst(
      {@JsonKey(name: 'amount') final double amount,
      @JsonKey(name: 'percentage') final double percentage}) = _$_Gst;

  factory _Gst.fromJson(Map<String, dynamic> json) = _$_Gst.fromJson;

  @override
  @JsonKey(name: 'amount')
  double get amount;
  @override
  @JsonKey(name: 'percentage')
  double get percentage;
  @override
  @JsonKey(ignore: true)
  _$$_GstCopyWith<_$_Gst> get copyWith => throw _privateConstructorUsedError;
}
