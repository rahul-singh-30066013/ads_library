// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_flight_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddFlightRequestModel _$$_AddFlightRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_AddFlightRequestModel(
      FlightDetails.fromJson(json['flightDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddFlightRequestModelToJson(
        _$_AddFlightRequestModel instance) =>
    <String, dynamic>{
      'flightDetails': instance.flightDetails,
    };

_$_FlightDetails _$$_FlightDetailsFromJson(Map<String, dynamic> json) =>
    _$_FlightDetails(
      json['flightNo'] as String,
      json['scheduledDate'] as String,
      json['scheduledTime'] as String,
      json['flightName'] as String,
      Location.fromJson(json['origin'] as Map<String, dynamic>),
      Location.fromJson(json['destination'] as Map<String, dynamic>),
      json['terminal'] as String,
      json['status'] as String,
      json['type'] as String,
      json['airlineCode'] as String,
      json['baggageBelt'] as String,
    );

Map<String, dynamic> _$$_FlightDetailsToJson(_$_FlightDetails instance) =>
    <String, dynamic>{
      'flightNo': instance.flightNo,
      'scheduledDate': instance.scheduledDate,
      'scheduledTime': instance.scheduledTime,
      'flightName': instance.flightName,
      'origin': instance.origin,
      'destination': instance.destination,
      'terminal': instance.terminal,
      'status': instance.status,
      'type': instance.type,
      'airlineCode': instance.airlineCode,
      'baggageBelt': instance.baggageBelt,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      json['code'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
