/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/json_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/enum/catalog_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

/// This view model class will used to return data from json(local/api) to CountryCode screen as per required,
CountryCodeModel _parseCountryCodeData(String jsonBody) {
  final parsed = json.decode(jsonBody);
  return CountryCodeModel.fromJson(parsed);
}

class CountryListState extends BaseViewModel {
  CountryCodeModel? _countryCodeModel;
  List<CountryCodeData> _listOfCountryCodes = [];
  String userSearchTerm = '';

  void buildSearch(
    String userSearchTerm,
  ) {
    this.userSearchTerm = userSearchTerm;
    userSearchTerm.isNotEmpty
        ? countryCodes = getFilteredCountryCodesList(
            userSearchTerm,
          )
        : countryCodes = _listOfCountryCodes;
    notifyListeners();
  }

  void initViewModel(
    BottomSheetType type,
    List<CountryCodeData> countryCodeData,
  ) {
    getCountryCodeList(
      JsonAssets.countryCodeJson,
      type,
      countryCodeData,
    );
  }

  Future<void> getCountryCodeList(
    String jsonPath,
    BottomSheetType type,
    List<CountryCodeData> countryCodeData,
  ) async {
    // updateState(ViewState.loading);
    _countryCodeModel = CountryCodeModel(countryCodes: countryCodeData);
    _listOfCountryCodes = countryCodeData;
    // updateState(ViewState.success);
    if (type == BottomSheetType.fromCountryCode) {
      adLog('sortCountryList');
      // sortCountryList;
    } else {
      adLog('sortCountryCode');
      adLog(jsonPath);

      // sortCountryCode;
    }
    notifyListeners();

    // await getCountryCodeListFromJson(jsonPath).then((value) {
    //   _countryCodeModel = value;
    //   _listOfCountryCodes = value != null ? value.countryCodes : [];
    //   updateState(ViewState.success);
    //   if (type == BottomSheetType.fromCountryCode) {
    //     adLog('sortCountryList');
    //     // sortCountryList;
    //   } else {
    //     adLog('sortCountryCode');
    //     // sortCountryCode;
    //   }
    //   notifyListeners();
    // });
  }

  Future<CountryCodeModel?> getCountryCodeListFromJson(String jsonPath) async {
    final jsonString = await rootBundle.loadString(jsonPath);
    return compute(_parseCountryCodeData, jsonString);
  }

  int get totalCountryCodes => _listOfCountryCodes.length;

  List<CountryCodeData> get countryCodes =>
      _countryCodeModel?.countryCodes ?? [];

  set countryCodes(List<CountryCodeData> list) {
    _countryCodeModel?.countryCodes = list;
  }

  void get sortCountryList {
    _countryCodeModel?.countryCodes
        .sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
  }

  void get sortCountryCode {
    _countryCodeModel?.countryCodes
        .sort((a, b) => (a.countryCode ?? '').compareTo(b.countryCode ?? ''));
  }

  List<CountryCodeData> countryCodeSearchFromList(
    List<CountryCodeData> listOfCountryCodes,
    String userSearchTerm,
  ) {
    return listOfCountryCodes.where(
      (countryCodes) {
        return countryCodes.name
                .validateWithDefaultValue()
                .toLowerCase()
                .startsWith(userSearchTerm.toLowerCase()) ||
            countryCodes.callingCode
                .validateWithDefaultValue()
                .toLowerCase()
                .contains(userSearchTerm.toLowerCase());
      },
    ).toList();
  }

  List<CountryCodeData> getFilteredCountryCodesList(String userSearchString) {
    return countryCodeSearchFromList(
      _listOfCountryCodes,
      userSearchString,
    );
  }
}
