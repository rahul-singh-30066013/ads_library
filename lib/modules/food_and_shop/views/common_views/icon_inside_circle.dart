/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

/// this class is used to draw icon inside white circle
class IconInsideCircle extends StatelessWidget {
  /// this will give you the click
  final GestureTapCallback onPressed;

  /// the icon you want to show inside circle
  final IconData iconData;
  const IconInsideCircle({
    required this.iconData,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.k_18,
          vertical: context.k_10,
        ),
        child: CircleAvatar(
          radius: context.k_16,
          backgroundColor: context.adColors.whiteTextColor,
          child: Icon(
            iconData,
            color: context.adColors.black,
            size: context.k_18,
          ),
        ),
      ),
    );
  }
}
