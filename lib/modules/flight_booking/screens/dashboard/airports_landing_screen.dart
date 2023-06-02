/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/ga_analytics_event/home_and_airport_selection_click_event.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/airports_list_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const Color _closeIconColor = Color(0xff333333);

class AirportsLandingScreen extends StatelessWidget {
  const AirportsLandingScreen({
    Key? key,
    required this.airportStateData,
  }) : super(key: key);

  final AirportItemModel? airportStateData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      appBar: AppBar(
        backgroundColor: context.adColors.whiteTextColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            SvgAssets.closingIcon,
            color: _closeIconColor,
          ),
          onPressed: () => navigateToHome(context),
        ),
        title: Text(
          'select_airport'.localize(context),
          style: ADTextStyle700.size22.setTextColor(context.adColors.black),
        ),
      ),
      body: AirportsListScreen(
        airportsData: airportStateData,
        isAirportsLanding: true,
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    AirportItemModel airportData = AirportItemModel.fromJson(
      json.decode(otherAirport),
    );
    for (final AirportItemModel airport in adaniAirportsList) {
      if (airport.city?.contains('Other') ?? false) {
        airportData = airport;
        otherAirport = json.encode(airport);
        break;
      } else {
        if (airport.city?.contains('Mumbai') ?? false) {
          airportData = airport;
        }
      }
    }

    HomeAndAirportSelectionClickEvent()
        .airportSelectionAnalyticsData(airportData.city ?? '', 'Cross');
    saveToPreference(keySelectedAirport, airportData);
    selectedAirportsData = airportData;
    selectedAirportNotifier.value = airportData.city ?? '';
    navigateUsingPushReplacementNamed(
      context,
      selectedAirportsData != null ? tabRoute : airportsLandingScreen,
    );
  }

  /// Save Data to Preference
  void saveToPreference(String key, AirportItemModel airportsData) {
    SharedPrefsUtils().putVarValueInPrefs(
      key,
      airportsData,
    );
  }
}
