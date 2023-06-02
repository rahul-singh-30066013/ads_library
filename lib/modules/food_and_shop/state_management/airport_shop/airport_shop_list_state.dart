/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future;

import 'package:adani_airport_mobile/modules/food_and_shop/models/repository/airport_shop/airport_shop_list_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

///this class is used to manage state for Airport shop list screen
class AirportShopListState extends ADBaseViewModel {
  final AirportShopListRepository _shopListRepository =
      AirportShopListRepository();

  /// Initiate loading state for api hit
  ADResponseState shopListState = ADResponseState.loading();
  Future<void> getShopListData(String jsonPath) async {
    await _shopListRepository
        .getDashBoardItemsListFromJson(jsonPath)
        .then((value) {
      _updateDashBoardState(value);
    });
  }

  void _updateDashBoardState(ADResponseState response) {
    shopListState = response;
    notifyListeners();
  }
}
