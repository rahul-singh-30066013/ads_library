/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_widgets_header.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class used to create gird view
const int columnCount = 2;

class DutyFreeGridView extends StatelessWidget {
  const DutyFreeGridView({
    Key? key,
    this.children,
    required this.contentData,
    this.gridType,
    this.onTapHandler,
  }) : super(key: key);

  ///Need to pass in case other then default items required
  final IndexedWidgetBuilder? children;

  ///Object of Dashboard item driving from the configuration json file.
  final DutyFreeDashboardItem contentData;

  ///Four type of Widget in case of grid [gridType]  where
  final WidgetType? gridType;

  ///onTapHandler to get the callback of item clicked.
  final ADTapCallbackWithValue? onTapHandler;

  // int _crossAxisCountBasedOnType(WidgetType? value) {
  //   final int columnCount = contentData.gridColumn ?? 2;
  //   final type = value ?? WidgetType.gridCircleTile;
  //   switch (type) {
  //     case WidgetType.gridCircleTile:
  //       return columnCount == 0 ? columnCount : columnCount;
  //     default:
  //       return contentData.gridColumn ?? columnCount;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ADSizedBox(
          height: contentData.itemMargin?.top.sp ?? 0,
        ),
        DutyFreeDashBoardWidgetsHeader(
          contentData: contentData,
          onTapHandler: onTapHandler,
        ),
        ADSizedBox(
          height: contentData.subItemMargin?.top.sp ?? 0,
        ),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.only(
            left: contentData.itemMargin?.left.sp ?? 0,
            right: contentData.itemMargin?.right.sp ?? 0,
          ),
          itemCount: contentData.widgetItems?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: contentData.gridColumn ?? columnCount,
            childAspectRatio: contentData.aspectRatio ?? 1,
          ),
          itemBuilder: children ??
              (context, index) => GestureDetector(
                    onTap: () => _onTapHandler(),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          contentData.subItemRadius ?? 0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.adColors.lightGreyGridSeparatorColor,
                          ),
                        ],
                      ),
                    ),
                  ),
        ),
      ],
    );
  }

  /// this method is used to handle tab listener
  void _onTapHandler() {
    ///TODO
  }
}
