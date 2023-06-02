/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:ui';

import 'package:adani_airport_mobile/modules/components/sliver_app_bar_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

/// this class is used for all utilities related to Bottom sheet.
class BottomSheetUtils {
  /// this method return the value childSize ration for DraggableScrollableSheet in respective of 1
  static double getBottomSheetHeightRatio(BuildContext context) {
    final statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
    return 1 - (statusBarHeight / context.heightOfScreen);
  }

  ///this method shows bottom sheet with child using sliver app bar bottom sheet
  static Future<dynamic> showDraggableBottomSheetDialog(
    BuildContext context,
    Widget child,
    String title,
  ) =>
      showModalBottomSheet(
        backgroundColor: context.adColors.whiteTextColor,
        elevation: context.k_8,
        useRootNavigator: true,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.k_22),
          ),
        ),
        context: context,
        builder: (context) {
          return ADDraggableScrollableBottomSheet(
            initialChildSize:
                BottomSheetUtils.getBottomSheetHeightRatio(context),
            childWidget: SliverAppBarBottomSheet(
              body: child,
              title: title,
            ),
          );
        },
      );

  ///this method shows bottom sheet with child using sliver app bar bottom sheet
  static Future<dynamic> showBottomSheetDialog(
    BuildContext context,
    Widget child,
  ) =>
      showModalBottomSheet(
        backgroundColor: context.adColors.whiteTextColor,
        elevation: context.k_8,
        useRootNavigator: true,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.k_22),
          ),
        ),
        context: context,
        builder: (context) => child,
      );

  ///this method shows bottom sheet with child using sliver app bar bottom sheet
  static Future<dynamic> showAdDraggableBottomSheetDialog(
    BuildContext context,
    Widget child, {
    bool isDismissible = false,
  }) =>
      showModalBottomSheet(
        isDismissible: isDismissible,
        backgroundColor: context.adColors.whiteTextColor,
        elevation: context.k_8,
        useRootNavigator: true,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.k_22),
          ),
        ),
        context: context,
        builder: (context) {
          return ADDraggableScrollableBottomSheet(
            initialChildSize:
                BottomSheetUtils.getBottomSheetHeightRatio(context),
            childWidget: child,
          );
        },
      );
}

// it will use to formate/convert date to string in a given format
class FormattedDate {
  static String getFormattedStringFromDate(DateTime date, String format) {
    final String formattedDateString = DateFormat(format).format(date);
    return formattedDateString;
  }

  static DateTime getFormattedDateFromString(String dateStr, String format) {
    final DateTime formattedDate = DateFormat(format).parse(dateStr);
    return formattedDate;
  }
}
