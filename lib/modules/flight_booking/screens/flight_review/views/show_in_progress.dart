/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class is used to show text with orange bg
/// [textToShowOnWidget] is used to show text.

//this will show in progress pnr widget
class ShowInProgress extends StatelessWidget {
  const ShowInProgress({
    this.textToShowOnWidget,
    this.inProgressBgColor = const Color(0xffeb9845),
    required this.fontSize,
    required this.isInternational,
    Key? key,
  }) : super(key: key);
  final String? textToShowOnWidget;
  final Color? inProgressBgColor;
  final double fontSize;
  final bool isInternational;
  @override
  Widget build(BuildContext context) {
    const double fontSizeInProgress = 11;
    const inProgressOpacity = 0.07;
    return textToShowOnWidget != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'pnr'.localize(context),
                style: ADTextStyle500.size14
                    .setTextColor(
                      context.adColors.neutralInfoMsg,
                    )
                    .copyWith(fontSize: fontSize),
              ),
              SizedBox(
                width: context.k_6,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.k_8,
                  vertical: context.k_4,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: inProgressBgColor?.withOpacity(inProgressOpacity),
                ),
                child: Text(
                  textToShowOnWidget ?? '',
                  style: ADTextStyle700.size12
                      .setTextColor(
                        inProgressBgColor ?? const Color(0xffeb9845),
                      )
                      .copyWith(fontSize: fontSizeInProgress),
                ),
              ),
              /*Container(
                padding: EdgeInsets.only(
                  left: context.k_10,
                  right: context.k_10,
                  top: context.k_2,
                  bottom: context.k_2,
                ),
                decoration: BoxDecoration(
                  color: inProgressBgColor?.withOpacity(inProgressOpacity),
                  borderRadius: BorderRadius.circular(context.k_12),
                ),
                child: Text(
                  textToShowOnWidget ?? '',
                  style: ADTextStyle700.size12
                      .setTextColor(
                        inProgressBgColor ?? const Color(0xffeb9845),
                      )
                      .copyWith(fontSize: fontSizeInProgress),
                ),
              ),*/
              Text(
                isInternational ? '' : ' • ',
                style: ADTextStyle500.size14
                    .setTextColor(
                      context.adColors.circleGreyTextColor,
                    )
                    .copyWith(fontSize: fontSize),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
