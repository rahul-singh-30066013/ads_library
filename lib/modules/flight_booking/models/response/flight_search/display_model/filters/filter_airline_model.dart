/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/default_filter_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

class FilterAirlineModel {
  String changeCode;
  final String filterName;
  final List<AirlineFilter> filterOptions;
  List<String> selectedFilterType = [];
  Map<String, int>? departureFlightCountMap;
  Map<String, int>? arrivalFlightCountMap;
  int filterCount;
  FilterAirlineModel({
    required this.changeCode,
    required this.filterName,
    required this.filterOptions,
    required this.selectedFilterType,
    required this.departureFlightCountMap,
    required this.arrivalFlightCountMap,
    required this.filterCount,
  });

  factory FilterAirlineModel.outBoundDefaultValues([
    DefaultFilterModel? flightCountModel,
  ]) =>
      FilterAirlineModel(
        changeCode: '',
        filterName: 'Airline',
        filterCount: 0,
        filterOptions: flightCountModel?.outBoundFilterOptions ?? [],
        selectedFilterType: [],
        departureFlightCountMap: flightCountModel?.departureFlightCountMap,
        arrivalFlightCountMap: flightCountModel?.arrivalFlightCountMap,
      );

  factory FilterAirlineModel.inBoundDefaultValues([
    DefaultFilterModel? flightCountModel,
  ]) =>
      FilterAirlineModel(
        changeCode: '',
        filterName: 'Airline',
        filterCount: 0,
        filterOptions: flightCountModel?.inBoundFilterOptions ?? [],
        selectedFilterType: [],
        departureFlightCountMap: flightCountModel?.departureFlightCountMap,
        arrivalFlightCountMap: flightCountModel?.arrivalFlightCountMap,
      );

  FilterAirlineModel copy() {
    final List<AirlineFilter> filterCopy = [];
    for (final element in filterOptions) {
      filterCopy.add(element.copy());
    }
    return FilterAirlineModel(
      changeCode: changeCode,
      filterName: filterName,
      filterOptions: filterCopy,
      selectedFilterType: selectedFilterType,
      departureFlightCountMap: departureFlightCountMap,
      arrivalFlightCountMap: arrivalFlightCountMap,
      filterCount: filterCount,
    );
  }

  void updateChangeCode() {
    final concatenate = StringBuffer();
    final List<String> _selectedFilterType = [];
    for (final item in filterOptions) {
      if (item.isSelected) {
        concatenate.write(item.itemCode);
        _selectedFilterType.add(item.airlineCode);
      }
    }
    selectedFilterType = _selectedFilterType;
    changeCode = concatenate.toString();
    filterCount = changeCode.isNotEmpty ? 1 : 0;

    //print(changeCode);
  }
}

class AirlineFilter {
  String airlineName;
  String airlineCode;
  String airlineLogo;
  String itemCode;
  bool isSelected = false;
  FlightCompany? flightCompany;

  AirlineFilter({
    required this.airlineName,
    required this.airlineCode,
    required this.itemCode,
    required this.airlineLogo,
    required this.isSelected,
    this.flightCompany,
  });

  AirlineFilter copy() {
    return AirlineFilter(
      airlineName: airlineName,
      airlineCode: airlineCode,
      airlineLogo: airlineLogo,
      itemCode: itemCode,
      isSelected: isSelected,
      flightCompany: flightCompany,
    );
  }
}
