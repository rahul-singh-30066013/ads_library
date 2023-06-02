// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pranaam_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PranaamBooking _$PranaamBookingFromJson(Map<String, dynamic> json) =>
    PranaamBooking()
      ..serviceAirport = json['serviceAirport'] as String?
      ..serviceType = json['serviceType'] as String?
      ..packageName = json['packageName'] as String?
      ..bookingDate = json['bookingDate'] as String?
      ..travelSector = json['travelSector'] as String?
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
          : From.fromJson(json['to'] as Map<String, dynamic>)
      ..serviceDateTime = json['serviceDateTime'] as String?
      ..flightName = json['flightName'] as String?
      ..refundStatus = json['refundStatus'] as String?
      ..roundTripDetails = json['roundTripDetails'] == null
          ? null
          : RoundTripDetails.fromJson(
              json['roundTripDetails'] as Map<String, dynamic>)
      ..imageUrl = json['imageUrl'] as String?
      ..pranaamBookingType = json['pranaamBookingType'] as String?
      ..itemCount = json['itemCount'] as int?
      ..serviceEpochTimeStamp = json['serviceEpochTimeStamp'] as int?;

Map<String, dynamic> _$PranaamBookingToJson(PranaamBooking instance) =>
    <String, dynamic>{
      'serviceAirport': instance.serviceAirport,
      'serviceType': instance.serviceType,
      'packageName': instance.packageName,
      'bookingDate': instance.bookingDate,
      'travelSector': instance.travelSector,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'from': instance.from,
      'to': instance.to,
      'serviceDateTime': instance.serviceDateTime,
      'flightName': instance.flightName,
      'refundStatus': instance.refundStatus,
      'roundTripDetails': instance.roundTripDetails,
      'imageUrl': instance.imageUrl,
      'pranaamBookingType': instance.pranaamBookingType,
      'itemCount': instance.itemCount,
      'serviceEpochTimeStamp': instance.serviceEpochTimeStamp,
    };
