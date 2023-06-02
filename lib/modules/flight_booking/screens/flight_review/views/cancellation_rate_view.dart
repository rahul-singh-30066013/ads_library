/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class is retuning a row which consists of the time before which we are cancelling the booking and the price for cancellation.
class CancellationRateView extends StatelessWidget {
  final String time;
  final String price;

  const CancellationRateView({
    Key? key,
    required this.time,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            time.startsWith('#')
                ? (time
                    .replaceFirst('#', '')
                    .replaceAll('d', ' ${'d'.localize(context)}')
                    .replaceAll('h', ' ${'h'.localize(context)}')
                    .replaceFirst('-', ' - '))
                : time.localize(context),
            style: time.startsWith('#')
                ? ADTextStyle400.size14
                    .setTextColor(context.adColors.darkGreyTextColor)
                : ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor),
          ),
        ),
        Text(
          price,
          style: time.startsWith('#')
              ? ADTextStyle400.size14
                  .setTextColor(context.adColors.darkGreyTextColor)
              : ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_20,
      bottom: context.k_20,
    );
  }
}
