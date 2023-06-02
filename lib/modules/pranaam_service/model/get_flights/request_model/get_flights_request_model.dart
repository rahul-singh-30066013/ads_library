/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_flights_request_model.freezed.dart';
part 'get_flights_request_model.g.dart';

/// This model is used to create flight request for getFlights API,
@Freezed(makeCollectionsUnmodifiable: false)
class GetFlightsRequestModel with _$GetFlightsRequestModel {
  const factory GetFlightsRequestModel({
    required String serviceType,
    required String originAirport,
    required String destinationAirport,
    required String serviceAirport,
    required String serviceDate,
    required String trip,
    required String tripType,
    int? travelSectorType,
  }) = _GetFlightRequestModel;

  factory GetFlightsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetFlightsRequestModelFromJson(json);
}
