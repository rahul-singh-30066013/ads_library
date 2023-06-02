/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/cached_image/ad_cached_image.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this is use for flight address destination and source and time
class FlightSourceDestinationAddress extends StatefulWidget {
  /// this is flight source address
  final String? flightSourceAddress;

  /// this is flight source time
  final String? flightSourceTime;

  /// this is flight source day and date
  final String? flightSourceDayAndDate;

  /// this is flight destination address
  final String? flightDestinationAddress;

  /// this is flight destination time
  final String? flightDestinationTime;

  /// this is flight destination day and date
  final String? flightDestinationDayAndDate;

  final String? imageIconFlight;

  final FlightReviewDetailInfo? flightSegmentData;

  static const int maxLineForAirlineName = 2;

  const FlightSourceDestinationAddress({
    Key? key,
    this.flightSourceAddress,
    this.flightSourceTime,
    this.flightSourceDayAndDate,
    this.flightDestinationAddress,
    this.flightDestinationTime,
    this.flightDestinationDayAndDate,
    this.imageIconFlight,
    this.flightSegmentData,
  }) : super(key: key);

  @override
  State<FlightSourceDestinationAddress> createState() =>
      _FlightSourceDestinationAddressState();
}

class _FlightSourceDestinationAddressState
    extends State<FlightSourceDestinationAddress> {
  int len = 0;
  double topPadding = 7.sp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ADSizedBox(
          width: context.k_48,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(context.k_4),
                child: SizedBox(
                  width: context.k_24,
                  height: context.k_24,
                  child: ADCachedImage(
                    imageUrl: widget.flightSegmentData?.journeyFlightDetails
                            ?.first.airLineIcon ??
                        '',
                    placeHolderSize: context.k_24,
                  ),
                ),
              ),
              Text(
                widget.flightSegmentData?.journeyFlightDetails?.first
                        .airLineName ??
                    '',
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.greyTextColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ).paddingBySide(top: topPadding),
            ],
          ),
        ),
        ADSizedBox(
          width: context.k_18,
        ),
        FlightTimeAddress(
          flightAddress:
              widget.flightSegmentData?.passengerJourneyInfo?.fromLocation ??
                  '',
          flightTime: widget.flightSegmentData?.journeyFlightDetails?.first
                  .flightDepartureTime ??
              '',
          flightDayAndDate: widget.flightSegmentData?.journeyFlightDetails
                  ?.first.flightDepartureDate ??
              '',
        ),
        SizedBox(
          width: context.k_12,
        ),
        SvgPicture.asset(
          'lib/assets/images/svg/icons/flight/left_arrow.svg',
          color: context.adColors.darkGreyTextColor,
          fit: BoxFit.cover,
          height: context.k_8,
          alignment: Alignment.topCenter,
        ).paddingBySide(bottom: context.k_22),
        SizedBox(
          width: context.k_12,
        ),
        FlightTimeAddress(
          flightAddress:
              widget.flightSegmentData?.passengerJourneyInfo?.toLocation ?? '',
          flightTime: widget.flightSegmentData?.journeyFlightDetails?.last
                  .flightArrivalTime ??
              '',
          flightDayAndDate: widget.flightSegmentData?.journeyFlightDetails?.last
                  .flightArrivalDate ??
              '',
        ),
      ],
    ).paddingBySide(
      top: context.k_16,
      bottom: context.k_16,
      left: context.k_16,
    );
  }
}

/// this is use for particular item address detail and time
class FlightTimeAddress extends StatelessWidget {
  /// this is use for both flight address
  final String flightAddress;

  /// this is use for both flight time
  final String flightTime;

  /// this is use for both flight day and time
  final String flightDayAndDate;

  const FlightTimeAddress({
    Key? key,
    required this.flightAddress,
    required this.flightTime,
    required this.flightDayAndDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              flightAddress,
              style: ADTextStyle400.size18
                  .setTextColor(context.adColors.greyTextColor),
            ),
            ADSizedBox(
              width: context.k_6,
            ),
            Text(
              flightTime,
              style: ADTextStyle700.size18.setTextColor(context.adColors.black),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Text(
          flightDayAndDate,
          style: ADTextStyle400.size12
              .setTextColor(context.adColors.greyTextColor),
        ),
      ],
    );
  }
}
