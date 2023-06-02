/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AdaniMissionContainer extends StatelessWidget {
  ///supporting/description text, some highlighted information
  ///*[onTapHandler] a function in which we will write the click functionality
  ///*[titleText] a string that represent title of the product
  ///*[descriptionText] a string that represent description of the product
  ///*[actionText] blue colored text
  const AdaniMissionContainer({
    Key? key,
    this.onTapHandler,
    required this.titleText,
    required this.descriptionText,
    this.actionText = 'know More',
    this.onPressed,
  }) : super(key: key);

  ///a function in which we will write the click functionality
  final ADTapCallback? onTapHandler;

  ///a string that represent title of the product
  final String titleText;

  ///a string that represent description of the product
  final String descriptionText;

  /// some highlighted text
  final String? actionText;

  final Function()? onPressed;

  static const defaultAspectRatio = 0.65;

  @override
  Widget build(BuildContext context) {
    const maxLines = 2;
    const maxDescLines = 5;
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        color: context.adColors.lightBlue,
        child: Column(
          children: [
            Text(
              titleText,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: maxLines,
              style: ADTextStyle700.size26
                  .setTextColor(context.adColors.blackTextColor),
            ),
            ADSizedBox(height: context.k_20),
            Text(
              descriptionText,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: maxDescLines,
              style: ADTextStyle400.size16.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
            ADSizedBox(height: context.k_20),
            Text(
              actionText ?? '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: ADTextStyle500.size16.copyWith(
                color: context.adColors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ).paddingBySide(
          top: context.k_60,
          bottom: context.k_60,
          left: context.k_32,
          right: context.k_32,
        ),
      ),
    );
  }
}
