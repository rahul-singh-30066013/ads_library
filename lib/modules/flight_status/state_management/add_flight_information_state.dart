/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:intl/intl.dart' show DateFormat;

class AddFlightInformationState extends ADBaseViewModel {
  FlightType _flightType = FlightType.arrival;

  FlightType get flightType => _flightType;

  DateTime _date = DateFormat(Constant.dateFormat3)
      .parse(DateFormat(Constant.dateFormat3).format(DateTime.now()));

  DateTime get date => _date;

  AirportItemModel? selectedAirport = selectedAirportsData;

  ///It will update flight
  void updateFlightType(FlightType flightType) {
    _flightType = flightType;
    notifyListeners();
  }

  ///It will update date
  void updateDate(DateTime updatedDate) {
    _date = updatedDate;
    notifyListeners();
  }

  ///It will update selected airport
  void updateSelectedAirport(AirportItemModel airportItem) {
    selectedAirport = airportItem;
    if ((selectedAirport?.airportCode?.toUpperCase() == 'BOM') ||
        ((selectedAirport?.city ?? '').trim().toLowerCase() ==
            'Other'.toLowerCase())) {
      _date = DateFormat(Constant.dateFormat3)
          .parse(DateFormat(Constant.dateFormat3).format(DateTime.now()));
    }
    notifyListeners();
  }
}
