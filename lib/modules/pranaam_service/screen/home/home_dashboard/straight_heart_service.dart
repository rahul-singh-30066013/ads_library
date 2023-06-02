/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/straight_height.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

final double carousel = 233.sp;

///this class is used to handle two view at a time first view is pranaamPackage and second one is RushDeal type which named as recommended_1 type.
///[shouldBeKeptAlive], variable is used to maintain scrollindex while scrolling
class StraightHeartService extends StatefulWidget {
  const StraightHeartService({
    Key? key,
    required this.item,
    this.onTapHandler,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  ///[item], variable is used to maintain dashboard reference
  ///[onTapHandler], variable is used to perform on TabHandler
  ///[shouldBeKeptAlive], variable is used to maintain index of list
  final pranaam_dashboard.DashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;
  final bool shouldBeKeptAlive;

  @override
  _StraightHeartServiceState createState() => _StraightHeartServiceState();
}

class _StraightHeartServiceState extends State<StraightHeartService>
    with AutomaticKeepAliveClientMixin {
  bool isItemAvailable = false;
  @override
  void initState() {
    isItemAvailable = true;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final result = super.build(context);
    //added to avoid the warning
    adLog(result.toString());
    return StraightHeight(
      autoPlayCarousel: true,
      dealsTypeItems: widget.item.widgetItems.first.options,
      carouselHeight: carousel,
      item: widget.item,
    );
  }

  ///this method is used to handle Click
  void handlePressed() {
    adLog('Click');
  }
}

/*///this class is used for ShimmerWidget
class _ShimmerWidget extends StatelessWidget {
  final double shimmerWidth_100 = 100.sp;
  final double shimmerWidth_150 = 300.sp;
  final double shimmerHeight_20 = 20.sp;
  final double shimmerWidth_160 = 270.sp;
  final double shimmerHeight_250 = 250.sp;
  final int shimmerItemCount = 6;
  _ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: shimmerWidth_150,
              height: shimmerHeight_20,
            ),
          ],
        ),
        ADSizedBox(
          height: shimmerHeight_250,
          child: ADShimmerBuilder(
            shimmerBuilderType: ShimmerBuilderType.listHorizontal,
            shimmerWidget: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: shimmerHeight_250,
              width: shimmerWidth_160,
            ),
            itemCount: shimmerItemCount,
          ),
        ),
      ],
    );
  }
}*/
