/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/flight_detail_row.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double dotWidth = 17.sp;
final double serviceTimePadding = 42.sp;
const Color paidWithCreditCardSectionColor = Color(0xfffbfbfb);

class FlightDetailViewForConfirmation extends StatelessWidget {
  /// this class gives detail about your flight source and destination which includes
  /// no of travellers, date time and flight number.
  ///
  final String bookingID;
  final bool isRoundTrip;
  final TripDetails tripDetail;

  const FlightDetailViewForConfirmation({
    Key? key,
    required this.bookingID,
    required this.isRoundTrip,
    required this.tripDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final isTrvAirport = tripDetail.serviceAirportName == 'Thiruvananthapuram';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlightDetailRow(
          isConfirmation: true,
          rightText: 'meeting_point'.localize(context),
          leftTextStyle: ADTextStyle400.size14
              .setTextColor(context.adColors.greyTextColor),
          leftText: 'Service',
          rightTextStyle: ADTextStyle400.size14
              .setTextColor(context.adColors.greyTextColor),
        ),
        ADSizedBox(
          height: context.k_4,
        ),
        FlightDetailRow(
          isConfirmation: true,
          rightText: isTrvAirport
              ? tripDetail.flightTerminal == 'N/A' ||
                      tripDetail.flightTerminal == ''
                  ? '${tripDetail.serviceAirportName}\n${'airportTitle'.localize(context)}'
                  : '${tripDetail.serviceAirportName}\n${'airportTitle'.localize(context)}\n(${tripDetail.flightTerminal})'
              : tripDetail.flightTerminal == 'N/A' ||
                      tripDetail.flightTerminal == ''
                  ? '${tripDetail.serviceAirportName} ${'airportTitle'.localize(context)}'
                  : '${tripDetail.serviceAirportName} ${'airportTitle'.localize(context)}\n(${tripDetail.flightTerminal})',
          leftTextStyle: ADTextStyle500.size16
              .setTextColor(context.adColors.blackTextColor),
          rightTextStyle: ADTextStyle500.size16
              .setTextColor(context.adColors.blackTextColor),
          leftText: tripDetail.serviceType ?? '',
        ),
        ADSizedBox(
          height: context.k_30,
        ),
        FlightDetailRow(
          isConfirmation: true,
          leftText: 'service_date'.localize(context),
          leftTextStyle: ADTextStyle400.size14
              .setTextColor(context.adColors.greyTextColor),
          rightText: 'service_time'.localize(context),
          rightTextStyle: ADTextStyle400.size14
              .setTextColor(context.adColors.greyTextColor),
        ),
        ADSizedBox(
          height: context.k_4,
        ),
        if (isRoundTrip)
          FlightDetailRow(
            isConfirmation: true,
            leftText: formatFlightServiceDate(
              tripDetail.roundTripSecServiceDateTime ?? '',
            ),
            leftTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            rightTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            rightText: formatFlightService12Time(
              tripDetail.roundTripSecServiceDateTime ?? '',
            ),
          )
        else
          FlightDetailRow(
            isConfirmation: true,
            leftText: formatDateTimeFlightServiceDate(
              tripDetail.serviceDateTime,
            ),
            leftTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            rightTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.blackTextColor),
            rightText: formatDateTimeFlightService12Time(
              tripDetail.serviceDateTime,
            ),
          ),
        ADSizedBox(
          height: context.k_28,
        ),
        FlightDetailRow(
          isConfirmation: true,
          rightText: 'Booking ID',
          leftTextStyle: ADTextStyle400.size14
              .setTextColor(context.adColors.greyTextColor),
          leftText: 'flight_no'.localize(context),
          rightTextStyle: ADTextStyle400.size14
              .setTextColor(context.adColors.greyTextColor),
        ),
        ADSizedBox(
          height: context.k_4,
        ),
        FlightDetailRow(
          isConfirmation: true,
          rightText: bookingID,
          leftTextStyle: ADTextStyle500.size16
              .setTextColor(context.adColors.blackTextColor),
          rightTextStyle: ADTextStyle500.size16
              .setTextColor(context.adColors.blackTextColor),
          leftText: (isRoundTrip &&
                  tripDetail.transitRoundTripSecFlightName != '')
              ? tripDetail.transitRoundTripSecFlightName ?? ''
              : (isRoundTrip && tripDetail.transitRoundTripSecFlightName == '')
                  ? tripDetail.transitRoundTripSecFlightNumber.toString()
                  : tripDetail.flightName != ''
                      ? tripDetail.flightName ?? ''
                      : tripDetail.flightNumber ?? '',
        ),
        ADSizedBox(
          height: context.k_60,
        ),
      ],
    ).paddingBySide(right: context.k_16);
  }
}
