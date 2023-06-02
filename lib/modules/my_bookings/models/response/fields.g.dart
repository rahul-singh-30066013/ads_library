// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fields _$FieldsFromJson(Map<String, dynamic> json) => Fields()
  ..flightbookingDetail = json['flightbookingDetail'] == null
      ? null
      : FlightBooking.fromJson(
          json['flightbookingDetail'] as Map<String, dynamic>)
  ..dutyfreeDetail = json['dutyfreeDetail'] == null
      ? null
      : DutyFreeBooking.fromJson(json['dutyfreeDetail'] as Map<String, dynamic>)
  ..pranaamDetail = json['pranaamDetail'] == null
      ? null
      : PranaamBooking.fromJson(json['pranaamDetail'] as Map<String, dynamic>)
  ..cabDetail = json['cabDetail'] == null
      ? null
      : CabBooking.fromJson(json['cabDetail'] as Map<String, dynamic>)
  ..trainManOrder = json['trainmanDetail'] == null
      ? null
      : TrainManOrder.fromJson(json['trainmanDetail'] as Map<String, dynamic>);

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'flightbookingDetail': instance.flightbookingDetail,
      'dutyfreeDetail': instance.dutyfreeDetail,
      'pranaamDetail': instance.pranaamDetail,
      'cabDetail': instance.cabDetail,
      'trainmanDetail': instance.trainManOrder,
    };
