/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';

class FlightStatusStorageModel {
  DateTime date;
  FlightType flightType;
  DateTime lastUpdatedTime;
  String cityCode;

  FlightStatusStorageModel({
    required this.date,
    required this.flightType,
    required this.lastUpdatedTime,
    required this.cityCode,
  });
}
