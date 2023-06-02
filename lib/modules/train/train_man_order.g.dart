// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_man_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainManOrder _$TrainManOrderFromJson(Map<String, dynamic> json) =>
    TrainManOrder()
      ..id = json['id'] as int?
      ..tmBookingId = json['tmBookingId'] as String?
      ..originName = json['originName'] as String?
      ..destinationName = json['destinationName'] as String?
      ..boardingName = json['boardingName'] as String?
      ..status = json['status'] as String?
      ..trainNumber = json['trainNumber'] as String?
      ..trainName = json['trainName'] as String?
      ..origin = json['origin'] as String?
      ..destination = json['destination'] as String?
      ..boardingDate = json['boardingDate'] as String?
      ..createdAt = json['createdOn'] as String?;

Map<String, dynamic> _$TrainManOrderToJson(TrainManOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tmBookingId': instance.tmBookingId,
      'originName': instance.originName,
      'destinationName': instance.destinationName,
      'boardingName': instance.boardingName,
      'status': instance.status,
      'trainNumber': instance.trainNumber,
      'trainName': instance.trainName,
      'origin': instance.origin,
      'destination': instance.destination,
      'boardingDate': instance.boardingDate,
      'createdOn': instance.createdAt,
    };
