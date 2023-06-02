/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future;

import 'package:adani_airport_mobile/modules/duty_free/repository/dashboard_repo.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

///this class is used to represent DashBoardViewModel
class DashBoardViewModel extends ADBaseViewModel {
  final DashboardRepo _dashboardRepository = DashboardRepo();

  /// Initiate loading state for api hit
  ADResponseState dashBoardState = ADResponseState.loading();
  ADResponseState homeDashBoardState = ADResponseState.loading();
  ADResponseState republicDashBoardState = ADResponseState.loading();

  ///Sitecore Airport Dashboard Home and Services Page API version
  final String siteCoreAirportHomeAndServicesAPIVersion = (AppConstantRemote()
                  .appConstantRemoteModel
                  ?.siteCoreAirportHomeAndServicesAPIVersion ??
              '')
          .isNotEmpty
      ? '-${AppConstantRemote().appConstantRemoteModel?.siteCoreAirportHomeAndServicesAPIVersion ?? ''}'
      : '';

  bool _isMoreVisible = true;

  bool get isMore => _isMoreVisible;

  List<String> get tipMarqueeList =>
      AppConstantRemote().appConstantRemoteModel?.tipMarqueeList ??
      [
        'Search Airport Services',
        'Search "Book Flights"',
        'Search "Pranaam"',
        'Search "DutyFree"',
        'Search "Cabs"',
        'Search "Flight Status"',
      ];

  Future<void> getDashBoardData(
    String airport, {
    String? postFix,
    bool notify = false,
  }) async {
    if (notify) {
      _updateHomeDashBoardState(ADResponseState.loading());
    }
    await _dashboardRepository.fetchDashBoardData(
      queryParams: {
        'item':
            '/$airport${SiteCoreApiUrls.airportDashboard}$siteCoreAirportHomeAndServicesAPIVersion${postFix ?? ''}',
        'sc_lang': 'en',
        'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
        'application': 'app',
      },
    ).then((value) {
      _updateHomeDashBoardState(value);
    });
  }

  Future<void> getRepublicDashBoardData({
    String? postFix,
  }) async {
    await _dashboardRepository.fetchDashBoardData(
      queryParams: {
        // 'item': '/$airport${SiteCoreApiUrls.airportDashboard}${postFix ?? ''}',
        'item': '${SiteCoreApiUrls.rewardLanding}${postFix ?? ''}',
        'sc_lang': 'en',
        'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
        'application': 'app',
      },
    ).then((value) {
      _updateRepublicDashBoardState(value);
    });
  }

  Future<void> getServicesData(String airport) async {
    _updateDashBoardState(ADResponseState.loading());
    await _dashboardRepository.fetchServicesData(
      queryParams: {
        'item':
            '/$airport${SiteCoreApiUrls.airportDashboard}$siteCoreAirportHomeAndServicesAPIVersion${SiteCoreApiUrls.serviceLandingPage}',
        'sc_lang': 'en',
        'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
        'application': 'app',
      },
    ).then((value) {
      _updateHomeDashBoardState(value);
    });
  }

  Future<void> getDashBoardDataFromLocalJson(String jsonPath) async {
    await _dashboardRepository
        .fetchDashBoardDataFromLocalJson(jsonPath)
        .then((value) {
      _updateDashBoardState(value);
    });
  }

  Future<void> getDutyFreeDashBoardData({
    bool isAgeAbove25 = false,
    String storeType = 'departure',
    // AirportItemModel? airportItemModel,
  }) async =>
      _dashboardRepository
          .getDutyFreeDashBoardItems(
        isAgeAbove25: isAgeAbove25,
        storeType: storeType,
        // airportItemModel: airportItemModel,
      )
          .then((value) {
        _updateDashBoardState(value);
      });

  void _updateDashBoardState(ADResponseState response) {
    dashBoardState = response;
    notifyListeners();
  }

  void _updateHomeDashBoardState(ADResponseState response) {
    homeDashBoardState = response;
    notifyListeners();
  }

  void _updateRepublicDashBoardState(ADResponseState response) {
    republicDashBoardState = response;
    notifyListeners();
  }

  Future<void> getAirportDashBoardData(String jsonPath) async {
    await _dashboardRepository
        .getAirportBoardItemsListFromJson(jsonPath)
        .then((value) {
      _updateDashBoardState(value);
    });
  }

  void tapToOpenMoreItems() {
    _isMoreVisible = false;
    notifyListeners();
  }
}
