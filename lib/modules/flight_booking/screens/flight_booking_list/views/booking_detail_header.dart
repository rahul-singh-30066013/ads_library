/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class BookingDetailHeader extends StatelessWidget {
  final double iconHeight = 68.sp;
  final double iconWidth = 72.sp;
  final double closeIconSize = 16.sp;
  final int maxLinesForText = 3;

  final String emailId;
  final String phoneNumber;
  final String tripId;
  final String toFrom;

  BookingDetailHeader({
    Key? key,
    required this.emailId,
    required this.phoneNumber,
    required this.tripId,
    required this.toFrom,
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
                Text(
                  '${'your_flight_to'.localize(context)} $toFrom',
                  maxLines: maxLinesForText,
                  overflow: TextOverflow.clip,
                  style: ADTextStyle700.size18
                      .setTextColor(context.adColors.whiteTextColor),
                ).paddingBySide(top: context.k_64, bottom: context.k_8),
                Text(
                  'booking_confirmation_message_description'
                      .localize(context)
                      .replaceFirst('#-emailId-#', emailId)
                      .replaceFirst('#-phoneNumber-#', phoneNumber),
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
