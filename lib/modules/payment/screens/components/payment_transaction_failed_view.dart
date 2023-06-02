/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class PaymentTransactionFailedView extends StatelessWidget {
  const PaymentTransactionFailedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_12,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_16,
      ),
      width: context.widthOfScreen,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(
          color: const Color(0xffffcfca),
          width: 1,
        ),
        color: const Color(0xfffef4f3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'lib/assets/images/common/payment_failed.svg',
            width: context.k_16,
            height: context.k_16,
          ),
          SizedBox(
            width: context.k_8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'payment_failed'.localize(context),
                  style: ADTextStyle600.size14
                      .setTextColor(context.adColors.errorInfoMsg),
                ),
                SizedBox(
                  height: context.k_4,
                ),
                Text(
                  'we_are_unable_to_process_your_payment_please_try_again'
                      .localize(context),
                  style: ADTextStyle400.size12
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
