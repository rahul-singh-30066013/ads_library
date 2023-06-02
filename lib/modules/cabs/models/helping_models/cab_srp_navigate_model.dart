/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_address_details_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class CabSrpNavigateModel {
  final AirportTerminalDetailModel? airportTerminalDetailModel;
  final AddressDetailModel? locationAddressDetailModel;
  final ADResponseState cabResponse;
  final Function(DateTime?) updateSelectedDate;
  final DateTime? selectedDate;
  final bool isFromAirport;

  const CabSrpNavigateModel({
    required this.airportTerminalDetailModel,
    required this.locationAddressDetailModel,
    required this.cabResponse,
    required this.updateSelectedDate,
    required this.selectedDate,
    required this.isFromAirport,
  });
}
