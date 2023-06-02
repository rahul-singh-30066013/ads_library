/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_status_model.freezed.dart';
part 'flight_status_model.g.dart';

/// This model is used to get fids data from API,
@Freezed(makeCollectionsUnmodifiable: false)
abstract class FlightStatusModel with _$FlightStatusModel {
  const factory FlightStatusModel({
    @Default([]) List<FlightStatusSegment> flightsegment,
  }) = _FlightStatusModel;

  factory FlightStatusModel.fromJson(Map<String, dynamic> json) =>
      _$FlightStatusModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class FlightStatusSegment with _$FlightStatusSegment {
  const factory FlightStatusSegment({
    @Default('') String iatalocalairport,
    @Default('') String iatalocalairportcode,
    @Default('') String iataroute,
    @Default('') String iataroutecode,
    @Default('') String estimatedtime,
    @Default('') String actualtime,
    @Default('') String airlinecode,
    @Default('') String flightnumber,
    @Default('') String terminal,
    @Default('') String aircrafttype,
    @Default('') String flighttype,
    @Default('') String status,
    @Default('') String remarkes,
    @Default('') String flightkind,
    @Default('') String scheduletime,
    @Default('') String estimateddate,
    @Default('') String actualdate,
    @Default('') String scheduledate,
    @Default('') String cardId,
    @Default([]) List<Carousel> stands,
    @Default([]) List<Carousel> gates,
    @Default([]) List<Carousel> carousel,
    @Default([]) List<Carousel> checkInCounter,
    @Default([]) List<String> codeShare,
    @Default(false) bool isFlightAdded,
    @Default(false) bool isFlightAdding,
  }) = _FlightStatusSegment;

  factory FlightStatusSegment.fromJson(Map<String, dynamic> json) =>
      _$FlightStatusSegmentFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Carousel with _$Carousel {
  const factory Carousel({
    @Default('') String fromtime,
    @Default('') String totime,
    @Default('') String carousel,
    @Default(0) int sequence,
    @Default('') String gate,
    @Default('') String stand,
    @Default('') String checkincounter,
  }) = _Carousel;

  factory Carousel.fromJson(Map<String, dynamic> json) =>
      _$CarouselFromJson(json);
}
