/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/app_tab_icon.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/businesses/business_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/more_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/order_and_bookings_screen.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used to define assets of home bottom navigator
/// it consist of map[homeBottomPages] having GlobalKey of type [NavigatorState] as key
/// and [Widget] as a value.
/// [getHomeBottomTabItemsList] is used to list of [BottomNavigationBarItem] in bottom navigator.
class HomeBottomAssets {
  static Map<GlobalKey<NavigatorState>, Widget> homeBottomPages = {
    BottomTabNavKeys.homeTabItemKey: HomeScreen(
      key: homeScreenKey,
    ),
    BottomTabNavKeys.businessTabItemKey: const BusinessScreen(),
    BottomTabNavKeys.ordersAndBookingsTabItemKey: const OrderAndBookingsScreen(
      fromMoreScreen: false,
      fromBottomTab: true,
    ),
    BottomTabNavKeys.cartTabItemKey: const ADSizedBox.shrink(),
    BottomTabNavKeys.moreTabItemKey: const MoreScreen(
      openBottomSheet: false,
    ),
  };

  static List<BottomNavigationBarItem> getHomeBottomTabItemsList(
    BuildContext context,
  ) {
    final bottomBars = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: AppTabIcon(
          assetName: SvgAssets.bottomBarHome,
          selectedColor: context.adColors.darkGreyTextColor,
        ),
        activeIcon: AppTabIcon(
          assetName: 'lib/assets/gif/home.gif',
          selectedColor: context.adColors.whiteTextColor,
        ),
        label: 'home'.localize(context),
      ),
      BottomNavigationBarItem(
        icon: AppTabIcon(
          assetName: SvgAssets.bottomBarServices,
          selectedColor: context.adColors.darkGreyTextColor,
        ),
        activeIcon: AppTabIcon(
          assetName: 'lib/assets/gif/services.gif',
          selectedColor: context.adColors.whiteTextColor,
        ),
        label: 'services'.localize(context),
      ),
      BottomNavigationBarItem(
        icon: AppTabIcon(
          assetName: SvgAssets.bottomBarMyOrder,
          selectedColor: context.adColors.darkGreyTextColor,
        ),
        activeIcon: AppTabIcon(
          assetName: 'lib/assets/gif/my_order.gif',
          selectedColor: context.adColors.whiteTextColor,
        ),
        label: 'orders'.localize(context),
      ),
      BottomNavigationBarItem(
        icon: Stack(
          children: [
            AppTabIcon(
              assetName: SvgAssets.bottomBarCart,
              selectedColor: context.adColors.darkGreyTextColor,
              cartName: 'cart_name'.localize(context),
            ),
          ],
        ),
        activeIcon: AppTabIcon(
          assetName: 'lib/assets/gif/cart.gif',
          selectedColor: context.adColors.whiteTextColor,
          cartName: 'cart_name'.localize(context),
        ),
        label: 'cart'.localize(context),
      ),
      BottomNavigationBarItem(
        icon: AppTabIcon(
          assetName: SvgAssets.bottomBarMore,
          selectedColor: context.adColors.darkGreyTextColor,
          cartName: 'more'.localize(context),
        ),
        activeIcon: AppTabIcon(
          assetName: 'lib/assets/gif/more.gif',
          selectedColor: context.adColors.whiteTextColor,
          cartName: 'more'.localize(context),
        ),
        label: 'more'.localize(context),
      ),
    ];
    return bottomBars;
  }
}
