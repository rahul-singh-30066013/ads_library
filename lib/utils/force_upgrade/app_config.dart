/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/app_constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_config_model/app_config_model.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/remote_config_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

///This class is used to get the configuration data like common userName,password,
///aesEncryption key etc. from remote config. Here we can also store the objects that
///we may need throughout the application.
class AppConfig {
  static final AppConfig _appConfig = AppConfig._internal();
  AppConfigModel? appConfigModel;

  factory AppConfig() {
    return _appConfig;
  }

  AppConfig._internal();

  Future<AppConfigModel?> init() async {
    final jsonString =
        RemoteConfigService().getInstance().getString('app_config');

    //This is used to update the splash themeData
    await setThemeData();

    if (jsonString.isNotEmpty) {
      appConfigModel = AppConfigModel.fromJson(json.decode(jsonString));
    }
    return appConfigModel;
  }

  Future<void> setThemeData() async {
    ///This is to check theme change
    final isThemeEnabled =
        RemoteConfigService().getInstance().getBool(RemoteKeys.isThemeEnabled);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final stored =
        await sharedPreferences.setBool('isThemeEnabled', isThemeEnabled);
    adLog('Splash theme stored $stored');
  }
}

///This method is used to get the version information to show on UI
Future<String> getAppVersionData() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return '${packageInfo.version}.${packageInfo.buildNumber}';
}
