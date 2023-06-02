/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/cached_image/ad_cached_image.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:video_player/video_player.dart';

enum DutyFreeStoryScreen { image, video }

///this class is used to show the story.
///no use of this variable in the case of video.
///
double k_2 = 2;
double k_3 = 3;

class DutyStory {
  /// media urls
  final String url;

  /// media type (image/video)
  final DutyFreeStoryScreen mediaType;

  /// slide duration in the case of image (in second)
  final int? duration;

  final String? timeStamp;
  ValueNotifier<bool> headerOpacity = ValueNotifier(true);

  DutyStory({
    required this.url,
    required this.mediaType,
    this.duration,
    this.timeStamp,
    required this.headerOpacity,
  });
}

class DutyFreeStory extends StatefulWidget {
  /// this list is needed to show the story based on their data.
  final List<DutyStory> stories;
  final bool isContainType;
  final Color? barFillColor;
  final Color? barColor;
  final ADTapCallback? onImageTap;
  final bool? pageControllerIndicator;
  final Function(int index)? onPageChanged;
  final ValueNotifier<bool> headerOpacity;

  const DutyFreeStory({
    Key? key,
    required this.stories,
    this.isContainType = false,
    this.barFillColor,
    this.barColor,
    this.onImageTap,
    this.pageControllerIndicator,
    this.onPageChanged,
    required this.headerOpacity,
  }) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<DutyFreeStory>
    with SingleTickerProviderStateMixin {
  /// this is used to control the page
  PageController _pageController = PageController();

  /// this is used to control the video (play/pause/stop)
  VideoPlayerController _videoController = VideoPlayerController.network('');

  /// this is identify the index of passed list.
  final int _currentIndex = 0;

  /// this is used to identify video is muted or not
  final ValueNotifier<bool> _videoMuted = ValueNotifier(true);
  final ValueNotifier<double> valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.stories.isEmpty) {
      return;
    }
    final DutyStory firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _pageController.addListener(
      () {
        if ((_pageController.position.pixels <=
                (widget.stories.length - 1) *
                    (context.widthOfScreen - (context.k_16 * k_2))) &&
            (_pageController.position.pixels >= 0)) {
          valueNotifier.value = _pageController.position.pixels <
                  (widget.stories.length - 1) *
                      (context.widthOfScreen - (context.k_16 * k_2))
              ? _pageController.position.pixels
              : (widget.stories.length - 1) *
                  (context.widthOfScreen - (context.k_16 * k_2));
        }
      },
    );
  }

  /// remove the controllers whenever the screen removed.
  @override
  void dispose() {
    _pageController.dispose();
    _videoMuted.dispose();
    if (_videoController.value.isPlaying) {
      _videoController
        ..pause()
        ..dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTapDown: (details) => _onTapDown(details, story),
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.stories.length,
              onPageChanged: (index) => widget.onPageChanged?.call(index),
              itemBuilder: (context, i) {
                final DutyStory story = widget.stories[i];
                switch (story.mediaType) {
                  case DutyFreeStoryScreen.image:
                    return FittedBox(
                      fit: widget.isContainType ? BoxFit.contain : BoxFit.cover,
                      child: Uri.parse(widget.stories[i].url).isAbsolute
                          ? /*Image(
                              image: NetworkImage(widget.stories[i].url),
                            )*/
                          GestureDetector(
                              onTap: widget.onImageTap,
                              child: ValueListenableBuilder<bool>(
                                valueListenable: widget.headerOpacity,
                                builder: (
                                  BuildContext context,
                                  value,
                                  Widget? child,
                                ) =>
                                    HeroMode(
                                  enabled: value,
                                  child: Hero(
                                    tag: widget.stories[i].timeStamp ??
                                        'dutyFree',
                                    child: ADCachedImage(
                                      imageUrl: widget.stories[i].url,
                                      boxFit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Image.asset(widget.stories[i].url),
                    );
                  case DutyFreeStoryScreen.video:
                    return (_videoController.value.isInitialized)
                        ? Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: _videoController.value.size.width,
                                height: _videoController.value.size.height,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: _videoController.value.size.width,
                                    height: _videoController.value.size.height,
                                    child: VideoPlayer(_videoController),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: context.k_8,
                                bottom: context.k_8,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ValueListenableBuilder(
                                    valueListenable: _videoMuted,
                                    builder: (context, bool value, child) =>
                                        GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTapDown: (details) => onTapDown(),
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          context.k_10,
                                        ),
                                        child: Icon(
                                          value
                                              ? Icons.volume_off
                                              : Icons.volume_up,
                                          color:
                                              context.adColors.whiteTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                }
              },
            ),
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          Container(
            height: k_2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(context.k_2)),
            ),
            constraints: BoxConstraints(
              maxWidth: context.widthOfScreen / k_2,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (context, value, child) {
                  return SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 2,
                      rangeThumbShape: RoundRangeSliderThumbShape(
                        elevation: 0,
                        disabledThumbRadius: 1,
                        enabledThumbRadius: 0.1,
                        pressedElevation: 0,
                      ),
                    ),
                    child: RangeSlider(
                      activeColor: Colors.grey[700],
                      inactiveColor: Colors.grey[400],
                      max: widget.stories.length.toDouble() *
                          (context.widthOfScreen - (context.k_16 * k_2)),
                      values: RangeValues(
                        valueNotifier.value,
                        valueNotifier.value +
                            context.widthOfScreen -
                            (context.k_16 * k_2),
                      ),
                      onChanged: (values) => adLog('rr'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapDown() {
    _videoMuted.value = !_videoMuted.value;
    _videoController.setVolume(
      _videoMuted.value ? 0 : 1,
    );
  }

  // /// this method manage forward and backward click on story.
  // void _onTapDown(TapDownDetails details, DutyStory story) {
  //   final double screenWidth = MediaQuery.of(context).size.width;
  //   final double dxv = details.globalPosition.dx;
  //   if (dxv < screenWidth / k_3) {
  //     setState(() {
  //       if (_currentIndex - 1 >= 0) {
  //         _currentIndex -= 1;
  //         _videoMuted.value = true;
  //         _loadStory(story: widget.stories[_currentIndex]);
  //       }
  //     });
  //   } else if (dxv > screenWidth * k_2 / k_3) {
  //     setState(() {
  //       _videoMuted.value = true;
  //       if (_currentIndex + 1 < widget.stories.length) {
  //         _currentIndex += 1;
  //         _loadStory(story: widget.stories[_currentIndex]);
  //       } else {
  //         _currentIndex = 0;
  //         _loadStory(story: widget.stories[_currentIndex]);
  //       }
  //     });
  //   } else {
  //     if (story.mediaType == DutyFreeStoryScreen.video) {
  //       if (_videoController != null) {
  //         if (_videoController.value.isPlaying) {
  //           _videoController.pause();
  //         } else {
  //           _videoController.play();
  //         }
  //       }
  //     }
  //   }
  // }

  void _loadStory({required DutyStory story, bool animateToPage = true}) {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
      // _videoController = null;
    }
    switch (story.mediaType) {
      case DutyFreeStoryScreen.image:
        break;
      case DutyFreeStoryScreen.video:
        _videoController = Uri.parse(story.url).isAbsolute
            ? VideoPlayerController.network(story.url)
            : VideoPlayerController.asset(story.url)
          ..setVolume(0)
          ..initialize().then((_) {
            setState(() {
              adLog('Hello');
            });
            if (_videoController.value.isInitialized) {
              _videoController.play();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
