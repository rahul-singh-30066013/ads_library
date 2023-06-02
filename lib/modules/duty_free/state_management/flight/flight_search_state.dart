/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/repositories/flight_status_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:intl/intl.dart' show DateFormat;

class FlightSearchState extends ADBaseViewModel {
  List<FlightStatusSegment> filteredFlightList = List.empty();
  List<FlightStatusSegment> flightList = List.empty();
  ADResponseState flightStatusState = ADResponseState.init();
  final FlightStatusRepository _flightStatusRepository =
      FlightStatusRepository();
  DateTime? pickUpDate;
  String? pickUpTime;
  String? terminal;

  void fetchFlightDetails({
    DateTime? pickUpDate,
    String? pickUpTime,
    String? terminal,
    String? airportCode,
  }) {
    this.pickUpDate ??= pickUpDate;
    this.pickUpTime ??= pickUpTime;
    this.terminal ??= terminal;
    flightStatusState = ADResponseState.loading();
    _flightStatusRepository.fetchFlightStatusList(
      queryParameters: {
        'pickupDate': DateFormat(Constant.dateFormat5)
            .format(this.pickUpDate ?? DateTime.now()),
        'pickupTime': this.pickUpTime ?? '',
        'flightType': this.terminal ?? '',
      },
      cityCode: airportCode ?? 'BOM',
    ).then((value) {
      flightStatusState = value;
      if (flightStatusState.viewStatus == Status.complete) {
        flightList =
            (flightStatusState.data as FlightStatusModel).flightsegment;
        filteredFlightList = List.of(flightList);
      }
      notifyListeners();
    });
  }

  void filterFlights(String value) {
    notifyListeners();
    filteredFlightList = List.of(
      flightList.where(
        (element) =>
            element.flightnumber.toLowerCase().contains(value.toLowerCase()),
      ),
    );
    notifyListeners();
  }
}
