/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/app_constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/remote_config_service.dart';
import 'package:flutter/services.dart';

class LaunchIconChanger {
  MethodChannel platform = const MethodChannel('com.adani_airport_mobile');

  Future<void> changeIcon()async {
    final bool isAlternateIconEnabled = RemoteConfigService().getInstance().getBool(RemoteKeys.alternateIconKey);
      if(isAlternateIconEnabled) {
        try {
            await _setAlternateIcon();
        } on PlatformException catch (e) {
          adLog(e.toString());
        }
      } else {
        try {
          await _setDefaultIcon();
        } on PlatformException catch (e) {
          adLog(e.toString());
        }
      }
  }


  Future<void> _setDefaultIcon()async {
    final temp = await platform.invokeMethod('resetIcon',{'iconName':null});
    adLog(temp.toString());
  }

  Future<void> _setAlternateIcon() async {
    final temp = await platform.invokeMethod('resetIcon',{'iconName':'AlternateIcon'});
    adLog(temp.toString());
  }
}