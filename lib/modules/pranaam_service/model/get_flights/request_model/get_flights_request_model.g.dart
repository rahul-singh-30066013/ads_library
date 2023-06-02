// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_flights_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFlightRequestModel _$$_GetFlightRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_GetFlightRequestModel(
      serviceType: json['serviceType'] as String,
      originAirport: json['originAirport'] as String,
      destinationAirport: json['destinationAirport'] as String,
      serviceAirport: json['serviceAirport'] as String,
      serviceDate: json['serviceDate'] as String,
      trip: json['trip'] as String,
      tripType: json['tripType'] as String,
      travelSectorType: json['travelSectorType'] as int?,
    );

Map<String, dynamic> _$$_GetFlightRequestModelToJson(
        _$_GetFlightRequestModel instance) =>
    <String, dynamic>{
      'serviceType': instance.serviceType,
      'originAirport': instance.originAirport,
      'destinationAirport': instance.destinationAirport,
      'serviceAirport': instance.serviceAirport,
      'serviceDate': instance.serviceDate,
      'trip': instance.trip,
      'tripType': instance.tripType,
      'travelSectorType': instance.travelSectorType,
    };
