/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/booking_detail_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// show flight segment list related view
class ShowBookingDetailList extends StatelessWidget {
  const ShowBookingDetailList({
    Key? key,
    required this.flightReviewDetailInfo,
    required this.tripType,
    required this.reviewScreenType,
    required this.isInternational,
    required this.miniRuleDisplayModel,
  }) : super(key: key);
  final List<FlightReviewDetailInfo> flightReviewDetailInfo;
  final String tripType;
  final ReviewScreenType reviewScreenType;
  final bool isInternational;
  final MiniRuleDisplayModel miniRuleDisplayModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: flightReviewDetailInfo.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final FlightReviewDetailInfo flightReviewDetailInfoItem =
            flightReviewDetailInfo[index];
        return BookingDetailView(
          tripType: tripType == 'O' ? TripType.oneWay : TripType.roundTrip,
          flightReviewDetailInfoItem: flightReviewDetailInfoItem,
          screenType: reviewScreenType == ReviewScreenType.flightPayment
              ? null
              : reviewScreenType.name.toString(),
          isInternational: isInternational,
          miniRuleDisplayModel: miniRuleDisplayModel,
        ).paddingBySide(
          bottom: index == flightReviewDetailInfo.length - 1 ? 0 : context.k_30,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: context.k_8,
          thickness: context.k_8,
          color: context.adColors.containerGreyBg,
        ).paddingBySide(
          top: context.k_10,
          bottom: context.k_40,
        );
      },
    );
  }
}
