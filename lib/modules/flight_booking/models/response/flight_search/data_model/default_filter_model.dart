/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_airline_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_nearby_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_price.dart';

class DefaultFilterModel {
  DefaultFilterModel({
    this.departureFlightCountMap,
    this.arrivalFlightCountMap,
    this.departureFilterPrice,
    this.arrivalFilterPrice,
    this.outBoundFilterOptions,
    this.inBoundFilterOptions,
    this.outBoundInternationalArrivalNearByAirportMap,
    this.outBoundInternationalArrivalNearbyAirports,
    this.outBoundInternationalDepartureNearbyAirports,
    this.outBoundInternationalDepartureNearByAirportMap,
    this.inBoundInternationalArrivalNearByAirportMap,
    this.inBoundInternationalArrivalNearbyAirports,
    this.inBoundInternationalDepartureNearbyAirports,
    this.inBoundInternationalDepartureNearByAirportMap,

  });

  Map<String, int>? departureFlightCountMap;

  Map<String, int>? arrivalFlightCountMap;
  FilterPrice? departureFilterPrice;
  FilterPrice? arrivalFilterPrice;
  List<AirlineFilter>? outBoundFilterOptions;
  List<AirlineFilter>? inBoundFilterOptions;
  ///International out bound
  List<NearbyAirports>? outBoundInternationalArrivalNearbyAirports;
  List<NearbyAirports>? outBoundInternationalDepartureNearbyAirports;
  Map<String, int>? outBoundInternationalArrivalNearByAirportMap;
  Map<String, int>? outBoundInternationalDepartureNearByAirportMap;

  ///International InBound Bound
  List<NearbyAirports>? inBoundInternationalArrivalNearbyAirports;
  List<NearbyAirports>? inBoundInternationalDepartureNearbyAirports;
  Map<String, int>? inBoundInternationalArrivalNearByAirportMap;
  Map<String, int>? inBoundInternationalDepartureNearByAirportMap;

  ///International round way

}
