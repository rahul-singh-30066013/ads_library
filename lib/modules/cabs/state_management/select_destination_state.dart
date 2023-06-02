/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';

import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_address_details_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/select_destination_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/search_results_enum.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class SelectDestinationState extends BaseViewModel {
  final CabsBookingRepository cabsBookingRepository = CabsBookingRepository();
  SelectDestinationNavigateModel? selectDestinationNavigateModel;

  ///It will  show data after filter and before filter data
  List<AirportTerminalDetailModel> airportDetailModel = [];

  ScrollController airportTextFieldScrollController = ScrollController();

  ScrollController otherLocationsTextFieldScrollController = ScrollController();

  ///It remain same to store data of airportList
  List<AirportTerminalDetailModel> airportDetailModelUnFilteredList = [];
  bool fetchingGooglePlaces = false;

  void updateListOnFocusChange() {
    notifyListeners();
  }

  void updateSelectedAirportTerminalDetailModel(
    AirportTerminalDetailModel? airportTerminalDetailModel,
  ) {
    _selectedAirportTerminalDetailModel = airportTerminalDetailModel;
    airportController.text =
        selectedAirportTerminalDetailModel?.airportAddressDescription ?? '';
    notifyListeners();
  }

  String? searchText = '';
  List<SearchAddressModel> filteredDestinationsList = [];

  AddressDetailModel? selectedAddressDetailModel;

  ///It will use to set Selected Location model
  AirportTerminalDetailModel? _selectedAirportTerminalDetailModel;

  AirportTerminalDetailModel? get selectedAirportTerminalDetailModel =>
      _selectedAirportTerminalDetailModel;

  /// Location Api Functionality

  final minimumCharacterCountForSearchQuery = 3;
  final maxRecentSearch = 10;

  List<SearchAddressModel> recentDestinationsList = [];

  String? searchQuery;

  SearchResultsEnum headerWidget = SearchResultsEnum.recentSearches;

  FocusNode sourceFocusNode = FocusNode();
  FocusNode focusNodeDestination = FocusNode();

  TextEditingController airportController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  void getRecentSearches() {
    ProfileSingleton.profileSingleton
        .readDataModelFromSharedPreferences(
          SharedPrefUtilsKeys.recentAddresses,
        )
        .then(
          (recentAddresses) => handleData(recentAddresses),
        );
  }

  void handleData(String recentAddresses) {
    if (!recentAddresses.isNullOrEmpty) {
      recentDestinationsList.clear();
      for (final Map<String, dynamic> result in json.decode(recentAddresses)) {
        recentDestinationsList.add(SearchAddressModel.fromJson(result));
      }
    }
    headerWidget = SearchResultsEnum.recentSearches;
    filteredDestinationsList
      ..clear()
      ..addAll(recentDestinationsList);
    notifyListeners();
  }

  Future<void> setRecentSearches(SearchAddressModel data) async {
    recentDestinationsList
      ..removeWhere((tempData) => tempData.placeId == data.placeId)
      ..insert(0, data);
    if (recentDestinationsList.length >= maxRecentSearch) {
      adLog('${recentDestinationsList.removeLast().toString()} removed');
    }
    final bool recentAddressesSaved = await ProfileSingleton.profileSingleton
        .writeDataModelToSharedPreferences(
      SharedPrefUtilsKeys.recentAddresses,
      recentDestinationsList,
    );
    adLog('recentAddressesSaved $recentAddressesSaved');
  }

  Timer? _debounce;

  void updateDestinationsSearchQuery({
    required String queryInput,
  }) {
    if (queryInput.isNotEmpty) {
      if (queryInput.length >= minimumCharacterCountForSearchQuery) {
        searchQuery = queryInput;
        headerWidget = SearchResultsEnum.loading;
        notifyListeners();
        if (_debounce?.isActive ?? false) {
          _debounce?.cancel();
        }
        _debounce = Timer(
          const Duration(seconds: 1),
          () => {
            cabsBookingRepository
                .fetchGoogleAddressSearchData(
              query: queryInput,
              selectedAirportTerminalDetailModel:
                  selectedAirportTerminalDetailModel,
            )
                .then(
              (value) {
                if (searchQuery?.isNotEmpty ?? false) {
                  if (queryInput.length >=
                      minimumCharacterCountForSearchQuery) {
                    if (value.viewStatus == Status.complete) {
                      filteredDestinationsList
                        ..clear()
                        ..addAll(value.data);
                      headerWidget = filteredDestinationsList.isEmpty
                          ? SearchResultsEnum.noResult
                          : SearchResultsEnum.result;
                    } else {
                      filteredDestinationsList.clear();
                      headerWidget = SearchResultsEnum.noResult;
                    }
                  } else {
                    filteredDestinationsList.clear();
                    headerWidget = SearchResultsEnum.minimumCharCount;
                  }
                } else {
                  filteredDestinationsList
                    ..clear()
                    ..addAll(recentDestinationsList);
                  headerWidget = SearchResultsEnum.recentSearches;
                }
                notifyListeners();
              },
            ),
          },
        );
      } else {
        if (recentDestinationsList.isNotEmpty) {
          headerWidget = SearchResultsEnum.recentSearches;
          filteredDestinationsList
            ..clear()
            ..addAll(
              recentDestinationsList.where(
                (address) {
                  return (address.structuredFormatting?.mainText ?? '')
                          .validateWithDefaultValue()
                          .toLowerCase()
                          .replaceAll(' ', '')
                          .contains(
                            queryInput.replaceAll(' ', '').toLowerCase(),
                          ) ||
                      (address.structuredFormatting?.secondaryText ?? '')
                          .validateWithDefaultValue()
                          .toLowerCase()
                          .replaceAll(' ', '')
                          .contains(
                            queryInput.replaceAll(' ', '').toLowerCase(),
                          );
                },
              ).toList(),
            );
          if (filteredDestinationsList.isEmpty) {
            headerWidget = SearchResultsEnum.minimumCharCount;
          }
        } else {
          filteredDestinationsList.clear();
          headerWidget = SearchResultsEnum.minimumCharCount;
        }
      }
    } else {
      filteredDestinationsList
        ..clear()
        ..addAll(recentDestinationsList);
      headerWidget = SearchResultsEnum.recentSearches;
    }
    notifyListeners();
  }

  void resetSearchQuery({isTextControllerAirport}) {
    searchQuery = '';
    if (isTextControllerAirport) {
      airportController.clear();
      selectDestinationNavigateModel?.airportTerminalDetailModel =
          AirportTerminalDetailModel();
      airportDetailModel = airportDetailModelUnFilteredList;
    } else {
      destinationController.clear();
      selectDestinationNavigateModel?.selectedLocationDetailModel =
          SearchAddressModel();
    }
    headerWidget = SearchResultsEnum.recentSearches;
    filteredDestinationsList
      ..clear()
      ..addAll(recentDestinationsList);
    notifyListeners();
  }

  AirportTerminalDetailModel? _selectedAirportTerminalDetailModels;

  AirportTerminalDetailModel? get selectedAirportTerminalDetailModels =>
      _selectedAirportTerminalDetailModels;

  List<AirportTerminalDetailModel> recentAirportsList = [];

  void getAirportsRecentSearches() {
    ProfileSingleton.profileSingleton
        .readDataModelFromSharedPreferences(
          SharedPrefUtilsKeys.recentAirports,
        )
        .then(
          (recentAirports) => handleAirportsRecentSearches(recentAirports),
        );
  }

  void handleAirportsRecentSearches(String recentAirports) {
    if (!recentAirports.isNullOrEmpty) {
      recentAirportsList.clear();
      for (final Map<String, dynamic> result in json.decode(recentAirports)) {
        recentAirportsList.add(AirportTerminalDetailModel.fromJson(result));
      }
    }
    notifyListeners();
  }

  Future<void> setAirportsRecentSearches(
    AirportTerminalDetailModel data,
  ) async {
    recentAirportsList
      ..removeWhere(
        (tempData) =>
            tempData.airportAddressDescription ==
            data.airportAddressDescription,
      )
      ..insert(0, data);
    if (recentAirportsList.length >= maxRecentSearch) {
      adLog('${recentAirportsList.removeLast().toString()} removed');
    }
    final bool recentAirportsSaved = await ProfileSingleton.profileSingleton
        .writeDataModelToSharedPreferences(
      SharedPrefUtilsKeys.recentAirports,
      recentAirportsList,
    );
    adLog('recentAddressesSaved $recentAirportsSaved');
  }

  void updateSelectedAirportTerminalDetailModels(
    AirportTerminalDetailModel? airportTerminalDetailModel,
  ) {
    _selectedAirportTerminalDetailModel = airportTerminalDetailModel;
    notifyListeners();
  }

  void updateAirportSearchQuery({
    required String text,
  }) {
    airportDetailModel = airportDetailModelUnFilteredList;
    airportDetailModel = airportDetailModel
        .where(
          (airport) =>
              airport.airportCode
                  .toString()
                  .replaceAll(' ', '')
                  .toUpperCase()
                  .contains(text.replaceAll(' ', '').toUpperCase()) ||
              airport.airportAddressDescription
                  .toString()
                  .replaceAll(' ', '')
                  .toUpperCase()
                  .contains(text.replaceAll(' ', '').toUpperCase()) ||
              airport.airportNameDescription
                  .toString()
                  .replaceAll(' ', '')
                  .toUpperCase()
                  .contains(text.replaceAll(' ', '').toUpperCase()) ||
              (airport.keywords ?? [])
                  .where(
                    (element) => element
                        .replaceAll(' ', '')
                        .toUpperCase()
                        .contains(text.replaceAll(' ', '').toUpperCase()),
                  )
                  .toList()
                  .isNotEmpty,
        )
        .toList();
    if (airportDetailModel.isEmpty) {
      CabGoogleAnalytics().sendGACabBookingAirportSearch(
        selectDestinationNavigateModel,
      );
    }
    notifyListeners();
  }
}
