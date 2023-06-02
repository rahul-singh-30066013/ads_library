/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';

import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/modules/site_core/repositories/site_core_repository.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

///This class is used to initialize the locale in which our customer can use the application.
///This class is also responsible to update the locale of application if user changes the language from
///setting page.
class AppTranslations {
  Map<dynamic, dynamic> _localisedValues = <dynamic, dynamic>{};
  final SiteCoreRepository _siteCoreRepository = SiteCoreRepository();
  final List<String> supportedLanguages = [
    'English',
    'Hindi',
  ];

  ///These are the codes of languages supported it should be in the same sequence as
  ///supportedLanguages otherwise there will be a mismatch in language and code
  ///there may be a chance that different language is shown for different code. So
  ///same sequence should be followed.
  static final List<String> supportedLanguagesCodes = [
    'en',
    'hi',
  ];

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  ///This method is used to load the locale json file which has all key,value pair
  ///for string resources of application from assets
  Future<AppTranslations> load({
    required Locale locale,
    required bool fetchFromRemote,
  }) async {
    return fetchFromRemote ? _loadFromSiteCore(locale) : _loadFromLocal(locale);
  }

  Future<AppTranslations> _loadFromSiteCore(Locale locale) async {
    final Map<String, String> queryParams = {
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
    };
    final languageDictionary =
        await _siteCoreRepository.fetchLanguageDictionary(
      queryParams,
      locale.languageCode,
    );
    if (languageDictionary.data != null) {
      _localisedValues = (languageDictionary.data as List).first;
    } else {
      final String jsonContent = await rootBundle
          .loadString('lib/assets/locale/lang_${locale.languageCode}.json');
      _localisedValues = json.decode(jsonContent);
    }
    return this;
  }

  Future<AppTranslations> _loadFromLocal(Locale locale) async {
    final String jsonContent = await rootBundle
        .loadString('lib/assets/locale/lang_${locale.languageCode}.json');
    _localisedValues = json.decode(jsonContent);
    return this;
  }

  ///This is used to get the string value from map using key
  String text(String key) {
    return _localisedValues[key] ?? '$key not found';
  }

  ///This is used to check if key exists in language file
  String inAbsenceOfLocalizeKeyUseOther(String key, String newString) {
    return _localisedValues[key] ?? newString;
  }
}

extension Localization on String {
  ///This method returns localized string according to selected language.
  String localize(BuildContext context) {
    final AppTranslations? appTranslations = AppTranslations.of(context);
    if (appTranslations == null) {
      return '$this not found';
    }
    return appTranslations.text(this);
  }

  String safeLocalize(BuildContext context, String newText) {
    final AppTranslations? appTranslations = AppTranslations.of(context);
    if (appTranslations == null) {
      return '$this not found';
    }
    return appTranslations.inAbsenceOfLocalizeKeyUseOther(this, newText);
  }
}
