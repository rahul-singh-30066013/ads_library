/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';

/// Manager for all AppsFlyer Services.
class AppsFlyerManager {
  static final AppsFlyerManager _appsFlyerManager =
      AppsFlyerManager._internal();

  factory AppsFlyerManager() => _appsFlyerManager;

  AppsFlyerManager._internal();

  AppsflyerSdk? _afS;

  /// Initialize Appsflyer SDK
  Future<void> initialize({
    required String devKey,
    required bool debugMode,
  }) async {
    try {
      final appsFlyerOptions = AppsFlyerOptions(
        afDevKey: devKey,
        appId: '1630064188', // AppID for IOS
        showDebug: debugMode,
      );
      _afS = AppsflyerSdk(appsFlyerOptions);
      await DeepLinkManager().startAppsFlyerDeepLinkUtil(
        sdk: _afS ?? AppsflyerSdk(appsFlyerOptions),
      );
      final callBack = await _afS?.initSdk(
        registerOnDeepLinkingCallback: true,
      );

      /// log app opened event
      await logEvent(
        eventName: AppsflyerClickEvents.af_app_opened.name,
      );
      adLog(callBack);
    } catch (e) {
      adLog('Appsflyer error -> ${e.toString()}');
    }
  }

  AppsflyerSdk get _appsflyerSdk {
    if (_afS != null) {
      return _afS ??
          // given to handle null values(will never go in this block)
          AppsflyerSdk(
            AppsFlyerOptions(
              afDevKey: 'devKey',
              appId: '1630064188', // AppID for IOS
              showDebug: kDebugMode,
            ),
          );
    } else {
      throw UnimplementedError(
        'AppflyerSdk has not been Initialized. Call AppsflyerManager.initialize() first.',
      );
    }
  }

  Future<void> logEvent({
    required String eventName,
    Map? eventValues,
  }) async {
    try {
      final result = await _appsflyerSdk.logEvent(eventName, eventValues);
      adLog('Event $eventName Log Status : $result');
    } on Exception catch (e) {
      adLog('Result logEvent: $e');
    }
  }

  void logUserId({
    required String userId,
  }) {
    try {
      _appsflyerSdk.setCustomerUserId(userId);
      adLog('Event userId $userId');
    } on Exception catch (e) {
      adLog('Result logEvent: $e');
    }
  }
}
