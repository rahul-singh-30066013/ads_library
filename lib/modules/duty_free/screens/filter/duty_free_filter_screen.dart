/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_header_footer.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_middle_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// To Do...

///const TabCount;
const tabBarCount = 2;

/// topHeaderHeight is used for set height for header View
const topHeaderHeight = 50.0;

/// bottomContainerHeight is used for set height for bottom View
const bottomContainerHeight = 80.0;

const k_10 = 10;
const k_20 = 14;

/// This class is used to for create Sort & Filter View
///[DutyFreeFilterScreen] is use for create Sort & Filter View
class DutyFreeFilterScreen extends StatefulWidget {
  const DutyFreeFilterScreen({Key? key}) : super(key: key);

  @override
  State<DutyFreeFilterScreen> createState() => _DutyFreeFilterScreenState();
}

class _DutyFreeFilterScreenState extends State<DutyFreeFilterScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const DutyFreeFilterHeaderFooter(),
        ADSizedBox(
          height: context.k_10,
        ),
        // ADDraggableSheetHeader(
        //   headerTitle: 'all_filter'.localize(context),
        //   closeCallBack: (value) => navigatorPopScreen(context),
        // ).paddingBySide(left: k_10.w, bottom: k_10.w),
        const Expanded(
          child: DutyFreeFilterMiddleView(),
        ),
        const DutyFreeFooterView(),
      ],
    );
  }
}
