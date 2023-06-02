/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double imageWidth = 100.sp;
final double imageHeight = 100.sp;
const int flexValue = 3;

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    Key? key,
    required this.title,
    this.subTitle,
    required this.phoneNumber,
    required this.email,
    this.backgroundColor,
    this.lottiePath,
    this.bookingStatus,
  }) : super(key: key);

  final String title;
  final String? subTitle;
  final String phoneNumber;
  final String email;
  final Color? backgroundColor;
  final String? lottiePath;
  final String? bookingStatus;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final double positionedTopPadding = -16.sp;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.k_16),
              width: double.infinity,
              color: backgroundColor ?? context.adColors.greenColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: flexValue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: ADTextStyle700.size24
                              .setTextColor(context.adColors.whiteTextColor),
                        ),
                        SizedBox(
                          height: context.k_10,
                        ),
                        Text(
                          subTitle ?? '',
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.whiteTextColor),
                        ),
                        ADSizedBox(
                          height: context.k_4,
                        ),
                        Text(
                          '$email${'and'.localize(context)}',
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.whiteTextColor),
                        ),
                        ADSizedBox(
                          height: context.k_4,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'sms_sent_to'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                              TextSpan(
                                text: phoneNumber,
                                style: ADTextStyle500.size14.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.k_19,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: positionedTopPadding,
              right: 0,
              child: Lottie.asset(
                lottiePath ?? '',
                width: imageWidth,
                height: imageHeight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}