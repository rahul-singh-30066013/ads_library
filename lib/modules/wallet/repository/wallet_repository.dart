/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io' show Platform;

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';

class WalletRepository {
  ///API call to fetch apple pass book.
  Future<ADResponseState> getApplePassbook(
    String endPointURL,
  ) async {
    final dio = Dio();
    final token = await _getToken();
    final Map<String, String> map = {
      'channelId': Platform.isAndroid ? 'Android' : 'iOS',
      'traceId': ProfileSingleton.profileSingleton.apiTraceId,
      'language': 'en',
      'Authorization': 'Bearer $token',
      'User-Agent': userAgent,
    };
    adLog('Headers${map.toString()}');
    adLog(
      'url to request ${'${Environment.instance.configuration.apiBaseUrl}$endPointURL'}',
    );
    Response? result;

    try {
      result = await dio.get(
        '${Environment.instance.configuration.apiBaseUrl}$endPointURL',
        options: Options(
          headers: map,
          contentType: 'application/pkpass',
          responseType: ResponseType.bytes,
        ),
      );
    } catch (e) {
      adLog(e.toString());
    }
    return result?.data != null
        ? ADResponseState.completed(result)
        : ADResponseState.error('Failed', '');
  }

  Future<String> _getToken() async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    return accessToken ?? '';
  }
}
