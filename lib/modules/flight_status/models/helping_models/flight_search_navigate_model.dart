/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_storage_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class FlightSearchNavigateModel {
  final List<FlightStatusSegment> flightSegment;
  final String searchKeyword;
  final ADTapCallbackWithValue flightTap;
  final FlightType flightType;
  final FlightStatusStorageModel flightStatusStorageModel;
  final ADTapCallback refreshTap;

  FlightSearchNavigateModel({
    required this.flightSegment,
    required this.searchKeyword,
    required this.flightTap,
    required this.flightType,
    required this.flightStatusStorageModel,
    required this.refreshTap,
  });
}
