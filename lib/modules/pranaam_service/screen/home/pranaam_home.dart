/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/pranaam_banner_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/pranaam_dashboard_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/enums/home_identifier.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// This class will used to represent pranaam home screen
class PranaamHome extends StatefulWidget {
  final UpSellLink? upSellLink;
  const PranaamHome({Key? key, required this.upSellLink}) : super(key: key);

  @override
  _PranaamHomeState createState() => _PranaamHomeState();
}

class _PranaamHomeState extends State<PranaamHome> {
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  AppModelStateManagement _appModelStateManagement = AppModelStateManagement();
  SiteCoreStateManagement _siteCoreStateManagement = SiteCoreStateManagement();

  @override
  void initState() {
    _appModelStateManagement = context.read<AppModelStateManagement>();
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    _appModelStateManagement.homeIdentifier = HomeIdentifier.pranaamHome;
    pranaamAppDataStateManagement = context.read<PranaamAppDataStateManagement>();
    pranaamAppDataStateManagement..upSellLink = widget.upSellLink
    ..setInitialDataBookingForm();
    WidgetsBinding.instance.addPostFrameCallback((_) => _postBuildProcess());
    super.initState();
  }

  @override
  void dispose() {
    pranaamAppDataStateManagement.upSellLink = null;
    _appModelStateManagement.homeIdentifier = HomeIdentifier.mainHome;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adLog('build', className: this);
    return const Scaffold(
      body: PranaamDashBoardScreen(),
    );
  }

  void _postBuildProcess() {
    pranaamAppDataStateManagement.editForm(value: false);
    getSelectedAirport();
  }

  Future<void> getSelectedAirport() async {
    // final dataObj = <String, Object>{
    //   'key': keySelectedAirport,
    //   'dataType': 'string',
    // };
    await SharedPrefsUtils()
        .getValueFromPrefs(keySelectedAirport)
        .then((value) {
      if (value.toString().isNotEmpty) {
        final AirportItemModel airportData =
            AirportItemModel.fromJson(json.decode(value ?? ''));
        pranaamAppDataStateManagement.updateSelectedAirport(
          airportData,
          _siteCoreStateManagement,
        );
        adLog('Selected airport is ${airportData.airportName}');
      }
    });
    // await AdaniMobilePlugin.readSharedPref(dataObj).then((value) {
    //   if (value.toString().isNotEmpty) {
    //     final AirportItemModel airportData =
    //         AirportItemModel.fromJson(json.decode(value));
    //     pranaamAppDataStateManagement.updateSelectedAirport(
    //       airportData,
    //       _siteCoreStateManagement,
    //     );
    //     adLog('Selected airport is ${airportData.airportName}');
    //   }
    // });
  }
}
