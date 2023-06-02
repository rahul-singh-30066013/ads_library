/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_flight_request_model.freezed.dart';
part 'add_flight_request_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AddFlightRequestModel with _$AddFlightRequestModel {
  const factory AddFlightRequestModel(
    FlightDetails flightDetails,
  ) = _AddFlightRequestModel;

  factory AddFlightRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddFlightRequestModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class FlightDetails with _$FlightDetails {
  const factory FlightDetails(
    String flightNo,
    String scheduledDate,
    String scheduledTime,
    String flightName,
    Location origin,
    Location destination,
    String terminal,
    String status,
    String type,
    String airlineCode,
    String baggageBelt,
  ) = _FlightDetails;

  factory FlightDetails.fromJson(Map<String, dynamic> json) =>
      _$FlightDetailsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Location with _$Location {
  const factory Location(
    String code,
    String name,
  ) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
