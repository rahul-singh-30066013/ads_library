/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';
import 'package:video_player/video_player.dart';

class DynamicVideoViewAsset extends StatelessWidget {
  const DynamicVideoViewAsset({
    Key? key,
    required this.contentData,
    required this.onTapHandler,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;

  final ADTapCallbackWithValue onTapHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Utils.getGradientBoxDecoration(
        contentData.gradientConfiguration,
        contentData.backgroundColor,
        Colors.transparent,
      ),
      // padding: EdgeInsets.only(
      //   left: contentData.itemMargin?.left.sp ?? 0,
      //   right: contentData.itemMargin?.right.sp ?? 0,
      // ),
      child: Column(
        children: [
          // ADSizedBox(
          //   height: contentData.itemMargin?.top.sp ?? 0,
          // ),
          CustomBanner(
            contentData: contentData,
            onTapHandler: onTapHandler,
          ),
          ADSizedBox(
            height: contentData.itemMargin?.bottom.sp ?? 0,
          ),
        ],
      ),
    );
  }
}

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    Key? key,
    required this.contentData,
    required this.onTapHandler,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;
  final ADTapCallbackWithValue? onTapHandler;

  @override
  Widget build(BuildContext context) {
    final itemWidth =
        context.widthOfScreen - 2 * (contentData.itemMargin?.left.sp ?? 0);
    final itemHeight = itemWidth * (contentData.aspectRatio ?? 0);
    if (contentData.widgetItems != null &&
        (contentData.widgetItems ?? []).isNotEmpty) {
      final item = (contentData.widgetItems ?? []).first;
      return TouchableOpacity(
        onTap: () => {
          onTapHandler?.call(item),
          // _controller?.play(),
        },
        child: Container(
          width: itemWidth,
          height: itemHeight,
          // margin: EdgeInsets.only(
          //   left: contentData.subItemMargin?.left.sp ?? 0,
          //   top: contentData.subItemMargin?.top.sp ?? 0,
          //   right: contentData.subItemMargin?.right.sp ?? 0,
          //   bottom: contentData.subItemMargin?.bottom.sp ?? 0,
          // ),
          child: DefaultVideoWidget(
            item: item,
            contentData: contentData,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

class DefaultVideoWidget extends StatefulWidget {
  const DefaultVideoWidget({
    Key? key,
    required this.item,
    required this.contentData,
  }) : super(key: key);
  final DutyFreeDashboardItem contentData;
  final DutyFreeItem item;

  @override
  State<DefaultVideoWidget> createState() => _DefaultVideoWidgetState();
}

class _DefaultVideoWidgetState extends State<DefaultVideoWidget>
    with AutomaticKeepAliveClientMixin {
  Future<void>? _initializeVideoPlayerFuture;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      widget.item.videoSrc,
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.play();
    _controller?.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    adLog(noUseWidget.toString());

    final itemWidth = context.widthOfScreen -
        2 * (widget.contentData.itemMargin?.left.sp ?? 0);
    final itemHeight = itemWidth * (widget.contentData.aspectRatio ?? 0);
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(
                    _controller ??
                        VideoPlayerController.asset(
                          widget.item.videoSrc,
                        ),
                  ),
                  /*Positioned(
              bottom: k_80,
              child: Text(
                widget.item.description.replaceAll(r'\n', '\n'),
                style: ADTextStyle600.size22
                    .setTextColor(
                  context.adColors.whiteTextColor,
                )
                    .copyWith(
                  height: lineSpacing,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: context.k_22,
              child: SizedBox(
                height: context.k_24,
                width: context.k_60 + context.k_60 + context.k_30,
                child: ADCachedImage(
                  imageUrl: widget.item.imageSrc,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: context.k_26,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  height: context.k_36,
                  padding: EdgeInsets.only(
                    left: context.k_24,
                    right: context.k_24,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.adColors.whiteTextColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        context.k_30,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.item.subTitle,
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.whiteTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),*/
                ],
              )
            : Center(
                child: ADShimmerBuilder(
                  shimmerBuilderType: ShimmerBuilderType.listVertical,
                  shimmerWidget: ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    height: itemWidth,
                    width: itemHeight,
                    detailTextHeight: context.k_20,
                  ),
                ),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => false;
}
