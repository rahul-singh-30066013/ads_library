/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// This class is used for ignoring multiple taps, work as a single tap.
class DeBounce {
  static const milliseconds = 1500;
  static DateTime? clickTime;

  DeBounce();

  static bool isRedundantClick() {
    final DateTime currentTime = DateTime.now();
    if (clickTime == null) {
      clickTime = currentTime;
      return false;
    }
    if (currentTime.difference(clickTime ?? DateTime.now()).inMilliseconds <
        milliseconds) {
      return true;
    }
    clickTime = currentTime;
    return false;
  }
}
