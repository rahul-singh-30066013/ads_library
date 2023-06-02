/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_order_confirmation_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This widget is used for upper thank you section for order confirmation page
class GenerateContentRow extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final String mobile;
  final Color color;
  GenerateContentRow({
    Key? key,
    required this.titleText,
    required this.subTitleText,
    required this.mobile,
    required this.color,
  }) : super(key: key);

  static const int flexValue = 3;
  final double fontHeight = 1.5.sp;
  final maxlineValue = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: flexValue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!titleText.isNullOrEmpty)
                Text(
                  titleText,
                  key: const Key(
                    DutyFreeOrderConfirmationAutomationKeys.titleText,
                  ),
                  style: ADTextStyle700.size28.setTextColor(color),
                ),
              ADSizedBox(
                height: context.k_8,
              ),
              if (!subTitleText.isNullOrEmpty)
                RichText(
                  maxLines: maxlineValue,
                  key: const Key(
                    DutyFreeOrderConfirmationAutomationKeys.subTitleEmailText,
                  ),
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: subTitleText,
                        style: ADTextStyle400.size14
                            .setTextColor(color)
                            .setFontHeight(fontHeight),
                      ),
                      TextSpan(
                        text: mobile,
                        style: ADTextStyle400.size14
                            .setTextColor(color)
                            .setFontHeight(fontHeight),
                      ),
                    ],
                  ),
                ),
              ADSizedBox(
                height: context.k_20,
              ),
            ],
          ).paddingBySide(
            left: context.k_6,
            right: context.k_6,
            bottom: context.k_16,
          ),
        ),
      ],
    );
  }
}
