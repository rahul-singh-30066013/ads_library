/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// _CircularBackground class is used for adding White circular background on icon
class CircularBackground extends StatelessWidget {
  final IconData icon;
  final double? leftPadding;
  final ADTapCallback onTap;

  const CircularBackground({
    Key? key,
    this.leftPadding = 0,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 46;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(context.k_6),
        width: height.sp,
        height: height.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.adColors.whiteTextColor.withOpacity(1),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: leftPadding?.sp ?? 0),
          child: Icon(
            icon,
            color: context.adColors.black,
            size: context.k_28,
          ),
        ),
      ),
    );
  }
}
