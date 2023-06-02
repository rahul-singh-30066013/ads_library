/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future;

import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/dashboard/pranaam_dashboard_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

///this class is used to represent PranaamDashBoardViewModel
class PranaamSitecoreStateManagement extends ADBaseViewModel {
  final PranaamDashboardRepository _pranaamDashboardRepository =
      PranaamDashboardRepository();

  /// Initiate loading state for api hit
  ADResponseState pranaamDashboardState = ADResponseState.loading();
  ADResponseState pranaamMasterDataState = ADResponseState.loading();

  Future<void> getDashBoardData() async {
    await _pranaamDashboardRepository
        .getDashBoardItemsListFromJson(JsonAssets.siteCorePranaamHome)
        .then((value) {
      _updateDashBoardState(value);
    });
  }

  void _updateDashBoardState(ADResponseState response) {
    pranaamDashboardState = response;
    notifyListeners();
  }


  Future<void> fetchDashBoardHome(
    SiteCoreStateManagement siteCoreStateManagement, AirportItemModel? serviceAirport,
  ) async {
    final String airport = '${selectedAirportsData?.city ?? 'Pranaam'}Home';
    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.pranaamHome + airport,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
      isCallFromAppKey: isCallNotFromAppValue,
      cityCode: serviceAirport?.airportCode?.toLowerCase() ?? selectedAirportsData?.airportCode?.toLowerCase() ?? '',
    };
    final ADResponseState responseState =
        await _pranaamDashboardRepository.getPranaamDashBoardItems(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParams: queryParams,
    );
    if (responseState.viewStatus == Status.complete) {
      pranaamDashboardState = responseState;
    } else {
      await getDashBoardData();
    }

    /// check airport data is present or not
    adLog(
      'airportPranaamCityList length ${siteCoreStateManagement.airportPranaamCityList.length}',
      className: this,
    );
    if (siteCoreStateManagement.airportPranaamCityList.isEmpty) {
      /// Hit API and if API is unsuccessful then read data from local json
      await siteCoreStateManagement.fetchListOfAirports();
    }

    notifyListeners();
  }

  Future<void> fetchPranaamMasterData() async {
    final Map<String, String> queryParams = {
      listsKey: listsDefaultValue,
      itemKey: SiteCoreApiUrls.pranaamMasterData,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
    };

    await _pranaamDashboardRepository
        .fetchPranaamMasterData(
      queryParams,
    )
        .then((value) {
      adLog(' pranaamMasterDataState ${value.data}');

      // pranaamMasterDataState = value;

      notifyListeners();
      adLog(' pranaamMasterDataState ${pranaamMasterDataState.viewStatus}');
    });
  }
}
