/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/country_codes/country_codes_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/country_repository/country_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/services.dart';

class CountryCodeState extends ADBaseViewModel {
  final CountryRepository _countryCodesRepo = CountryRepository();

  ///It will provide country list from api
  Future<ADResponseState> getCountryCodes() async {
    final ADResponseState adResponseState =
        await _countryCodesRepo.fetchCountryCodesList();

    return adResponseState;
  }

  Future<CountryCodesResponseModel> getCountryCodesfromJSON() async {
    final String countryCodeJson =
        await rootBundle.loadString(JsonAssets.countryCodeAssets);
    final Map<String, dynamic> decoded = json.decode(countryCodeJson);
    final CountryCodesResponseModel countryCodesResponseModel =
        CountryCodesResponseModel.fromJson(decoded);
    return countryCodesResponseModel;
  }
}
