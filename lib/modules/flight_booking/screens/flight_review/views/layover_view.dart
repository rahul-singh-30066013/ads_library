/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

/// [LayOverView] is used to show the layover time.
class LayOverView extends StatelessWidget {
  const LayOverView({Key? key, required this.layoverTime}) : super(key: key);

  final String layoverTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key(FlightAutomationKeys.layoverViewKey),
      padding: EdgeInsets.all(context.k_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.sp,
            width: context.k_64.sp,
            color: context.adColors.tileBorderColor,
          ),
          Text(
            '  ${'layover'.localize(context)}:$layoverTime  ',
            style: ADTextStyle400.size12.setTextColor(
              context.adColors.greyTextColor,
            ),
          ),
          Container(
            height: 1.sp,
            width: context.k_64.sp,
            color: context.adColors.tileBorderColor,
          ),
        ],
      ),
    );
  }
}
