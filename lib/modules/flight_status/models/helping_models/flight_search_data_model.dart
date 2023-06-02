/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_status_search_options.dart';

class FlightSearchDataModel {
  String text;
  FlightStatusSearchOptions flightStatusSearchOptions;
  String? icon;
  String airlineCode;
  FlightSearchDataModel({
    required this.text,
    required this.flightStatusSearchOptions,
    required this.icon,
    required this.airlineCode,
  });
}
