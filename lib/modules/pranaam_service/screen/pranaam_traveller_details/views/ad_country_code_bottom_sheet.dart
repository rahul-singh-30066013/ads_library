/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/country_code_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

const int itemCount = 5;
const double blurRadius = 3;
const double bottomSheetHeight = 600;

class ADCountryCodeBottomSheet extends StatelessWidget {
  const ADCountryCodeBottomSheet({
    Key? key,
    required this.onTap,
    required this.countryListCodes,
    required this.selectedCountry,
    this.visibleCountryCode = false,
    this.visibleCountryDialCode = false,
  }) : super(key: key);
  final ADGenericCallback onTap;
  final List<Country> countryListCodes;
  final String selectedCountry;
  final bool visibleCountryCode;
  final bool visibleCountryDialCode;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    context.read<PranaamAppDataStateManagement>().countryCodeDetailModelList =
        countryListCodes;
    return CountryCodeView(
      onCountrySelected: (value) => onBottomTap(value, context),
      countryCodesList: countryListCodes,
      visibleCountryCode: visibleCountryCode,
      visibleCountryDialCode: visibleCountryDialCode,
      selectedCountry: selectedCountry,
    );
  }

  void onBottomTap(value, BuildContext context) {
    onTap(value);
    navigatorPopScreen(context);
  }
}
