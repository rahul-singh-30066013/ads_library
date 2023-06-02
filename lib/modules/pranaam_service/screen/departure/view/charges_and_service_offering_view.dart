/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double sizedBoxHeight = 27.sp;
const double iconSize = 7;

class ChargesAndServiceOfferingView extends StatelessWidget {
  final String typeOfDeparture;
  const ChargesAndServiceOfferingView({Key? key, required this.typeOfDeparture})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final List<String> serviceOfferings = [
      'Warm welcome by Pranaam Officer at the \ncurbside/car drop off zone',
      'Dedicated Pranaam Officer for assistance from \ncurbside till the boarding gate',
      'Dedicated porter for assistance with hand \nbaggage from curbside to the boarding gate',
      'Guidance through VIP/CIP lanes for \nSecurity Check',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          typeOfDeparture,
          style: ADTextStyle700.size22
              .setTextColor(context.adColors.blackTextColor),
        ),
        ADSizedBox(
          height: context.k_16,
        ),
        Text(
          'charges'.localize(context),
          style: ADTextStyle700.size18
              .setTextColor(context.adColors.blackTextColor),
        ),
        ADSizedBox(
          height: context.k_14,
        ),
        Text(
          'The applicable charges for booking Pranaam Elite Services at least 24 hours prior to the flight time are as below:',
          style: ADTextStyle400.size16,
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        // const CancellationPoliciesTable(),
        ADSizedBox(
          height: context.k_32,
        ),
        Text(
          'service_offering'.localize(context),
          style: ADTextStyle700.size18
              .setTextColor(context.adColors.blackTextColor),
        ),
        ADSizedBox(
          height: sizedBoxHeight,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: serviceOfferings.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: context.adColors.greyCircleColor,
                      size: iconSize,
                    ),
                    const ADSizedBox(
                      width: 15,
                    ),
                    Text(
                      serviceOfferings[index],
                      style: ADTextStyle400.size14,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
                const ADSizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
        Text(
          'read_more'.localize(context),
          style: ADTextStyle400.size16.copyWith(
            decoration: TextDecoration.underline,
          ),
        ).paddingBySide(left: context.k_20),
        const ADSizedBox(
          height: 50,
        ),
      ],
    );
  }
}
