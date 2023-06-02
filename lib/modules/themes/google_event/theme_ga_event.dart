/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';

class ThemeGaEvent{
  void tapToSaluteEvent(int count) {
    final tapToSaluteEvent = <String, Object?>{
      'category': 'home_page',
      'sub_category': 'campaign_popup',
      'lable': 'Tap To Salute',
      'count': count,
    };
    ClickEvents.tap_to_salute.logEvent(
      parameters: tapToSaluteEvent,
    );
  }

  void campaignPopup() {
    try {
      final tapToSaluteEvent = <String, Object?>{
        'category': 'home_page',
        'sub_category': 'campaign_popup',
        'lable': 'tap to salute the flag',
      };
      ClickEvents.tap_to_salute.logEvent(
        parameters: tapToSaluteEvent,
      );
    } catch (e) {
      adLog(e.toString());
    }
  }
  // void campaignPopupComplete() {
  //   final tapToSaluteEvent = <String, Object?>{
  //     'category': 'home_page',
  //     'sub_category': 'campaign_popup',
  //     'lable': 'Tap To Salute',
  //   };
  //   ClickEvents.tap_to_salute.logEvent(
  //     parameters: tapToSaluteEvent,
  //   );
  // }
}

