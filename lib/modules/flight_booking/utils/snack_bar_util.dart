/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

///Common class for snackbar related functionalities
class SnackBarUtil {
  ///Function that shows snacbar with message
  static void showSnackBar(
    BuildContext context,
    String message, [
    int? time,
    EdgeInsets? margin,
  ]) {
    const double elevation = 20;
    final int durationInMilliSeconds = time ?? 2000;

    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: elevation,
        margin: margin ??
            EdgeInsets.symmetric(
              horizontal: context.k_16,
              vertical: context.k_64,
            ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: ADTextStyle400.size12.setTextColor(Colors.white),
        ),
        duration: Duration(
          milliseconds: durationInMilliSeconds,
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_4),
          ),
        ),
      ),
    );
    adLog(showSnackBar.toString());
  }
}
