// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_flights_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetFlightsResponseModel _$$_GetFlightsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_GetFlightsResponseModel(
      pranaamFlights: (json['pranaamFlights'] as List<dynamic>?)
              ?.map((e) => PranaamFlights.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$_GetFlightsResponseModelToJson(
        _$_GetFlightsResponseModel instance) =>
    <String, dynamic>{
      'pranaamFlights': instance.pranaamFlights,
      'message': instance.message,
    };
