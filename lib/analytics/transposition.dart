/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:firebase_analytics/firebase_analytics.dart';

class Transposition {
  static Map<String, dynamic> getMixpanelEventItems({
    required List<AnalyticsEventItem> analyticsEventItemList,
  }) {
    final Map<String, List<dynamic>> properties = {};
    for (final AnalyticsEventItem element in analyticsEventItemList) {
      final Map<String, dynamic> elementMap = element.asMap();
      for (int index = 0; index < elementMap.length; index++) {
        final currentKey = elementMap.keys.elementAt(index);
        if (properties.containsKey(currentKey)) {
          properties[currentKey]?.add(elementMap[currentKey]);
        } else {
          properties[currentKey] = [elementMap[currentKey]];
        }
      }
    }
    return properties;
  }

  static List<Map<String, dynamic>> getWebEngageEventItems({
    required List<AnalyticsEventItem> analyticsEventItemList,
  }) {
    final List<Map<String, dynamic>> webEngageItems = [];
    for (final AnalyticsEventItem element in analyticsEventItemList) {
      webEngageItems.add(element.asMap());
    }
    return webEngageItems;
  }
}
