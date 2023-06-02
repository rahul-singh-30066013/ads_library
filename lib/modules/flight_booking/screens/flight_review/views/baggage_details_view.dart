/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/baggage_and_cancellation_policies_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/baggage_tab_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// [BaggageDetailsView] is used to show your baggage of cabin and check-in.
class BaggageDetailsView extends StatelessWidget {
  const BaggageDetailsView({
    required this.cabinWeight,
    required this.checkInWeight,
    required this.newFontSize,
    this.baggageInfoNote,
    this.miniRuleDisplayModel,
    this.screenType,
    this.flightReviewDetailModel,
    Key? key,
  }) : super(key: key);

  /// this defines weight of bag you can carry in cabin.
  final String cabinWeight;

  /// this defines weight of the check-in bag.
  final String checkInWeight;

  final double newFontSize;

  /// this is use for showing not in baggage and cancellation
  final String? baggageInfoNote;
  final MiniRuleDisplayModel? miniRuleDisplayModel;
  final String? screenType;

  final FlightReviewDetailModel? flightReviewDetailModel;

  @override
  Widget build(BuildContext context) {
    return !checkInWeight.isNullOrEmpty && !cabinWeight.isNullOrEmpty
        ? Column(
            key: const Key(FlightAutomationKeys.baggageDetailKey),
            children: [
              Divider(
                thickness: 1.sp,
                height: context.k_30,
              ),
              if (!checkInWeight.isNullOrEmpty)
                Row(
                  children: [
                    Text(
                      '${'checking_baggage'.localize(context)} - ',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.greyTextColor)
                          .copyWith(fontSize: newFontSize),
                    ),
                    if ((baggageInfoNote ?? '').isNotEmpty)
                      InkWell(
                        onTap: () => showBaggageCancellationView(
                          context: context,
                          screenType: screenType ?? '',
                          flightReviewDetailModel: flightReviewDetailModel,
                        ),

                        /// this is use for when checkInBaggage and checkInWeight
                        child: Text(
                          'knowMore'.localize(context),
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.greyTextColor)
                              .copyWith(fontSize: newFontSize)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      )
                    else
                      Text(
                        checkInWeight,
                        style: ADTextStyle700.size16
                            .setTextColor(context.adColors.greyTextColor)
                            .copyWith(fontSize: newFontSize),
                      ),
                    ADSizedBox(
                      width: context.k_4,
                    ),
                  ],
                ),
              if (!checkInWeight.isNullOrEmpty)
                ADSizedBox(
                  height: context.k_6,
                ),
              if (!cabinWeight.isNullOrEmpty)
                Row(
                  children: [
                    Text(
                      '${'cabin_baggage'.localize(context)} - ',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.greyTextColor)
                          .copyWith(fontSize: newFontSize),
                    ),
                    if ((baggageInfoNote ?? '').isNotEmpty)
                      InkWell(
                        onTap: () => showBaggageCancellationView(
                          context: context,
                          screenType: screenType ?? '',
                          flightReviewDetailModel: flightReviewDetailModel,
                        ),
                        child: Text(
                          'knowMore'.localize(context),
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.greyTextColor)
                              .copyWith(fontSize: newFontSize)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      )
                    else
                      Text(
                        cabinWeight,
                        style: ADTextStyle700.size16
                            .setTextColor(context.adColors.greyTextColor)
                            .copyWith(fontSize: newFontSize),
                      ),
                  ],
                ),
            ],
          )
        : const SizedBox.shrink();
  }

  // //to show baggage view -mini rule
  void showBaggageCancellationView({
    required BuildContext context,
    required String screenType,
    FlightReviewDetailModel? flightReviewDetailModel,
  }) {
    if (screenType.isNotEmpty &&
        screenType == 'flightBookingConfirmation' &&
        miniRuleDisplayModel == null) {
      final List<BaggageMiniRule> baggageMiniRuleList = [];
      final List<FlightReviewDetailInfo> flightReviewDetailInfo =
          flightReviewDetailModel?.flightReviewDetailInfo ?? [];
      if (flightReviewDetailInfo.isNotEmpty) {
        for (int detailInfoItem = 0;
            detailInfoItem < flightReviewDetailInfo.length;
            detailInfoItem++) {
          final FlightReviewDetailInfo reviewDetailInfoItem =
              flightReviewDetailInfo[detailInfoItem];
          final PassengerJourneyInfo? passengerJourneyInfo =
              reviewDetailInfoItem.passengerJourneyInfo;
          final List<JourneyFlightDetails> journeyFlightDetails =
              reviewDetailInfoItem.journeyFlightDetails ?? [];
          String fromLocation = '';
          String toLocation = '';
          final List<BaggageInfo> baggageInfoList = [];
          fromLocation = passengerJourneyInfo?.fromLocation ?? '';
          toLocation = passengerJourneyInfo?.toLocation ?? '';
          if (journeyFlightDetails.isNotEmpty) {
            for (int journeyInfoItem = 0;
                journeyInfoItem < journeyFlightDetails.length;
                journeyInfoItem++) {
              final BaggageInfo baggageInfoItem = BaggageInfo(
                fromLocationCode: journeyFlightDetails[journeyInfoItem]
                    .flightDepartureCityCode,
                toLocationCode:
                    journeyFlightDetails[journeyInfoItem].flightArrivalCityCode,
                airlineCode:
                    journeyFlightDetails[journeyInfoItem].airLineNumber,
                airlineName: journeyFlightDetails[journeyInfoItem].airLineName,
                baggageInfoNote:
                    journeyFlightDetails[journeyInfoItem].baggageInfoNote,
              );
              baggageInfoList.add(baggageInfoItem);
            }
          }
          baggageMiniRuleList.add(
            BaggageMiniRule(
              fromLocationCity: fromLocation,
              toLocationCity: toLocation,
              baggageInfoList: baggageInfoList,
            ),
          );
        }
      }
      adShowBottomSheet(
        context: context,
        childWidget: BaggageTabView(
          baggageMiniRuleList: baggageMiniRuleList,
        ),
        headerTitle: 'baggage_policy'.localize(context),
      );
    } else {
      adShowBottomSheet(
        context: context,
        childWidget: BaggageAndCancellationPoliciesScreen(
          miniRuleDisplayModel: miniRuleDisplayModel,
        ),
        headerTitle: 'baggage_and_cancellation_policy'.localize(context),
      );
    }
  }
}
