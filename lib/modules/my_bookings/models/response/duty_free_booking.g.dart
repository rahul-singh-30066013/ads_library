// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DutyFreeBooking _$DutyFreeBookingFromJson(Map<String, dynamic> json) =>
    DutyFreeBooking()
      ..materialName = json['materialName'] as String?
      ..skuCode = json['skuCode'] as String?
      ..skuName = json['skuName'] as String?
      ..quantity = json['quantity'] as num?
      ..unit = json['unit'] as String?
      ..size = json['size'] as String?
      ..imageUrl = (json['imageUrl'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList()
      ..storeName = json['storeName'] as String?
      ..airportCode = json['airportCode'] as String?
      ..refundStatus = json['refundStatus'] as String?
      ..pickupDate = json['pickupDate'];

Map<String, dynamic> _$DutyFreeBookingToJson(DutyFreeBooking instance) =>
    <String, dynamic>{
      'materialName': instance.materialName,
      'skuCode': instance.skuCode,
      'skuName': instance.skuName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'size': instance.size,
      'imageUrl': instance.imageUrl,
      'storeName': instance.storeName,
      'airportCode': instance.airportCode,
      'refundStatus': instance.refundStatus,
      'pickupDate': instance.pickupDate,
    };
