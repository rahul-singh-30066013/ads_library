/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ProcessDialog {
  static bool _isLoading = false;
  static BuildContext? contextT;

  static void closeLoadingDialog(BuildContext buildContext) {
    if (_isLoading) {
      if (contextT != null) {
        Navigator.of(contextT ?? buildContext).pop();
      }
      _isLoading = false;
    }
    contextT = null;
  }

  static void showLoadingDialog(BuildContext buildContext) {
    _isLoading = true;
    final dialog = showDialog(
      barrierDismissible: false,
      builder: (BuildContext context) {
        contextT = context;
        return SimpleDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          children: <Widget>[
            Center(
              child: ADDotProgressView(
                color: buildContext.adColors.whiteTextColor,
              ),
            ),
          ],
        );
      },
      context: buildContext,
    );
    adLog(dialog.toString());
  }
}
