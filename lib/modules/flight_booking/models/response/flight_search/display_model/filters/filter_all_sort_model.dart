/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

class FilterAllSortModel {
  final List<FlightSorting> priceSort;
  String changeCode;

  FilterAllSortModel({
    required this.priceSort,
    required this.changeCode,
  });

  factory FilterAllSortModel.defaultValues() => FilterAllSortModel(
        changeCode: '',
        priceSort: [
          FlightSorting(
            sortType: SortType.asc,
            flightSort: FlightSort.byPrice,
            sortName: 'Price\nLow to High',
            isSelected: true,
          ),
          FlightSorting(
            sortType: SortType.des,
            flightSort: FlightSort.byPrice,
            sortName: 'Price\nHigh to Low',
            isSelected: false,
          ),
          FlightSorting(
            sortType: SortType.asc,
            flightSort: FlightSort.byDuration,
            sortName: 'Duration\nLow to High',
            isSelected: false,
          ),
          FlightSorting(
            sortType: SortType.des,
            flightSort: FlightSort.byDuration,
            sortName: 'Duration\nHigh to Low',
            isSelected: false,
          ),
          FlightSorting(
            sortType: SortType.asc,
            flightSort: FlightSort.byTime,
            sortName: 'Time\nLow to High',
            isSelected: false,
          ),
          FlightSorting(
            sortType: SortType.des,
            flightSort: FlightSort.byTime,
            sortName: 'Time\nHigh to Low',
            isSelected: false,
          ),
        ],
      );
  FilterAllSortModel copy() {
    return FilterAllSortModel(
      priceSort: priceSort,
      changeCode: changeCode,
    );
  }
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
