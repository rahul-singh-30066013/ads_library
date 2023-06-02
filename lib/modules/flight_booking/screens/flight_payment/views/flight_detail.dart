/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const gerColorCode = Color(0xff444444);

class FlightDetail extends StatelessWidget {
  /// this is used to identify the type of trip.
  final TripType? tripType;

  /// this defines the full name of source city
  final String fromCityName;

  /// this defines the code of the source city like BLR for BANGALORE
  final String fromCityCode;

  /// this defines the full name of destination city
  final String toCityName;

  /// this defines the code of the destination city like BLR for BANGALORE
  final String toCityCode;

  /// this defines from date of flight
  final String fromDate;

  /// this defines to date of flight
  final String toDate;

  /// this defines passenger count
  final int passengerCount;

  /// on tap handler
  final ADTapCallback? onTapDetails;

  const FlightDetail({
    Key? key,
    required this.fromCityName,
    required this.fromCityCode,
    required this.toCityName,
    required this.toCityCode,
    required this.fromDate,
    required this.toDate,
    required this.passengerCount,
    required this.tripType,
    this.onTapDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapDetails,
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xffF5FAFF),
          borderRadius: BorderRadius.circular(context.k_4),
        ),
        padding: EdgeInsets.fromLTRB(
          context.k_16,
          context.k_14,
          context.k_14,
          context.k_16,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      fromCityName,
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    if (FlightUtils.isRoundTrip(tripType))
                      SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/round trip.svg',
                        height: context.k_16,
                        width: context.k_12,
                        color: context.adColors.darkGreyTextColor,
                        fit: BoxFit.cover,
                      )
                    else
                      SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/one way.svg',
                        height: context.k_10,
                        width: context.k_12,
                        color: context.adColors.darkGreyTextColor,
                        fit: BoxFit.cover,
                      ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      toCityName,
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ],
                ),
                ADSizedBox(
                  height: context.k_6,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    children: [
                      Text(
                        FlightUtils.isRoundTrip(tripType)
                            ? 'round_trip'.localize(context)
                            : 'one_way'.localize(context),
                        style: ADTextStyle400.size14.setTextColor(
                          gerColorCode,
                        ),
                      ),
                      ADSizedBox(
                        width: context.k_6,
                      ),
                      Text(
                        ' • $fromDate',
                        style: ADTextStyle400.size14.setTextColor(
                          gerColorCode,
                        ),
                      ),
                      if (toDate.isNotEmpty && tripType == TripType.roundTrip)
                        Text(
                          '- $toDate',
                          style: ADTextStyle400.size14.setTextColor(
                            gerColorCode,
                          ),
                        ),
                      ADSizedBox(
                        width: context.k_6,
                      ),
                      Text(
                        '• $passengerCount ${passengerCount > 1 ? 'travellers'.localize(context) : 'traveller'.localize(context)}',
                        style: ADTextStyle400.size14.setTextColor(
                          gerColorCode,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  'lib/assets/images/svg/icons/shopping/i_common.svg',
                  height: context.k_18,
                  width: context.k_18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
