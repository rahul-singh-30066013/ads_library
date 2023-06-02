/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:video_player/video_player.dart';

///this class is used to show the story.

const onePointFive = 1.5;
const two = 2;
const three = 3;
const five = 5;

class StoryViewScreen extends StatefulWidget {
  // usage sample code
  //
  // final List<Story> stories = [
  //     const Story(
  //       url:
  //           'https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg',
  //       mediaType: MediaType.image,
  //       duration: 5,
  //     ),
  //     const Story(
  //       url:
  //           'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  //       mediaType: MediaType.image,
  //       duration: 5,
  //     ),
  //     const Story(
  //       url:
  //           'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
  //       mediaType: MediaType.image,
  //       duration: 5,
  //     ),
  //   ];
  //
  // StoryScreen(
  //         stories: stories,
  //       )

  /// this list is needed to show the story based on their data.
  final List<Story> stories;
  final bool isContainType;
  final Color? barFillColor;
  final Color? barColor;
  final double? maxHeight;

  const StoryViewScreen({
    Key? key,
    required this.stories,
    this.isContainType = false,
    this.barFillColor,
    this.barColor,
    this.maxHeight,
  }) : super(key: key);

  @override
  _StoryViewScreenState createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen>
    with SingleTickerProviderStateMixin {
  /// this is used to control the page
  PageController? _pageController;

  /// this is used to control the slide time duration.
  AnimationController? _animController;

  /// this is used to control the video (play/pause/stop)
  VideoPlayerController? _videoController;

  /// this is identify the index of passed list.
  int _currentIndex = 0;

  /// this is used to identify video is muted or not
  final ValueNotifier<bool> _videoMuted = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);
    if (widget.stories.isEmpty) {
      return;
    }
    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController
          ?..stop()
          ..reset();
        _videoMuted.value = true;
        setState(() {
          /// this logic is used for recursion, so that the story could be shown in repeat order.
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            _currentIndex = 0;
            _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  /// remove the controllers whenever the screen removed.
  @override
  void dispose() {
    _pageController?.dispose();
    _animController?.dispose();
    _videoMuted.dispose();
    if (_videoController != null && _videoController?.value.isPlaying == true) {
      _videoController?.pause();
      _videoController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details, story),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.stories.length,
            itemBuilder: (context, i) {
              final Story story = widget.stories[i];
              switch (story.mediaType) {
                case MediaType.image:
                  return FittedBox(
                    fit: widget.isContainType ? BoxFit.contain : BoxFit.cover,
                    child: Container(
                      color: context.adColors.containerGreyBg,
                      height: widget.maxHeight,
                      width: context.widthOfScreen,
                      child: Uri.parse(widget.stories[i].url).isAbsolute
                          ? ADCachedImage(
                              imageUrl: widget.stories[i].url,
                            )
                          : Image.asset(widget.stories[i].url),
                    ),
                  );
                case MediaType.video:
                  return _videoController != null &&
                          _videoController?.value.isInitialized == true
                      ? Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: _videoController?.value.size.width,
                              height: _videoController?.value.size.height,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width: _videoController?.value.size.width,
                                  height: _videoController?.value.size.height,
                                  child: VideoPlayer(
                                    _videoController ??
                                        VideoPlayerController.network(
                                          story.url,
                                        ),
                                  ),
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
                                    onTapDown: (details) => {
                                      _videoMuted.value = !_videoMuted.value,
                                      _videoController?.setVolume(
                                        _videoMuted.value ? 0 : 1,
                                      ),
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        context.k_10,
                                      ),
                                      child: Icon(
                                        value
                                            ? Icons.volume_off
                                            : Icons.volume_up,
                                        color: context.adColors.whiteTextColor,
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
          Container(
            width: context.widthOfScreen / two,
            child: Row(
              children: widget.stories
                  .asMap()
                  .map((i, e) {
                    return MapEntry(
                      i,
                      AnimatedBar(
                        animController:
                            _animController ?? AnimationController(vsync: this),
                        position: i,
                        currentIndex: _currentIndex,
                        barColor: widget.barColor,
                        barFillColor: widget.barFillColor,
                      ),
                    );
                  })
                  .values
                  .toList(),
            ),
          ).paddingBySide(
            bottom: context.k_20,
          ),
        ],
      ),
    );
  }

  /// this method manage forward and backward click on story.
  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dxx = details.globalPosition.dx;
    if (dxx < screenWidth / three) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _videoMuted.value = true;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dxx > (screenWidth * two) / three) {
      setState(() {
        _videoMuted.value = true;
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          _currentIndex = 0;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else {
      if (story.mediaType == MediaType.video) {
        if (_videoController != null) {
          if (_videoController?.value.isPlaying == true) {
            _videoController?.pause();
            _animController?.stop();
          } else {
            _videoController?.play();
            _animController?.forward().then((value) => null);
          }
        }
      }
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController
      ?..stop()
      ..reset();
    if (_videoController != null && _videoController?.value.isPlaying == true) {
      _videoController?.pause();
      _videoController = null;
    }
    switch (story.mediaType) {
      case MediaType.image:
        _animController?.duration = Duration(seconds: story.duration ?? five);
        _animController?.forward().then((value) => null);
        break;
      case MediaType.video:
        _videoController = Uri.parse(story.url).isAbsolute
            ? VideoPlayerController.network(story.url)
            : VideoPlayerController.asset(story.url)
          ..setVolume(0)
          ..initialize().then((_) {
            setState(() => {});
            if (_videoController != null &&
                _videoController?.value.isInitialized == true) {
              _animController?.duration = _videoController?.value.duration;
              _videoController?.play();
              _animController?.forward().then((value) => null);
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController?.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

/// this class manage for bottom slider.
class AnimatedBar extends StatelessWidget {
  /// this controller controls the bottom slider animations
  final AnimationController animController;

  /// this variable is used to differentiate the color from current and previous or next story slider.
  final int position;

  /// this indicate the current story.
  final int currentIndex;

  final Color? barFillColor;

  final Color? barColor;

  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
    this.barFillColor,
    this.barColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.scaled(onePointFive)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                SliderWidget(
                  width: double.infinity,
                  color: position < currentIndex
                      ? barFillColor ?? context.adColors.storyViewBarFillColor
                      : barColor ??
                          context.adColors.storyViewBarBackgroundColor,
                ),
                if (position == currentIndex)
                  AnimatedBuilder(
                    animation: animController,
                    builder: (context, child) {
                      return SliderWidget(
                        width: constraints.maxWidth * animController.value,
                        color: barFillColor ??
                            context.adColors.storyViewBarFillColor,
                      );
                    },
                  )
                else
                  const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// this return the slider widget
class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
    required this.width,
    required this.color,
  }) : super(key: key);
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaled(two.toDouble()),
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
    );
  }
}

enum MediaType { image, video }

class Story {
  /// media urls
  final String url;

  /// media type (image/video)
  final MediaType mediaType;

  /// slide duration in the case of image (in second)
  final int? duration;

  const Story({
    required this.url,
    required this.mediaType,
    this.duration,
  });
}
