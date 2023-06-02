/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io' show Platform;

import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';

/// this class is used create the common api headers for the apis
class APIHeaderUtils {
  ///traceId: unique 32 char string
  ///traceId: agentId logged in user id
  ///channelId: IOS | ANDROID
  static Map<String, dynamic> flightBookingHeaders({
    bool? isGuestLoggedIn,
    String? oldAgentID,
    String anonymousKeyName = 'anonymousId',
  }) {
    return ProfileSingleton.profileSingleton.isLoggedIn
        ? {
            'User-Agent': userAgent,
            'channelId': Platform.isAndroid ? 'Android' : 'iOS',
            'version': ProfileSingleton.profileSingleton.appBuildNumber,
            'traceId': ProfileSingleton.profileSingleton.apiTraceId,
            'deviceId': ProfileSingleton.profileSingleton.deviceId,
            'language': 'en',
            if (isGuestLoggedIn != null && isGuestLoggedIn)
              anonymousKeyName:
                  oldAgentID ?? ProfileSingleton.profileSingleton.userID,
          }
        : {
            'User-Agent': userAgent,
            'channelId': Platform.isAndroid ? 'Android' : 'iOS',
            'version': ProfileSingleton.profileSingleton.appBuildNumber,
            'agentId': ProfileSingleton.profileSingleton.userID,
            'traceId': ProfileSingleton.profileSingleton.apiTraceId,
            'deviceId': ProfileSingleton.profileSingleton.deviceId,
            'language': 'en',
            if (isGuestLoggedIn != null && isGuestLoggedIn)
              anonymousKeyName:
                  oldAgentID ?? ProfileSingleton.profileSingleton.userID,
          };
  }

  static Map<String, dynamic> tempFlightBookingHeaders({
    bool? isGuestLoggedIn,
    String? oldAgentID,
    String anonymousKeyName = 'anonymousId',
  }) {
    return ProfileSingleton.profileSingleton.isLoggedIn
        ? {
            'User-Agent': userAgent,
            'channelid': Platform.isAndroid ? 'ANDROID' : 'IOS',
            'version': ProfileSingleton.profileSingleton.appBuildNumber,
            'traceId': ProfileSingleton.profileSingleton.apiTraceId,
            'deviceId': ProfileSingleton.profileSingleton.deviceId,
            'language': 'en',
            if (isGuestLoggedIn != null && isGuestLoggedIn)
              anonymousKeyName:
                  oldAgentID ?? ProfileSingleton.profileSingleton.userID,
          }
        : {
            'User-Agent': userAgent,
            'channelid': Platform.isAndroid ? 'Android' : 'iOS',
            'version': ProfileSingleton.profileSingleton.appBuildNumber,
            'agentId': ProfileSingleton.profileSingleton.userID,
            'traceId': ProfileSingleton.profileSingleton.apiTraceId,
            'deviceId': ProfileSingleton.profileSingleton.deviceId,
            'language': 'en',
            if (isGuestLoggedIn != null && isGuestLoggedIn)
              anonymousKeyName:
                  oldAgentID ?? ProfileSingleton.profileSingleton.userID,
          };
  }

  static Map<String, dynamic> identityServerHeader() {
    return {
      'User-Agent': userAgent,
      'clientId': clientId,
      'Audience': clientId,
      'deviceId': ProfileSingleton.profileSingleton.deviceId,
      'channelId': Platform.isAndroid ? 'Android' : 'iOS',
      'version': ProfileSingleton.profileSingleton.appBuildNumber,
    };
  }

  //TODO Need to remove x-api-key once development is done.
  static Map<String, dynamic> siteCoreHeader() {
    return {
      'User-Agent': userAgent,
      'channelId': Platform.isAndroid ? 'Android' : 'iOS',
      'version': ProfileSingleton.profileSingleton.appBuildNumber,
    };
  }
}
