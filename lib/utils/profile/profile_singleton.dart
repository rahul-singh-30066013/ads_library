/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/user_profile.dart';
import 'package:adani_mobile_utility/app_utils/analytics/google_analytics.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

///this singleton class is used globally inside app to manage user profile related things(login status, userID..etc)

class ProfileSingleton {
  String apiTraceId =
      '${Platform.isAndroid ? 'ANDROID' : 'IOS'}_${DateTime.now().millisecondsSinceEpoch}';
  UserProfile? userProfile;

  String? _deviceId;
  String? _appInstanceId;
  String? _appBuildNumber;
  String? _userIDFromToken;

  //static instance for ProfileSingleton
  static final ProfileSingleton _profileSingleton =
      ProfileSingleton._profileSingletonInstance();

//constructor that we need to call, will return same instance
  static ProfileSingleton get profileSingleton => _profileSingleton;

  ProfileSingleton._profileSingletonInstance();

  String get userID => userProfile?.userId ?? generateRandomGuestUserId();

  bool get isLoggedIn => userProfile?.isLoggedIn ?? false;

  String get secureToken => userProfile?.accessToken ?? '';

  String get refreshToken => userProfile?.refreshToken ?? '';

  String get deviceId => _deviceId ?? '';

  String get appInstanceId => _appInstanceId ?? '';

  String get appBuildNumber => _appBuildNumber ?? '';

  String get jwtUserID => _userIDFromToken ?? '';

  void updateAppBuildNumber(String buildNumber) {
    _appBuildNumber = buildNumber;
    adLog('build number = ${buildNumber.toString()}');
  }

  CountryCodeData get countryCodeData =>
      userProfile?.countryCodeData ?? CountryCodeData.defaultValue();

  //to read data from data store
  Future<UserProfile> readUserProfile(String keyUserProfileData) async {
    final value =
        await SharedPrefsUtils().getVarValueFromPrefs(keyUserProfileData);
    if (value == null) {
      return UserProfile();
    }
    final decodeValue = json.decode(value.toString());
    final user = UserProfile.fromJson(decodeValue);
    return user;
  }

  //to get the device id
  Future<void> getDeviceId() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceDetails = await deviceInfoPlugin.deviceInfo;
    _deviceId = Platform.isAndroid
        ? deviceDetails.toMap()['id']
        : deviceDetails.toMap()['identifierForVendor'];
  }

  //to write data to data store
  Future<void> writeUserProfile(
    String keyUserProfileData,
    UserProfile userProfile,
  ) async {
    await SharedPrefsUtils()
        .putVarValueInPrefs(keyUserProfileData, userProfile);
    _userIDFromToken= await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.userIDFromToken);
  }

  String generateRandomGuestUserId() {
    // const int min = 100000; //min and max values act as your 6 digit range
    // const int max = 999999;
    //
    // adLog('date ${DateTime.now().microsecondsSinceEpoch}');
    // final String guestUserId = '${min + Random().nextInt(max - min)}';
    // adLog('GuestUserId $guestUserId');
    //
    // return guestUserId;
    final String guId = const Uuid().v4();
    return guId;
  }

  Future<void> getFirebaseAppInstanceId() async {
    _appInstanceId = await GoogleAnalytics().getFirebaseAppInstanceId();
  }

  //to write data to data store
  Future<bool> writeDataModelToSharedPreferences<T>(
    String key,
    T model,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final isStored = await prefs.setString(key, jsonEncode(model));
    return isStored;
  }

  //to read data from data store
  Future<String> readDataModelFromSharedPreferences(
    String key,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
}
