/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_flights_response_model.freezed.dart';
part 'get_flights_response_model.g.dart';

/// This model is the response from the getFlights api.
@Freezed(makeCollectionsUnmodifiable: false)
class GetFlightsResponseModel with _$GetFlightsResponseModel {
  const factory GetFlightsResponseModel({
    @Default([]) List<PranaamFlights>? pranaamFlights,
    @Default('') String message,
  }) = _GetFlightsResponseModel;

  factory GetFlightsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetFlightsResponseModelFromJson(json);
}
