/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pranaam_flights.freezed.dart';
part 'pranaam_flights.g.dart';

/// This model is used to create no of flights available.
@Freezed(makeCollectionsUnmodifiable: false)
class PranaamFlights with _$PranaamFlights {
  const factory PranaamFlights({
    @Default('') String flightFinalNumber,
    @Default('') String flightTime,
    @Default('') String serviceDate,
    @Default('') String flightDate,
    @Default('') String serviceDateTime,
    @Default('') String flightDisplayName,
    @Default('') String serviceTime,
    @Default('') String airlineCode,
    @Default('') String flightNo,
    @Default('') String flightName,
    @Default('') String flightTerminal,
  }) = _PranaamFlights;

  factory PranaamFlights.fromJson(Map<String, dynamic> json) =>
      _$PranaamFlightsFromJson(json);
}
