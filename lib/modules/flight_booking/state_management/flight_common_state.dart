/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_fare/display_model/fare_calendar_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/traveller_passenger_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/saved_flight_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/repositories/flight_status_repository.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/cupertino.dart';

//this common state class is used for overall flight booking, its added on root level for flight section and persist through out
class FlightCommonState extends ChangeNotifier {
  TravellerPassengerResponseModel? travellerPassengerResponseModel;
  String? reviewedUserID;
  CountryCodeData? countryCodeData;

  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();

  // fareCalendar departure state
  ADResponseState fareCalenderState = ADResponseState.loading();

  // fareCalendar arrival state
  ADResponseState fareCalenderArrivalState = ADResponseState.loading();

  // to store all the fareCalendarObjects with respect to fromToCity and toFromCity
  final Map<String, FareCalendarDisplayModel> fareCalendarAllObjects = {};

  // to check to city and from city
  TripDetailModel? tripDetailModel;

  bool isNeedRefresh = false;

  bool isCouponRemovedFromBackend = false;

  ///refresh time of SRP when popping from review page (in minutes)
  final int refreshTime = 1;

  ///To Show saved flight data on Airport Dashboard
  SavedFlightModel? savedFlights;

  Future<void> callSavedFlightApi() async {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      const int three = 3;
      await FlightStatusRepository()
          .getSavedFlight(
        pageSize: three,
        pageIndex: 1,
        language: 'en',
      )
          .then(
        (value) {
          if (value.viewStatus == Status.complete && value.data != null) {
            final SavedFlightModel savedFlightResponse = value.data;
            savedFlights = savedFlightResponse.flights.isNotEmpty
                ? savedFlightResponse
                : null;
          } else {
            savedFlights = null;
          }
          notifyListeners();
        },
      );
    } else {
      savedFlights = null;
      notifyListeners();
    }
  }

  bool isNeedRefreshAfterATime(DateTime time) {
    return DateTime.now()
            .difference(
              time,
            )
            .inMinutes >=
        refreshTime;
  }

  void getFlightsFareCalender(
    FlightBookingModel bookingModel,
    TripType tripType,
  ) {
    if (tripType == TripType.oneWay) {
      if (fareCalenderState != ADResponseState.loading()) {
        _getFlightsFareCalender(bookingModel, false);
      }
    } else {
      if (fareCalenderState != ADResponseState.loading()) {
        _getFlightsFareCalender(bookingModel, false);
      }
      if (fareCalenderArrivalState != ADResponseState.loading()) {
        _getFlightsFareCalender(bookingModel, true);
      }
    }
  }

  ///It will provide flight fare data
  Future<void> _getFlightsFareCalender(
    FlightBookingModel bookingModel,
    isArrival,
  ) async {
    final keyObject =
        _isFareCalendarAPICallRequiredNew(bookingModel, isArrival);
    if (keyObject.isApiCall) {
      setDepartureArrivalStates(isArrival);
      final value = await _flightBookingRepository.fetchFlightFare(
        flightBookingModel: bookingModel,
        isArrival: isArrival,
      );

      _updateFareListState(
        value,
        keyObject.fromToCityKey,
        keyObject.selectedCity,
      );
    }
  }

  ///It will update flight fare data of ADResponseState
  void _updateFareListState(
    ADResponseState response,
    String fromToCityKey,
    String selectedCity,
  ) {
    if (fromToCityKey == selectedCity) {
      fareCalenderState = response;
    } else {
      fareCalenderArrivalState = response;
    }
    final FareCalendarDisplayModel fareCalendarDisplayModel =
        FareCalendarDisplayModel.fromFareCalenderResponse(response.data);
    fareCalendarAllObjects[fromToCityKey] = fareCalendarDisplayModel;
    notifyListeners();
  }

  /// this method will set the state of departure and arrival fareCalendar request
  void setDepartureArrivalStates(isArrival) {
    if (isArrival) {
      if (fareCalenderArrivalState.viewStatus != Status.loading) {
        fareCalenderArrivalState = ADResponseState.loading();
      }
    } else {
      if (fareCalenderState.viewStatus != Status.loading) {
        fareCalenderState = ADResponseState.loading();
      }
    }
  }

  // this method is use to check id to city and from city contains in fareCalendarAllObjects
  // if it contain the keys and last api hit time is greater than 1 min, then we will hit again this api.

  KeyObject _isFareCalendarAPICallRequiredNew(
    FlightBookingModel bookingModel,
    isArrival,
  ) {
    final selectedCity =
        '${bookingModel.oneWayTrip?.fromCity?.cityCode}${bookingModel.oneWayTrip?.toCity?.cityCode}';

    final fromToCityKey = isArrival
        ? '${bookingModel.oneWayTrip?.toCity?.cityCode}${bookingModel.oneWayTrip?.fromCity?.cityCode}'
        : '${bookingModel.oneWayTrip?.fromCity?.cityCode}${bookingModel.oneWayTrip?.toCity?.cityCode}';

    if (fareCalendarAllObjects.isNotEmpty) {
      final isAdded = fareCalendarAllObjects.containsKey(fromToCityKey);
      if (isAdded) {
        final object =
            fareCalendarAllObjects[fromToCityKey] as FareCalendarDisplayModel;
        if (DateTime.now().difference(object.lastHitTime).inMinutes >
            kFareCalendarApiHitTime) {
          return KeyObject(
            isApiCall: true,
            fromToCityKey: fromToCityKey,
            selectedCity: selectedCity,
          );
        }
        return KeyObject(
          isApiCall: false,
          fromToCityKey: fromToCityKey,
          selectedCity: selectedCity,
        );
      }
    }
    return KeyObject(
      isApiCall: true,
      fromToCityKey: fromToCityKey,
      selectedCity: selectedCity,
    );
  }
}

/// this method is used to send toFromCity and fromToCity keys
class KeyObject {
  bool isApiCall;
  String fromToCityKey;
  String selectedCity;

  KeyObject({
    required this.isApiCall,
    required this.fromToCityKey,
    required this.selectedCity,
  });
}
