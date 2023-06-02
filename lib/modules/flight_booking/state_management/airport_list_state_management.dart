/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future;

import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/enums/home_identifier.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This ViewModel is used to request data from the [SiteCoreStateManagement] and
/// binds it with the corresponding view AirportListScreen.
class AirportListStateManagement extends ADBaseViewModel {
  final bool isLoggedIn;
  AirportItemModel? airportData = selectedAirportsData;

  /// Initiate loading state for api hit
  ADResponseState airportListState = ADResponseState.loading();

  AirportListStateManagement({required this.isLoggedIn, this.airportData});

  void updateData(AirportItemModel response, BuildContext context) {
    if (context.read<AppModelStateManagement>().homeIdentifier ==
        HomeIdentifier.dutyFreeHome) {
      BottomTabNavKeys.businessTabItemKey.currentState
          ?.popUntil((route) => route.isFirst);
    }
    airportData = response;
    notifyListeners();
  }

  ///It will provide airports list from api/json path
  Future<void> getAirportList(SiteCoreStateManagement read) async {
    await getAirportsItems(read).then((value) {
      _updateAirportListState(value);
    });
  }

  ///It will update airport list data of ADResponseState
  void _updateAirportListState(ADResponseState response) {
    airportListState = response;
    notifyListeners();
  }

  Future<ADResponseState> getAirportsItems(SiteCoreStateManagement read) async {
    try {
      final List<AirportItemModel> adaniAirportsList = read.adaniAirportsList;
      _updateAirportListState(ADResponseState.loading());
      return adaniAirportsList.isEmpty
          ? await read.fetchListAdaniAirports().then((value) => value)
          : ADResponseState.completed(adaniAirportsList);
    } catch (e) {
      return ADResponseState.error('Something went wrong', '');
    }
  }

  ///Return airport list where dutyfree service available
  static List<AirportItemModel> _parseListOfAirports(
    List<AirportItemModel> airportsList,
  ) {
    final List<AirportItemModel> selectedAirportsList =
        List.empty(growable: true);
    for (final airportItemModel in airportsList) {
      if (airportItemModel.terminalsList?.isNotEmpty ?? false) {
        final List<Terminal>? terminalList = airportItemModel.terminalsList
            ?.where((element) => element.dutyFreeAvailable == true)
            .toList();
        if (terminalList?.isNotEmpty ?? false) {
          selectedAirportsList.add(airportItemModel);
        }
      }
    }
    return selectedAirportsList;
  }

  ///Return airport list where cab service available
  static List<AirportItemModel> _parseCabListOfAirports(
    List<AirportItemModel> airportsList,
  ) {
    final List<AirportItemModel> selectedAirportsList =
        List.empty(growable: true);
    for (final airportItemModel in airportsList) {
      if (airportItemModel.isCabEnabled ?? false) {
        selectedAirportsList.add(airportItemModel);
      }
    }
    return selectedAirportsList;
  }

  ///Return airport list where Porter service available
  static List<AirportItemModel> _parsePranaamListOfAirports(
    List<AirportItemModel> airportsList,
  ) {
    final List<AirportItemModel> selectedAirportsList =
        List.empty(growable: true);
    // for (final airportItemModel in airportsList) {
    //   if (airportItemModel.city?.toLowerCase() != 'other') {
    //     selectedAirportsList.add(airportItemModel);
    //   }
    // }
    for (final airportItemModel in airportsList) {
      if (airportItemModel.city?.toLowerCase() != 'other') {
        if (airportItemModel.terminalsList?.isNotEmpty ?? false) {
          final List<Terminal>? terminalList = airportItemModel.terminalsList
              ?.where((element) => element.pranaamServiceAvailable == true)
              .toList();
          if (terminalList?.isNotEmpty ?? false) {
            selectedAirportsList.add(airportItemModel);
          }
        }
      }
    }
    return selectedAirportsList;
  }

  ///Return airport list where Porter service available
  static List<AirportItemModel> _parsePorterListOfAirports(
    List<AirportItemModel> airportsList,
  ) {
    final List<AirportItemModel> selectedAirportsList =
        List.empty(growable: true);
    for (final airportItemModel in airportsList) {
      if (airportItemModel.porterServiceAvailable ?? false) {
        selectedAirportsList.add(airportItemModel);
      }
    }
    return selectedAirportsList;
  }

  ///Return airport list based on lob type
  Future<List<AirportItemModel>> getAvailableAirportsBasedOnLob(
    List<AirportItemModel> airportsList,
    String? type,
  ) async {
    return type?.isNotEmpty ?? false
        ? await _parseListAirports(
            airportsList,
            ServicesEnum.values.byName(type?.toLowerCase() ?? 'flight'),
          )
        : airportsList;
  }

  Future<List<AirportItemModel>> _parseListAirports(
    List<AirportItemModel> airportList,
    ServicesEnum type,
  ) async {
    switch (type) {
      case ServicesEnum.dutyfree:
        return compute(_parseListOfAirports, airportList);
      case ServicesEnum.cabbooking:
        return compute(_parseCabListOfAirports, airportList);
      case ServicesEnum.pranaam:
        return compute(_parsePranaamListOfAirports, airportList);
      case ServicesEnum.porter:
        return compute(_parsePorterListOfAirports, airportList);
      default:
        return airportList;
    }
  }
}
