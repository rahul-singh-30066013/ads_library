/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/modules/more/models/language_model.dart';
import 'package:adani_airport_mobile/utils/constants/app_constants.dart';
import 'package:adani_airport_mobile/utils/enums/home_identifier.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

///This is a App level config model class contains app wide data like
///theme and language
class AppModelStateManagement extends BaseViewModel {
  /// default value to locale
  Locale locale = Locale.fromSubtags(languageCode: AppConstants.defaultLocale);
  bool _isDark = false;
  bool get isDark => _isDark;
  static const prefKey = 'pref_key';
  LanguageModel? _languageModel;
  String retrievedLanguage = '';
  bool isLoyalityActive = false;
  PackageInfo? packageInfo;
  HomeIdentifier homeIdentifier = HomeIdentifier.mainHome;

  /// used to fetch package details such as version number of application
  /// to display on more screen
  Future<void> getPackageDetails() async {
    packageInfo = await PackageInfo.fromPlatform();
    ProfileSingleton.profileSingleton
        .updateAppBuildNumber('${packageInfo?.buildNumber}');
  }

  Future<void> loadLanguageData(String jsonPath) async {
    updateState(ViewState.loading);
    final languageJson = await rootBundle.loadString(jsonPath);
    final Map<String, dynamic> decodedData = jsonDecode(languageJson);
    _languageModel = LanguageModel.fromJson(decodedData);
  }

  List<LanguageOptions>? get languageList =>
      _languageModel?.languageOptions ?? [];

  Future<void> saveLanguageObject(String selectedLanguageObject) async {
    await SharedPrefsUtils().putKeyValuePairInPrefs(
      AppConstants.languageSelected,
      selectedLanguageObject,
    );
  }

  Future<void> retrieveLanguageObject() async {
    await SharedPrefsUtils()
        .getValueFromPrefs(AppConstants.languageSelected)
        .then((value) {
      retrievedLanguage = AppConstants.defaultLocale;
      if (value != null) {
        final Map<String, dynamic> map = jsonDecode(value);
        if (map[AppConstants.keyLanguageCode] != null) {
          retrievedLanguage = map[AppConstants.keyLanguageCode];
        }
      }
      locale = Locale.fromSubtags(languageCode: retrievedLanguage);
      updateState(ViewState.success);
    });
  }

  void updateSelectedLanguage(
    String selectedLanguageObject,
    String languageCode,
  ) {
    retrievedLanguage = languageCode;
    saveLanguageObject(selectedLanguageObject);
    locale = Locale.fromSubtags(languageCode: retrievedLanguage);
    updateState(ViewState.success);
  }

  AppModelStateManagement() {
    getThemeMode();

    /// load language is used to fetch language data from server
    /// (As of now it's in assets)
    getPackageDetails();
    loadLanguageData(JsonAssets.languageOptionsJson);
    retrieveLanguageObject();
  }

  void toggleLightDarkMode() {
    _isDark = !_isDark;
    setThemeMode(isDark);
    notifyListeners();
  }

  ///Using this method you can set the value of ScreenMode
  Future<void> setThemeMode(value) async {
    await SharedPrefsUtils().putKeyValuePairInPrefs(prefKey, value.toString());
  }

  ///Using this method you can get the value of ScreenMode
  Future<void> getThemeMode() async {
    await SharedPrefsUtils().getValueFromPrefs(prefKey).then((value) {
      if (value != null) {
        _isDark = value.toLowerCase() == 'true';
      }
    });
  }
}
