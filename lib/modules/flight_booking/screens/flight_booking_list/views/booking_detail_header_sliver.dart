/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/circle_with_left_notification.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class BookingDetailHeaderSliver extends StatelessWidget {
  final double iconHeight = 68.sp;
  final double iconWidth = 72.sp;
  final double closeIconSize = 16.sp;
  final int maxLinesForText = 3;

  final String tripId;
  final String fromLocation;
  final String toLocation;
  final bool isOneway;

  BookingDetailHeaderSliver({
    Key? key,
    required this.tripId,
    required this.fromLocation,
    required this.toLocation,
    required this.isOneway,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$fromLocation ',
                      maxLines: maxLinesForText,
                      overflow: TextOverflow.clip,
                      style: ADTextStyle700.size18
                          .setTextColor(context.adColors.whiteTextColor),
                    ),
                    SvgPicture.asset(
                      isOneway
                          ? 'lib/assets/images/svg/icons/flight/one way.svg'
                          : 'lib/assets/images/svg/icons/flight/round trip.svg',
                      width: context.k_12,
                      color: white,
                    ).paddingBySide(
                      left: context.k_4,
                      right: context.k_4,
                    ),
                    Text(
                      ' $toLocation',
                      maxLines: maxLinesForText,
                      overflow: TextOverflow.clip,
                      style: ADTextStyle700.size18
                          .setTextColor(context.adColors.whiteTextColor),
                    ),
                  ],
                ).paddingBySide(top: context.k_64, bottom: context.k_8),
                Text(
                  '${'your_booking_id_is'.localize(context)} $tripId',
                  overflow: TextOverflow.clip,
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.whiteTextColor),
                ).paddingBySide(top: context.k_8, bottom: context.k_18),
              ],
            ),
          ),
        ],
      ).paddingBySide(
        left: context.k_16,
        right: context.k_16,
      ),
    );
  }
}
