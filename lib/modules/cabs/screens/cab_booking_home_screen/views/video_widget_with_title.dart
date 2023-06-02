/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/common_video_card.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

///this class is used to handle how to work Cab Booking video on landing page.
class VideoWidgetWithTitle extends StatefulWidget {
  const VideoWidgetWithTitle({
    Key? key,
    required this.item,
    this.onTapHandler,
  }) : super(key: key);

  ///[item], variable is used to maintain dashboard reference
  ///[onTapHandler], variable is used to perform on TabHandler
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;

  @override
  _VideoWidgetWithTitleState createState() => _VideoWidgetWithTitleState();
}

class _VideoWidgetWithTitleState extends State<VideoWidgetWithTitle>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final result = super.build(context);
    adLog(result.toString());
    return CommonVideoCard(
      item: widget.item,
    );
  }
}
