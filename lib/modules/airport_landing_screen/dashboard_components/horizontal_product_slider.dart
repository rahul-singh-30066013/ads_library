/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/tab_slider.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This class used to create widget of tab slider for duty free
class HorizontalProductSlider extends StatelessWidget {
  final DutyFreeDashboardItem dutyFreeDashboardItem;

  const HorizontalProductSlider({Key? key, required this.dutyFreeDashboardItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dutyFreeDashboardItem.widgetItems?.length ?? 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dutyFreeDashboardItem.title.validateWithDefaultValue(),
            style: ADTextStyle700.size22
                .copyWith(color: context.adColors.blackTextColor),
          ).paddingBySide(
            left: context.scaled(dutyFreeDashboardItem.itemMargin?.left ?? 0),
          ),
          TabView(
            subItemMargin: dutyFreeDashboardItem.subItemMargin,
            dutyFreeItem:
                dutyFreeDashboardItem.widgetItems?.first ?? DutyFreeItem(),
            subItemRadius: dutyFreeDashboardItem.subItemRadius,
          ),
        ],
      ).paddingBySide(
        top: context.scaled(dutyFreeDashboardItem.itemMargin?.top ?? 0),
      ),
    );
  }
}
