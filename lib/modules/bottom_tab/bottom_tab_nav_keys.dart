/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

/// This class [BottomTabNavKeys] is used to defines all the global keys of tab items in bottom nav bar
/// of type [NavigatorState].
class BottomTabNavKeys {
  static GlobalKey<NavigatorState> homeTabItemKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> businessTabItemKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> scanTabItemKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> cartTabItemKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> moreTabItemKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> ordersAndBookingsTabItemKey =
      GlobalKey<NavigatorState>();
}
