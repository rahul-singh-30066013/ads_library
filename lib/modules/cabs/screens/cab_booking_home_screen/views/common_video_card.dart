/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

///This widget is used for creating a card with a video.
///[CommonVideoCard] will create a card with a video.
///below is the example that how to use:
///```dart
///  ADVideoCard(
///  url:'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');
const double circularRadius = 1.5;
bool showThumbnail = true;

class CommonVideoCard extends StatefulWidget {
  final DutyFreeDashboardItem item;

  const CommonVideoCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<CommonVideoCard> createState() => _CommonVideoCardState();
}

class _CommonVideoCardState extends State<CommonVideoCard> {
  VideoPlayerController? _controller;
  Future<void>? videoPlayerFuture;

  @override
  void initState() {
    super.initState();
    showThumbnail = true;

    _controller = VideoPlayerController.network(
      widget.item.widgetItems?.first.videoSrc ?? '',
    );
    videoPlayerFuture = _controller?.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    adLog('Video disposed');
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adLog(
      'Widget build ${widget.item.widgetItems?.first.title}',
      className: this,
    );
    const double withOpacityFraction = 0.2;
    final withOpacity = context.adColors.black.withOpacity(withOpacityFraction);
    const double sizeRadius = 45;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.item.widgetItems?.first.title ?? '',
          style: ADTextStyle700.size22
              .setTextColor(context.adColors.blackTextColor),
        ),
        Container(
          width: context.widthOfScreen,
          child: Stack(
            alignment: Alignment.center,
            children: [
              FutureBuilder(
                future: videoPlayerFuture,
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.done
                      ? ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.item.subItemRadius ?? 0),
                          ),
                          child: AspectRatio(
                            aspectRatio: _controller?.value.aspectRatio ??
                                widget.item.aspectRatio ??
                                0,
                            child: VisibilityDetector(
                              key: const Key('AdVideoCard'),
                              onVisibilityChanged: (visibilityInfo) =>
                                  setState(() {
                                _controller?.value.isPlaying ?? false
                                    ? _controller?.pause()
                                    : adLog('video visibility Detected');
                              }),
                              child: VideoPlayer(
                                _controller ??
                                    VideoPlayerController.network(
                                      '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Project/Adani/Pranaam/HowItWorks/Parnaam-Sardar-Vallabhbhai-Patel-International-Airport.mp4',
                                    ),
                              ),
                            ),
                          ),
                        ).paddingAllSide(context.k_16)
                      : AspectRatio(
                          aspectRatio: _controller?.value.aspectRatio ??
                              widget.item.aspectRatio ??
                              0,
                          child: const Center(child: ADDotProgressView()),
                        );
                },
              ),
              if (showThumbnail)
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.item.subItemRadius ?? 0),
                  ),
                  child: Image.network(
                    widget.item.widgetItems?.first.mobileImage ?? '',
                  ),
                )
              else
                const SizedBox.shrink(),
              InkWell(
                onTap: () => setState(() {
                  _controller?.value.isPlaying ?? false
                      ? _controller?.pause()
                      : _controller?.play();

                  showThumbnail = false;
                }),
                child: _controller?.value.isPlaying ?? false
                    ? Icon(
                        Icons.pause,
                        color: withOpacity,
                        size: sizeRadius,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(sizeRadius / circularRadius),
                          ),
                          color: context.adColors.whiteTextColor,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: sizeRadius,
                        ).paddingAllSide(context.k_8),
                      ),
              ),
            ],
          ),
        ).paddingBySide(top: widget.item.subItemMargin?.top.sp ?? 0),
      ],
    ).paddingBySide(
      top: widget.item.itemMargin?.top.sp ?? 0,
      left: widget.item.itemMargin?.left.sp ?? 0,
      right: widget.item.itemMargin?.right.sp ?? 0,
      bottom: widget.item.itemMargin?.bottom.sp ?? 0,
    );
  }
}
