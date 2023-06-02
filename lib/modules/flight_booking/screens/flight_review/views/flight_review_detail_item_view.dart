/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// [FlightReviewDetailItemView] is used to show the details like flight time and date ,terminal.

const Color _durationTextColor = Color(0xff444444);
const lineHeight = 1.3;

class FlightReviewDetailItemView extends StatelessWidget {
  const FlightReviewDetailItemView({
    required this.journeyFlightDetailsItems,
    required this.newFontSize,
    Key? key,
  }) : super(key: key);

  //flight journey info detail from api response
  final JourneyFlightDetails journeyFlightDetailsItems;
  final double newFontSize;

  @override
  Widget build(BuildContext context) {
    final siteCore = context.read<SiteCoreStateManagement>();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: ADTextStyle400.size20,
                      text:
                          '${journeyFlightDetailsItems.flightDepartureCityCode} ',
                    ),
                    TextSpan(
                      style: ADTextStyle700.size20,
                      text: journeyFlightDetailsItems.flightDepartureTime,
                    ),
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              'lib/assets/images/svg/icons/more/flight_duration.svg',
            ),
            Expanded(
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: ADTextStyle700.size20,
                      text: journeyFlightDetailsItems.flightArrivalTime,
                    ),
                    TextSpan(
                      style: ADTextStyle400.size20,
                      text:
                          ' ${journeyFlightDetailsItems.flightArrivalCityCode}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_8,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                journeyFlightDetailsItems.flightDepartureDate,
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.greyTextColor)
                    .copyWith(fontSize: newFontSize),
              ),
            ),
            Text(
              journeyFlightDetailsItems.flightDuration,
              style: ADTextStyle400.size12.setTextColor(_durationTextColor),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Text(
                journeyFlightDetailsItems.flightArrivalDate,
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.greyTextColor)
                    .copyWith(fontSize: newFontSize),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_4,
        ),
        ADRow(
          leftText: journeyFlightDetailsItems.flightDepartureTerminal.isNotEmpty
              ? '${'terminal'.localize(context)} - ${journeyFlightDetailsItems.flightDepartureTerminal}'
              : '-',
          leftTextStyle: ADTextStyle400.size12
              .setTextColor(context.adColors.greyTextColor),
          rightTextStyle: ADTextStyle400.size12
              .setTextColor(context.adColors.greyTextColor),
          rightText: journeyFlightDetailsItems.flightArrivalTerminal.isNotEmpty
              ? '${'terminal'.localize(context)} - ${journeyFlightDetailsItems.flightArrivalTerminal}'
              : '-',
        ).paddingBySide(top: context.k_2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                // journeyFlightDetailsItems.flightDepartureAirportName,
                siteCore
                        .airportCityMap[
                            journeyFlightDetailsItems.flightDepartureCityCode]
                        ?.airportName ??
                    journeyFlightDetailsItems.flightDepartureAirportName,
                style: ADTextStyle400.size12
                    .setTextColor(
                      context.adColors.greyTextColor,
                    )
                    .copyWith(height: lineHeight),
                textAlign: TextAlign.start,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                // journeyFlightDetailsItems.flightArrivalAirportName,
                siteCore
                        .airportCityMap[
                            journeyFlightDetailsItems.flightArrivalCityCode]
                        ?.airportName ??
                    journeyFlightDetailsItems.flightArrivalAirportName,
                style: ADTextStyle400.size12
                    .setTextColor(
                      context.adColors.greyTextColor,
                    )
                    .copyWith(
                      height: lineHeight,
                    ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ).paddingBySide(
          top: context.k_2,
        ),
      ],
    );
  }
}
