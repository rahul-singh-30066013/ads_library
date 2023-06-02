// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripDetail _$TripDetailFromJson(Map<String, dynamic> json) {
  return _TripDetail.fromJson(json);
}

/// @nodoc
mixin _$TripDetail {
  @JsonKey(name: 'tripId')
  int get tripId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tripBookingNumber')
  String get tripBookingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'originAirportId')
  int get originAirportId => throw _privateConstructorUsedError;
  @JsonKey(name: 'originAirport')
  String get originAirport => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinationAirportId')
  int get destinationAirportId => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinationAirport')
  String get destinationAirport => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceAirportId')
  int get serviceAirportId => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessUnitId')
  int get businessUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceDateTime')
  String get serviceDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightName')
  String get flightName => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightNumber')
  String get flightNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightTerminal')
  String get flightTerminal => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightDate')
  String get flightDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightTime')
  String get flightTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'travelSector')
  String get travelSector => throw _privateConstructorUsedError;
  @JsonKey(name: 'travelSectorId')
  int get travelSectorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceAirport')
  String get serviceAirport => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceAirportName')
  String get serviceAirportName => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceType')
  String get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'tripStatus')
  TripStatus get tripStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'transitDestRoundTripSecOrigin')
  int get transitDestRoundTripSecOrigin => throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightName')
  String get transitRoundTripSecFlightName =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightNumber')
  int get transitRoundTripSecFlightNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightTerminal')
  String get transitRoundTripSecFlightTerminal =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightDate')
  String get transitRoundTripSecFlightDate =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightTime')
  String get transitRoundTripSecFlightTime =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'roundTripSecServiceDateTime')
  String get roundTripSecServiceDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripDetailCopyWith<TripDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripDetailCopyWith<$Res> {
  factory $TripDetailCopyWith(
          TripDetail value, $Res Function(TripDetail) then) =
      _$TripDetailCopyWithImpl<$Res, TripDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tripId')
          int tripId,
      @JsonKey(name: 'tripBookingNumber')
          String tripBookingNumber,
      @JsonKey(name: 'originAirportId')
          int originAirportId,
      @JsonKey(name: 'originAirport')
          String originAirport,
      @JsonKey(name: 'destinationAirportId')
          int destinationAirportId,
      @JsonKey(name: 'destinationAirport')
          String destinationAirport,
      @JsonKey(name: 'serviceAirportId')
          int serviceAirportId,
      @JsonKey(name: 'businessUnitId')
          int businessUnitId,
      @JsonKey(name: 'serviceDateTime')
          String serviceDateTime,
      @JsonKey(name: 'flightName')
          String flightName,
      @JsonKey(name: 'flightNumber')
          String flightNumber,
      @JsonKey(name: 'flightTerminal')
          String flightTerminal,
      @JsonKey(name: 'flightDate')
          String flightDate,
      @JsonKey(name: 'flightTime')
          String flightTime,
      @JsonKey(name: 'travelSector')
          String travelSector,
      @JsonKey(name: 'travelSectorId')
          int travelSectorId,
      @JsonKey(name: 'serviceAirport')
          String serviceAirport,
      @JsonKey(name: 'serviceAirportName')
          String serviceAirportName,
      @JsonKey(name: 'serviceType')
          String serviceType,
      @JsonKey(name: 'tripStatus')
          TripStatus tripStatus,
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          int transitDestRoundTripSecOrigin,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          String transitRoundTripSecFlightName,
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          int transitRoundTripSecFlightNumber,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          String transitRoundTripSecFlightTerminal,
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          String transitRoundTripSecFlightDate,
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          String transitRoundTripSecFlightTime,
      @JsonKey(name: 'roundTripSecServiceDateTime')
          String roundTripSecServiceDateTime});

  $TripStatusCopyWith<$Res> get tripStatus;
}

/// @nodoc
class _$TripDetailCopyWithImpl<$Res, $Val extends TripDetail>
    implements $TripDetailCopyWith<$Res> {
  _$TripDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? tripBookingNumber = null,
    Object? originAirportId = null,
    Object? originAirport = null,
    Object? destinationAirportId = null,
    Object? destinationAirport = null,
    Object? serviceAirportId = null,
    Object? businessUnitId = null,
    Object? serviceDateTime = null,
    Object? flightName = null,
    Object? flightNumber = null,
    Object? flightTerminal = null,
    Object? flightDate = null,
    Object? flightTime = null,
    Object? travelSector = null,
    Object? travelSectorId = null,
    Object? serviceAirport = null,
    Object? serviceAirportName = null,
    Object? serviceType = null,
    Object? tripStatus = null,
    Object? transitDestRoundTripSecOrigin = null,
    Object? transitRoundTripSecFlightName = null,
    Object? transitRoundTripSecFlightNumber = null,
    Object? transitRoundTripSecFlightTerminal = null,
    Object? transitRoundTripSecFlightDate = null,
    Object? transitRoundTripSecFlightTime = null,
    Object? roundTripSecServiceDateTime = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      tripBookingNumber: null == tripBookingNumber
          ? _value.tripBookingNumber
          : tripBookingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      originAirportId: null == originAirportId
          ? _value.originAirportId
          : originAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      originAirport: null == originAirport
          ? _value.originAirport
          : originAirport // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAirportId: null == destinationAirportId
          ? _value.destinationAirportId
          : destinationAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      destinationAirport: null == destinationAirport
          ? _value.destinationAirport
          : destinationAirport // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAirportId: null == serviceAirportId
          ? _value.serviceAirportId
          : serviceAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      businessUnitId: null == businessUnitId
          ? _value.businessUnitId
          : businessUnitId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceDateTime: null == serviceDateTime
          ? _value.serviceDateTime
          : serviceDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      flightName: null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flightTerminal: null == flightTerminal
          ? _value.flightTerminal
          : flightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as String,
      flightTime: null == flightTime
          ? _value.flightTime
          : flightTime // ignore: cast_nullable_to_non_nullable
              as String,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as String,
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceAirport: null == serviceAirport
          ? _value.serviceAirport
          : serviceAirport // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAirportName: null == serviceAirportName
          ? _value.serviceAirportName
          : serviceAirportName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      tripStatus: null == tripStatus
          ? _value.tripStatus
          : tripStatus // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      transitDestRoundTripSecOrigin: null == transitDestRoundTripSecOrigin
          ? _value.transitDestRoundTripSecOrigin
          : transitDestRoundTripSecOrigin // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightName: null == transitRoundTripSecFlightName
          ? _value.transitRoundTripSecFlightName
          : transitRoundTripSecFlightName // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightNumber: null == transitRoundTripSecFlightNumber
          ? _value.transitRoundTripSecFlightNumber
          : transitRoundTripSecFlightNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightTerminal: null ==
              transitRoundTripSecFlightTerminal
          ? _value.transitRoundTripSecFlightTerminal
          : transitRoundTripSecFlightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightDate: null == transitRoundTripSecFlightDate
          ? _value.transitRoundTripSecFlightDate
          : transitRoundTripSecFlightDate // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightTime: null == transitRoundTripSecFlightTime
          ? _value.transitRoundTripSecFlightTime
          : transitRoundTripSecFlightTime // ignore: cast_nullable_to_non_nullable
              as String,
      roundTripSecServiceDateTime: null == roundTripSecServiceDateTime
          ? _value.roundTripSecServiceDateTime
          : roundTripSecServiceDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TripStatusCopyWith<$Res> get tripStatus {
    return $TripStatusCopyWith<$Res>(_value.tripStatus, (value) {
      return _then(_value.copyWith(tripStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TripDetailCopyWith<$Res>
    implements $TripDetailCopyWith<$Res> {
  factory _$$_TripDetailCopyWith(
          _$_TripDetail value, $Res Function(_$_TripDetail) then) =
      __$$_TripDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tripId')
          int tripId,
      @JsonKey(name: 'tripBookingNumber')
          String tripBookingNumber,
      @JsonKey(name: 'originAirportId')
          int originAirportId,
      @JsonKey(name: 'originAirport')
          String originAirport,
      @JsonKey(name: 'destinationAirportId')
          int destinationAirportId,
      @JsonKey(name: 'destinationAirport')
          String destinationAirport,
      @JsonKey(name: 'serviceAirportId')
          int serviceAirportId,
      @JsonKey(name: 'businessUnitId')
          int businessUnitId,
      @JsonKey(name: 'serviceDateTime')
          String serviceDateTime,
      @JsonKey(name: 'flightName')
          String flightName,
      @JsonKey(name: 'flightNumber')
          String flightNumber,
      @JsonKey(name: 'flightTerminal')
          String flightTerminal,
      @JsonKey(name: 'flightDate')
          String flightDate,
      @JsonKey(name: 'flightTime')
          String flightTime,
      @JsonKey(name: 'travelSector')
          String travelSector,
      @JsonKey(name: 'travelSectorId')
          int travelSectorId,
      @JsonKey(name: 'serviceAirport')
          String serviceAirport,
      @JsonKey(name: 'serviceAirportName')
          String serviceAirportName,
      @JsonKey(name: 'serviceType')
          String serviceType,
      @JsonKey(name: 'tripStatus')
          TripStatus tripStatus,
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          int transitDestRoundTripSecOrigin,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          String transitRoundTripSecFlightName,
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          int transitRoundTripSecFlightNumber,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          String transitRoundTripSecFlightTerminal,
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          String transitRoundTripSecFlightDate,
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          String transitRoundTripSecFlightTime,
      @JsonKey(name: 'roundTripSecServiceDateTime')
          String roundTripSecServiceDateTime});

  @override
  $TripStatusCopyWith<$Res> get tripStatus;
}

/// @nodoc
class __$$_TripDetailCopyWithImpl<$Res>
    extends _$TripDetailCopyWithImpl<$Res, _$_TripDetail>
    implements _$$_TripDetailCopyWith<$Res> {
  __$$_TripDetailCopyWithImpl(
      _$_TripDetail _value, $Res Function(_$_TripDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? tripBookingNumber = null,
    Object? originAirportId = null,
    Object? originAirport = null,
    Object? destinationAirportId = null,
    Object? destinationAirport = null,
    Object? serviceAirportId = null,
    Object? businessUnitId = null,
    Object? serviceDateTime = null,
    Object? flightName = null,
    Object? flightNumber = null,
    Object? flightTerminal = null,
    Object? flightDate = null,
    Object? flightTime = null,
    Object? travelSector = null,
    Object? travelSectorId = null,
    Object? serviceAirport = null,
    Object? serviceAirportName = null,
    Object? serviceType = null,
    Object? tripStatus = null,
    Object? transitDestRoundTripSecOrigin = null,
    Object? transitRoundTripSecFlightName = null,
    Object? transitRoundTripSecFlightNumber = null,
    Object? transitRoundTripSecFlightTerminal = null,
    Object? transitRoundTripSecFlightDate = null,
    Object? transitRoundTripSecFlightTime = null,
    Object? roundTripSecServiceDateTime = null,
  }) {
    return _then(_$_TripDetail(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      tripBookingNumber: null == tripBookingNumber
          ? _value.tripBookingNumber
          : tripBookingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      originAirportId: null == originAirportId
          ? _value.originAirportId
          : originAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      originAirport: null == originAirport
          ? _value.originAirport
          : originAirport // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAirportId: null == destinationAirportId
          ? _value.destinationAirportId
          : destinationAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      destinationAirport: null == destinationAirport
          ? _value.destinationAirport
          : destinationAirport // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAirportId: null == serviceAirportId
          ? _value.serviceAirportId
          : serviceAirportId // ignore: cast_nullable_to_non_nullable
              as int,
      businessUnitId: null == businessUnitId
          ? _value.businessUnitId
          : businessUnitId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceDateTime: null == serviceDateTime
          ? _value.serviceDateTime
          : serviceDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      flightName: null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flightTerminal: null == flightTerminal
          ? _value.flightTerminal
          : flightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as String,
      flightTime: null == flightTime
          ? _value.flightTime
          : flightTime // ignore: cast_nullable_to_non_nullable
              as String,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as String,
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceAirport: null == serviceAirport
          ? _value.serviceAirport
          : serviceAirport // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAirportName: null == serviceAirportName
          ? _value.serviceAirportName
          : serviceAirportName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      tripStatus: null == tripStatus
          ? _value.tripStatus
          : tripStatus // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      transitDestRoundTripSecOrigin: null == transitDestRoundTripSecOrigin
          ? _value.transitDestRoundTripSecOrigin
          : transitDestRoundTripSecOrigin // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightName: null == transitRoundTripSecFlightName
          ? _value.transitRoundTripSecFlightName
          : transitRoundTripSecFlightName // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightNumber: null == transitRoundTripSecFlightNumber
          ? _value.transitRoundTripSecFlightNumber
          : transitRoundTripSecFlightNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightTerminal: null ==
              transitRoundTripSecFlightTerminal
          ? _value.transitRoundTripSecFlightTerminal
          : transitRoundTripSecFlightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightDate: null == transitRoundTripSecFlightDate
          ? _value.transitRoundTripSecFlightDate
          : transitRoundTripSecFlightDate // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightTime: null == transitRoundTripSecFlightTime
          ? _value.transitRoundTripSecFlightTime
          : transitRoundTripSecFlightTime // ignore: cast_nullable_to_non_nullable
              as String,
      roundTripSecServiceDateTime: null == roundTripSecServiceDateTime
          ? _value.roundTripSecServiceDateTime
          : roundTripSecServiceDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripDetail implements _TripDetail {
  const _$_TripDetail(
      {@JsonKey(name: 'tripId')
          this.tripId = 0,
      @JsonKey(name: 'tripBookingNumber')
          this.tripBookingNumber = '',
      @JsonKey(name: 'originAirportId')
          this.originAirportId = 0,
      @JsonKey(name: 'originAirport')
          this.originAirport = '',
      @JsonKey(name: 'destinationAirportId')
          this.destinationAirportId = 0,
      @JsonKey(name: 'destinationAirport')
          this.destinationAirport = '',
      @JsonKey(name: 'serviceAirportId')
          this.serviceAirportId = 0,
      @JsonKey(name: 'businessUnitId')
          this.businessUnitId = 0,
      @JsonKey(name: 'serviceDateTime')
          this.serviceDateTime = '',
      @JsonKey(name: 'flightName')
          this.flightName = '',
      @JsonKey(name: 'flightNumber')
          this.flightNumber = '',
      @JsonKey(name: 'flightTerminal')
          this.flightTerminal = '',
      @JsonKey(name: 'flightDate')
          this.flightDate = '',
      @JsonKey(name: 'flightTime')
          this.flightTime = '',
      @JsonKey(name: 'travelSector')
          this.travelSector = '',
      @JsonKey(name: 'travelSectorId')
          this.travelSectorId = 0,
      @JsonKey(name: 'serviceAirport')
          this.serviceAirport = '',
      @JsonKey(name: 'serviceAirportName')
          this.serviceAirportName = '',
      @JsonKey(name: 'serviceType')
          this.serviceType = '',
      @JsonKey(name: 'tripStatus')
          this.tripStatus = const TripStatus(),
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          this.transitDestRoundTripSecOrigin = 0,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          this.transitRoundTripSecFlightName = '',
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          this.transitRoundTripSecFlightNumber = 0,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          this.transitRoundTripSecFlightTerminal = '',
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          this.transitRoundTripSecFlightDate = '',
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          this.transitRoundTripSecFlightTime = '',
      @JsonKey(name: 'roundTripSecServiceDateTime')
          this.roundTripSecServiceDateTime = ''});

  factory _$_TripDetail.fromJson(Map<String, dynamic> json) =>
      _$$_TripDetailFromJson(json);

  @override
  @JsonKey(name: 'tripId')
  final int tripId;
  @override
  @JsonKey(name: 'tripBookingNumber')
  final String tripBookingNumber;
  @override
  @JsonKey(name: 'originAirportId')
  final int originAirportId;
  @override
  @JsonKey(name: 'originAirport')
  final String originAirport;
  @override
  @JsonKey(name: 'destinationAirportId')
  final int destinationAirportId;
  @override
  @JsonKey(name: 'destinationAirport')
  final String destinationAirport;
  @override
  @JsonKey(name: 'serviceAirportId')
  final int serviceAirportId;
  @override
  @JsonKey(name: 'businessUnitId')
  final int businessUnitId;
  @override
  @JsonKey(name: 'serviceDateTime')
  final String serviceDateTime;
  @override
  @JsonKey(name: 'flightName')
  final String flightName;
  @override
  @JsonKey(name: 'flightNumber')
  final String flightNumber;
  @override
  @JsonKey(name: 'flightTerminal')
  final String flightTerminal;
  @override
  @JsonKey(name: 'flightDate')
  final String flightDate;
  @override
  @JsonKey(name: 'flightTime')
  final String flightTime;
  @override
  @JsonKey(name: 'travelSector')
  final String travelSector;
  @override
  @JsonKey(name: 'travelSectorId')
  final int travelSectorId;
  @override
  @JsonKey(name: 'serviceAirport')
  final String serviceAirport;
  @override
  @JsonKey(name: 'serviceAirportName')
  final String serviceAirportName;
  @override
  @JsonKey(name: 'serviceType')
  final String serviceType;
  @override
  @JsonKey(name: 'tripStatus')
  final TripStatus tripStatus;
  @override
  @JsonKey(name: 'transitDestRoundTripSecOrigin')
  final int transitDestRoundTripSecOrigin;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightName')
  final String transitRoundTripSecFlightName;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightNumber')
  final int transitRoundTripSecFlightNumber;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTerminal')
  final String transitRoundTripSecFlightTerminal;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightDate')
  final String transitRoundTripSecFlightDate;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTime')
  final String transitRoundTripSecFlightTime;
  @override
  @JsonKey(name: 'roundTripSecServiceDateTime')
  final String roundTripSecServiceDateTime;

  @override
  String toString() {
    return 'TripDetail(tripId: $tripId, tripBookingNumber: $tripBookingNumber, originAirportId: $originAirportId, originAirport: $originAirport, destinationAirportId: $destinationAirportId, destinationAirport: $destinationAirport, serviceAirportId: $serviceAirportId, businessUnitId: $businessUnitId, serviceDateTime: $serviceDateTime, flightName: $flightName, flightNumber: $flightNumber, flightTerminal: $flightTerminal, flightDate: $flightDate, flightTime: $flightTime, travelSector: $travelSector, travelSectorId: $travelSectorId, serviceAirport: $serviceAirport, serviceAirportName: $serviceAirportName, serviceType: $serviceType, tripStatus: $tripStatus, transitDestRoundTripSecOrigin: $transitDestRoundTripSecOrigin, transitRoundTripSecFlightName: $transitRoundTripSecFlightName, transitRoundTripSecFlightNumber: $transitRoundTripSecFlightNumber, transitRoundTripSecFlightTerminal: $transitRoundTripSecFlightTerminal, transitRoundTripSecFlightDate: $transitRoundTripSecFlightDate, transitRoundTripSecFlightTime: $transitRoundTripSecFlightTime, roundTripSecServiceDateTime: $roundTripSecServiceDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripDetail &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.tripBookingNumber, tripBookingNumber) ||
                other.tripBookingNumber == tripBookingNumber) &&
            (identical(other.originAirportId, originAirportId) ||
                other.originAirportId == originAirportId) &&
            (identical(other.originAirport, originAirport) ||
                other.originAirport == originAirport) &&
            (identical(other.destinationAirportId, destinationAirportId) ||
                other.destinationAirportId == destinationAirportId) &&
            (identical(other.destinationAirport, destinationAirport) ||
                other.destinationAirport == destinationAirport) &&
            (identical(other.serviceAirportId, serviceAirportId) ||
                other.serviceAirportId == serviceAirportId) &&
            (identical(other.businessUnitId, businessUnitId) ||
                other.businessUnitId == businessUnitId) &&
            (identical(other.serviceDateTime, serviceDateTime) ||
                other.serviceDateTime == serviceDateTime) &&
            (identical(other.flightName, flightName) ||
                other.flightName == flightName) &&
            (identical(other.flightNumber, flightNumber) ||
                other.flightNumber == flightNumber) &&
            (identical(other.flightTerminal, flightTerminal) ||
                other.flightTerminal == flightTerminal) &&
            (identical(other.flightDate, flightDate) ||
                other.flightDate == flightDate) &&
            (identical(other.flightTime, flightTime) ||
                other.flightTime == flightTime) &&
            (identical(other.travelSector, travelSector) ||
                other.travelSector == travelSector) &&
            (identical(other.travelSectorId, travelSectorId) ||
                other.travelSectorId == travelSectorId) &&
            (identical(other.serviceAirport, serviceAirport) ||
                other.serviceAirport == serviceAirport) &&
            (identical(other.serviceAirportName, serviceAirportName) ||
                other.serviceAirportName == serviceAirportName) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.tripStatus, tripStatus) ||
                other.tripStatus == tripStatus) &&
            (identical(other.transitDestRoundTripSecOrigin, transitDestRoundTripSecOrigin) ||
                other.transitDestRoundTripSecOrigin ==
                    transitDestRoundTripSecOrigin) &&
            (identical(other.transitRoundTripSecFlightName, transitRoundTripSecFlightName) ||
                other.transitRoundTripSecFlightName ==
                    transitRoundTripSecFlightName) &&
            (identical(other.transitRoundTripSecFlightNumber,
                    transitRoundTripSecFlightNumber) ||
                other.transitRoundTripSecFlightNumber ==
                    transitRoundTripSecFlightNumber) &&
            (identical(other.transitRoundTripSecFlightTerminal,
                    transitRoundTripSecFlightTerminal) ||
                other.transitRoundTripSecFlightTerminal ==
                    transitRoundTripSecFlightTerminal) &&
            (identical(other.transitRoundTripSecFlightDate, transitRoundTripSecFlightDate) ||
                other.transitRoundTripSecFlightDate ==
                    transitRoundTripSecFlightDate) &&
            (identical(other.transitRoundTripSecFlightTime, transitRoundTripSecFlightTime) ||
                other.transitRoundTripSecFlightTime ==
                    transitRoundTripSecFlightTime) &&
            (identical(other.roundTripSecServiceDateTime, roundTripSecServiceDateTime) ||
                other.roundTripSecServiceDateTime ==
                    roundTripSecServiceDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        tripId,
        tripBookingNumber,
        originAirportId,
        originAirport,
        destinationAirportId,
        destinationAirport,
        serviceAirportId,
        businessUnitId,
        serviceDateTime,
        flightName,
        flightNumber,
        flightTerminal,
        flightDate,
        flightTime,
        travelSector,
        travelSectorId,
        serviceAirport,
        serviceAirportName,
        serviceType,
        tripStatus,
        transitDestRoundTripSecOrigin,
        transitRoundTripSecFlightName,
        transitRoundTripSecFlightNumber,
        transitRoundTripSecFlightTerminal,
        transitRoundTripSecFlightDate,
        transitRoundTripSecFlightTime,
        roundTripSecServiceDateTime
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripDetailCopyWith<_$_TripDetail> get copyWith =>
      __$$_TripDetailCopyWithImpl<_$_TripDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripDetailToJson(
      this,
    );
  }
}

abstract class _TripDetail implements TripDetail {
  const factory _TripDetail(
      {@JsonKey(name: 'tripId')
          final int tripId,
      @JsonKey(name: 'tripBookingNumber')
          final String tripBookingNumber,
      @JsonKey(name: 'originAirportId')
          final int originAirportId,
      @JsonKey(name: 'originAirport')
          final String originAirport,
      @JsonKey(name: 'destinationAirportId')
          final int destinationAirportId,
      @JsonKey(name: 'destinationAirport')
          final String destinationAirport,
      @JsonKey(name: 'serviceAirportId')
          final int serviceAirportId,
      @JsonKey(name: 'businessUnitId')
          final int businessUnitId,
      @JsonKey(name: 'serviceDateTime')
          final String serviceDateTime,
      @JsonKey(name: 'flightName')
          final String flightName,
      @JsonKey(name: 'flightNumber')
          final String flightNumber,
      @JsonKey(name: 'flightTerminal')
          final String flightTerminal,
      @JsonKey(name: 'flightDate')
          final String flightDate,
      @JsonKey(name: 'flightTime')
          final String flightTime,
      @JsonKey(name: 'travelSector')
          final String travelSector,
      @JsonKey(name: 'travelSectorId')
          final int travelSectorId,
      @JsonKey(name: 'serviceAirport')
          final String serviceAirport,
      @JsonKey(name: 'serviceAirportName')
          final String serviceAirportName,
      @JsonKey(name: 'serviceType')
          final String serviceType,
      @JsonKey(name: 'tripStatus')
          final TripStatus tripStatus,
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          final int transitDestRoundTripSecOrigin,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          final String transitRoundTripSecFlightName,
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          final int transitRoundTripSecFlightNumber,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          final String transitRoundTripSecFlightTerminal,
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          final String transitRoundTripSecFlightDate,
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          final String transitRoundTripSecFlightTime,
      @JsonKey(name: 'roundTripSecServiceDateTime')
          final String roundTripSecServiceDateTime}) = _$_TripDetail;

  factory _TripDetail.fromJson(Map<String, dynamic> json) =
      _$_TripDetail.fromJson;

  @override
  @JsonKey(name: 'tripId')
  int get tripId;
  @override
  @JsonKey(name: 'tripBookingNumber')
  String get tripBookingNumber;
  @override
  @JsonKey(name: 'originAirportId')
  int get originAirportId;
  @override
  @JsonKey(name: 'originAirport')
  String get originAirport;
  @override
  @JsonKey(name: 'destinationAirportId')
  int get destinationAirportId;
  @override
  @JsonKey(name: 'destinationAirport')
  String get destinationAirport;
  @override
  @JsonKey(name: 'serviceAirportId')
  int get serviceAirportId;
  @override
  @JsonKey(name: 'businessUnitId')
  int get businessUnitId;
  @override
  @JsonKey(name: 'serviceDateTime')
  String get serviceDateTime;
  @override
  @JsonKey(name: 'flightName')
  String get flightName;
  @override
  @JsonKey(name: 'flightNumber')
  String get flightNumber;
  @override
  @JsonKey(name: 'flightTerminal')
  String get flightTerminal;
  @override
  @JsonKey(name: 'flightDate')
  String get flightDate;
  @override
  @JsonKey(name: 'flightTime')
  String get flightTime;
  @override
  @JsonKey(name: 'travelSector')
  String get travelSector;
  @override
  @JsonKey(name: 'travelSectorId')
  int get travelSectorId;
  @override
  @JsonKey(name: 'serviceAirport')
  String get serviceAirport;
  @override
  @JsonKey(name: 'serviceAirportName')
  String get serviceAirportName;
  @override
  @JsonKey(name: 'serviceType')
  String get serviceType;
  @override
  @JsonKey(name: 'tripStatus')
  TripStatus get tripStatus;
  @override
  @JsonKey(name: 'transitDestRoundTripSecOrigin')
  int get transitDestRoundTripSecOrigin;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightName')
  String get transitRoundTripSecFlightName;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightNumber')
  int get transitRoundTripSecFlightNumber;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTerminal')
  String get transitRoundTripSecFlightTerminal;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightDate')
  String get transitRoundTripSecFlightDate;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTime')
  String get transitRoundTripSecFlightTime;
  @override
  @JsonKey(name: 'roundTripSecServiceDateTime')
  String get roundTripSecServiceDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_TripDetailCopyWith<_$_TripDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
