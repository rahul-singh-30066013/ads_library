/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/food_and_shop/models/model/airport_shop/airport_shop_list_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/services.dart';

///this class is used to communicate with state class for Airport shop list screen,
///add business logic here for our Api/local db.
class AirportShopListRepository {
  Future<ADResponseState> getDashBoardItemsListFromJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        return ADResponseState.completed(
          AirportShopListModel.fromJson(parsed).airportShop,
        );
      });
}
