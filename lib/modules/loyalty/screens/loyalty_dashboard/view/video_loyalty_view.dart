/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';
import 'package:video_player/video_player.dart';

///  this class is used to load loyalty animated videos on dashboard top
class VideoLoyaltyView extends StatefulWidget {
  final String appImagSrc;
  final bool looping;

  const VideoLoyaltyView({
    Key? key,
    required this.appImagSrc,
    this.looping = false,
  }) : super(key: key);

  @override
  _VideoLoyaltyViewState createState() => _VideoLoyaltyViewState();
}

class _VideoLoyaltyViewState extends State<VideoLoyaltyView>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  final double shimmerHeight_338 = 338.sp;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      widget.appImagSrc,
    );
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.play();
    _controller?.setLooping(widget.looping);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    //added to avoid the warning
    adLog(noUseWidget.toString());
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? VideoPlayer(
                  _controller ??
                      VideoPlayerController.network(
                        widget.appImagSrc,
                      ),
                )
              : ADShimmerWidget.shimmerShape(
                  type: ShimmerType.squareBox,
                  width: context.widthOfScreen,
                  height: shimmerHeight_338,
                );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
