/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// this class is used to draw a row with your custom left and right textstyle.
class FlightDetailRow extends StatelessWidget {
  const FlightDetailRow({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.leftTextStyle,
    this.rightTextStyle,
    this.isConfirmation = false,
  }) : super(key: key);

  /// this defines the left text of row
  final String leftText;

  /// this defines the left text of row
  final String rightText;

  /// this defines the leftTextStyle of row
  final TextStyle? leftTextStyle;

  /// this defines the rightTextStyle of row
  final TextStyle? rightTextStyle;

  final bool isConfirmation;

  @override
  Widget build(BuildContext context) {
    final double spacingFromLeftEdge = context.widthOfScreen / 2;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: context.k_20,
          width: double.infinity,
        ),
        PositionedDirectional(
          start: context.k_20,
          top: context.k_20,
          child: Text(
            leftText,
            style: leftTextStyle ??
                ADTextStyle400.size14
                    .setTextColor(context.adColors.neutralInfoMsg),
          ),
        ),
        PositionedDirectional(
          start: spacingFromLeftEdge,
          end: context.k_10,
          top: context.k_20,
          child: Text(
            rightText,
            style: rightTextStyle ??
                ADTextStyle400.size14.setTextColor(
                  context.adColors.neutralInfoMsg,
                ),
          ),
        ),
      ],
    );
  }
}
