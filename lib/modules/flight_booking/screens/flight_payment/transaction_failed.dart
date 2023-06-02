/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

// ignore: must_be_immutable
class TransactionFailed extends StatelessWidget {
  double buttonHeight = 52.sp;
  double fontHeight = 1.6;
  double fontSize = 14;
  double dividerThickness = 0.7;
  int maxLineForInformationMsg = 5;
  Color textColor = const Color(0xfff04c23);
  final String amount;
  final ADTapCallbackWithValue tapCallbackWithValue;
  final PaymentModule paymentModule;

  TransactionFailed({
    Key? key,
    required this.amount,
    required this.tapCallbackWithValue,
    required this.paymentModule,
  }) : super(key: key);

  String get failedText => paymentModule == PaymentModule.dutyFree
      ? 'transaction_failed_message_duty_free'
      : 'transaction_failed_message';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'lib/assets/images/svg/icons/flight/i_transaction_failed.svg',
              color: textColor,
              height: context.k_16,
            ).paddingBySide(top: context.k_8),
            Expanded(
              child: Text(
                failedText.localize(context),
                style: ADTextStyle400.size14
                    .setTextColor(
                      textColor,
                    )
                    .setFontHeight(fontHeight)
                    .setFontSize(fontSize),
                maxLines: maxLineForInformationMsg,
                textAlign: TextAlign.start,
              ).paddingBySide(
                left: context.k_10,
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
        ),
        Divider(
          height: 1,
          thickness: dividerThickness,
          color: context.adColors.dividerColor,
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
          top: context.k_30,
          bottom: context.k_30,
        ),
        Row(
          children: [
            Text(
              'to_pay'.localize(context),
              style: ADTextStyle500.size16.setTextColor(
                context.adColors.neutralInfoMsg,
              ),
            ),
            Text(
              amount,
              style: ADTextStyle600.size20.setTextColor(
                context.adColors.blackTextColor,
              ),
            ).paddingBySide(
              left: context.k_8,
            ),
          ],
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
          bottom: context.k_30,
        ),
        // buttons
        Divider(
          height: 1,
          thickness: dividerThickness,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(
                    0,
                    buttonHeight,
                  ),
                  side: BorderSide(
                    width: 1.sp,
                    color: context.adColors.blackTextColor,
                  ),
                  shape: const StadiumBorder(),
                ),
                onPressed: () => {
                  Navigator.pop(context, false),
                  tapCallbackWithValue(false),
                },
                child: Text(
                  'try_other'.localize(context),
                  style: ADTextStyle600.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: context.k_14,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    0,
                    buttonHeight,
                  ),
                  primary: context.adColors.blueColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () => {
                  Navigator.pop(context, false),
                  tapCallbackWithValue(true),
                },
                child: Text(
                  'retry'.localize(context),
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
                ),
              ),
            ),
          ],
        ).paddingBySide(
          top: context.k_10,
          bottom: context.k_10,
          left: context.k_20,
          right: context.k_20,
        ),
      ],
    );
  }
}
