/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';

class SelectDestinationNavigateModel {
  List<AirportTerminalDetailModel>? airportUpdatedDetailedListForCab;
  AirportTerminalDetailModel? airportTerminalDetailModel;
  SearchAddressModel? selectedLocationDetailModel;
  final void Function(AirportTerminalDetailModel?) airportLocationChange;
  final void Function(SearchAddressModel?) selectedLocationChange;
  final bool isFromAirport;
  final bool isAirportLocationTap;
  final DateTime? selectedDate;

  SelectDestinationNavigateModel({
    required this.airportUpdatedDetailedListForCab,
    required this.airportTerminalDetailModel,
    required this.airportLocationChange,
    required this.selectedLocationDetailModel,
    required this.selectedLocationChange,
    required this.isFromAirport,
    required this.isAirportLocationTap,
    required this.selectedDate,
  });
}
