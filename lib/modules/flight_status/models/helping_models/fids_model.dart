/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';

class FidsModel {
  final AirportItemModel? airportItemModel;
  final FlightType? flightType;
  final String? searchText;
  final DateTime? date;

  const FidsModel({
    this.airportItemModel,
    this.flightType,
    this.searchText,
    this.date,
  });
}
