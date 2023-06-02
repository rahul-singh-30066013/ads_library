// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripDetail _$$_TripDetailFromJson(Map<String, dynamic> json) =>
    _$_TripDetail(
      tripId: json['tripId'] as int? ?? 0,
      tripBookingNumber: json['tripBookingNumber'] as String? ?? '',
      originAirportId: json['originAirportId'] as int? ?? 0,
      originAirport: json['originAirport'] as String? ?? '',
      destinationAirportId: json['destinationAirportId'] as int? ?? 0,
      destinationAirport: json['destinationAirport'] as String? ?? '',
      serviceAirportId: json['serviceAirportId'] as int? ?? 0,
      businessUnitId: json['businessUnitId'] as int? ?? 0,
      serviceDateTime: json['serviceDateTime'] as String? ?? '',
      flightName: json['flightName'] as String? ?? '',
      flightNumber: json['flightNumber'] as String? ?? '',
      flightTerminal: json['flightTerminal'] as String? ?? '',
      flightDate: json['flightDate'] as String? ?? '',
      flightTime: json['flightTime'] as String? ?? '',
      travelSector: json['travelSector'] as String? ?? '',
      travelSectorId: json['travelSectorId'] as int? ?? 0,
      serviceAirport: json['serviceAirport'] as String? ?? '',
      serviceAirportName: json['serviceAirportName'] as String? ?? '',
      serviceType: json['serviceType'] as String? ?? '',
      tripStatus: json['tripStatus'] == null
          ? const TripStatus()
          : TripStatus.fromJson(json['tripStatus'] as Map<String, dynamic>),
      transitDestRoundTripSecOrigin:
          json['transitDestRoundTripSecOrigin'] as int? ?? 0,
      transitRoundTripSecFlightName:
          json['transitRoundTripSecFlightName'] as String? ?? '',
      transitRoundTripSecFlightNumber:
          json['transitRoundTripSecFlightNumber'] as int? ?? 0,
      transitRoundTripSecFlightTerminal:
          json['transitRoundTripSecFlightTerminal'] as String? ?? '',
      transitRoundTripSecFlightDate:
          json['transitRoundTripSecFlightDate'] as String? ?? '',
      transitRoundTripSecFlightTime:
          json['transitRoundTripSecFlightTime'] as String? ?? '',
      roundTripSecServiceDateTime:
          json['roundTripSecServiceDateTime'] as String? ?? '',
    );

Map<String, dynamic> _$$_TripDetailToJson(_$_TripDetail instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'tripBookingNumber': instance.tripBookingNumber,
      'originAirportId': instance.originAirportId,
      'originAirport': instance.originAirport,
      'destinationAirportId': instance.destinationAirportId,
      'destinationAirport': instance.destinationAirport,
      'serviceAirportId': instance.serviceAirportId,
      'businessUnitId': instance.businessUnitId,
      'serviceDateTime': instance.serviceDateTime,
      'flightName': instance.flightName,
      'flightNumber': instance.flightNumber,
      'flightTerminal': instance.flightTerminal,
      'flightDate': instance.flightDate,
      'flightTime': instance.flightTime,
      'travelSector': instance.travelSector,
      'travelSectorId': instance.travelSectorId,
      'serviceAirport': instance.serviceAirport,
      'serviceAirportName': instance.serviceAirportName,
      'serviceType': instance.serviceType,
      'tripStatus': instance.tripStatus,
      'transitDestRoundTripSecOrigin': instance.transitDestRoundTripSecOrigin,
      'transitRoundTripSecFlightName': instance.transitRoundTripSecFlightName,
      'transitRoundTripSecFlightNumber':
          instance.transitRoundTripSecFlightNumber,
      'transitRoundTripSecFlightTerminal':
          instance.transitRoundTripSecFlightTerminal,
      'transitRoundTripSecFlightDate': instance.transitRoundTripSecFlightDate,
      'transitRoundTripSecFlightTime': instance.transitRoundTripSecFlightTime,
      'roundTripSecServiceDateTime': instance.roundTripSecServiceDateTime,
    };
