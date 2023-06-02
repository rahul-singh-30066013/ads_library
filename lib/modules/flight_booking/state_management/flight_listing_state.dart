/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future, unawaited;

import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_fare/display_model/fare_calendar_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_create_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_all_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_nearby_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_price.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_oprations.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flight_list_model_mapping_helper.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/offers/repositories/offer_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';

/// this state class is used for handling flight listing
class FlightListingState extends ADBaseViewModel {
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();

  /// Initiate loading state for api hit
  ADResponseState flightListingState = ADResponseState.loading();
  ADResponseState offerState = ADResponseState.loading();
  ADResponseState flightFareCalendarState = ADResponseState.loading();
  List<CouponDetails> filteredOfferList = List.empty();
  FilterSortModel filterSortModel = FilterSortModel.defaultFilterSort();

  FlightListModel? responseMainData;

  FareCalendarDisplayModel? fareCalendarDisplayModel;

  final FlightBookingModel _flightBookingModel;

  bool? isFilterApplied;
  bool isResetApply = false;
  bool listItemSelector = false;

  FilterPrice? outBoundFilterPrice;
  FilterPrice? inBoundFilterPrice;
  FlightCreateItineraryResponseModel? flightItineraryResponseModel;

  SortType outBoundPriceSortType = SortType.asc;
  SortType outBoundDurationSortType = SortType.des;
  SortType outBoundTimeSortType = SortType.des;
  SortType inBoundPriceSortType = SortType.asc;
  SortType inBoundDurationSortType = SortType.des;
  SortType inBoundTimeSortType = SortType.des;
  FlightSort outBoundSelectedFilterButtonType = FlightSort.byPrice;
  FlightSort inBoundSelectedFilterButtonType = FlightSort.byPrice;
  int outBoundMinPrice = 0;
  int outBoundMaxPrice = 0;
  int inBoundMinPrice = 0;
  int inBoundMaxPrice = 0;
  int maxSeatThreshold = 0;
  String sectorId = 'D';
  String oneWayFromCity = '';
  String oneWayToCity = '';
  String roundTripFromCity = '';
  String roundTripToCity = '';
  FlightListingState(this._flightBookingModel);
  void resetHeaderSort() {
    outBoundPriceSortType = SortType.asc;
    outBoundDurationSortType = SortType.des;
    outBoundTimeSortType = SortType.des;
    inBoundPriceSortType = SortType.asc;
    inBoundDurationSortType = SortType.des;
    inBoundTimeSortType = SortType.des;
    outBoundSelectedFilterButtonType = FlightSort.byPrice;
    inBoundSelectedFilterButtonType = FlightSort.byPrice;
  }

  ///It will provide airports list from api
  Future<void> getFlights() async {
    final isInternational = sectorId.toLowerCase() == 'i';
    unawaited(
      getAllSRPOffers(
        isInternational: isInternational,
        noOfPax: _flightBookingModel.travellers?.totalSeatTravellers ?? 0,
      ),
    );
    _updateLoadingState();
    roundTripFromCity = _flightBookingModel.roundTrip?.fromCity?.cityCode ?? '';
    roundTripToCity = _flightBookingModel.roundTrip?.toCity?.cityCode ?? '';
    oneWayFromCity = _flightBookingModel.oneWayTrip?.fromCity?.cityCode ?? '';
    oneWayToCity = _flightBookingModel.oneWayTrip?.toCity?.cityCode ?? '';
    await _flightBookingRepository
        .fetchFlightList(flightBookingModel: _flightBookingModel)
        .then((value) {
      _updateFlightListState(value);
    });
  }

  ///It will fetch  offer data
  Future<void> getAllSRPOffers({
    required bool isInternational,
    required int noOfPax,
  }) async {
    final Map<String, Object> queryParameters = {
      'promoBusinessSubType': 'FlightBooking',
      'limit': 100,
      'earningPercentageLob': 'FlightBooking',
      'travelType': isInternational ? 'International' : 'Domestic',
      'noOfPax': noOfPax,
    };

    final value = await OfferRepository().fetchOffersOnSRP(
      queryParameters: queryParameters,
    );
    offerState = value;
    if (value.data != null) {
      final earnPoints =
          (value.data as CouponListResponse).earningPercentage.toList();
      filteredOfferList =
          (value.data as CouponListResponse).promoCodes.toList();
      if (earnPoints.isNotEmpty) {
        filteredOfferList.insert(
          0,
          CouponDetails(
            promoCode: '',
            promoDescription: earnPoints.first.description,
            promoType: '1',
          ),
        );
      }
    }
    notifyListeners();
  }

  ///It will provide fare calendar from api
  Future<void> getFareCalendar(List<DateTime> fetchFareForDates) async {
    _updateFareCalendarLoadingState();
    await _flightBookingRepository
        .fetchFlightFareOnSRP(
      flightBookingModel: _flightBookingModel,
      fetchFareForDates: fetchFareForDates,
    )
        .then((value) {
      _updateFareCalendarState(value);
    });
  }

  ///It will provide airports list from api
  void sortFlight({
    required FlightSort flightSort,
    required SortType sortType,
    required bool isTypeReturn,
  }) {
    if (flightListingState.data != null) {
      (flightListingState.data as FlightListModel).sortFlightList(
        flightSort: flightSort,
        sortType: sortType,
        isReturn: isTypeReturn,
        sectorId: sectorId,
      );
    }
  }

  ///It will update airport list data of ADResponseState
  void _updateFlightListState(ADResponseState response) {
    final FlightListModel? instance = response.data;
    responseMainData = instance?.copyWith();
    flightListingState = response;
    if (sectorId == 'D') {
      final int outBoundLength =
          responseMainData?.outBoundFlightListing?.length ?? 0;
      final int inBoundLength =
          responseMainData?.inBoundFlightListing?.length ?? 0;
      if (outBoundLength != 0) {
        outBoundMinPrice = responseMainData
                ?.outBoundFlightListing?.first.flightFilterInfo.unitPrice ??
            0;
        outBoundMaxPrice = responseMainData
                ?.outBoundFlightListing?.last.flightFilterInfo.unitPrice ??
            0;
      }

      if (inBoundLength != 0) {
        inBoundMinPrice = responseMainData
                ?.inBoundFlightListing?.first.flightFilterInfo.unitPrice ??
            0;
        inBoundMaxPrice = responseMainData
                ?.inBoundFlightListing?.last.flightFilterInfo.unitPrice ??
            0;
      }
    } else {
      final int outBoundLength =
          responseMainData?.internationalFlightListing?.length ?? 0;
      if (outBoundLength != 0) {
        outBoundMinPrice = responseMainData?.internationalFlightListing?.first
                .flightFilterInfo.unitPrice ??
            0;
        outBoundMaxPrice = responseMainData
                ?.internationalFlightListing?.last.flightFilterInfo.unitPrice ??
            0;
        inBoundMinPrice = responseMainData?.internationalFlightListing?.first
                .flightFilterInfo.unitPrice ??
            0;
        inBoundMaxPrice = responseMainData
                ?.internationalFlightListing?.last.flightFilterInfo.unitPrice ??
            0;
      }

      /**
       * Function to remove search airport
       */
      // updateInternationalNearbyList();
    }

    sortFlight(
      flightSort: FlightSort.byPrice,
      sortType: SortType.asc,
      isTypeReturn: false,
    );
    if (FlightUtils.isRoundTrip(_flightBookingModel.tripType)) {
      sortFlight(
        flightSort: FlightSort.byPrice,
        sortType: SortType.asc,
        isTypeReturn: true,
      );
    }
    setDefaultFilter(responseMainData);
    notifyListeners();
  }

  void updateInternationalNearbyList() {
    final int outBoundDepartureLength = responseMainData?.defaultFilterModel
            ?.outBoundInternationalDepartureNearbyAirports?.length ??
        0;
    if (outBoundDepartureLength > 1) {
      for (int index = 0;
          index <
              (responseMainData?.defaultFilterModel
                      ?.outBoundInternationalDepartureNearbyAirports?.length ??
                  0);
          index++) {
        final NearbyAirports? element = responseMainData?.defaultFilterModel
            ?.outBoundInternationalDepartureNearbyAirports?[index];
        if (element?.airportCode == oneWayFromCity) {
          final value = responseMainData
              ?.defaultFilterModel?.outBoundInternationalDepartureNearbyAirports
              ?.removeAt(index);
          debugPrint(value.toString());
        }
      }
    }

    final int outBoundArrivalLength = responseMainData?.defaultFilterModel
            ?.outBoundInternationalArrivalNearbyAirports?.length ??
        0;
    if (outBoundArrivalLength > 1) {
      for (int index = 0;
          index <
              (responseMainData?.defaultFilterModel
                      ?.outBoundInternationalArrivalNearbyAirports?.length ??
                  0);
          index++) {
        final NearbyAirports? element = responseMainData?.defaultFilterModel
            ?.outBoundInternationalArrivalNearbyAirports?[index];
        if (element?.airportCode == oneWayToCity) {
          final value = responseMainData
              ?.defaultFilterModel?.outBoundInternationalArrivalNearbyAirports
              ?.removeAt(index);
          debugPrint(value.toString());
        }
      }
    }

    final int inBoundDepartureLength = responseMainData?.defaultFilterModel
            ?.inBoundInternationalDepartureNearbyAirports?.length ??
        0;
    if (inBoundDepartureLength > 1) {
      for (int index = 0;
          index <
              (responseMainData?.defaultFilterModel
                      ?.inBoundInternationalDepartureNearbyAirports?.length ??
                  0);
          index++) {
        final NearbyAirports? element = responseMainData?.defaultFilterModel
            ?.inBoundInternationalDepartureNearbyAirports?[index];
        if (element?.airportCode == roundTripFromCity) {
          final value = responseMainData
              ?.defaultFilterModel?.inBoundInternationalDepartureNearbyAirports
              ?.removeAt(index);
          debugPrint(value.toString());
        }
      }
    }
    final int inBoundArrivalLength = responseMainData?.defaultFilterModel
            ?.inBoundInternationalArrivalNearbyAirports?.length ??
        0;
    if (inBoundArrivalLength > 1) {
      for (int index = 0;
          index <
              (responseMainData?.defaultFilterModel
                      ?.inBoundInternationalArrivalNearbyAirports?.length ??
                  0);
          index++) {
        final NearbyAirports? element = responseMainData?.defaultFilterModel
            ?.inBoundInternationalArrivalNearbyAirports?[index];
        if (element?.airportCode == oneWayToCity) {
          final value = responseMainData
              ?.defaultFilterModel?.inBoundInternationalArrivalNearbyAirports
              ?.removeAt(index);
          debugPrint(value.toString());
        }
      }
    }
  }

  ///It will update airport list data of ADResponseState
  void _updateFareCalendarState(ADResponseState response) {
    fareCalendarDisplayModel =
        FareCalendarDisplayModel.fromFareCalenderResponse(response.data);
    flightFareCalendarState = response;
    notifyListeners();
  }

  /// Used to update prices on date header on SRP
  /// according to the listing of flights
  void updateFareCalendarStateWithSRP({
    required DateTime selectedDate,
    required double newMinimumPrice,
  }) {
    final formattedDateKey = FormattedDate.getFormattedStringFromDate(
      selectedDate,
      Constant.dateFormat5,
    );
    final oldColoredPriceObject =
        ColoredPrice(price: newMinimumPrice, color: Colors.black);
    fareCalendarDisplayModel?.coloredPriceMap[formattedDateKey] =
        oldColoredPriceObject;
    notifyListeners();
  }

  ///It will update airport list data of ADResponseState
  void _updateLoadingState() {
    flightListingState = ADResponseState.loading();
    notifyListeners();
  }

  ///It will update fare calendar list data of ADResponseState
  void _updateFareCalendarLoadingState() {
    flightFareCalendarState = ADResponseState.loading();
    notifyListeners();
  }

  /// Outbound flight listing sort
  /// This function takes 2 millisecond for perform operation all filter
  void filterOutboundFlight(
    FilterSortModel? newFilter,
    status,
  ) {
    final List<FlightsDisplayModel> outBoundFlightListing =
        responseMainData?.outBoundFlightListing ?? [];
    final List<FlightsDisplayModel> outBoundFilteredListing = [];

    if (newFilter != null && newFilter.changeCode.isNotEmpty) {
      bool hasValue = true;
      final int listLength = outBoundFlightListing.length;
      for (int index = 0; index < listLength; index++) {
        final element = outBoundFlightListing[index];

        if (hasValue && newFilter.outBoundAirline.changeCode != '') {
          if (newFilter.outBoundAirline.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                element.flightFilterInfo.airLineCode.toString().toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundFilterPrice.selectedPrice != 0) {
          if ((element.flightFilterInfo.unitPrice >=
                  newFilter.outBoundFilterPrice.minPrice) &&
              (element.flightFilterInfo.unitPrice <=
                  newFilter.outBoundFilterPrice.selectedPrice)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundStops.changeCode != '') {
          if (newFilter.outBoundStops.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(element.flightFilterInfo.stopType.toLowerCase())) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundDepartureTimes.changeCode != '') {
          if (newFilter.outBoundDepartureTimes.selectedFilterType
              .contains(element.flightFilterInfo.departureTimeType)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundArrivalTimes.changeCode != '') {
          if (newFilter.outBoundArrivalTimes.selectedFilterType
              .contains(element.flightFilterInfo.arrivalTimeType)) {
            hasValue = true;
          } else {
            continue;
          }
        }
        if (hasValue &&
            newFilter.outBoundArrivalFilterNearbyModel.changeCode != '') {
          if (newFilter.outBoundArrivalFilterNearbyModel.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                element.flightFareInfo.arrivalCity.toString().toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }
        if (hasValue &&
            newFilter.outBoundDepartureFilterNearbyModel.changeCode != '') {
          if (newFilter.outBoundDepartureFilterNearbyModel.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                element.flightFareInfo.departureCity.toString().toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }
        outBoundFilteredListing.add(element);
      }
    }
    listItemSelector = false;
    if (outBoundFilteredListing.isEmpty) {
      isFilterApplied = true;
    }
    final FlightListModel data =
        FlightListModel(outBoundFlightListing: outBoundFilteredListing);
    flightListingState = ADResponseState.completed(data);

    if (newFilter != null && newFilter.sortChangeCode.isNotEmpty) {
      sortFilter(newFilter.outBoundFilterAllSortModel, false);
    }
    if (status) {
      notifyListeners();
    } else {
      filterInboundFlight(newFilter, outBoundFilteredListing);
    }
  }

  /// Outbound International flight listing sort
  /// This function takes 2 millisecond for perform operation all filter
  void internationalFilterOutboundFlight(
    FilterSortModel? newFilter,
  ) {
    final List<FlightsDisplayModel> outBoundFlightListing =
        responseMainData?.internationalFlightListing ?? [];
    final List<FlightsDisplayModel> outBoundFilteredListing = [];

    if (newFilter != null &&
        newFilter.outBoundInternationalFilterApply.isNotEmpty) {
      bool hasValue = true;
      final int listLength = outBoundFlightListing.length;
      for (int index = 0; index < listLength; index++) {
        final element = outBoundFlightListing[index];

        if (hasValue && newFilter.outBoundAirline.changeCode != '') {
          if (newFilter.outBoundAirline.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                element.flightFilterInfo.airLineCode.toString().toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundFilterPrice.selectedPrice != 0) {
          if ((element.flightFilterInfo.unitPrice >=
                  newFilter.outBoundFilterPrice.minPrice) &&
              (element.flightFilterInfo.unitPrice <=
                  newFilter.outBoundFilterPrice.selectedPrice)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundStops.changeCode != '') {
          if (newFilter.outBoundStops.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(element.flightFilterInfo.stopType.toLowerCase())) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundDepartureTimes.changeCode != '') {
          if (newFilter.outBoundDepartureTimes.selectedFilterType
              .contains(element.flightFilterInfo.departureTimeType)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.outBoundArrivalTimes.changeCode != '') {
          if (newFilter.outBoundArrivalTimes.selectedFilterType
              .contains(element.flightFilterInfo.arrivalTimeType)) {
            hasValue = true;
          } else {
            continue;
          }
        }
        if (hasValue &&
            newFilter.outBoundArrivalFilterNearbyModel.changeCode != '') {
          if (newFilter.outBoundArrivalFilterNearbyModel.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                (element
                            .pricedItinerary
                            .airItinerary
                            ?.originDestinationOption
                            ?.first
                            .flightSegment
                            ?.last
                            .arrivalAirport
                            ?.locationCode ??
                        '')
                    .toString()
                    .toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue &&
            newFilter.outBoundDepartureFilterNearbyModel.changeCode != '') {
          if (newFilter.outBoundDepartureFilterNearbyModel.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                (element
                            .pricedItinerary
                            .airItinerary
                            ?.originDestinationOption
                            ?.first
                            .flightSegment
                            ?.first
                            .departureAirport
                            ?.locationCode ??
                        '')
                    .toString()
                    .toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        outBoundFilteredListing.add(element);
      }
    }

    listItemSelector = false;
    if (outBoundFilteredListing.isEmpty) {
      isFilterApplied = true;
    }
    final FlightListModelMappingHelper flightListModelMappingHelper =
        FlightListModelMappingHelper();
    final outBoundFilteredGroupedListing = flightListModelMappingHelper
        .groupFilteredInterNationalFlights(outBoundFilteredListing);
    final FlightListModel data = FlightListModel(
      internationalFlightListingWithGroup: outBoundFilteredGroupedListing,
    );
    flightListingState = ADResponseState.completed(data);

    if (newFilter != null && newFilter.sortChangeCode.isNotEmpty) {
      sortFilter(newFilter.outBoundFilterAllSortModel, false);
    }
    if (newFilter?.inBoundInternationalFilterApply == '') {
      notifyListeners();
    } else {
      if (newFilter?.inBoundInternationalFilterApply != '' &&
          newFilter?.outBoundInternationalFilterApply == '') {
        outBoundFilteredListing
            .addAll(responseMainData?.internationalFlightListing ?? []);
      }

      internationalFilterInboundFlight(newFilter, outBoundFilteredListing);
    }
  }

  void internationalFilterInboundFlight(
    FilterSortModel? newFilter,
    List<FlightsDisplayModel> outBoundFilteredListing,
  ) {
    final List<FlightsDisplayModel> inBoundFilteredListing = [];

    if (newFilter != null && newFilter.changeCode.isNotEmpty) {
      bool hasValue = true;
      final int listLength = outBoundFilteredListing.length;
      for (int index = 0; index < listLength; index++) {
        final element = outBoundFilteredListing[index];

        if (hasValue && newFilter.inBoundAirline.changeCode != '') {
          if (newFilter.inBoundAirline.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                (element.internationReturnFilterInfo?.airLineCode ?? '')
                    .toString()
                    .toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundStops.changeCode != '') {
          if (newFilter.inBoundStops.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                (element.internationReturnFilterInfo?.stopType ?? '')
                    .toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundDepartureTimes.changeCode != '') {
          if (newFilter.inBoundDepartureTimes.selectedFilterType.contains(
            element.internationReturnFilterInfo?.departureTimeType,
          )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundArrivalTimes.changeCode != '') {
          if (newFilter.inBoundArrivalTimes.selectedFilterType
              .contains(element.internationReturnFilterInfo?.arrivalTimeType)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundFilterPrice.selectedPrice != 0) {
          if ((element.flightFilterInfo.unitPrice >=
                  newFilter.inBoundFilterPrice.minPrice) &&
              (element.flightFilterInfo.unitPrice <=
                  newFilter.inBoundFilterPrice.selectedPrice)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue &&
            newFilter.inBoundArrivalFilterNearbyModel.changeCode != '') {
          if (newFilter.inBoundArrivalFilterNearbyModel.selectedFilterType
              .contains(
            (element.pricedItinerary.airItinerary?.originDestinationOption?[1]
                        .flightSegment?.last.arrivalAirport?.locationCode ??
                    '')
                .toString(),
          )) {
            hasValue = true;
          } else {
            continue;
          }
        }
        if (hasValue &&
            newFilter.inBoundDepartureFilterNearbyModel.changeCode != '') {
          if (newFilter.inBoundDepartureFilterNearbyModel.selectedFilterType
              .contains(
            (element.pricedItinerary.airItinerary?.originDestinationOption?[1]
                        .flightSegment?.first.departureAirport?.locationCode ??
                    '')
                .toString(),
          )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        inBoundFilteredListing.add(element);
      }
    }
    listItemSelector = false;
    if (inBoundFilteredListing.isEmpty) {
      isFilterApplied = true;
    }

    if (newFilter != null && newFilter.sortChangeCode.isNotEmpty) {
      sortFilter(newFilter.inBoundFilterAllSortModel, true);
    }

    final FlightListModelMappingHelper flightListModelMappingHelper =
        FlightListModelMappingHelper();
    final inBoundFilteredGroupedListing = flightListModelMappingHelper
        .groupFilteredInterNationalFlights(inBoundFilteredListing);

    final FlightListModel data1 = FlightListModel(
      internationalFlightListingWithGroup: inBoundFilteredGroupedListing,
    );

    flightListingState = ADResponseState.completed(data1);
    notifyListeners();
  }

  /// This function decide apply and reset filter based in hashcode changes
  void applyFilter(
    FilterSortStateModel? filterSortStateModel,
  ) {
    isResetApply = false;
    flightListingState = ADResponseState.init();
    notifyListeners();

    if (filterSortStateModel != null && filterSortStateModel.hasAnyChange) {
      final List<FlightsDisplayModel> outBoundFlightListing =
          responseMainData?.outBoundFlightListing ?? [];

      final List<FlightsDisplayModel> inBoundFlightListing =
          responseMainData?.inBoundFlightListing ?? [];

      if (outBoundFlightListing.isNotEmpty && inBoundFlightListing.isEmpty) {
        filterOutboundFlight(
          filterSortStateModel.newFilter,
          true,
        );
      } else {
        filterOutboundFlight(
          filterSortStateModel.newFilter,
          false,
        );
      }
    } else {
      setDefaultFilter(responseMainData);

      restAllFilterValue();
      flightListingState = ADResponseState.completed(responseMainData);
      if (filterSortStateModel != null &&
          filterSortStateModel
              .newFilter.outBoundFilterAllSortModel.changeCode.isNotEmpty) {
        sortFilter(
          filterSortStateModel.newFilter.outBoundFilterAllSortModel,
          false,
        );
      }
      if (filterSortStateModel != null &&
          filterSortStateModel
              .newFilter.inBoundFilterAllSortModel.changeCode.isNotEmpty) {
        sortFilter(
          filterSortStateModel.newFilter.inBoundFilterAllSortModel,
          true,
        );
      }
    }
  }

  void applyInternationalFilter(
    FilterSortStateModel? filterSortStateModel,
  ) {
    isResetApply = false;
    flightListingState = ADResponseState.init();
    notifyListeners();

    if (filterSortStateModel != null && filterSortStateModel.hasAnyChange) {
      final List<FlightsDisplayModel> outBoundFlightListing =
          responseMainData?.internationalFlightListing ?? [];

      if (outBoundFlightListing.isNotEmpty) {
        internationalFilterOutboundFlight(
          filterSortStateModel.newFilter,
        );
      }
    } else {
      setDefaultFilter(responseMainData);

      restAllFilterValue();
      flightListingState = ADResponseState.completed(responseMainData);
      if (filterSortStateModel != null &&
          filterSortStateModel
              .newFilter.outBoundFilterAllSortModel.changeCode.isNotEmpty) {
        sortFilter(
          filterSortStateModel.newFilter.outBoundFilterAllSortModel,
          false,
        );
      }
      if (filterSortStateModel != null &&
          filterSortStateModel
              .newFilter.inBoundFilterAllSortModel.changeCode.isNotEmpty) {
        sortFilter(
          filterSortStateModel.newFilter.inBoundFilterAllSortModel,
          true,
        );
      }
    }
  }

  void resetFilter() {
    isResetApply = true;
    setDefaultFilter(responseMainData);
    restAllFilterValue();
    flightListingState = ADResponseState.completed(responseMainData);
  }

  /// Reset all sorting default value
  void restAllFilterValue() {
    outBoundPriceSortType = SortType.asc;
    outBoundDurationSortType = SortType.des;
    outBoundTimeSortType = SortType.des;
    inBoundPriceSortType = SortType.asc;
    inBoundDurationSortType = SortType.des;
    inBoundTimeSortType = SortType.des;
    outBoundSelectedFilterButtonType = FlightSort.byPrice;
    inBoundSelectedFilterButtonType = FlightSort.byPrice;
  }

  /// InBound Flight list sort
  /// This function takes 5 millisecond for perform operation all filter including Outbound and Inbound
  /// Individual this function takes 2 millisecond for perform all inbound filter operation
  void filterInboundFlight(
    FilterSortModel? newFilter,
    List<FlightsDisplayModel> outBoundFilteredListing,
  ) {
    final List<FlightsDisplayModel> inBoundFlightListing =
        responseMainData?.inBoundFlightListing ?? [];
    final List<FlightsDisplayModel> inBoundFilteredListing = [];

    if (newFilter != null && newFilter.changeCode.isNotEmpty) {
      bool hasValue = true;
      final int listLength = inBoundFlightListing.length;
      for (int index = 0; index < listLength; index++) {
        final element = inBoundFlightListing[index];

        if (hasValue && newFilter.inBoundAirline.changeCode != '') {
          if (newFilter.inBoundAirline.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(
                element.flightFilterInfo.airLineCode.toString().toLowerCase(),
              )) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundStops.changeCode != '') {
          if (newFilter.inBoundStops.selectedFilterType
              .toString()
              .toLowerCase()
              .contains(element.flightFilterInfo.stopType.toLowerCase())) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundDepartureTimes.changeCode != '') {
          if (newFilter.inBoundDepartureTimes.selectedFilterType
              .contains(element.flightFilterInfo.departureTimeType)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundArrivalTimes.changeCode != '') {
          if (newFilter.inBoundArrivalTimes.selectedFilterType
              .contains(element.flightFilterInfo.arrivalTimeType)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        if (hasValue && newFilter.inBoundFilterPrice.selectedPrice != 0) {
          if ((element.flightFilterInfo.unitPrice >=
                  newFilter.inBoundFilterPrice.minPrice) &&
              (element.flightFilterInfo.unitPrice <=
                  newFilter.inBoundFilterPrice.selectedPrice)) {
            hasValue = true;
          } else {
            continue;
          }
        }

        inBoundFilteredListing.add(element);
      }
    }
    listItemSelector = false;
    if (inBoundFilteredListing.isEmpty) {
      isFilterApplied = true;
    }
    final FlightListModel data =
        FlightListModel(inBoundFlightListing: inBoundFilteredListing);
    flightListingState = ADResponseState.completed(data);

    if (newFilter != null && newFilter.sortChangeCode.isNotEmpty) {
      sortFilter(newFilter.inBoundFilterAllSortModel, true);
    }

    final FlightListModel data1 = FlightListModel(
      outBoundFlightListing: outBoundFilteredListing,
      inBoundFlightListing: inBoundFilteredListing,
    );

    flightListingState = ADResponseState.completed(data1);
    notifyListeners();
  }

  /// This function is use to Sort List and identify from where Sort click whether from Flight listing screen of from filter.
  void sortClicked({
    required FlightSort sortButtonType,
    FlightSort inBoundFilterButtonType = FlightSort.byPrice,
    bool isTypeReturn = false,
    required bool filterClick,
  }) {
    if (!isTypeReturn) {
      outBoundFilterSort(filterClick, sortButtonType);
    }
    if (isTypeReturn) {
      inBoundFilterSort(filterClick, sortButtonType);
    }
    switch (isTypeReturn ? inBoundFilterButtonType : sortButtonType) {
      case FlightSort.byPrice:
        sortFlight(
          flightSort: FlightSort.byPrice,
          sortType: isTypeReturn ? inBoundPriceSortType : outBoundPriceSortType,
          isTypeReturn: isTypeReturn,
        );
        break;
      case FlightSort.byDuration:
        sortFlight(
          flightSort: FlightSort.byDuration,
          sortType:
              isTypeReturn ? inBoundDurationSortType : outBoundDurationSortType,
          isTypeReturn: isTypeReturn,
        );
        break;
      case FlightSort.byTime:
        sortFlight(
          flightSort: FlightSort.byTime,
          sortType: isTypeReturn ? inBoundTimeSortType : outBoundTimeSortType,
          isTypeReturn: isTypeReturn,
        );
        break;
    }
    flightListingState = ADResponseState.completed(flightListingState.data);
    notifyListeners();
  }

  /// Inbound flight sorting and update Filter list model as well
  void inBoundFilterSort(filterClick, FlightSort sortButtonType) {
    if (filterClick) {
      for (int inBoundIndex = 0;
          inBoundIndex <
              filterSortModel.inBoundFilterAllSortModel.priceSort.length;
          inBoundIndex++) {
        final element =
            filterSortModel.inBoundFilterAllSortModel.priceSort[inBoundIndex];
        if (element.isSelected) {
          if (element.flightSort == FlightSort.byPrice) {
            inBoundSelectedFilterButtonType = element.flightSort;
            inBoundPriceSortType = element.sortType;
          } else if (element.flightSort == FlightSort.byDuration) {
            inBoundSelectedFilterButtonType = element.flightSort;
            inBoundDurationSortType = element.sortType;
          } else if (element.flightSort == FlightSort.byTime) {
            inBoundSelectedFilterButtonType = element.flightSort;
            inBoundTimeSortType = element.sortType;
          }
        }
      }
    } else {
      inBoundPriceSortType =
          inBoundPriceSortType == SortType.asc ? SortType.des : SortType.asc;
      inBoundDurationSortType =
          inBoundDurationSortType == SortType.asc ? SortType.des : SortType.asc;
      inBoundTimeSortType =
          inBoundTimeSortType == SortType.asc ? SortType.des : SortType.asc;
      inBoundSelectedFilterButtonType = sortButtonType;

      for (int inBoundIndex = 0;
          inBoundIndex <
              filterSortModel.inBoundFilterAllSortModel.priceSort.length;
          inBoundIndex++) {
        final element =
            filterSortModel.inBoundFilterAllSortModel.priceSort[inBoundIndex];

        if (element.flightSort == inBoundSelectedFilterButtonType) {
          if (element.flightSort == FlightSort.byPrice) {
            element.isSelected = element.sortType == inBoundPriceSortType;
          }
          if (element.flightSort == FlightSort.byTime) {
            element.isSelected = element.sortType == inBoundTimeSortType;
          }
          if (element.flightSort == FlightSort.byDuration) {
            element.isSelected = element.sortType == inBoundDurationSortType;
          }
        } else {
          element.isSelected = false;
        }
      }
    }
  }

  /// Outbound flight sorting and update Filter list model as well

  void outBoundFilterSort(filterClick, FlightSort sortButtonType) {
    if (filterClick) {
      for (int outBoundIndex = 0;
          outBoundIndex <
              filterSortModel.outBoundFilterAllSortModel.priceSort.length;
          outBoundIndex++) {
        final element =
            filterSortModel.outBoundFilterAllSortModel.priceSort[outBoundIndex];
        if (element.isSelected) {
          if (element.flightSort == FlightSort.byPrice) {
            outBoundSelectedFilterButtonType = element.flightSort;
            outBoundPriceSortType = element.sortType;
          } else if (element.flightSort == FlightSort.byDuration) {
            outBoundSelectedFilterButtonType = element.flightSort;
            outBoundDurationSortType = element.sortType;
          } else if (element.flightSort == FlightSort.byTime) {
            outBoundSelectedFilterButtonType = element.flightSort;
            outBoundTimeSortType = element.sortType;
          }
        }
      }
    } else {
      outBoundPriceSortType =
          outBoundPriceSortType == SortType.asc ? SortType.des : SortType.asc;
      outBoundDurationSortType = outBoundDurationSortType == SortType.asc
          ? SortType.des
          : SortType.asc;
      outBoundTimeSortType =
          outBoundTimeSortType == SortType.asc ? SortType.des : SortType.asc;
      outBoundSelectedFilterButtonType = sortButtonType;

      for (int outBoundIndex = 0;
          outBoundIndex <
              filterSortModel.outBoundFilterAllSortModel.priceSort.length;
          outBoundIndex++) {
        final element =
            filterSortModel.outBoundFilterAllSortModel.priceSort[outBoundIndex];

        if (element.flightSort == outBoundSelectedFilterButtonType) {
          if (element.flightSort == FlightSort.byPrice) {
            element.isSelected = element.sortType == outBoundPriceSortType;
          }
          if (element.flightSort == FlightSort.byTime) {
            element.isSelected = element.sortType == outBoundTimeSortType;
          }
          if (element.flightSort == FlightSort.byDuration) {
            element.isSelected = element.sortType == outBoundDurationSortType;
          }
        } else {
          element.isSelected = false;
        }
      }
    }
  }

  /// Set Default value to filter Like:- Flight count, min max price
  void setDefaultFilter(FlightListModel? responseMainData) {
    if (sectorId == 'D') {
      final int outBoundLength =
          responseMainData?.outBoundFlightListing?.length ?? 0;
      final int inBoundLength =
          responseMainData?.inBoundFlightListing?.length ?? 0;
      if (outBoundLength != 0) {
        outBoundFilterPrice = FilterPrice(
          minPrice: outBoundMinPrice,
          maxPrice: outBoundMaxPrice,
          selectedPrice: 0,
          changeCode: '',
          filterCount: 0,
        );
      }
      if (inBoundLength != 0) {
        inBoundFilterPrice = FilterPrice(
          minPrice: inBoundMinPrice,
          maxPrice: inBoundMaxPrice,
          selectedPrice: 0,
          changeCode: '',
          filterCount: 0,
        );
      }
    } else {
      outBoundFilterPrice = FilterPrice(
        minPrice: outBoundMinPrice,
        maxPrice: outBoundMaxPrice,
        selectedPrice: 0,
        changeCode: '',
        filterCount: 0,
      );
      inBoundFilterPrice = FilterPrice(
        minPrice: inBoundMinPrice,
        maxPrice: inBoundMaxPrice,
        selectedPrice: 0,
        changeCode: '',
        filterCount: 0,
      );
    }

    responseMainData?.defaultFilterModel?.departureFilterPrice =
        outBoundFilterPrice;
    responseMainData?.defaultFilterModel?.arrivalFilterPrice =
        inBoundFilterPrice;
    final int inBoundAirlineLength =
        responseMainData?.defaultFilterModel?.inBoundFilterOptions?.length ?? 0;
    for (int index = 0; index < inBoundAirlineLength; index++) {
      responseMainData
          ?.defaultFilterModel?.inBoundFilterOptions?[index].isSelected = false;
    }
    final int outBoundAirlineLength =
        responseMainData?.defaultFilterModel?.outBoundFilterOptions?.length ??
            0;
    for (int index = 0; index < outBoundAirlineLength; index++) {
      responseMainData?.defaultFilterModel?.outBoundFilterOptions?[index]
          .isSelected = false;
    }
    filterSortModel =
        FilterSortModel.defaultFilterSort(responseMainData?.defaultFilterModel);
  }

  /// Sorting mechanism
  void sortFilter(FilterAllSortModel? filterModel, returnType) {
    final int length = filterModel?.priceSort.length ?? 0;
    for (int index = 0; index < length; index++) {
      final element = filterModel?.priceSort[index];
      if (element?.isSelected ?? false) {
        if (element != null) {
          sortClicked(
            sortButtonType: element.flightSort,
            inBoundFilterButtonType: element.flightSort,
            isTypeReturn: returnType,
            filterClick: true,
          );
        }
      }
    }
    notifyListeners();
  }
}
