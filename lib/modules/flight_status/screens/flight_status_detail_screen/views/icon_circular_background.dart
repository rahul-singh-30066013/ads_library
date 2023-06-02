/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used for adding White circular background on icon
class IconCircularBackground extends StatelessWidget {
  final IconData icon;
  final double leftPadding;
  final double rightPadding;
  final Color? backgroundColor;
  final ADTapCallback onTap;

  const IconCircularBackground({
    Key? key,
    this.leftPadding = 0,
    this.rightPadding = 0,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = 44.sp;
    const double elevation = 0;

    return InkWell(
      onTap: onTap,
      child: ADSizedBox(
        width: height.sp,
        height: height.sp,
        child: Card(
          elevation: elevation,
          margin: EdgeInsets.all(context.k_6),
          shape: const CircleBorder(),
          color: backgroundColor ?? context.adColors.whiteTextColor,
          child: Padding(
            padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
            child: Icon(
              icon,
              color: context.adColors.black,
              size: context.k_18,
            ),
          ),
        ),
      ),
    );
  }
}
