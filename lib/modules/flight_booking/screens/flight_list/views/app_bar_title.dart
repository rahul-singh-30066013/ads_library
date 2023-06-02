/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// build the title of app bar in flight listing screen
class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.flightBookingModel,
    this.isFlightLoadingAnimation = false,
  }) : super(key: key);

  final FlightBookingModel? flightBookingModel;

  final bool isFlightLoadingAnimation;

  static const double _circleRadius = 2;

  String get traveller => (flightBookingModel?.travellers?.totalTravellers ??
              0) >
          1
      ? '${(flightBookingModel?.travellers?.totalTravellers) ?? 1} Travellers'
      : '${flightBookingModel?.travellers?.totalSeatTravellers ?? 1} Traveller';

  @override
  Widget build(BuildContext context) {
    final selectedTravelClass = flightBookingModel?.travellers
        ?.travelClassToDisplay()
        .localize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: isFlightLoadingAnimation
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text(
              ///TODO: Fix using validateDefaultValue method
              flightBookingModel?.oneWayTrip?.fromCity?.cityName ?? '',
              style: ADTextStyle700.size16.setTextColor(
                context.adColors.neutralInfoMsg,
              ),
            ),
            ADSizedBox(width: context.k_6),
            if (FlightUtils.isOnewayTrip(flightBookingModel?.tripType))
              SvgPicture.asset(
                'lib/assets/images/svg/icons/flight/one way.svg',
                height: context.k_8,
                color: context.adColors.darkGreyTextColor,
              )
            else
              SvgPicture.asset(
                'lib/assets/images/svg/icons/flight/round trip.svg',
                height: context.k_14,
                color: context.adColors.darkGreyTextColor,
              ),
            ADSizedBox(width: context.k_6),
            Flexible(
              child: Text(
                ///TODO: Fix using validateDefaultValue method
                flightBookingModel?.oneWayTrip?.toCity?.cityName ?? '',
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.neutralInfoMsg),
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: isFlightLoadingAnimation ? context.k_10 : context.k_4,
        ),
        Row(
          mainAxisAlignment: isFlightLoadingAnimation
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text(
              _getDate(),
              style: isFlightLoadingAnimation
                  ? ADTextStyle400.size12
                      .setTextColor(context.adColors.greyTextColor)
                  : ADTextStyle400.size14
                      .setTextColor(context.adColors.greyTextColor),
            ),
            CircleAvatar(
              radius: _circleRadius,
              backgroundColor: context.adColors.circleGreyTextColor,
            ).paddingBySide(left: context.k_4, right: context.k_4),
            Text(
              traveller,
              style: isFlightLoadingAnimation
                  ? ADTextStyle400.size12
                      .setTextColor(context.adColors.greyTextColor)
                  : ADTextStyle400.size14
                      .setTextColor(context.adColors.greyTextColor),
            ),
            CircleAvatar(
              radius: _circleRadius,
              backgroundColor: context.adColors.circleGreyTextColor,
            ).paddingBySide(left: context.k_4, right: context.k_4),
            Flexible(
              child: Text(
                selectedTravelClass ?? '',
                style: isFlightLoadingAnimation
                    ? ADTextStyle400.size12
                        .setTextColor(context.adColors.greyTextColor)
                    : ADTextStyle400.size14
                        .setTextColor(context.adColors.greyTextColor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getDate() {
    return FlightUtils.isOnewayTrip(flightBookingModel?.tripType)
        ? DateFormat(Constant.dateFormat2)
            .format(flightBookingModel?.oneWayTrip?.date ?? DateTime.now())
        : '${DateFormat(Constant.dateFormat10).format(
            flightBookingModel?.oneWayTrip?.date ?? DateTime.now(),
          )} - ${DateFormat(Constant.dateFormat10).format(flightBookingModel?.roundTrip?.date ?? DateTime.now())}';
  }
}
