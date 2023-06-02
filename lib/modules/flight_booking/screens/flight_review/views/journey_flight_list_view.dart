/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/baggage_details_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/flight_review_detail_item_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/show_in_progress.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// In this class, we are making a component to show list for flight segment available for current itinerary.

class JourneyFlightListView extends StatelessWidget {
  final double fontSize15;
  final List<JourneyFlightDetails> journeyFlightDetails;
  final List<FlightBaggageDetails> flightBaggageDetails;
  final PassengerJourneyInfo? passengerJourneyInfo;
  final String pnrNo;
  final bool isInternational;
  final String? screenType;
  final MiniRuleDisplayModel? miniRuleDisplayModel;
  final FlightReviewDetailModel? flightReviewDetailModel;
  final String? orderStatus;

  const JourneyFlightListView({
    Key? key,
    required this.fontSize15,
    required this.journeyFlightDetails,
    required this.flightBaggageDetails,
    this.passengerJourneyInfo,
    required this.pnrNo,
    required this.isInternational,
    this.screenType,
    this.miniRuleDisplayModel,
    this.flightReviewDetailModel,
    this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String travelType = passengerJourneyInfo?.travelClass ?? '';
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: journeyFlightDetails.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final JourneyFlightDetails journeyFlightDetailsItems =
            journeyFlightDetails[index];
        final FlightBaggageDetails flightCabinBaggageData =
            flightBaggageDetails[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.k_4),
                  child: SizedBox(
                    width: context.k_32,
                    height: context.k_32,
                    child: ADCachedImage(
                      imageUrl: journeyFlightDetailsItems.airLineIcon,
                      placeHolderSize: context.k_32,
                    ),
                  ),
                ),
                ADSizedBox(
                  width: context.k_4,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: ADTextStyle600.size14
                            .copyWith(fontSize: fontSize15),
                        text: '  ${journeyFlightDetailsItems.airLineName}',
                      ),
                      TextSpan(
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.greyTextColor)
                            .copyWith(fontSize: fontSize15),
                        text:
                            '  \n  ${journeyFlightDetailsItems.airLineNumber}',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (!isInternational && travelType.isNotEmpty)
                  Text(
                    travelType.localize(context),
                    style: ADTextStyle400.size14
                        .setTextColor(
                          context.adColors.greyTextColor,
                        )
                        .copyWith(fontSize: fontSize15),
                  ),
                if (isInternational)
                  if (journeyFlightDetailsItems.pnrCode.isNotEmpty &&
                      !journeyFlightDetailsItems.pnrCode
                          .contains('In Progress') &&
                      orderStatus?.toUpperCase() != 'FAILED')
                    RichText(
                      text: TextSpan(
                        text:
                            '${'pnr'.localize(context)} - ${journeyFlightDetailsItems.pnrCode}',
                        style: ADTextStyle400.size14
                            .setTextColor(
                              context.adColors.blackTextColor,
                            )
                            .copyWith(fontSize: fontSize15),
                        children: [
                          TextSpan(
                            text: '\n',
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
                            orderStatus?.toUpperCase() == 'CANCELLED' || orderStatus?.toUpperCase() == 'PENDING'
                        ? const SizedBox.shrink()
                        : ShowInProgress(
                            textToShowOnWidget:
                                'in_progress'.localize(context).toUpperCase(),
                            fontSize: fontSize15,
                            isInternational: isInternational,
                          ).paddingBySide(
                            bottom: context.k_12,
                          ),
              ],
            ),
            ADSizedBox(
              height: journeyFlightDetailsItems.isOperatedByDifferentAirline
                  ? context.k_16
                  : context.k_8,
            ),
            if (!journeyFlightDetailsItems.isOperatedByDifferentAirline)
              Text(
                '${'lbl_operated_by'.localize(context)}${journeyFlightDetailsItems.operatedAirline}',
                style: ADTextStyle400.size12,
              ),
            if (!journeyFlightDetailsItems.isOperatedByDifferentAirline)
              ADSizedBox(
                height: context.k_16,
              ),
            FlightReviewDetailItemView(
              journeyFlightDetailsItems: journeyFlightDetailsItems,
              newFontSize: fontSize15,
            ),
            ADSizedBox(
              height: context.k_10,
            ),
            BaggageDetailsView(
              cabinWeight: flightCabinBaggageData.cabinBaggageWeight.isNotEmpty
                  ? flightCabinBaggageData.cabinBaggageWeight
                  : 'NA',
              checkInWeight:
                  flightCabinBaggageData.checkInBaggageWeight.isNotEmpty
                      ? flightCabinBaggageData.checkInBaggageWeight
                      : 'NA',
              newFontSize: fontSize15,
              baggageInfoNote: flightCabinBaggageData.baggageInfoNote,
              miniRuleDisplayModel: miniRuleDisplayModel,
              screenType: screenType,
              flightReviewDetailModel: flightReviewDetailModel,
            ),
            // if(screenType!=null&&screenType !='flightPayment' )
            Divider(
              thickness: 1.sp,
              height: 1.sp,
            ).paddingBySide(top: context.k_15, bottom: context.k_10),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return ShowLayoverViewView(
          stoppage: passengerJourneyInfo?.stoppage ?? '',
          journeyFlightDetails: journeyFlightDetails,
          index: index,
        );
      },
    );
  }
}

// this will show layover view, only called from above class
class ShowLayoverViewView extends StatelessWidget {
  final String stoppage;
  final List<JourneyFlightDetails> journeyFlightDetails;
  final int index;
  const ShowLayoverViewView({
    Key? key,
    required this.stoppage,
    required this.journeyFlightDetails,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double planeChangeFontSize = 11;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
        Container(
          height: context.k_56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.k_28),
            border: Border.all(
              color: context.adColors.dividerColor,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (stoppage != '0')
                    RichText(
                      text: TextSpan(
                        children: [
                          if (journeyFlightDetails[index].layoverType == '1')
                            WidgetSpan(
                              child: SvgPicture.asset(
                                'lib/assets/images/svg/icons/flight/long_layover.svg',
                                height: context.k_14,
                                color: context.adColors.greyTextColor,
                              ).paddingBySide(
                                right: context.k_6,
                              ),
                            ),
                          if (journeyFlightDetails[index].layoverType == '0')
                            WidgetSpan(
                              child: SvgPicture.asset(
                                'lib/assets/images/svg/icons/flight/short_layover.svg',
                                color: context.adColors.greyTextColor,
                                height: context.k_14,
                              ).paddingBySide(
                                right: context.k_6,
                              ),
                            ),
                          TextSpan(
                            text: journeyFlightDetails[index].layoverType == '1'
                                ? 'long_layover'.localize(context)
                                : journeyFlightDetails[index].layoverType == '0'
                                    ? 'short_layover'.localize(context)
                                    : '',
                            style: ADTextStyle500.size12.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Text(
                    stoppage == '0'
                        ? ''
                        : ' ${journeyFlightDetails[index].flightArrivalCityName}, ${journeyFlightDetails[index].flightLayoverDuration}',
                    style: ADTextStyle500.size12.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              if (stoppage == '0')
                const SizedBox.shrink()
              else
                Text(
                  journeyFlightDetails[index].isPlaneChange
                      ? 'plane_change'.localize(context)
                      : 'layover_deboarding'.localize(context),
                  style: ADTextStyle400.size12
                      .setTextColor(
                        context.adColors.blackTextColor,
                      )
                      .copyWith(fontSize: planeChangeFontSize),
                ).paddingBySide(top: context.k_4),
            ],
          ).paddingBySide(
            left: context.k_30,
            right: context.k_30,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
          ),
        ),
      ],
    ).paddingBySide(
      top: context.k_20,
      bottom: context.k_30,
    );
  }
}
