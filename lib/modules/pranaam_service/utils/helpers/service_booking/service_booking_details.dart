/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/flight_details_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

const int id_1 = 1;
const int id_2 = 2;
const int id_3 = 3;
const int id_4 = 4;
const int id_5 = 5;
const int id_6 = 6;

/// this class is used to retrieve/ manipulate data from api/local_db.
/// it will return data to repository class.
///
class ServiceBookingDetails {
  static final ServiceBookingDetails _serviceBookingDetails =
      ServiceBookingDetails();

  static ServiceBookingDetails getInstance() {
    return _serviceBookingDetails;
  }

  List<ServiceModel> getServices() {
    return [
      ServiceModel(
        serviceId: id_4,
        serviceTitle: 'Arrival',
      ),
      ServiceModel(
        serviceId: id_1,
        serviceTitle: 'Departure',
      ),
      ServiceModel(
        serviceId: id_3,
        serviceTitle: 'Round Trip',
      ),
      ServiceModel(
        serviceId: id_2,
        serviceTitle: 'Transit',
      ),
    ];
  }

  String getServiceName(int id) {
    final List<ServiceModel> serviceModelList = getServices();
    final int length = serviceModelList.length;
    for (int index = 0; index < length; index++) {
      if (serviceModelList[index].serviceId == id) {
        return serviceModelList[index].serviceTitle;
      }
    }
    return 'Departure';
  }

  List<TravelSectorModel> getTravelSectorData() {
    return [
      TravelSectorModel(
        travelSectorId: id_3,
        travelSectorTitle: 'Domestic',
      ),
      TravelSectorModel(
        travelSectorId: id_4,
        travelSectorTitle: 'International',
      ),
      TravelSectorModel(
        travelSectorId: id_6,
        travelSectorTitle: 'Domestic to Domestic',
        isTransit: true,
      ),
      TravelSectorModel(
        travelSectorId: id_1,
        travelSectorTitle: 'Domestic to International',
        isTransit: true,
      ),
      TravelSectorModel(
        travelSectorId: id_2,
        travelSectorTitle: 'International to International',
        isTransit: true,
      ),
      TravelSectorModel(
        travelSectorId: id_5,
        travelSectorTitle: 'International to Domestic',
        isTransit: true,
      ),
    ];
  }

  String getTravelSectorName(int id) {
    final List<TravelSectorModel> travelSectorList = getTravelSectorData();
    final int length = travelSectorList.length;
    for (int index = 0; index < length; index++) {
      if (travelSectorList[index].travelSectorId == id) {
        return travelSectorList[index].travelSectorTitle;
      }
    }

    return 'Domestic';
  }

  List<FlightDetailsModel> getFlightDetailsData() {
    return [
      FlightDetailsModel(
        flightNumber: '6E 0437',
        icon: 'lib/assets/images/common/indigo.png',
        arrivalTime: '00:30',
        serviceTime: '00:30',
      ),
      FlightDetailsModel(
        flightNumber: '6E 2487',
        icon: 'lib/assets/images/common/indigo.png',
        arrivalTime: '12:00',
        serviceTime: '12:00',
      ),
      FlightDetailsModel(
        flightNumber: '6E 6562',
        icon: 'lib/assets/images/common/indigo.png',
        arrivalTime: '14:00',
        serviceTime: '14:00',
      ),
      FlightDetailsModel(
        flightNumber: '6E 354',
        icon: 'lib/assets/images/common/indigo.png',
        arrivalTime: '17:00',
        serviceTime: '17:00',
      ),
      FlightDetailsModel(
        flightNumber: '6E 991',
        icon: 'lib/assets/images/common/indigo.png',
        arrivalTime: '22:00',
        serviceTime: '22:00',
      ),
    ];
  }

  String handleSearchString(String userSearchTerm) {
    return userSearchTerm.replaceAll(
      RegExp(r'[^\w\s]+'), //regex for identifying special characters.
      '',
    );
  }

  List<PranaamFlights> airportSearchFromList(
    List<PranaamFlights> listOfAirports,
    String userSearchTerm,
  ) {
    return listOfAirports.where(
      (airportDetailsModel) {
        return airportDetailsModel.flightFinalNumber
            .validateWithDefaultValue()
            .toLowerCase()
            .contains(userSearchTerm.toLowerCase());
      },
    ).toList();
  }

  List<Country> countrySearchFromList(
    List<Country> listOfCountry,
    String userSearchTerm,
  ) {
    adLog('searchCountry..$userSearchTerm');
    final List<Country> countryList = listOfCountry.where(
      (countryDetailsModel) {
        return countryDetailsModel.countryName
                .validateWithDefaultValue()
                .toLowerCase()
                .startsWith(userSearchTerm.toLowerCase()) ||
            countryDetailsModel.dialCode
                .validateWithDefaultValue()
                .toLowerCase()
                .startsWith(userSearchTerm.toLowerCase());
      },
    ).toList();
    adLog('searchCountry..$countryList');
    return countryList;
  }

  Map<int, String> getPassengerType = {
    1: 'Adult',
    2: 'Child',
    3: 'Infant',
  };

  Map<String, int> getSalutationType = {
    'Mr': 1,
    'Mrs': 2,
    'Ms': 3,
    'Inf': 4,
    'Master': 5,
    'Miss': 6,
  };
}
