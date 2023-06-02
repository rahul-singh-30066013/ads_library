/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_storage_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class FlightStatusDetailModel {
  final FlightStatusStorageModel flightStatusStorageModel;
  final ADTapCallbackWithValue refreshTap;
  final String flightNumber;
  final FlightStatusSegment selectedFlightStatusSegment;
  bool isNeedToUpdate;

  FlightStatusDetailModel({
    required this.flightStatusStorageModel,
    required this.refreshTap,
    required this.flightNumber,
    required this.selectedFlightStatusSegment,
    this.isNeedToUpdate = false,
  });
}
