/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/loyalty/repositories/loyalty_repository.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

///this class is used for transaction history state management
class LoyaltyStateManagement extends ADBaseViewModel {
  final LoyaltyRepository _loyaltyRepository = LoyaltyRepository();
  bool _isAbsorbing = false;

  bool get isAbsorbing => _isAbsorbing;

  bool _isAbsorb = false;

  bool get isAborb => _isAbsorb;
  String selectedTerminalValue = '';
  String get selectedTerminal => selectedTerminalValue;
  int balance = 0;
  int pending = 0;

  /// Initiate loading state for api hit
  ADResponseState loyaltyStatusState = ADResponseState.loading();
  ADResponseState loyaltySiteCoreState = ADResponseState.loading();
  static ADResponseState loyaltyPendingState = ADResponseState.loading();

  ///It will provide reward transaction history list from api
  Future<void> getTransactionList() async {
    final Map<String, Object> queryParameters = {
      'type': 'completed',
      'limit': 30,
    };
    _isAbsorbing = true;
    notifyListeners();
    final value = await _loyaltyRepository.fetchTransactionList(
      queryParameters: queryParameters,
    );
    _isAbsorbing = false;
    updateState(value);
  }

  set selectedTerminal(String value) {
    selectedTerminalValue = value;
  }

  ///It will provide reward transaction history list from api
  Future<void> getPendingTransactionList() async {
    final Map<String, Object> queryParameters = {
      //  'mobileNo': ProfileSingleton.profileSingleton.userID,
      'type': 'pending',
      'limit': 30,
    };
    _isAbsorbing = true;
    notifyListeners();
    final value = await _loyaltyRepository.fetchPendingTransactionList(
      queryParameters: queryParameters,
    );
    _isAbsorbing = false;
    updateState(value);
  }

  /// this is used to get reward balance
  Future<void> getBalance() async {
    await getTotalBalance();
    await getPendingBalance();
  }

  Future<void> getTotalBalance() async {
    final map = <String, List<String>>{};
    addValueToMap(map, 'balanceTypes', 'available');
    addValueToMap(map, 'balanceTypes', 'profile');
    _isAbsorbing = true;
    notifyListeners();
    final value = await _loyaltyRepository.fetchPointBalance(
      queryParameters: map,
    );
    _isAbsorbing = false;
    updateState(value);
  }

  /// this is used to get pending balance
  Future<void> getPendingBalance() async {
    final map = <String, List<String>>{};
    adLog('sadness1');
    //  final Map<String, String> queryParameters = {
    //  'mobileNo': ProfileSingleton.profileSingleton.userID,
    addValueToMap(map, 'balanceTypes', 'pending');
    addValueToMap(map, 'balanceTypes', 'profile');
    final value = await _loyaltyRepository.fetchPointBalance(
      queryParameters: map,
    );
    loyaltyPendingState = value;
  }

  /// It is used to fetch Refer Url
  Future<void> getReferUrl() async {
    _isAbsorbing = true;
    notifyListeners();
    final value = await _loyaltyRepository.fetchReferUrl();
    _isAbsorbing = false;
    updateState(value);
  }

  /// It is used to get Item detail for each transition
  Future<void> getItemDetail(String orderId) async {
    final Map<String, String> queryParameters = {
      'orderID': orderId,
    };
    _isAbsorbing = true;
    notifyListeners();
    final value = await _loyaltyRepository.fetchOrderDetails(
      queryParameters: queryParameters,
    );
    _isAbsorbing = false;
    updateState(value);
  }

  ///It will update reward transaction history
  void updateState(ADResponseState response) {
    loyaltyStatusState = response;
    notifyListeners();
  }

  ///It will fetch loyalty dashboard UI
  Future<void> fetchDashBoardHome(String terminalModel) async {
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.loyaltyHome,
      'sc_lang': 'en',
      'sc_type': '2',
      'sc_apptype': 'app',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'false',
      'sc_location': airportPrefixName().toString(),
      'sc_storeType': terminalModel,
    };
    adLog('airportName');
    adLog(airportPrefixName().toString());
    _isAbsorb = true;
    notifyListeners();
    final responseState = await _loyaltyRepository.fetchLoyaltyHome(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParams: queryParams,
    );
    _isAbsorb = false;
    if (responseState.viewStatus == Status.complete) {
      loyaltySiteCoreState = responseState;
    } else if (responseState.viewStatus == Status.error) {
      loyaltySiteCoreState = responseState;
    }
    notifyListeners();
  }

  String? airportPrefixName() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty == false
        ? selectedAirportsData?.airportPrefixName
        : 'adani-one-airport';
  }

  ///It will used to fetch refer and earn page
  Future<void> fetchReferAndEarn() async {
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.referAndEarn,
      'sc_lang': 'en',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'false',
    };

    _isAbsorb = true;
    notifyListeners();
    final responseState = await _loyaltyRepository.fetchReferAndEarn(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParams: queryParams,
    );
    _isAbsorb = false;
    if (responseState.viewStatus == Status.complete) {
      loyaltySiteCoreState = responseState;
    }
    notifyListeners();
  }

  ///It will used to fetch refer and earn page
  Future<void> fetchDialog() async {
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.dialogData,
      'sc_lang': 'en',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'false',
    };

    _isAbsorb = true;
    notifyListeners();
    final responseState = await _loyaltyRepository.fetchDailog(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParams: queryParams,
    );
    _isAbsorb = false;
    if (responseState.viewStatus == Status.complete) {
      loyaltySiteCoreState = responseState;
    }
    notifyListeners();
  }

  ///It will update terminal
  void updateTerminal(String updatedTerminal) {
    adLog(updatedTerminal);
    selectedTerminalValue = updatedTerminal;
    notifyListeners();
  }

  void addValueToMap<K, V>(Map<K, List<V>> map, K key, V value) =>
      map.update(key, (list) => list..add(value), ifAbsent: () => [value]);
}
