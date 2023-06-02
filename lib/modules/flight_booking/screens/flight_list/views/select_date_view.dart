/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// this class will return the a view for departure and arrival along with hint (based on you passed).
class SelectDateView extends StatelessWidget {
  ///*[travelType] is used the show the hint of the view
  final String travelType;

  ///*[dateTime] is used the show the selected date.
  final DateTime? dateTime;

  ///*[crossAxisAlignment] is used to content on view by given alignment.
  final CrossAxisAlignment? crossAxisAlignment;

  /// required in case of return trip when date is selected
  final bool isCrossIconEnabled;

  final Function()? onCrossTap;

  const SelectDateView({
    Key? key,
    required this.travelType,
    this.dateTime,
    this.crossAxisAlignment,
    this.isCrossIconEnabled = false,
    this.onCrossTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isCrossIconEnabled ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isCrossIconEnabled)
                  IconButton(
                    constraints:
                        BoxConstraints.tight(Size(context.k_40, context.k_18)),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    iconSize: context.k_20,
                    onPressed: onCrossTap,
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                Text(
                  travelType,
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.greyTextColor),
                  key: const Key(FlightAutomationKeys.travelDateType),
                ),
              ],
            ),
            Text(
              getFormattedDateTime().startsWith('0')
                  ? getFormattedDateTime().replaceFirst('0', '')
                  : getFormattedDateTime(),
              style: ADTextStyle500.size20.setTextColor(context.adColors.black),
              key: const Key(FlightAutomationKeys.travelDate),
            ).paddingBySide(
              top: context.k_6,
            ),
          ],
        ),
      ],
    ).paddingBySide(
      top: context.k_16,
      bottom: context.k_16,
      left: context.k_16,
      right: crossAxisAlignment == CrossAxisAlignment.start ? 0 : context.k_16,
    );
  }

  String getFormattedDateTime() {
    return DateFormat(Constant.dateFormat2).format(dateTime ?? DateTime.now());
  }
}
