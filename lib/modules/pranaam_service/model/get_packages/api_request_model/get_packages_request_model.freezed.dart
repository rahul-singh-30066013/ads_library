// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_packages_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetPackagesRequestModel _$GetPackagesRequestModelFromJson(
    Map<String, dynamic> json) {
  return _GetPackagesRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GetPackagesRequestModel {
  String get serviceTypeId => throw _privateConstructorUsedError;
  String get serviceType => throw _privateConstructorUsedError;
  String get travelSector => throw _privateConstructorUsedError;
  String get serviceDate => throw _privateConstructorUsedError;
  String get serviceTime => throw _privateConstructorUsedError;
  String get originAirport => throw _privateConstructorUsedError;
  String get destinationAirport => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldBookingId')
  int get oldBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldBookingReferenceId')
  String get oldBookingReferenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
  bool get isOrderDetailsToBeFetchedFromService =>
      throw _privateConstructorUsedError;
  int get adultCount => throw _privateConstructorUsedError;
  int get childCount => throw _privateConstructorUsedError;
  int get infantCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ServiceAirportId')
  int? get serviceAirportId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoundTransitServiceTime')
  String? get roundTransitServiceTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoundTransitServiceDate')
  String? get roundTransitServiceDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPackagesRequestModelCopyWith<GetPackagesRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPackagesRequestModelCopyWith<$Res> {
  factory $GetPackagesRequestModelCopyWith(GetPackagesRequestModel value,
          $Res Function(GetPackagesRequestModel) then) =
      _$GetPackagesRequestModelCopyWithImpl<$Res, GetPackagesRequestModel>;
  @useResult
  $Res call(
      {String serviceTypeId,
      String serviceType,
      String travelSector,
      String serviceDate,
      String serviceTime,
      String originAirport,
      String destinationAirport,
      @JsonKey(name: 'oldBookingId')
          int oldBookingId,
      @JsonKey(name: 'OldBookingReferenceId')
          String oldBookingReferenceId,
      @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
          bool isOrderDetailsToBeFetchedFromService,
      int adultCount,
      int childCount,
      int infantCount,
      @JsonKey(name: 'ServiceAirportId')
          int? serviceAirportId,
      @JsonKey(name: 'RoundTransitServiceTime')
          String? roundTransitServiceTime,
      @JsonKey(name: 'RoundTransitServiceDate')
          String? roundTransitServiceDate});
}

/// @nodoc
class _$GetPackagesRequestModelCopyWithImpl<$Res,
        $Val extends GetPackagesRequestModel>
    implements $GetPackagesRequestModelCopyWith<$Res> {
  _$GetPackagesRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceTypeId = null,
    Object? serviceType = null,
    Object? travelSector = null,
    Object? serviceDate = null,
    Object? serviceTime = null,
    Object? originAirport = null,
    Object? destinationAirport = null,
    Object? oldBookingId = null,
    Object? oldBookingReferenceId = null,
    Object? isOrderDetailsToBeFetchedFromService = null,
    Object? adultCount = null,
    Object? childCount = null,
    Object? infantCount = null,
    Object? serviceAirportId = freezed,
    Object? roundTransitServiceTime = freezed,
    Object? roundTransitServiceDate = freezed,
  }) {
    return _then(_value.copyWith(
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDate: null == serviceDate
          ? _value.serviceDate
          : serviceDate // ignore: cast_nullable_to_non_nullable
              as String,
      serviceTime: null == serviceTime
          ? _value.serviceTime
          : serviceTime // ignore: cast_nullable_to_non_nullable
              as String,
      originAirport: null == originAirport
          ? _value.originAirport
          : originAirport // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAirport: null == destinationAirport
          ? _value.destinationAirport
          : destinationAirport // ignore: cast_nullable_to_non_nullable
              as String,
      oldBookingId: null == oldBookingId
          ? _value.oldBookingId
          : oldBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      oldBookingReferenceId: null == oldBookingReferenceId
          ? _value.oldBookingReferenceId
          : oldBookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      isOrderDetailsToBeFetchedFromService: null ==
              isOrderDetailsToBeFetchedFromService
          ? _value.isOrderDetailsToBeFetchedFromService
          : isOrderDetailsToBeFetchedFromService // ignore: cast_nullable_to_non_nullable
              as bool,
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
      serviceAirportId: freezed == serviceAirportId
          ? _value.serviceAirportId
          : serviceAirportId // ignore: cast_nullable_to_non_nullable
              as int?,
      roundTransitServiceTime: freezed == roundTransitServiceTime
          ? _value.roundTransitServiceTime
          : roundTransitServiceTime // ignore: cast_nullable_to_non_nullable
              as String?,
      roundTransitServiceDate: freezed == roundTransitServiceDate
          ? _value.roundTransitServiceDate
          : roundTransitServiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetPackagesRequestModelCopyWith<$Res>
    implements $GetPackagesRequestModelCopyWith<$Res> {
  factory _$$_GetPackagesRequestModelCopyWith(_$_GetPackagesRequestModel value,
          $Res Function(_$_GetPackagesRequestModel) then) =
      __$$_GetPackagesRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String serviceTypeId,
      String serviceType,
      String travelSector,
      String serviceDate,
      String serviceTime,
      String originAirport,
      String destinationAirport,
      @JsonKey(name: 'oldBookingId')
          int oldBookingId,
      @JsonKey(name: 'OldBookingReferenceId')
          String oldBookingReferenceId,
      @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
          bool isOrderDetailsToBeFetchedFromService,
      int adultCount,
      int childCount,
      int infantCount,
      @JsonKey(name: 'ServiceAirportId')
          int? serviceAirportId,
      @JsonKey(name: 'RoundTransitServiceTime')
          String? roundTransitServiceTime,
      @JsonKey(name: 'RoundTransitServiceDate')
          String? roundTransitServiceDate});
}

/// @nodoc
class __$$_GetPackagesRequestModelCopyWithImpl<$Res>
    extends _$GetPackagesRequestModelCopyWithImpl<$Res,
        _$_GetPackagesRequestModel>
    implements _$$_GetPackagesRequestModelCopyWith<$Res> {
  __$$_GetPackagesRequestModelCopyWithImpl(_$_GetPackagesRequestModel _value,
      $Res Function(_$_GetPackagesRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceTypeId = null,
    Object? serviceType = null,
    Object? travelSector = null,
    Object? serviceDate = null,
    Object? serviceTime = null,
    Object? originAirport = null,
    Object? destinationAirport = null,
    Object? oldBookingId = null,
    Object? oldBookingReferenceId = null,
    Object? isOrderDetailsToBeFetchedFromService = null,
    Object? adultCount = null,
    Object? childCount = null,
    Object? infantCount = null,
    Object? serviceAirportId = freezed,
    Object? roundTransitServiceTime = freezed,
    Object? roundTransitServiceDate = freezed,
  }) {
    return _then(_$_GetPackagesRequestModel(
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDate: null == serviceDate
          ? _value.serviceDate
          : serviceDate // ignore: cast_nullable_to_non_nullable
              as String,
      serviceTime: null == serviceTime
          ? _value.serviceTime
          : serviceTime // ignore: cast_nullable_to_non_nullable
              as String,
      originAirport: null == originAirport
          ? _value.originAirport
          : originAirport // ignore: cast_nullable_to_non_nullable
              as String,
      destinationAirport: null == destinationAirport
          ? _value.destinationAirport
          : destinationAirport // ignore: cast_nullable_to_non_nullable
              as String,
      oldBookingId: null == oldBookingId
          ? _value.oldBookingId
          : oldBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      oldBookingReferenceId: null == oldBookingReferenceId
          ? _value.oldBookingReferenceId
          : oldBookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      isOrderDetailsToBeFetchedFromService: null ==
              isOrderDetailsToBeFetchedFromService
          ? _value.isOrderDetailsToBeFetchedFromService
          : isOrderDetailsToBeFetchedFromService // ignore: cast_nullable_to_non_nullable
              as bool,
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
      serviceAirportId: freezed == serviceAirportId
          ? _value.serviceAirportId
          : serviceAirportId // ignore: cast_nullable_to_non_nullable
              as int?,
      roundTransitServiceTime: freezed == roundTransitServiceTime
          ? _value.roundTransitServiceTime
          : roundTransitServiceTime // ignore: cast_nullable_to_non_nullable
              as String?,
      roundTransitServiceDate: freezed == roundTransitServiceDate
          ? _value.roundTransitServiceDate
          : roundTransitServiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetPackagesRequestModel implements _GetPackagesRequestModel {
  const _$_GetPackagesRequestModel(
      {required this.serviceTypeId,
      required this.serviceType,
      required this.travelSector,
      required this.serviceDate,
      required this.serviceTime,
      required this.originAirport,
      required this.destinationAirport,
      @JsonKey(name: 'oldBookingId')
          this.oldBookingId = 0,
      @JsonKey(name: 'OldBookingReferenceId')
          this.oldBookingReferenceId = '',
      @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
          this.isOrderDetailsToBeFetchedFromService = true,
      required this.adultCount,
      this.childCount = 0,
      this.infantCount = 0,
      @JsonKey(name: 'ServiceAirportId')
          this.serviceAirportId = 0,
      @JsonKey(name: 'RoundTransitServiceTime')
          this.roundTransitServiceTime,
      @JsonKey(name: 'RoundTransitServiceDate')
          this.roundTransitServiceDate});

  factory _$_GetPackagesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetPackagesRequestModelFromJson(json);

  @override
  final String serviceTypeId;
  @override
  final String serviceType;
  @override
  final String travelSector;
  @override
  final String serviceDate;
  @override
  final String serviceTime;
  @override
  final String originAirport;
  @override
  final String destinationAirport;
  @override
  @JsonKey(name: 'oldBookingId')
  final int oldBookingId;
  @override
  @JsonKey(name: 'OldBookingReferenceId')
  final String oldBookingReferenceId;
  @override
  @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
  final bool isOrderDetailsToBeFetchedFromService;
  @override
  final int adultCount;
  @override
  @JsonKey()
  final int childCount;
  @override
  @JsonKey()
  final int infantCount;
  @override
  @JsonKey(name: 'ServiceAirportId')
  final int? serviceAirportId;
  @override
  @JsonKey(name: 'RoundTransitServiceTime')
  final String? roundTransitServiceTime;
  @override
  @JsonKey(name: 'RoundTransitServiceDate')
  final String? roundTransitServiceDate;

  @override
  String toString() {
    return 'GetPackagesRequestModel(serviceTypeId: $serviceTypeId, serviceType: $serviceType, travelSector: $travelSector, serviceDate: $serviceDate, serviceTime: $serviceTime, originAirport: $originAirport, destinationAirport: $destinationAirport, oldBookingId: $oldBookingId, oldBookingReferenceId: $oldBookingReferenceId, isOrderDetailsToBeFetchedFromService: $isOrderDetailsToBeFetchedFromService, adultCount: $adultCount, childCount: $childCount, infantCount: $infantCount, serviceAirportId: $serviceAirportId, roundTransitServiceTime: $roundTransitServiceTime, roundTransitServiceDate: $roundTransitServiceDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPackagesRequestModel &&
            (identical(other.serviceTypeId, serviceTypeId) ||
                other.serviceTypeId == serviceTypeId) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.travelSector, travelSector) ||
                other.travelSector == travelSector) &&
            (identical(other.serviceDate, serviceDate) ||
                other.serviceDate == serviceDate) &&
            (identical(other.serviceTime, serviceTime) ||
                other.serviceTime == serviceTime) &&
            (identical(other.originAirport, originAirport) ||
                other.originAirport == originAirport) &&
            (identical(other.destinationAirport, destinationAirport) ||
                other.destinationAirport == destinationAirport) &&
            (identical(other.oldBookingId, oldBookingId) ||
                other.oldBookingId == oldBookingId) &&
            (identical(other.oldBookingReferenceId, oldBookingReferenceId) ||
                other.oldBookingReferenceId == oldBookingReferenceId) &&
            (identical(other.isOrderDetailsToBeFetchedFromService,
                    isOrderDetailsToBeFetchedFromService) ||
                other.isOrderDetailsToBeFetchedFromService ==
                    isOrderDetailsToBeFetchedFromService) &&
            (identical(other.adultCount, adultCount) ||
                other.adultCount == adultCount) &&
            (identical(other.childCount, childCount) ||
                other.childCount == childCount) &&
            (identical(other.infantCount, infantCount) ||
                other.infantCount == infantCount) &&
            (identical(other.serviceAirportId, serviceAirportId) ||
                other.serviceAirportId == serviceAirportId) &&
            (identical(
                    other.roundTransitServiceTime, roundTransitServiceTime) ||
                other.roundTransitServiceTime == roundTransitServiceTime) &&
            (identical(
                    other.roundTransitServiceDate, roundTransitServiceDate) ||
                other.roundTransitServiceDate == roundTransitServiceDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceTypeId,
      serviceType,
      travelSector,
      serviceDate,
      serviceTime,
      originAirport,
      destinationAirport,
      oldBookingId,
      oldBookingReferenceId,
      isOrderDetailsToBeFetchedFromService,
      adultCount,
      childCount,
      infantCount,
      serviceAirportId,
      roundTransitServiceTime,
      roundTransitServiceDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetPackagesRequestModelCopyWith<_$_GetPackagesRequestModel>
      get copyWith =>
          __$$_GetPackagesRequestModelCopyWithImpl<_$_GetPackagesRequestModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetPackagesRequestModelToJson(
      this,
    );
  }
}

abstract class _GetPackagesRequestModel implements GetPackagesRequestModel {
  const factory _GetPackagesRequestModel(
      {required final String serviceTypeId,
      required final String serviceType,
      required final String travelSector,
      required final String serviceDate,
      required final String serviceTime,
      required final String originAirport,
      required final String destinationAirport,
      @JsonKey(name: 'oldBookingId')
          final int oldBookingId,
      @JsonKey(name: 'OldBookingReferenceId')
          final String oldBookingReferenceId,
      @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
          final bool isOrderDetailsToBeFetchedFromService,
      required final int adultCount,
      final int childCount,
      final int infantCount,
      @JsonKey(name: 'ServiceAirportId')
          final int? serviceAirportId,
      @JsonKey(name: 'RoundTransitServiceTime')
          final String? roundTransitServiceTime,
      @JsonKey(name: 'RoundTransitServiceDate')
          final String? roundTransitServiceDate}) = _$_GetPackagesRequestModel;

  factory _GetPackagesRequestModel.fromJson(Map<String, dynamic> json) =
      _$_GetPackagesRequestModel.fromJson;

  @override
  String get serviceTypeId;
  @override
  String get serviceType;
  @override
  String get travelSector;
  @override
  String get serviceDate;
  @override
  String get serviceTime;
  @override
  String get originAirport;
  @override
  String get destinationAirport;
  @override
  @JsonKey(name: 'oldBookingId')
  int get oldBookingId;
  @override
  @JsonKey(name: 'OldBookingReferenceId')
  String get oldBookingReferenceId;
  @override
  @JsonKey(name: 'IsOrderDetailsToBeFetchedFromService')
  bool get isOrderDetailsToBeFetchedFromService;
  @override
  int get adultCount;
  @override
  int get childCount;
  @override
  int get infantCount;
  @override
  @JsonKey(name: 'ServiceAirportId')
  int? get serviceAirportId;
  @override
  @JsonKey(name: 'RoundTransitServiceTime')
  String? get roundTransitServiceTime;
  @override
  @JsonKey(name: 'RoundTransitServiceDate')
  String? get roundTransitServiceDate;
  @override
  @JsonKey(ignore: true)
  _$$_GetPackagesRequestModelCopyWith<_$_GetPackagesRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
