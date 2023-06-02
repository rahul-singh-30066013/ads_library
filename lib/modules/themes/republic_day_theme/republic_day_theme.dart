/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/themes/republic_day_theme/basic_ltr.dart';
import 'package:adani_airport_mobile/modules/themes/republic_day_theme/salute_counter.dart';
import 'package:adani_airport_mobile/modules/themes/state_management/theme_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:video_player/video_player.dart';

Color orange = const Color.fromARGB(255, 223, 116, 45);
Color green = const Color.fromARGB(255, 50, 115, 67);

class RepublicDayTheme extends StatefulWidget {
  const RepublicDayTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<RepublicDayTheme> createState() => _RepublicDayThemeState();
}

class _RepublicDayThemeState extends State<RepublicDayTheme> {
  Future<void>? _initializeVideoPlayerFuture;
  VideoPlayerController? _controller;
  final _scrollController = ScrollController();
  static const double scrollExtent = 200;
  final ValueNotifier<bool> isScrollable = ValueNotifier(false);
  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      context
                  .read<AppSessionState>()
                  .androidDeviceInfo
                  ?.model
                  ?.contains('SM-A32') ??
              false
          ? 'lib/assets/videos/republic_theme_main_video_alt.mp4'
          : 'lib/assets/videos/republic_theme_main_video.mp4',
    );
    _controller?.addListener(videoListener);
    _initializeVideoPlayerFuture = _controller?.initialize();
    _controller?.pause();
    _controller?.setLooping(false);
  }

  void videoListener() {
    if ((_controller?.value.isInitialized ?? false) &&
        _controller?.value.position.inMilliseconds ==
            _controller?.value.duration.inMilliseconds) {
      _controller?.removeListener(videoListener);
      isScrollable.value = true;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        const int num60 = 60;
        _scrollController.animateTo(
          ((key.currentContext?.findRenderObject() as RenderBox?)
                      ?.localToGlobal(Offset.zero)
                      .dy ??
                  scrollExtent) -
              num60,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        context.read<ThemeStateManagement>().initiatePolling();
      });
    }
  }

  bool isSalute = false;

  void tapButton() {
    setState(() {
      isSalute = true;
    });
    // if (kReleaseMode) {
    //   SharedPreferences.getInstance().then(
    //     (value) => value.setBool(SharedPreferenceKeys.saluteStatus, true).then(
    //           (value) => adLog('stored $value'),
    //         ),
    //   );
    // }
  }

  Future<bool> tapCallBack() async {
    Navigator.of(context).pop(isSalute);
    return isSalute;
  }

  @override
  Widget build(BuildContext context) {
    //added to avoid the warning

    return WillPopScope(
      onWillPop: () => tapCallBack(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                !(_controller?.value.isInitialized ?? false)) {
              _controller?.removeListener(videoListener);
              _controller = VideoPlayerController.asset(
                'lib/assets/videos/republic_theme_main_video_alt.mp4',
              );
              _controller?.addListener(videoListener);
            }
            return snapshot.connectionState == ConnectionState.done
                ? (!(_controller?.value.isInitialized ?? false))
                    ? FutureBuilder(
                        future: _controller?.initialize(),
                        builder: (context, status) =>
                            status.connectionState == ConnectionState.done
                                ? VideoWidget(
                                    isScrollable: isScrollable,
                                    scrollController: _scrollController,
                                    isSalute: isSalute,
                                    tapButton: tapButton,
                                    controller: _controller,
                                    contentKey: key,
                                  )
                                : const ADSizedBox.shrink(),
                      )
                    : VideoWidget(
                        isScrollable: isScrollable,
                        scrollController: _scrollController,
                        isSalute: isSalute,
                        tapButton: tapButton,
                        controller: _controller,
                        contentKey: key,
                      )
                : const ADSizedBox.shrink();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    isScrollable.dispose();
    super.dispose();
  }
}

ThemeStateManagement themeStateManagement = ThemeStateManagement();

class VideoWidget extends StatelessWidget {
  final ValueNotifier<bool> isScrollable;
  final ScrollController scrollController;
  final bool isSalute;
  final VideoPlayerController? controller;
  final Function() tapButton;
  static const double bottomPosition = 1.8;
  final GlobalKey contentKey;

  const VideoWidget({
    Key? key,
    required this.isScrollable,
    required this.scrollController,
    required this.isSalute,
    this.controller,
    required this.tapButton,
    required this.contentKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double twenty = 0.2;
    final double twentyTwo = context
                .read<AppSessionState>()
                .androidDeviceInfo
                ?.model
                ?.contains('SM-A32') ??
            false
        ? 0.07
        : 0.22;
    const double elevation = 3;
    return ValueListenableBuilder<bool>(
      valueListenable: isScrollable,
      builder: (BuildContext context, value, Widget? child) {
        return ListView(
          controller: scrollController,
          physics: value
              ? const ClampingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: child == null
              ? [
                  Stack(
                    children: [
                      SizedBox(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              isSalute
                                  ? Colors.transparent
                                  : const Color(greyBorder).withOpacity(1),
                              BlendMode.saturation,
                            ),
                            child: SizedBox(
                              width: controller?.value.size.width,
                              height: controller?.value.size.height,
                              child: VideoPlayer(
                                controller ??
                                    VideoPlayerController.asset(
                                      'lib/assets/videos/republic_theme_main_video.mp4',
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isSalute)
                        const ADSizedBox()
                      else
                        Positioned(
                          top: context.heightOfScreen * twentyTwo,
                          left: context.widthOfScreen * twenty,
                          child: StatefulBuilder(
                            builder: (
                              BuildContext context,
                              void Function(void Function()) setState,
                            ) =>
                                isSalute
                                    ? const ADSizedBox.shrink()
                                    : Column(
                                        children: [
                                          Text(
                                            'A salute for the sacrifices.',
                                            style: ADTextStyle500.size22
                                                .setTextColor(
                                              orange,
                                            ),
                                          ),
                                          ADSizedBox(
                                            height: context.k_6,
                                          ),
                                          Text(
                                            'A salute for the heroes.',
                                            style: ADTextStyle500.size22
                                                .setTextColor(
                                              green,
                                            ),
                                          ),
                                          ADSizedBox(
                                            height: context.k_6,
                                          ),
                                          Text(
                                            'A salute for the nation.',
                                            style: ADTextStyle500.size22
                                                .setTextColor(
                                              orange,
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Colors.orange,
                                              ),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                Size.zero,
                                              ),
                                              fixedSize:
                                                  MaterialStateProperty.all(
                                                Size(
                                                  context.widthOfScreen /
                                                      bottomPosition,
                                                  context.k_56,
                                                ),
                                              ),
                                              elevation:
                                                  MaterialStateProperty.all(
                                                elevation,
                                              ),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      context.k_36,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              shadowColor:
                                                  MaterialStateProperty.all(
                                                Colors.grey,
                                              ),
                                            ),
                                            onPressed: () => {
                                              themeStateManagement
                                                  .setSaluteCount(),
                                              themeStateManagement
                                                  .getSaluteCount(),
                                              controller?.play(),
                                              tapButton.call(),
                                            },
                                            child: Center(
                                              child: Text(
                                                'tap_to_salute'.localize(
                                                  context,
                                                ),
                                                style: ADTextStyle600.size22
                                                    .setTextColor(
                                                  context
                                                      .adColors.whiteTextColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                          ),
                        ),
                    ],
                  ),

                  // const Text("A constitution is not just a document of law to govern a nation. Its framework defines the country's way of life. It upholds the ideals of a nation. Its beliefs and ideas."),
                  Container(
                    key: contentKey,
                    padding: EdgeInsets.only(bottom: context.k_34),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xfffdcfa7),
                          Color.fromARGB(255, 252, 244, 235),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: const [
                        SaluteCounter(),
                        BasicLtr(),
                      ],
                    ),
                  ),
                  // const Text('So, on the auspicious occasion of the 74th Republic Day of India let us salute our great nation and all its brave martyrs. Let their inspiration drive us to achieve greater goals for the country and take India to greater heights with each passing day. Jai Hind!'),
                ]
              : [child],
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isSalute
                          ? Colors.transparent
                          : const Color(greyBorder).withOpacity(1),
                      BlendMode.saturation,
                    ),
                    child: SizedBox(
                      width: controller?.value.size.width,
                      height: controller?.value.size.height,
                      child: VideoPlayer(
                        controller ??
                            VideoPlayerController.asset(
                              'lib/assets/videos/republic_theme_main_video.mp4',
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isSalute)
                const ADSizedBox()
              else
                Positioned.fill(
                  top: context.heightOfScreen * twentyTwo,
                  child: StatefulBuilder(
                    builder: (
                      BuildContext context,
                      void Function(void Function()) setState,
                    ) =>
                        isSalute
                            ? const ADSizedBox.shrink()
                            : Column(
                                children: [
                                  Text(
                                    'A salute for the sacrifices.',
                                    style: ADTextStyle500.size22.setTextColor(
                                      orange,
                                    ),
                                  ),
                                  ADSizedBox(
                                    height: context.k_6,
                                  ),
                                  Text(
                                    'A salute for the heroes.',
                                    style: ADTextStyle500.size22.setTextColor(
                                      green,
                                    ),
                                  ),
                                  ADSizedBox(
                                    height: context.k_6,
                                  ),
                                  Text(
                                    'A salute for the nation.',
                                    style: ADTextStyle500.size22.setTextColor(
                                      orange,
                                    ),
                                  ),
                                  ADSizedBox(
                                    height: context.k_18,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        orange,
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                        Size.zero,
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                        Size(
                                          context.widthOfScreen /
                                              bottomPosition,
                                          context.k_56,
                                        ),
                                      ),
                                      elevation: MaterialStateProperty.all(
                                        elevation,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              context.k_36,
                                            ),
                                          ),
                                        ),
                                      ),
                                      shadowColor: MaterialStateProperty.all(
                                        Colors.grey,
                                      ),
                                    ),
                                    onPressed: () => {
                                      controller?.play(),
                                      tapButton(),
                                      themeStateManagement.setSaluteCount(),
                                      themeStateManagement.getSaluteCount(),
                                    },
                                    child: Center(
                                      child: Text(
                                        'tap_to_salute'.localize(context),
                                        style:
                                            ADTextStyle600.size22.setTextColor(
                                          context.adColors.whiteTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                ),
            ],
          ),
          Container(
            key: contentKey,
            padding: EdgeInsets.only(bottom: context.k_34),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfffdcfa7),
                  Color.fromARGB(255, 252, 244, 235),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: const [
                SaluteCounter(),
                BasicLtr(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
