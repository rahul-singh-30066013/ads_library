/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

class AppConstantRemoteModel {
  bool isChatBotEnabled;
  String googleApiKey;
  int cabSearchRadiusInMeters;
  String supportMail;
  String supportContact;
  String signInHeaderTitle;
  bool isBottomSignInEnabled;
  bool isIncompleteProfilePopupEnabled;
  bool isRewardEnabled;
  bool isReferAndEarnEnabled;
  String? splashUrl;
  int? splashVersion;
  int scheduleMinimumTimeMinutes;
  int scheduleMaximumTimeMinutes;
  List<String> preferredVendorList;
  bool isOneWayEnable;
  List<String> tipMarqueeList;
  bool isSpeechEnable;
  String? siteCoreAirportHomeAndServicesAPIVersion;
  bool deleteAccountRequired;

  AppConstantRemoteModel({
    required this.isChatBotEnabled,
    required this.googleApiKey,
    required this.cabSearchRadiusInMeters,
    required this.supportMail,
    required this.supportContact,
    required this.signInHeaderTitle,
    required this.isBottomSignInEnabled,
    required this.isIncompleteProfilePopupEnabled,
    required this.isRewardEnabled,
    required this.isReferAndEarnEnabled,
    this.splashUrl,
    this.splashVersion,
    required this.scheduleMinimumTimeMinutes,
    required this.scheduleMaximumTimeMinutes,
    required this.preferredVendorList,
    required this.isOneWayEnable,
    required this.tipMarqueeList,
    required this.isSpeechEnable,
    required this.siteCoreAirportHomeAndServicesAPIVersion,
    required this.deleteAccountRequired,
  });

  factory AppConstantRemoteModel.fromJson(Map<String, dynamic> json) =>
      AppConstantRemoteModel(
        isChatBotEnabled: (Platform.isAndroid)
            ? (json['isAndroidChatBotEnabled'] as bool?) ?? false
            : (json['isIosChatBotEnabled'] as bool?) ?? false,
        googleApiKey: json['googleApiKey'] as String,
        cabSearchRadiusInMeters: json['cabSearchRadiusInMeters'] as int,
        supportMail: json['supportMail'],
        supportContact: json['supportContact'],
        signInHeaderTitle: json['signInHeaderTitle'],
        isBottomSignInEnabled: json['isBottomSignInEnabled'] ?? false,
        isIncompleteProfilePopupEnabled:
            json['isIncompleteProfilePopupEnabled'] ?? false,
        isRewardEnabled: json['isRewardEnabled'] ?? false,
        isReferAndEarnEnabled: json['isReferAndEarnEnabled'] ?? false,
        splashUrl: json['splashUrl'],
        splashVersion: json['splashVersion'],
        scheduleMinimumTimeMinutes: json['scheduleMinimumTimeMinutes'] as int,
        scheduleMaximumTimeMinutes: json['scheduleMaximumTimeMinutes'] as int,
        preferredVendorList: (json['preferredVendorList'] != null)
            ? (json['preferredVendorList'] as List)
                .map((v) => v.toString())
                .toList()
            : [],
        isOneWayEnable: json['isOneWayEnable'],
        tipMarqueeList: (json['tipMarqueeList'] != null)
            ? (json['tipMarqueeList'] as List).map((v) => v.toString()).toList()
            : [],
        isSpeechEnable: json['isSpeechEnable'],
        siteCoreAirportHomeAndServicesAPIVersion:
            json['siteCoreAirportHomeAndServicesAPIVersion'],
        deleteAccountRequired:
            (json['deleteAccountRequired'] as bool?) ?? false,
      );
}
