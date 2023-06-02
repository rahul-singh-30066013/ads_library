/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';

/// This delegate is responsible to handle the localization of application
class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  ///This constructor is used to initialize the application with a default locale.
  ///and this method is also used to update the application locale
  ///if user changes the locale from app settings.
  const AppTranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppTranslations.supportedLanguagesCodes
        .contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) {
    //whenever locale change delegate calls this method
    return AppTranslations().load(locale: locale, fetchFromRemote: false);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return false;
  }
}
