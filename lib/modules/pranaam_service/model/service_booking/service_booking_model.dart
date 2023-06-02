/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/date_of_journey_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';

///
///Model class for Booking Pranaam Service feature.
///It has following data
///ServiceModel
///TravelSectorModel
///CityDetailModel
///DateOfJourneyModel
///Travellers
///FlightDetailsModel
///

class ServiceBookingModel {
  ServiceModel? selectedService;
  TravelSectorModel? selectedTravelSector;
  CityDetailModel? selectedCityDetailFrom;
  CityDetailModel? selectedCityDetailTo;
  DateOfJourneyModel? dateOfJourney;
  Travellers? travellers;
  PranaamFlights? selectedFlightDetailModel;
  CityDetailModel? arriveFrom;
  CityDetailModel? goingTo;
  DateOfJourneyModel? roundTripTransitDate;
  PranaamFlights? roundTripTransitFlights;
  String? serviceAirport;

  ServiceBookingModel({
    this.selectedService,
    this.selectedTravelSector,
    this.selectedCityDetailFrom,
    this.selectedCityDetailTo,
    this.dateOfJourney,
    this.travellers,
    this.selectedFlightDetailModel,
  });

  @override
  String toString() {
    return 'ServiceBookingModel{selectedService: $selectedService, selectedTravelSector: $selectedTravelSector, selectedCityDetailFrom: $selectedCityDetailFrom, selectedCityDetailTo: $selectedCityDetailTo, dateOfJourney: $dateOfJourney, travellers: $travellers, selectedFlightDetailModel: $selectedFlightDetailModel, arriveFrom: $arriveFrom, goingTo: $goingTo, roundTripTransitDate: $roundTripTransitDate, roundTripTransitFlights: $roundTripTransitFlights}';
  }
}
