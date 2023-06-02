/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

//to show fare detail screen for booking
class FareSheetView extends StatelessWidget {
  final String title;
  final String price;
  const FareSheetView({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
          ),
        ),
        Text(
          price,
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.blackTextColor),
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_20,
      bottom: context.k_20,
    );
  }
}
