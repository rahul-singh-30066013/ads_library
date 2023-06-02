/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/default_filter_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_airline_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_all_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_nearby_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_departure_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_departure_nearby_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_price.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_stop_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

class FilterSortModel {
  final FilterStopModel outBoundStops;
  final FilterStopModel inBoundStops;
  final FilterDepartureModel outBoundDepartureTimes;
  final FilterDepartureModel inBoundDepartureTimes;
  final FilterArrivalModel outBoundArrivalTimes;
  final FilterArrivalModel inBoundArrivalTimes;
  final FilterAirlineModel outBoundAirline;
  final FilterAirlineModel inBoundAirline;
  final FilterPrice outBoundFilterPrice;
  final FilterPrice inBoundFilterPrice;

  final FilterAllSortModel outBoundFilterAllSortModel;
  final FilterAllSortModel inBoundFilterAllSortModel;

  /// Out bound filter nearby
  final FilterArrivalNearbyModel outBoundArrivalFilterNearbyModel;
  final FilterDepartureNearbyModel outBoundDepartureFilterNearbyModel;


  /// In bound filter nearby
  final FilterArrivalNearbyModel inBoundArrivalFilterNearbyModel;
  final FilterDepartureNearbyModel inBoundDepartureFilterNearbyModel;

  FilterSortModel({
    required this.outBoundStops,
    required this.inBoundStops,
    required this.outBoundDepartureTimes,
    required this.inBoundDepartureTimes,
    required this.outBoundAirline,
    required this.inBoundAirline,
    required this.outBoundArrivalTimes,
    required this.inBoundArrivalTimes,
    required this.outBoundFilterPrice,
    required this.inBoundFilterPrice,
    required this.outBoundFilterAllSortModel,
    required this.inBoundFilterAllSortModel,
    required this.outBoundArrivalFilterNearbyModel,
    required this.outBoundDepartureFilterNearbyModel,
    required this.inBoundArrivalFilterNearbyModel,
    required this.inBoundDepartureFilterNearbyModel,

  });

  factory FilterSortModel.defaultFilterSort([
    DefaultFilterModel? flightCountModel,
  ]) {
    return FilterSortModel(
      outBoundFilterAllSortModel: FilterAllSortModel.defaultValues(),
      outBoundStops: FilterStopModel.defaultValues(),
      inBoundStops: FilterStopModel.defaultValues(),
      outBoundDepartureTimes: FilterDepartureModel.defaultValues(),
      inBoundDepartureTimes: FilterDepartureModel.defaultValues(),
      outBoundArrivalTimes: FilterArrivalModel.defaultValues(),
      inBoundArrivalTimes: FilterArrivalModel.defaultValues(),
      outBoundAirline:
          FilterAirlineModel.outBoundDefaultValues(flightCountModel),
      inBoundAirline: FilterAirlineModel.inBoundDefaultValues(flightCountModel),
      inBoundFilterAllSortModel: FilterAllSortModel.defaultValues(),
      outBoundFilterPrice:
          FilterPrice.defaultValues(flightCountModel?.departureFilterPrice),
      inBoundFilterPrice:
          FilterPrice.defaultValues(flightCountModel?.arrivalFilterPrice),
      outBoundArrivalFilterNearbyModel:  FilterArrivalNearbyModel.outBoundDefaultValues(flightCountModel),
      outBoundDepartureFilterNearbyModel:  FilterDepartureNearbyModel.outBoundDefaultValues(flightCountModel),
      inBoundArrivalFilterNearbyModel:  FilterArrivalNearbyModel.inBoundDefaultValues(flightCountModel),
      inBoundDepartureFilterNearbyModel:  FilterDepartureNearbyModel.inBoundDefaultValues(flightCountModel),

    );
  }

  FilterSortModel copy() {
    return FilterSortModel(
      outBoundFilterAllSortModel: outBoundFilterAllSortModel.copy(),
      inBoundFilterAllSortModel: inBoundFilterAllSortModel.copy(),
      outBoundStops: outBoundStops.copy(),
      inBoundStops: inBoundStops.copy(),
      outBoundDepartureTimes: outBoundDepartureTimes.copy(),
      inBoundDepartureTimes: inBoundDepartureTimes.copy(),
      outBoundAirline: outBoundAirline.copy(),
      inBoundAirline: inBoundAirline.copy(),
      outBoundArrivalTimes: outBoundArrivalTimes.copy(),
      inBoundArrivalTimes: inBoundArrivalTimes.copy(),
      outBoundFilterPrice: outBoundFilterPrice.copy(),
      inBoundFilterPrice: inBoundFilterPrice.copy(),
      outBoundArrivalFilterNearbyModel: outBoundArrivalFilterNearbyModel.copy(),
      outBoundDepartureFilterNearbyModel: outBoundDepartureFilterNearbyModel.copy(),
      inBoundArrivalFilterNearbyModel: inBoundArrivalFilterNearbyModel.copy(),
      inBoundDepartureFilterNearbyModel: inBoundDepartureFilterNearbyModel.copy(),
    );
  }

  String get changeCode =>
      outBoundStops.changeCode +
      outBoundDepartureTimes.changeCode +
      outBoundArrivalTimes.changeCode +
      outBoundAirline.changeCode +
      outBoundFilterPrice.changeCode +
      inBoundStops.changeCode +
      inBoundDepartureTimes.changeCode +
      inBoundFilterPrice.changeCode +
      inBoundAirline.changeCode +
      inBoundArrivalTimes.changeCode +
      outBoundFilterAllSortModel.changeCode +
      inBoundFilterAllSortModel.changeCode+
          outBoundArrivalFilterNearbyModel.changeCode+
          outBoundDepartureFilterNearbyModel.changeCode+
          inBoundArrivalFilterNearbyModel.changeCode+
          inBoundDepartureFilterNearbyModel.changeCode;

  String get sortChangeCode =>
      outBoundFilterAllSortModel.changeCode +
      inBoundFilterAllSortModel.changeCode;

  int get outBoundFilterCount =>
      outBoundStops.filterCount +
      outBoundDepartureTimes.filterCount +
      outBoundArrivalTimes.filterCount +
      outBoundAirline.filterCount +
          outBoundArrivalFilterNearbyModel.filterCount +
          outBoundDepartureFilterNearbyModel.filterCount +
          outBoundFilterPrice.filterCount;

  int get inBoundFilterCount =>
      inBoundStops.filterCount +
      inBoundDepartureTimes.filterCount +
      inBoundArrivalTimes.filterCount +
      inBoundAirline.filterCount +
          inBoundArrivalFilterNearbyModel.filterCount +
          inBoundDepartureFilterNearbyModel.filterCount +
      inBoundFilterPrice.filterCount;

  String get outBoundInternationalFilterApply =>
      outBoundArrivalFilterNearbyModel.changeCode+
          outBoundDepartureFilterNearbyModel.changeCode+
          outBoundAirline.changeCode+
          outBoundArrivalTimes.changeCode+
          outBoundDepartureTimes.changeCode+
          outBoundStops.changeCode;

  String get inBoundInternationalFilterApply =>
      inBoundArrivalFilterNearbyModel.changeCode+
          inBoundDepartureFilterNearbyModel.changeCode+
          inBoundAirline.changeCode+
          inBoundArrivalTimes.changeCode+
          inBoundDepartureTimes.changeCode+
          inBoundStops.changeCode;

}

class FlightSorting {
  SortType sortType;
  FlightSort flightSort;
  String sortName;
  bool isSelected;

  FlightSorting({
    required this.sortType,
    required this.flightSort,
    required this.sortName,
    required this.isSelected,
  });
}

class FilterSortStateModel {
  final FilterSortModel oldFilter;
  final FilterSortModel newFilter;

  FilterSortStateModel({required this.oldFilter, required this.newFilter});

  ///Check for the any change in the overall filters
  bool get hasAnyChange => oldFilter.changeCode != newFilter.changeCode;
}
