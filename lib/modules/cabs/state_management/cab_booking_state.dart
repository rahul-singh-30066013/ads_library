/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/offers/repositories/offer_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

///It will use to show tool tip
ValueNotifier<bool> showToolTip = ValueNotifier(true);

class CabBookingState extends BaseViewModel {
  final CabsBookingRepository _cabBookingRepository = CabsBookingRepository();

  /// Initiate loading state for api hit
  ADResponseState cabHomeScreenResponseState = ADResponseState.loading();
  ADResponseState cabOffersResponseState = ADResponseState.loading();
  DateTime? selectedDate;
  SearchAddressModel? _selectedAddressDetailModel;

  SearchAddressModel? get selectedAddressDetailModel =>
      _selectedAddressDetailModel;
  bool isFromAirport = true;

  void updateLocation(SearchAddressModel? addressDetailModel) {
    if (addressDetailModel != null) {
      _selectedAddressDetailModel = addressDetailModel;
    }
    notifyListeners();
  }

  void updateScheduleTime(DateTime? timeWithDate) {
    selectedDate = (timeWithDate?.difference(DateTime.now()).isNegative ?? true)
        ? null
        : timeWithDate;
    notifyListeners();
  }

  Future<void> getCabLandingPageData() async {
    _updateLandingPageState(ADResponseState.loading());
    await _cabBookingRepository.fetchCabBookingLandingPageData(
      queryParams: {
        'item': SiteCoreApiUrls.siteCoreCabBookingLayoutAPI,
        'sc_lang': 'en',
        'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
        'application': 'app',
      },
    ).then((value) {
      _updateLandingPageState(value);
    });
  }

  void updateSelections(value) {
    isFromAirport = value;
    notifyListeners();
  }

  ///It will fetch grid offer data
  Future<ADResponseState> getCabOffers() async {
    final Map<String, String> queryParameters = {
      'language': 'en',
      'StoreType': '',
      'appType': 'app',
      'AirportCode': 'adani-one-airport',
    };

    final value = await OfferRepository().fetchOffers(
      queryParameters: queryParameters,
    );
    return value;
  }

  void _updateLandingPageState(ADResponseState response) {
    cabHomeScreenResponseState = response;
    notifyListeners();
  }

  ///It will use to set Selected Airport model
  AirportTerminalDetailModel? _selectedAirportTerminalDetailModel;

  AirportTerminalDetailModel? get selectedAirportTerminalDetailModel =>
      _selectedAirportTerminalDetailModel;

  void updateSelectedAirportTerminalDetailModel(
    AirportTerminalDetailModel? airportTerminalDetailModel,
  ) {
    _selectedAirportTerminalDetailModel = airportTerminalDetailModel;
    notifyListeners();
  }

  List<AirportTerminalDetailModel> airportUpdatedDetailedListForCab = [];

  Future<void> getAirportListForCabs(BuildContext context) async {
    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.airportListForCabBooking,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
    };
    final response = await _cabBookingRepository.fetchAirportListForCabs(
      queryParams,
    );

    if (response.viewStatus == Status.complete) {
      final AdaniAirportsElement? data = response.data;
      if (data?.fields?.listOfAirports?.isNotEmpty ?? false) {
        final List<AirportItemModel> airportsList =
            data?.fields?.listOfAirports ?? [];
        for (final AirportItemModel airportItemModel in airportsList) {
          if (airportItemModel.isCabEnabled ?? false) {
            if (airportItemModel.terminalsList?.isEmpty ?? false) {
              airportUpdatedDetailedListForCab.add(
                AirportTerminalDetailModel(
                  airportName: airportItemModel.airportName ?? '',
                  airportCode: airportItemModel.airportCode ?? '',
                  airportCity: airportItemModel.city ?? '',
                  airportPrefixName: airportItemModel.airportPrefixName ?? '',
                  keywords: airportItemModel.keywords ?? [],
                  latitude: airportItemModel.latitude ?? '',
                  longitude: airportItemModel.longitude ?? '',
                  placeID: airportItemModel.placeID ?? '',
                  airportNameDescription: airportItemModel.details ?? '',
                  airportAddressDescription:
                      airportItemModel.airportAddress ?? '',
                ),
              );
              continue;
            }
            for (final Terminal terminal
                in airportItemModel.terminalsList ?? []) {
              if (terminal.isCabEnabled ?? false) {
                if (terminal.gates?.isEmpty ?? false) {
                  airportUpdatedDetailedListForCab.add(
                    AirportTerminalDetailModel(
                      airportName: airportItemModel.airportName ?? '',
                      airportCode: airportItemModel.airportCode ?? '',
                      airportCity: airportItemModel.city ?? '',
                      airportPrefixName:
                          airportItemModel.airportPrefixName ?? '',
                      keywords: airportItemModel.keywords ?? [],
                      terminalName: terminal.terminalName ?? '',
                      terminalCode: terminal.terminalCode ?? '',
                      latitude: terminal.latitude ?? '',
                      longitude: terminal.longitude ?? '',
                      placeID: terminal.placeID ?? '',
                      airportNameDescription:
                          terminal.terminalName?.trim().isNotEmpty ?? false
                              ? terminal.terminalName
                              : airportItemModel.details,
                      airportAddressDescription: terminal.terminalAddress ?? '',
                    ),
                  );
                  continue;
                }
                for (final Gate gate in terminal.gates ?? []) {
                  if (gate.isCabEnabled ?? false) {
                    airportUpdatedDetailedListForCab.add(
                      AirportTerminalDetailModel(
                        airportName: airportItemModel.airportName ?? '',
                        airportCode: airportItemModel.airportCode ?? '',
                        airportCity: airportItemModel.city ?? '',
                        airportPrefixName:
                            airportItemModel.airportPrefixName ?? '',
                        keywords: airportItemModel.keywords ?? [],
                        terminalName: terminal.terminalName ?? '',
                        terminalCode: terminal.terminalCode ?? '',
                        flightType: gate.gate ?? '',
                        latitude: gate.latitude ?? '',
                        longitude: gate.longitude ?? '',
                        placeID: gate.placeID ?? '',
                        airportNameDescription:
                            terminal.terminalName?.trim().isNotEmpty ?? false
                                ? terminal.terminalName
                                : airportItemModel.details,
                        airportAddressDescription: gate.pickupAddress ?? '',
                      ),
                    );
                  }
                }
              }
            }
          }
        }

        await checkLocationPermission(context);
        getSelectedAirport();
        await getCabLandingPageData();
      } else {
        _updateLandingPageState(
          ADResponseState.error(
            'Sorry, No data Found.',
          ),
        );
      }
    } else {
      _updateLandingPageState(
        ADResponseState.error(
          'Sorry, No data Found.',
        ),
      );
    }
  }

  ///It will use to get location
  Future<void> checkLocationPermission(BuildContext context) async {
    final LocationPermission permission = await Geolocator.checkPermission();
    await checkPermissionStatus(permission: permission, context: context);
  }

  Future<void> requestLocationPermission(BuildContext context) async {
    final LocationPermission requestPermission =
        await Geolocator.requestPermission();
    await checkPermissionStatus(
      isFromRequest: true,
      permission: requestPermission,
      context: context,
    );
  }

  Future<void> checkPermissionStatus({
    required LocationPermission permission,
    required BuildContext context,
    bool isFromRequest = false,
  }) async {
    switch (permission) {
      case LocationPermission.denied:
        if (!isFromRequest) {
          await requestLocationPermission(context);
        }
        /*else {
          getSelectedAirport();
        }*/
        break;
      case LocationPermission.deniedForever:
        //getSelectedAirport();
        break;
      case LocationPermission.whileInUse:
        // await getCurrentLocation();
        //getSelectedAirport();

        break;
      case LocationPermission.always:
        // await getCurrentLocation();
        //getSelectedAirport();

        break;
      case LocationPermission.unableToDetermine:
        //getSelectedAirport();
        break;
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final Position currentPosition = await Geolocator.getCurrentPosition();
      double? distanceInMeters;
      for (final AirportTerminalDetailModel? airportTerminalDetailModel
          in airportUpdatedDetailedListForCab) {
        final double newDistanceInMeters = Geolocator.distanceBetween(
          currentPosition.latitude,
          currentPosition.longitude,
          double.parse(
            (airportTerminalDetailModel?.latitude)?.isEmpty ?? false
                ? '0'
                : airportTerminalDetailModel?.latitude ?? '',
          ),
          double.parse(
            (airportTerminalDetailModel?.longitude)?.isEmpty ?? false
                ? '0'
                : airportTerminalDetailModel?.longitude ?? '',
          ),
        );
        if (newDistanceInMeters <= (distanceInMeters ?? newDistanceInMeters)) {
          distanceInMeters = newDistanceInMeters;
          _selectedAirportTerminalDetailModel = airportTerminalDetailModel;
        }
      }
      notifyListeners();
    } catch (e) {
      adLog(e.toString());
      getSelectedAirport();
    }
  }

  void getSelectedAirport() {
    if ((selectedAirportsData?.airportCode ?? '').isNotEmpty) {
      _selectedAirportTerminalDetailModel =
          airportUpdatedDetailedListForCab.firstWhereOrNull(
        (element) =>
            element.airportCode == (selectedAirportsData?.airportCode ?? ''),
      );
    }
    notifyListeners();
  }

  ///It will fetch  offer data
  Future<void> getAllOffers() async {
    final Map<String, String> queryParameters = {
      'language': 'en',
      'StoreType': '',
      'appType': 'app',
      'AirportCode': 'adani-one-airport',
      'LOB': 'cab-booking',
    };
    await OfferRepository()
        .fetchOffers(
          queryParameters: queryParameters,
        )
        .then((value) => _updateAllOffersState(value));
  }

  void _updateAllOffersState(ADResponseState response) {
    cabOffersResponseState = response;
    notifyListeners();
  }
}
