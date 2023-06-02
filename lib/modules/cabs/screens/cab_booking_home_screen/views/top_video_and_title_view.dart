/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:video_player/video_player.dart';

class TopVideoAndTitleView extends StatelessWidget {
  const TopVideoAndTitleView({
    Key? key,
    required this.dashBoardItem,
  }) : super(key: key);
  final DutyFreeDashboardItem dashBoardItem;

  @override
  Widget build(BuildContext context) {
    const titleFontSize = 36.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TopVideoWidget(
          item: dashBoardItem.widgetItems?.first,
          contentData: dashBoardItem,
        ),
        ADSizedBox(
          height: dashBoardItem.subItemMargin?.top.sp,
        ),
        Text(
          dashBoardItem.widgetItems?.first.title.replaceAll(r'\n', '\n') ?? '',
          textAlign: TextAlign.center,
          style: ADTextStyle700.size32
              .setTextColor(context.adColors.blackTextColor)
              .copyWith(
                fontSize: titleFontSize,
              ),
        ).paddingBySide(
          left: dashBoardItem.itemMargin?.left.sp ?? 0,
          right: dashBoardItem.itemMargin?.right.sp ?? 0,
        ),
      ],
    ).paddingBySide(
      top: dashBoardItem.itemMargin?.top.sp ?? 0,
      bottom: dashBoardItem.itemMargin?.bottom.sp ?? 0,
    );
  }
}

class TopVideoWidget extends StatefulWidget {
  const TopVideoWidget({
    Key? key,
    required this.item,
    required this.contentData,
  }) : super(key: key);
  final DutyFreeDashboardItem contentData;
  final DutyFreeItem? item;

  @override
  State<TopVideoWidget> createState() => _TopVideoWidgetState();
}

class _TopVideoWidgetState extends State<TopVideoWidget>
    with AutomaticKeepAliveClientMixin {
  Future<void>? _initializeVideoPlayerFuture;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.item?.videoSrc ?? '');

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.play();
    _controller?.setLooping(false);
  }

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    //added to avoid the warning
    adLog(noUseWidget.toString());
    final itemWidth = context.widthOfScreen;
    final itemHeight = itemWidth * (widget.contentData.aspectRatio ?? 0);
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        return ((snapshot.connectionState == ConnectionState.done) &&
                (_controller != null &&
                    _controller?.value.isInitialized == true))
            ? FittedBox(
                fit: BoxFit.fitWidth,
                child: SizedBox(
                  width: (_controller?.value.size.width.sp ?? 0) + context.k_20,
                  height:
                      (_controller?.value.size.height.sp ?? 0) + context.k_20,
                  child: VideoPlayer(
                    _controller ??
                        VideoPlayerController.network(
                          widget.item?.videoSrc ?? '',
                        ),
                  ),
                ),
              )
            : SizedBox(
                height: itemHeight,
                width: itemWidth,
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
