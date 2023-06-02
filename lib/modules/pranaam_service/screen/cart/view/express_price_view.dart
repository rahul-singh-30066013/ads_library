/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ExpressPriceView extends StatelessWidget {
  final double heightOfExpressPriceViewContainer = 48.sp;

  static const offWhite = Color(0xfffef6ea);

  ExpressPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: context.k_16,
        right: context.k_16,
        bottom: context.k_20,
      ),
      height: heightOfExpressPriceViewContainer,
      color: offWhite,
      child: Row(
        children: [
          ADSizedBox(
            width: context.k_14,
          ),
          const Icon(Icons.info_outline),
          ADSizedBox(
            width: context.k_8,
          ),
          RichText(
            text: TextSpan(
              text: 'surge_in_prices_due_to'.localize(context),
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.blackTextColor),
              children: [
                TextSpan(
                  text: ' ${'express_entry'.localize(context)}',
                  style: ADTextStyle700.size14
                      .setTextColor(context.adColors.blackTextColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
