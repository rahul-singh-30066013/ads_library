/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/enums/home_identifier.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class NoRecordFound extends StatelessWidget {
  final String errorMessage;
  final String subTitleError;
  final String buttonText;
  final String imagePath;
  final bool isFromOrders;
  final bool isFromMoreScreen;
  final BookingHistory? bookingModelForApi;

  const NoRecordFound({
    Key? key,
    required this.errorMessage,
    required this.subTitleError,
    required this.buttonText,
    required this.imagePath,
    this.isFromOrders = false,
    this.isFromMoreScreen = false,
    this.bookingModelForApi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = context.widthOfScreen * 0.68;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    width: contentWidth,
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  ADSizedBox(
                    width: contentWidth,
                    child: Text(
                      errorMessage,
                      style: ADTextStyle700.size18.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ADSizedBox(
                    height: context.k_10,
                  ),
                  Text(
                    subTitleError,
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ADSizedBox(
                    height: context.k_30,
                  ),
                  OutlinedButton(
                    onPressed: () => _startShoppingTap(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: context.adColors.blackTextColor,
                      ),
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.symmetric(
                        horizontal: context.k_34,
                        vertical: context.k_14,
                      ), //
                    ),
                    child: Text(
                      buttonText,
                      style: ADTextStyle500.size14
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startShoppingTap(BuildContext context) {
    if (bookingModelForApi?.tabType == 'all') {
      ProfileGaAnalytics().selectStartExploringAnalyticsData(source: 'All');
    } else if (bookingModelForApi?.tabType == 'shopping') {
      ProfileGaAnalytics()
          .selectStartExploringAnalyticsData(source: 'Shopping');
    } else if (bookingModelForApi?.tabType == 'booking') {
      ProfileGaAnalytics().selectStartExploringAnalyticsData(source: 'Booking');
    }
    GaEvent.getInstance()
        .backToStartShopEvent(context.read<PranaamAppDataStateManagement>());
    ClickEvents.book_pranaam_back_to_shopping
        .logEvent(parameters: GaEvent.getInstance().parameterMap);
    final CustomTabScaffold scaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    NavigatorState selectedTabState =
        BottomTabNavKeys.homeTabItemKey.currentState ?? NavigatorState();
    if (isFromOrders) {
      context.read<AppModelStateManagement>().homeIdentifier =
          HomeIdentifier.mainHome;
      if (isFromMoreScreen) {
        navigatorPopScreen(context);
      }
    } else {
      navigatorPopScreen(context);
    }

    switch (context.read<AppModelStateManagement>().homeIdentifier) {
      case HomeIdentifier.mainHome:
        scaffold.controller?.index = 0;
        selectedTabState.popUntil((route) => route.isFirst);
        break;
      case HomeIdentifier.dutyFreeHome:
        scaffold.controller?.index = 1;
        selectedTabState = BottomTabNavKeys.businessTabItemKey.currentState ??
            NavigatorState();
        selectedTabState.popUntil(
          (route) => route.settings.name == dutyFreeScreen || route.isFirst,
        );
        break;
      case HomeIdentifier.pranaamHome:
        scaffold.controller?.index = 1;
        selectedTabState = BottomTabNavKeys.businessTabItemKey.currentState ??
            NavigatorState();
        selectedTabState.popUntil(
          (route) => route.settings.name == pranaamService || route.isFirst,
        );
        break;
    }

    // OrderAndBookingsScreen orderAndBookingsScreen = HomeBottomAssets
    //         .homeBottomPages[BottomTabNavKeys.ordersAndBookingsTabItemKey]
    //     as OrderAndBookingsScreen;
  }
}
