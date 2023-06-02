/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CabUtil {
  static String dateConverter(DateTime myDate) {
    final _myDate = DateFormat('EEE dd MMM, hh:mm a')
        .format(myDate)
        .replaceAll('AM', 'am')
        .replaceAll('PM', 'pm');

    String date = _myDate;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final dateToCheck = myDate;
    final checkDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (checkDate == today) {
      date =
          'Today ${DateFormat('hh:mm a').format(myDate).replaceAll('AM', 'am').replaceAll('PM', 'pm')}';
    } else if (checkDate == yesterday) {
      date =
          'Yesterday ${DateFormat('hh:mm a').format(myDate).replaceAll('AM', 'am').replaceAll('PM', 'pm')}';
    } else if (checkDate == tomorrow) {
      date =
          'Tomorrow ${DateFormat('hh:mm a').format(myDate).replaceAll('AM', 'am').replaceAll('PM', 'pm')}';
    }
    return date;
  }

  static String buildStringWithThreeDot(
    BuildContext context,
    double widthOfPlace,
    String fullText,
    TextStyle? style,
  ) {
    const three = 3;
    final StringBuffer finalString = StringBuffer();
    for (int count = 0; count < fullText.length; count++) {
      finalString.write(fullText[count]);
      if (_getStringWidth(context, finalString.toString(), style) >=
          widthOfPlace) {
        return '${finalString.toString().substring(0, count - three).trim()}...';
      }
    }
    return finalString.toString();
  }

  /// Returns the width of the text.
  static double _getStringWidth(
    BuildContext context,
    String? text,
    TextStyle? style,
  ) {
    final span = TextSpan(text: text, style: style);

    final richTextWidget = Text.rich(span).build(context) as RichText;
    final renderObject = richTextWidget.createRenderObject(context)
      ..layout(const BoxConstraints());

    final boxes = renderObject.getBoxesForSelection(
      TextSelection(
        baseOffset: 0,
        extentOffset: TextSpan(text: text).toPlainText().length,
      ),
    );

    return boxes.last.right;
  }
}
