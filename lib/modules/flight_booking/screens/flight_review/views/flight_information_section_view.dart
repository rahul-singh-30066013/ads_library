/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/flight_information_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This can be use in flight module only made with the use of [FlightInformationView].
class FlightInformationSectionView extends StatelessWidget {
  const FlightInformationSectionView({
    Key? key,
    required this.flightReviewDetailInfoDetails,
  }) : super(key: key);

  final List<FlightReviewDetailInfo> flightReviewDetailInfoDetails;

  ///This is used to make the transitVisa Text
  String get transitVisaText {
    final visaTexts = StringBuffer();
    for (final FlightReviewDetailInfo flightReviewDetailInfo
        in flightReviewDetailInfoDetails) {
      for (final JourneyFlightDetails object
          in flightReviewDetailInfo.journeyFlightDetails ?? []) {
        final transitText = object.transitVisaMessage ?? '';
        final isValid = transitText.isNotEmpty &&
            !visaTexts.toString().contains(transitText);
        if (visaTexts.isNotEmpty && isValid) {
          visaTexts.write('\n\n');
        }
        if (isValid) {
          visaTexts.write(object.transitVisaMessage ?? '');
        }
      }
    }
    return visaTexts.toString();
  }

  ///This is used to make the terminal and airport text for the important information.
  String terminalAirportChangeText(BuildContext context) {
    bool isTerminalChange = false;
    bool isAirportChange = false;

    for (final FlightReviewDetailInfo flightReviewDetailInfo
        in flightReviewDetailInfoDetails) {
      for (final JourneyFlightDetails object
          in flightReviewDetailInfo.journeyFlightDetails ?? []) {
        if ((object.isTerminalChange ?? false) && !isTerminalChange) {
          isTerminalChange = true;
        }
        if ((object.isAirportChange ?? false) && !isAirportChange) {
          isAirportChange = true;
        }
      }
    }

    final terminalTexts = StringBuffer();
    if (isTerminalChange) {
      terminalTexts.write(
        'terminal_change'.localize(context),
      );
    }
    if (isAirportChange) {
      if (terminalTexts.isNotEmpty) {
        terminalTexts.write('\n\n');
      }
      terminalTexts.write(
        'airport_change'.localize(context),
      );
    }
    return terminalTexts.toString();
  }

  @override
  Widget build(BuildContext context) {
    final terminalAirportText = terminalAirportChangeText(context);
    return Column(
      children: [
        if (terminalAirportText.isNotEmpty)
          FlightInformationView(
            tagName: 'important'.localize(context),
            tagMessage: terminalAirportText,
          ),
        if (terminalAirportText.isNotEmpty)
          SizedBox(
            height: context.k_10,
          ),
        if (transitVisaText.isNotEmpty)
          FlightInformationView(
            tagName: 'visa'.localize(context),
            tagMessage: transitVisaText,
          ),
        if (transitVisaText.isNotEmpty)
          SizedBox(
            height: context.k_10,
          ),
        if (transitVisaText.isNotEmpty || terminalAirportText.isNotEmpty)
          SizedBox(
            height: context.k_10,
          ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}
