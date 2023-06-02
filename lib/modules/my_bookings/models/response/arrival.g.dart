// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arrival.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Arrival _$ArrivalFromJson(Map<String, dynamic> json) => Arrival()
  ..date = json['date'] as String?
  ..time = json['time'] as String?
  ..flightName = json['flightName'] as String?
  ..flightNumber = json['flightNumber'] as String?
  ..orderStatus = json['orderStatus'] as String?;

Map<String, dynamic> _$ArrivalToJson(Arrival instance) => <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'flightName': instance.flightName,
      'flightNumber': instance.flightNumber,
      'orderStatus': instance.orderStatus,
    };
