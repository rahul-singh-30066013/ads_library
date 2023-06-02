// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_packages_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetPackagesRequestModel _$$_GetPackagesRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_GetPackagesRequestModel(
      serviceTypeId: json['serviceTypeId'] as String,
      serviceType: json['serviceType'] as String,
      travelSector: json['travelSector'] as String,
      serviceDate: json['serviceDate'] as String,
      serviceTime: json['serviceTime'] as String,
      originAirport: json['originAirport'] as String,
      destinationAirport: json['destinationAirport'] as String,
      oldBookingId: json['oldBookingId'] as int? ?? 0,
      oldBookingReferenceId: json['OldBookingReferenceId'] as String? ?? '',
      isOrderDetailsToBeFetchedFromService:
          json['IsOrderDetailsToBeFetchedFromService'] as bool? ?? true,
      adultCount: json['adultCount'] as int,
      childCount: json['childCount'] as int? ?? 0,
      infantCount: json['infantCount'] as int? ?? 0,
      serviceAirportId: json['ServiceAirportId'] as int? ?? 0,
      roundTransitServiceTime: json['RoundTransitServiceTime'] as String?,
      roundTransitServiceDate: json['RoundTransitServiceDate'] as String?,
    );

Map<String, dynamic> _$$_GetPackagesRequestModelToJson(
        _$_GetPackagesRequestModel instance) =>
    <String, dynamic>{
      'serviceTypeId': instance.serviceTypeId,
      'serviceType': instance.serviceType,
      'travelSector': instance.travelSector,
      'serviceDate': instance.serviceDate,
      'serviceTime': instance.serviceTime,
      'originAirport': instance.originAirport,
      'destinationAirport': instance.destinationAirport,
      'oldBookingId': instance.oldBookingId,
      'OldBookingReferenceId': instance.oldBookingReferenceId,
      'IsOrderDetailsToBeFetchedFromService':
          instance.isOrderDetailsToBeFetchedFromService,
      'adultCount': instance.adultCount,
      'childCount': instance.childCount,
      'infantCount': instance.infantCount,
      'ServiceAirportId': instance.serviceAirportId,
      'RoundTransitServiceTime': instance.roundTransitServiceTime,
      'RoundTransitServiceDate': instance.roundTransitServiceDate,
    };
