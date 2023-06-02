import 'dart:io' as io;

import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/flight_status_loading_video_player.dart';
import 'package:adani_airport_mobile/modules/splash/utils/splash_changer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:video_player/video_player.dart';

class DynamicSplash extends StatelessWidget {
  final Widget defaultWidget;

  const DynamicSplash({
    Key? key,
    required this.defaultWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SplashChanger().checkSplashExist(),
      builder: (context, snapshot) {
        if (SplashChanger().splashUrl.isEmpty) {
          return defaultWidget;
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ADSizedBox.shrink();
        }
        if (!snapshot.hasData) {
          return defaultWidget;
        }
        if (!(snapshot.data ?? false)) {
          return defaultWidget;
        }
        if (SplashChanger().type == UrlType.image) {
          return Image.file(
            SplashChanger().splashFile ?? io.File(''),
            height: context.heightOfScreen,
            width: context.widthOfScreen,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return defaultWidget;
            },
          );
        }
        if (SplashChanger().type == UrlType.json) {
          return LottieBuilder.file(
            SplashChanger().splashFile ?? io.File(''),
            height: context.heightOfScreen,
            width: context.widthOfScreen,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return defaultWidget;
            },
          );
        }
        if (SplashChanger().type == UrlType.video) {
          return FlightStatusLoadingVideoPlayer(
            videoPlayerController: VideoPlayerController.file(
              SplashChanger().splashFile ?? io.File(''),
            ),
            videoUrl: 'stopLooping',
          );
        }
        return defaultWidget;
      },
    );
  }
}
