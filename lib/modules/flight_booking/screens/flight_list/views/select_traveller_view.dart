/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// this class return the the view for number of traveller along with travel class type.

class SelectTravellerView extends StatelessWidget {
  ///*[type] is used the show the hint of the view
  final String type;

  ///*[crossAxisAlignment] is used to content on view by given alignment.
  final CrossAxisAlignment? crossAxisAlignment;

  const SelectTravellerView({
    Key? key,
    required this.type,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<FlightBookingState, Travellers>(
      selector: (context, flightViewModel) =>
          flightViewModel.allTravellers ?? Travellers(),
      builder: (BuildContext context, travellers, Widget? child) => Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: ADTextStyle400.size16
                .setTextColor(context.adColors.greyTextColor),
            key: const Key(FlightAutomationKeys.travelClassHeading),
          ),
          Text(
            travellers.totalTravellers > 1
                ? '${travellers.totalTravellers} Traveller(s) | ${travellers.travelClass.toString().split('.').last.localize(context)}'
                : '${travellers.totalTravellers} Traveller | ${travellers.travelClass.toString().split('.').last.localize(context)}',
            style: ADTextStyle600.size20.setTextColor(context.adColors.black),
            key: const Key(FlightAutomationKeys.travelClass),
          ).paddingBySide(
            top: context.k_6,
          ),
        ],
      ).paddingBySide(
        left: context.k_16,
        right: context.k_16,
        top: context.k_18,
        bottom: context.k_18,
      ),
    );
  }

  String getTravelClass(Travellers? travellers) {
    String travelClass;
    if (travellers == null) {
      travelClass = 'Economy';
    } else if (travellers.travelClass == TravelClass.economy) {
      travelClass = 'Economy';
    } else if (travellers.travelClass == TravelClass.premiumEconomy) {
      travelClass = 'Premium Economy';
    } else {
      travelClass = 'Business';
    }
    return travelClass;
  }
}
