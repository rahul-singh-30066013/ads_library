/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/flight_booking_search_screen.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// this is the main screen that contain a toolbar a tab layout along with booking screen.
///
class FlightBookingScreen extends StatefulWidget {
  final FlightBookingDeepLinkModel? flightBookingDeepLinkModel;
  const FlightBookingScreen({
    Key? key,
    this.flightBookingDeepLinkModel,
  }) : super(key: key);

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      // appBar: AppBar(
      //   titleSpacing: 0,
      //   elevation: 0,
      //   backgroundColor: context.adColors.whiteTextColor,
      //   title: Align(
      //     alignment: Alignment.centerLeft,
      //     child: Text(
      //       'book_flight'.localize(context),
      //       style: ADTextStyle700.size22.setTextColor(context.adColors.black),
      //     ),
      //   ),
      //   actions: [
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         Text(
      //           'powered_by'.localize(context),
      //           style:
      //               ADTextStyle400.size10.setTextColor(context.adColors.black),
      //         ),
      //         ADSizedBox(
      //           width: context.k_64,
      //           child: Image.asset(
      //             'lib/assets/images/common/cleartrip.png',
      //           ),
      //         ).paddingBySide(
      //           top: context.k_6,
      //         ),
      //       ],
      //     ).paddingBySide(top: context.k_12, right: context.k_16),
      //   ],
      // ),
      // body: SafeArea(
      //   child: FlightBookingSearchScreen(
      //     flightBookingModel: FlightBookingRepository().getFlightBookingModel(),
      //   ),
      // ),
      body: SliverAppBarBaseComponent(
        appBarLeftPadding: context.k_2,
        titleTextStyle: ADTextStyle700.size32.setTextColor(
          context.adColors.blackTextColor,
        ),
        title: 'book_flight'.localize(context),
        leadingTitleTextStyle: ADTextStyle700.size22.setTextColor(
          context.adColors.blackTextColor,
        ),
        flexibleTitleTopPadding: context.k_6,
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: FlightBookingSearchScreen(
            flightBookingModel: widget.flightBookingDeepLinkModel == null
                ? FlightBookingRepository().getFlightBookingModel()
                : FlightBookingRepository().getDeepLinkFlightBookingModel(
                    widget.flightBookingDeepLinkModel,
                    context,
                  ),
            isFromDeepLink: widget.flightBookingDeepLinkModel != null,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    ScreenEvents.flight_booking_screen.log();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
