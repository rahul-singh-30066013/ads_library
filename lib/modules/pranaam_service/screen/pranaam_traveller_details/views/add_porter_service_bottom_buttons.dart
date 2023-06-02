/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class AddPorterServiceBottomButtons extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color textColor;
  final Function() onTap;
  final bool isLoading;
  final double? borderWidth;
  const AddPorterServiceBottomButtons({
    Key? key,
    required this.name,
    required this.bgColor,
    required this.textColor,
    required this.onTap, this.isLoading = false, this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _borderWidth = 0.5;
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(context.k_20)),
            side: BorderSide(color: textColor, width: borderWidth ?? _borderWidth),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.k_26,
            vertical: context.k_14,
          ),
        ),
        child: isLoading
            ? const ADDotProgressView(
                color: ADColors.white,
              )
            : Text(
                name,
                style: ADTextStyle700.size14.setTextColor(textColor),
              ),
      ),
    );
  }
}
