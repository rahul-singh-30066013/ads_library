/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

extension FilterSortOprations on FlightListModel {
  ///Defined multiple sort options as per the business logics
  void sortFlightList({
    required FlightSort flightSort,
    required SortType sortType,
    required bool isReturn,
    required String sectorId,
  }) {
    switch (flightSort) {
      case FlightSort.byPrice:
        _sortFlightListByPrice(
          sortType: sortType,
          isReturn: isReturn,
          sectorId: sectorId,
        );
        break;
      case FlightSort.byDuration:
        _sortFlightListByDuration(
          sortType: sortType,
          isReturn: isReturn,
          sectorId: sectorId,
        );
        break;
      case FlightSort.byTime:
        _sortFlightListByDepartureTime(
          sortType: sortType,
          isReturn: isReturn,
          sectorId: sectorId,
        );
        break;
    }
  }

  //sort based on the Price
  void _sortFlightListByPrice({
    required SortType sortType,
    required bool isReturn,
    required String sectorId,
  }) {
    if (sectorId == 'D') {
      final List<FlightsDisplayModel>? flightListing =
          isReturn ? inBoundFlightListing : outBoundFlightListing;

      if (sortType == SortType.des) {
        //minimum amount first
        flightListing?.sort((b, a) {
          final sortByPriceFirst =
              a.flightDisplayInfo.price.compareTo(b.flightDisplayInfo.price);
          if (sortByPriceFirst != 0) {
            return sortByPriceFirst;
          }
          return b.flightDisplayInfo.flightDuration
              .compareTo(a.flightDisplayInfo.flightDuration);
        });
      } else {
        //maximum amount first
        flightListing?.sort((a, b) {
          final sortByPriceFirst =
              a.flightDisplayInfo.price.compareTo(b.flightDisplayInfo.price);
          if (sortByPriceFirst != 0) {
            return sortByPriceFirst;
          }
          return a.flightDisplayInfo.flightDuration
              .compareTo(b.flightDisplayInfo.flightDuration);
        });
      }
    } else {
      final List<FlightsDisplayModel>? flightListing = isReturn
          ? internationalFlightListingWithGroup
          : internationalFlightListingWithGroup;

      if (sortType == SortType.des) {
        //minimum amount first
        flightListing?.sort((b, a) {
          final sortByPriceFirst =
              a.flightDisplayInfo.price.compareTo(b.flightDisplayInfo.price);
          if (sortByPriceFirst != 0) {
            return sortByPriceFirst;
          }
          return b.flightDisplayInfo.flightDuration
              .compareTo(a.flightDisplayInfo.flightDuration);
        });
      } else {
        //maximum amount first
        flightListing?.sort((a, b) {
          final sortByPriceFirst =
              a.flightDisplayInfo.price.compareTo(b.flightDisplayInfo.price);
          if (sortByPriceFirst != 0) {
            return sortByPriceFirst;
          }
          return a.flightDisplayInfo.flightDuration
              .compareTo(b.flightDisplayInfo.flightDuration);
        });
      }
    }
  }

  //sort based on the Duration
  void _sortFlightListByDuration({
    required SortType sortType,
    required bool isReturn,
    required String sectorId,
  }) {
    if (sectorId == 'D') {
      final List<FlightsDisplayModel>? flightListing =
          isReturn ? inBoundFlightListing : outBoundFlightListing;

      if (sortType == SortType.des) {
        //minimum duration first
        flightListing?.sort(
          (b, a) => a.flightFilterInfo.duration
              .compareTo(b.flightFilterInfo.duration),
        );
      } else {
        //maximum duration first
        flightListing?.sort(
          (a, b) => a.flightFilterInfo.duration
              .compareTo(b.flightFilterInfo.duration),
        );
      }
    } else {
      final List<FlightsDisplayModel>? flightListing = isReturn
          ? internationalFlightListingWithGroup
          : internationalFlightListingWithGroup;

      if (sortType == SortType.des) {
        //minimum duration first
        flightListing?.sort(
          (b, a) => a.flightFilterInfo.duration
              .compareTo(b.flightFilterInfo.duration),
        );
      } else {
        //maximum duration first
        flightListing?.sort(
          (a, b) => a.flightFilterInfo.duration
              .compareTo(b.flightFilterInfo.duration),
        );
      }
    }
  }

  //sort based on the Time
  void _sortFlightListByDepartureTime({
    required SortType sortType,
    required bool isReturn,
    required String sectorId,
  }) {
    if (sectorId == 'D') {
      final List<FlightsDisplayModel>? flightListing =
          isReturn ? inBoundFlightListing : outBoundFlightListing;

      if (sortType == SortType.des) {
        //minimum amount first
        flightListing?.sort(
          (b, a) => a.flightDisplayInfo.flightDepartureTime
              .compareTo(b.flightDisplayInfo.flightDepartureTime),
        );
      } else {
        //maximum duration first
        flightListing?.sort(
          (a, b) => a.flightDisplayInfo.flightDepartureTime
              .compareTo(b.flightDisplayInfo.flightDepartureTime),
        );
      }
    } else {
      final List<FlightsDisplayModel>? flightListing = isReturn
          ? internationalFlightListingWithGroup
          : internationalFlightListingWithGroup;

      if (sortType == SortType.des) {
        //minimum amount first
        flightListing?.sort(
          (b, a) => a.flightDisplayInfo.flightDepartureTime
              .compareTo(b.flightDisplayInfo.flightDepartureTime),
        );
      } else {
        //maximum duration first
        flightListing?.sort(
          (a, b) => a.flightDisplayInfo.flightDepartureTime
              .compareTo(b.flightDisplayInfo.flightDepartureTime),
        );
      }
    }
  }
}
