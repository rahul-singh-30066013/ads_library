/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabConfirmationStripView extends StatelessWidget {
  final String time;

  const CabConfirmationStripView({Key? key, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int offWhiteStripeColor = 0xfffef6ea;
    const int circleContainerColors = 0xff239fdb;
    return Container(
      decoration: BoxDecoration(
        color: const Color(offWhiteStripeColor),
        borderRadius: BorderRadius.all(
          Radius.circular(context.k_8),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: context.k_30,
            width: context.k_30,
            decoration: const BoxDecoration(
              color: Color(circleContainerColors),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                SvgAssets.taxiIcon,
                color: context.adColors.whiteTextColor,
                width: context.k_15,
              ),
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'cab_driver_details_will_be_shared'.localize(context),
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.filterBlackText),
                children: [
                  TextSpan(
                    text: time,
                    style: ADTextStyle600.size16
                        .setTextColor(context.adColors.filterBlackText),
                  ),
                  TextSpan(
                    text: 'before_the_ride'.localize(context),
                    style: ADTextStyle400.size16
                        .setTextColor(context.adColors.filterBlackText),
                  ),
                ],
              ),
            ).paddingBySide(left: context.k_12),
          ),
        ],
      ).paddingBySide(
        right: context.k_16,
        left: context.k_16,
        top: context.k_14,
        bottom: context.k_14,
      ),
    );
  }
}
