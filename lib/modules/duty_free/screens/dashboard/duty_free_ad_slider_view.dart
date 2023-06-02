/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_widgets_header.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double k1dot2WidthRatio = 0.96;
const double k2dot2WidthRatio = 0.43;
const double k3dot2WidthRatio = 0.28;
const double k4dot2WidthRatio = 0.21;
const double viewPagerViewportFraction = 0.9;

class DutyFreeADSliderView extends StatefulWidget {
  const DutyFreeADSliderView({
    Key? key,
    required this.sliderType,
    required this.itemBuilder,
    required this.contentData,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;

  final WidgetType sliderType;

  final IndexedWidgetBuilder itemBuilder;

  final bool shouldBeKeptAlive;

  static double itemWidthBasedOnType(
    WidgetType value,
    DutyFreeDashboardItem? sizeData,
    BuildContext context,
  ) {
    final totalMarginWidth = (sizeData?.itemMargin?.left.sp ?? 0) +
        (sizeData?.itemMargin?.right.sp ?? 0);
    switch (value) {
      case WidgetType.sliderBanner_1dot2:
        return (context.widthOfScreen - totalMarginWidth) *
            (sizeData?.subItemWidth ?? k1dot2WidthRatio);
      case WidgetType.sliderBanner_2dot2:
        return (context.widthOfScreen - totalMarginWidth) *
            (sizeData?.subItemWidth ?? 0);
      case WidgetType.sliderBanner_3dot2:
        return (context.widthOfScreen - totalMarginWidth) * k3dot2WidthRatio;
      case WidgetType.sliderBanner_4dot2:
        return (context.widthOfScreen - totalMarginWidth) * k4dot2WidthRatio;
      case WidgetType.slider:
        return (context.widthOfScreen - totalMarginWidth) *
            (sizeData?.subItemWidth ?? 0);
      default:
        return (context.widthOfScreen - totalMarginWidth) *
            (sizeData?.subItemWidth ?? 0);
    }
  }

  @override
  State<DutyFreeADSliderView> createState() => _DutyFreeADSliderViewState();
}

enum ADSliderItemType { banner, circleTile, circleTilePlain }

class _DutyFreeADSliderViewState extends State<DutyFreeADSliderView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);

    //added to avoid the warning
    adLog(noUseWidget.toString());

    final itemWidth = DutyFreeADSliderView.itemWidthBasedOnType(
      widget.sliderType,
      widget.contentData,
      context,
    );
    final sliderHeight = itemWidth * (widget.contentData.aspectRatio ?? 0);

    return Container(
      decoration: Utils.getGradientBoxDecoration(
        widget.contentData.gradientConfiguration,
        widget.contentData.backgroundColor,
        ADColors.white,
      ),
      padding: EdgeInsets.only(
        top: widget.contentData.itemMargin?.top.sp ?? 0,
        bottom: widget.contentData.itemMargin?.bottom.sp ?? 0,
      ),
      child: Column(
        children: [
          if (widget.contentData.title?.isNotEmpty ?? false)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DutyFreeDashBoardWidgetsHeader(
                  contentData: widget.contentData,
                ),
                ADSizedBox(
                  height: widget.contentData.subItemMargin?.top.sp ?? 0,
                ),
              ],
            ),
          SizedBox(
            height: sliderHeight,
            child: widget.sliderType == WidgetType.sliderBanner_1dot2Pager
                ? PageView.builder(
                    controller: PageController(
                      viewportFraction: viewPagerViewportFraction,
                    ),
                    itemCount: widget.contentData.widgetItems?.length ?? 0,
                    itemBuilder: widget.itemBuilder,
                  )
                : ListView.separated(
                    padding: EdgeInsets.only(
                      left: widget.contentData.itemMargin?.left.sp ?? 0,
                      right: (widget.contentData.itemMargin?.right.sp ?? 0) > 0
                          ? context.k_16
                          : widget.contentData.itemMargin?.right.sp ?? 0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.contentData.widgetItems?.length ?? 0,
                    itemBuilder: widget.itemBuilder,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: widget.contentData.subItemMargin?.left.sp ?? 0,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
