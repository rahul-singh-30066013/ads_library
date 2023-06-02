/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/booking_details/api_response_model/booking_details_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_detail.freezed.dart';
part 'trip_detail.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TripDetail with _$TripDetail {
  const factory TripDetail({
    @JsonKey(name: 'tripId') @Default(0) int tripId,
    @JsonKey(name: 'tripBookingNumber') @Default('') String tripBookingNumber,
    @JsonKey(name: 'originAirportId') @Default(0) int originAirportId,
    @JsonKey(name: 'originAirport') @Default('') String originAirport,
    @JsonKey(name: 'destinationAirportId') @Default(0) int destinationAirportId,
    @JsonKey(name: 'destinationAirport') @Default('') String destinationAirport,
    @JsonKey(name: 'serviceAirportId') @Default(0) int serviceAirportId,
    @JsonKey(name: 'businessUnitId') @Default(0) int businessUnitId,
    @JsonKey(name: 'serviceDateTime') @Default('') String serviceDateTime,
    @JsonKey(name: 'flightName') @Default('') String flightName,
    @JsonKey(name: 'flightNumber') @Default('') String flightNumber,
    @JsonKey(name: 'flightTerminal') @Default('') String flightTerminal,
    @JsonKey(name: 'flightDate') @Default('') String flightDate,
    @JsonKey(name: 'flightTime') @Default('') String flightTime,
    @JsonKey(name: 'travelSector') @Default('') String travelSector,
    @JsonKey(name: 'travelSectorId') @Default(0) int travelSectorId,
    @JsonKey(name: 'serviceAirport') @Default('') String serviceAirport,
    @JsonKey(name: 'serviceAirportName') @Default('') String serviceAirportName,
    @JsonKey(name: 'serviceType') @Default('') String serviceType,
    @JsonKey(name: 'tripStatus') @Default(TripStatus()) TripStatus tripStatus,
    @JsonKey(name: 'transitDestRoundTripSecOrigin')
    @Default(0)
        int transitDestRoundTripSecOrigin,
    @JsonKey(name: 'transitRoundTripSecFlightName')
    @Default('')
        String transitRoundTripSecFlightName,
    @JsonKey(name: 'transitRoundTripSecFlightNumber')
    @Default(0)
        int transitRoundTripSecFlightNumber,
    @JsonKey(name: 'transitRoundTripSecFlightTerminal')
    @Default('')
        String transitRoundTripSecFlightTerminal,
    @JsonKey(name: 'transitRoundTripSecFlightDate')
    @Default('')
        String transitRoundTripSecFlightDate,
    @JsonKey(name: 'transitRoundTripSecFlightTime')
    @Default('')
        String transitRoundTripSecFlightTime,
    @JsonKey(name: 'roundTripSecServiceDateTime')
    @Default('')
        String roundTripSecServiceDateTime,
  }) = _TripDetail;

  factory TripDetail.fromJson(Map<String, dynamic> json) =>
      _$TripDetailFromJson(json);
}
