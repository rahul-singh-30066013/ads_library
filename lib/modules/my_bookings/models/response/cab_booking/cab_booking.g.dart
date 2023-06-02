// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cab_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CabBooking _$CabBookingFromJson(Map<String, dynamic> json) => CabBooking()
  ..bookingID = json['bookingID'] as String?
  ..vehicleType = json['vehicleType'] as String?
  ..vehicleImage = json['vehicleImage'] as String?
  ..locationCode = json['locationCode'] as String?;

Map<String, dynamic> _$CabBookingToJson(CabBooking instance) =>
    <String, dynamic>{
      'bookingID': instance.bookingID,
      'vehicleType': instance.vehicleType,
      'vehicleImage': instance.vehicleImage,
      'locationCode': instance.locationCode,
    };
