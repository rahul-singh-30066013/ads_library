/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'dart:convert';

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/app_utils/analytics/google_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

///This class is used to send all kinds of analytics events to firebase.
class Analytics {
  //to used for flight booking ga common object to pass in event
  static Map<String, Object?>? flightBookingGAObject = {};

  static bool isGAEnabled = true;

  /// Log events to google analytics
  /// File events only in release mode
  Future<void> logEvent({
    required String event,
    Map<String, Object?>? parameters,
  }) async {
    if (isGAEnabled) {
      await GoogleAnalytics()
          .logAnalyticsEvent(name: event, parameters: parameters);
    }

    // try {
    //   final List<AnalyticsEventItem>? itemList =
    //       parameters?[Parameters.items.name] as List<AnalyticsEventItem>;
    //   if (itemList != null) {
    //     for (int index = 0; index < itemList.length; index++) {
    //       adLog(
    //         'GOOGLE_EVENTS=> logging item $index: ${itemList[index].asMap()}',
    //       );
    //     }
    //   }
    // } catch (e) {
    //   adLog('message');
    // }
    if (kDebugMode) {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyLogs = encoder.convert(parameters);
      adLog(
        'GOOGLE_EVENTS=> logging event $event with properties \n$prettyLogs',
      );
    } else {
      adLog(
        'GOOGLE_EVENTS=> logging event $event with properties $parameters',
      );
    }
  }

  /// Log screen names to google analytics
  /// File events only in release mode
  Future<void> logScreen({required String screen}) async {
    adLog('GOOGLE_EVENTS=> logging $screen');
    if (isGAEnabled) {
      await GoogleAnalytics().logCurrentScreenName(screen);
    }
  }

  ///Log User Properties to Firebase analytics
  Future<void> logUserProperty({
    required String property,
    required Object value,
  }) async {
    adLog('log user property $property $value');
    if (isGAEnabled) {
      await GoogleAnalytics().logUserProperties(name: property, value: value);
    }
  }

  ///Log  User id to Firebase analytics
  Future<void> logUserId({
    required String uid,
  }) async {
    adLog('log user id $uid');
    if (isGAEnabled) {
      await GoogleAnalytics().logUserId(uid: uid);
    }
  }

  /// log the cart items
  Future<void> logViewItemList({
    String? itemListId,
    String? itemListName,
    required List<AnalyticsEventItem> items,
  }) async {
    adLog('GOOGLE_EVENTS=> logging $itemListId   $itemListName  $items');
    if (isGAEnabled) {
      await GoogleAnalytics().logViewItemList(
        itemListId: itemListId,
        itemListName: itemListName,
        items: items,
      );
    }
  }

  /// log the cart items
  Future<void> logAddToCartItems({
    String? currency,
    double? value,
    required List<AnalyticsEventItem> items,
  }) async {
    adLog('GOOGLE_EVENTS=> logging $currency   $value  $items');
    if (isGAEnabled) {
      await GoogleAnalytics().logAddToCart(
        currency: currency,
        value: value,
        items: items,
      );
    }
  }
}
