/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CabBookingLoadingVideoPlayer extends StatefulWidget {
  const CabBookingLoadingVideoPlayer({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<CabBookingLoadingVideoPlayer> createState() =>
      _CabBookingLoadingVideoPlayerState();
  final String videoUrl;
}

class _CabBookingLoadingVideoPlayerState
    extends State<CabBookingLoadingVideoPlayer> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(
      widget.videoUrl,
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.play();
    _controller?.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Complete the code in the next step.
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller?.value.size.width,
                    height: _controller?.value.size.height,
                    child: VideoPlayer(
                      _controller ??
                          VideoPlayerController.asset(
                            widget.videoUrl,
                          ),
                    ),
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
