/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/ad_video_card.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

///this class is used to handle how to work pranaam video on pranaam dash board.
class VideoCardService extends StatefulWidget {
  const VideoCardService({
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
  _VideoCardServiceState createState() => _VideoCardServiceState();
}

class _VideoCardServiceState extends State<VideoCardService>
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
    return ADVideoCard(
      videoTypeItems: widget.item.widgetItems,
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
  final double shimmerWidth_343 = 343.sp;
  final double shimmerHeight_400 = 400.sp;
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
          height: shimmerHeight_400,
          child: ADShimmerBuilder(
            shimmerBuilderType: ShimmerBuilderType.listHorizontal,
            shimmerWidget: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: shimmerHeight_400,
              width: shimmerWidth_343,
            ),
            itemCount: shimmerItemCount,
          ),
        ),
      ],
    );
  }
}*/
