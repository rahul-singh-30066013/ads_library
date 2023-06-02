/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  static final RemoteConfigService _remoteConfigService =
      RemoteConfigService._internal();

  factory RemoteConfigService() {
    return _remoteConfigService;
  }

  RemoteConfigService._internal();

  Future<void> initRemoteConfig() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(),
      ),
    );
    await _remoteConfig
        .fetchAndActivate()
        .then(
          (value) => value
              ? adLog('remote config activated.')
              : adLog('Unable to fetch remote config.'),
        )
        .onError(
          (error, stackTrace) => {
            adLog('remote config ${error.toString()}'),
            adLog('remote config ${stackTrace.toString()}'),
          },
        );
  }

  FirebaseRemoteConfig getInstance() {
    return _remoteConfig;
  }
}
