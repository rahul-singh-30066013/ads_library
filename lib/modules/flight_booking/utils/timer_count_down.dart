/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

/// this class is used to count down timer and animation time.
class TimerCountDown extends AnimatedWidget {
  const TimerCountDown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  final Animation<int> animation;
  @override
  Widget build(BuildContext context) {
    final Duration clockTimer = Duration(seconds: animation.value);
    final String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    return Text(timerText, style: ADTextStyle500.size16);
  }
}
