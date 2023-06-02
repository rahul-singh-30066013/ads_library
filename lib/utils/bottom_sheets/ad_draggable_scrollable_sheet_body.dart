/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ADDraggableScrollableSheetBody extends StatelessWidget {
  final String headerTitle;
  final Widget childWidget;

  const ADDraggableScrollableSheetBody({
    Key? key,
    required this.headerTitle,
    required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            context.k_22, //
          ),
        ),
      ),
      child: Column(
        children: [
          ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ).paddingBySide(top: context.k_10),
          ADDraggableSheetHeader(
            headerTitle: headerTitle.isNotEmpty
                ? headerTitle.localize(context)
                : headerTitle,
            closeCallBack: (value) => navigatorPopScreen(context),
          ).paddingBySide(top: context.k_6, bottom: context.k_20),
          Expanded(
            child: childWidget,
          ),
        ],
      ),
    );
  }

  static const double minChildSize = 0.9;
  static const double maxChildSize = 0.95;

  ///this method shows bottom sheet with child using sliver app bar bottom sheet
  static Future<dynamic> showDraggableScrollableBottomSheet({
    required BuildContext context,
    required Widget child,
  }) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        builder: (context) => child,
      );
}
