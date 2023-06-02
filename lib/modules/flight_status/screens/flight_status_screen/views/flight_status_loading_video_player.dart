// ignore_for_file: constant_identifier_names

/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

const int RINGER_MODE_VIBRATE = 0;
const int RINGER_MODE_SILENT = 1;

class FlightStatusLoadingVideoPlayer extends StatefulWidget {
  const FlightStatusLoadingVideoPlayer({
    Key? key,
    this.videoUrl,
    this.videoPlayerController,
  }) : super(key: key);

  @override
  State<FlightStatusLoadingVideoPlayer> createState() =>
      _FlightStatusLoadingVideoPlayerState();
  final String? videoUrl;
  final VideoPlayerController? videoPlayerController;
}

class _FlightStatusLoadingVideoPlayerState
    extends State<FlightStatusLoadingVideoPlayer> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = widget.videoPlayerController ??
        VideoPlayerController.asset(
          widget.videoUrl ?? 'lib/assets/videos/flight_status_loading.mp4',
        );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.play();
    _controller?.setLooping(widget.videoUrl == null);
    handleAudioBasedOnAudioManagerMode();
  }

  Future<dynamic> checkAudioMode() async {
    try {
      //Method channel for audio manager
      return const MethodChannel('audio.manager.dev/channel')
          .invokeMethod('audioManager');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  void handleAudioBasedOnAudioManagerMode() {
    if (Platform.isAndroid) {
      checkAudioMode().then(_changeVolume);
    }
  }

  void _changeVolume(dynamic currentMode) {
    if (currentMode != null) {
      switch (currentMode) {
        case RINGER_MODE_VIBRATE:
        case RINGER_MODE_SILENT:
          _controller?.setVolume(0);
          break;
        default:
          _controller?.setVolume(1);
      }
    }
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
            ? Stack(
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller?.value.size.width,
                        height: _controller?.value.size.height,
                        child: VideoPlayer(
                          _controller ??
                              VideoPlayerController.asset(
                                widget.videoUrl ??
                                    'lib/assets/videos/flight_status_loading.mp4',
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
