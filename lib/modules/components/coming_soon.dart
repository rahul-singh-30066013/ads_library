/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

final fontSize = 9.sp;

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    Key? key,
    this.tagName,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  final String? tagName;
  final String? textColor;
  final String? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final hasTagNameLength = tagName?.trim().isNotEmpty ?? false;
    return Container(
      padding: EdgeInsets.only(
        left: context.k_6,
        right: context.k_6,
        top: context.k_4,
        bottom: context.k_4,
      ),
      decoration: BoxDecoration(
        color: tagName != null
            ? (hasTagNameLength
                ? Color(
                    int.parse(
                      (backgroundColor?.isNotEmpty ?? false)
                          ? backgroundColor.toString()
                          : '0xFFFFD866',
                    ),
                  )
                : null)
            : Color(int.parse('0xFFFFD866')),
        borderRadius: BorderRadius.all(
          Radius.circular(context.k_8),
        ),
      ),
      child: Text(
        (tagName?.isNotEmpty ?? false)
            ? tagName.toString()
            : 'coming_soon'.localize(context),
        style: ADTextStyle600.size10.copyWith(
          color: textColor?.isNotEmpty ?? false
              ? Color(int.parse(textColor.toString()))
              : context.adColors.blackTextColor,
          fontSize: fontSize,
          height: 1,
        ),
      ),
    );
  }
}
