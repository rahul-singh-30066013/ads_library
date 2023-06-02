/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:audioplayers/audioplayers.dart';

const soundVolume = 0.5;

class PlaySound {
  static void playAudioSound(String file, {double volume = soundVolume}) {
    final player = AudioPlayer()
      ..play(AssetSource(file), volume: volume)
      ..setAudioContext(
        AudioContextConfig(
          respectSilence: true,
          forceSpeaker: !Platform.isIOS,
        ).build(),
      );
    adLog('$file $player');
  }
}
