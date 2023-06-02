// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_trip_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundTripDetails _$RoundTripDetailsFromJson(Map<String, dynamic> json) =>
    RoundTripDetails()
      ..departure = json['departure'] == null
          ? null
          : Arrival.fromJson(json['departure'] as Map<String, dynamic>)
      ..arrival = json['arrival'] == null
          ? null
          : Arrival.fromJson(json['arrival'] as Map<String, dynamic>)
      ..from = json['from'] == null
          ? null
          : From.fromJson(json['from'] as Map<String, dynamic>)
      ..to = json['to'] == null
          ? null
          : From.fromJson(json['to'] as Map<String, dynamic>);

Map<String, dynamic> _$RoundTripDetailsToJson(RoundTripDetails instance) =>
    <String, dynamic>{
      'departure': instance.departure,
      'arrival': instance.arrival,
      'from': instance.from,
      'to': instance.to,
    };
