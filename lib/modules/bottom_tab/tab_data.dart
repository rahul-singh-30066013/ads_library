/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/businesses/business_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

///This class is used to maintain index of tabBar

class TabData extends ChangeNotifier {
  var _position = 0;
  IndexedStack? indexedStack;

  int get getCurrentTabPosition {
    return _position;
  }

  void changeTab(Pages page) {
    _position = page.index;
    indexedStack = rootController();
    notifyListeners();
  }

  void initialTab() {
    indexedStack = rootController();
    notifyListeners();
  }

  /// Tab bar all pages
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(
      key: homeScreenKey,
    ),
    const BusinessScreen(),
    Center(
      child: Text('', style: ADTextStyle700.size16),
    ),
    Center(
      child: Text('Cart', style: ADTextStyle700.size16),
    ),
    const MoreScreen(
      openBottomSheet: false,
    ),
  ];

  IndexedStack rootController() {
    return IndexedStack(
      index: _position,
      children: [..._widgetOptions],
    );
  }
}

enum Pages { home, business, scan, shoppingCart, notification, more }
