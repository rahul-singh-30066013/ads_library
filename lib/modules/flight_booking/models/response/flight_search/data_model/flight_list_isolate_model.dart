/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';

class FlightListIsolateModel {
  FlightListIsolateModel({
    required this.jsonData,
    this.airlineInfo,
    required this.arrivalFlightCountMap,
    required this.departureFlightCountMap,
    required this.internationalAirportMap,
  });

  Map<String, dynamic> jsonData;
  Map<String, AirLineInfo?>? airlineInfo;
  Map<String, int> departureFlightCountMap;
  Map<String, int> arrivalFlightCountMap;
  Map<String, CityDetailModel> internationalAirportMap;
}
