/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// In this class, we are making a component to define the source and destination of the flight.

class RouteNameContainerView extends StatelessWidget {
  final String source;
  final String destination;
  final bool isRoundTrip;

  const RouteNameContainerView({
    Key? key,
    required this.source,
    required this.destination,
    required this.isRoundTrip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final siteCore = context.read<SiteCoreStateManagement>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_8,
      ),
      // margin: EdgeInsets.symmetric(vertical: context.k_20),
      width: double.infinity,
      color: context.adColors.containerGreyBg,
      child: Row(
        children: [
          Text(
            siteCore.airportCityMap[source]?.cityName ?? '$source ',
            style: ADTextStyle500.size14
                .setTextColor(context.adColors.greyTextColor),
          ),
          SvgPicture.asset(
            isRoundTrip
                ? 'lib/assets/images/svg/icons/flight/round trip.svg'
                : 'lib/assets/images/svg/icons/flight/one way.svg',
            width: context.k_10,
            color: context.adColors.greyTextColor,
          ).paddingBySide(left: context.k_6, right: context.k_6),
          Text(
            siteCore.airportCityMap[destination]?.cityName ?? ' $destination',
            style: ADTextStyle500.size14
                .setTextColor(context.adColors.greyTextColor),
          ),
        ],
      ),
    );
  }
}
