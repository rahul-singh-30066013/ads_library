/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/show_in_progress.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// In this class, we are making a component to define the source and destination of the flight - it will call from review component.

class SourceDestinationBookingView extends StatelessWidget {
  final String source;
  final String destination;
  final String directionalId;
  final String pnrNo;
  final double fontSize15;
  final String? screenType;
  final String stoppage;
  final String journeyDuration;
  final String travelType;
  final bool isInternational;
  final String? orderStatus;

  const SourceDestinationBookingView({
    Key? key,
    required this.source,
    required this.destination,
    required this.directionalId,
    required this.pnrNo,
    required this.fontSize15,
    this.screenType,
    required this.stoppage,
    required this.journeyDuration,
    required this.travelType,
    required this.isInternational,
    this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (directionalId == 'O')
              Icon(
                Icons.flight_takeoff_outlined,
                size: context.k_20,
                color: context.adColors.neutralInfoMsg,
              )
            else
              SvgPicture.asset(
                'lib/assets/images/svg/icons/flight/return_flight.svg',
                color: Colors.black,
              ),
            ADSizedBox(
              width: context.k_8,
            ),
            Text(
              directionalId == 'O'
                  ? 'departing_flight'.localize(context)
                  : 'return_flight'.localize(context),
              style: ADTextStyle500.size16
                  .setTextColor(
                    context.adColors.blackTextColor,
                  )
                  .copyWith(fontSize: fontSize15),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Wrap(
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              source,
              style: ADTextStyle700.size22.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
            SizedBox(
              width: context.k_6,
            ),
            SvgPicture.asset(
              'lib/assets/images/svg/icons/flight/one way.svg',
              width: context.k_10,
            ),
            SizedBox(
              width: context.k_6,
            ),
            Text(
              destination,
              style: ADTextStyle700.size22.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isInternational)
              RichText(
                text: TextSpan(
                  text: travelType.localize(context),
                  style: ADTextStyle500.size14
                      .setTextColor(
                        context.adColors.blackTextColor,
                      )
                      .copyWith(fontSize: fontSize15),
                  children: [
                    TextSpan(
                      text: ' • ',
                      style: ADTextStyle500.size14
                          .setTextColor(
                            context.adColors.circleGreyTextColor,
                          )
                          .copyWith(fontSize: fontSize15),
                    ),
                  ],
                ),
              )
            else if (!isInternational)
              if (pnrNo.isNotEmpty && !pnrNo.contains('In Progress'))
                RichText(
                  text: TextSpan(
                    text: '${'pnr'.localize(context)} - $pnrNo',
                    style: ADTextStyle500.size14
                        .setTextColor(
                          context.adColors.blackTextColor,
                        )
                        .copyWith(fontSize: fontSize15),
                    children: [
                      TextSpan(
                        text: ' • ',
                        style: ADTextStyle500.size14
                            .setTextColor(
                              context.adColors.circleGreyTextColor,
                            )
                            .copyWith(fontSize: fontSize15),
                      ),
                    ],
                  ),
                )
              else
                screenType == null ||
                        screenType == 'flightList' ||
                        orderStatus?.toUpperCase() == 'FAILED' ||
                        orderStatus?.toUpperCase() == 'CANCELLED'|| orderStatus?.toUpperCase() == 'PENDING'
                    ? const SizedBox.shrink()
                    : ShowInProgress(
                        textToShowOnWidget:
                            'in_progress'.localize(context).toUpperCase(),
                        fontSize: fontSize15,
                        isInternational: isInternational,
                      ),
            /*else if (!isInternational &&
                pnrNo.isNotEmpty ||
                !pnrNo.contains('In Progress'))
              RichText(
                text: TextSpan(
                  text: '${'pnr'.localize(context)} - $pnrNo',
                  style: ADTextStyle500.size14
                      .setTextColor(
                        context.adColors.blackTextColor,
                      )
                      .copyWith(fontSize: fontSize15),
                  children: [
                    TextSpan(
                      text: ' • ',
                      style: ADTextStyle500.size14
                          .setTextColor(
                            context.adColors.circleGreyTextColor,
                          )
                          .copyWith(fontSize: fontSize15),
                    ),
                  ],
                ),
              )
            else if
              !isInternational &&pnrNo.isEmpty &&
                  pnrNo.contains('In Progress')&&
                      (screenType == null || screenType == 'flightList')
                  ? const SizedBox.shrink()
                  : ShowInProgress(
                      textToShowOnWidget:
                          'in_progress'.localize(context).toUpperCase(),
                      fontSize: fontSize15,
                    ),*/
            RichText(
              text: TextSpan(
                text: stoppage,
                style: ADTextStyle500.size14
                    .setTextColor(
                      context.adColors.blackTextColor,
                    )
                    .copyWith(fontSize: fontSize15),
                children: [
                  TextSpan(
                    text: ' • ',
                    style: ADTextStyle500.size14
                        .setTextColor(
                          context.adColors.circleGreyTextColor,
                        )
                        .copyWith(fontSize: fontSize15),
                  ),
                ],
              ),
            ),
            Text(
              // '02h 20m • ',
              journeyDuration,
              style: ADTextStyle500.size14
                  .setTextColor(
                    context.adColors.blackTextColor,
                  )
                  .copyWith(fontSize: fontSize15),
            ),
          ],
        ),
      ],
    ).paddingBySide(
      bottom: context.k_20,
    );
  }
}
