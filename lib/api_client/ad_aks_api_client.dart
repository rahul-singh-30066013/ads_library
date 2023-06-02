/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_logger.dart';
import 'package:adani_airport_mobile/api_client/aks_base_response.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/network/session/session_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_response.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const _apiHitTimesLimit = 2;

class ADAksApiClient {
  final String baseUrl;
  Dio? _dio;
  final int _unAuthorized = 401;
  final int _forbidden = 403;
  final int _notFound = 404;
  final int _success = 200;
  final int _creation = 201;
  ADAksApiClient({required this.baseUrl}) {
    _dio = _createDio(baseUrl);
    adLog(_dio.toString());
  }

  Dio _createDio(String endPoint) {
    final Dio _dio = Dio();
    // _dio.options.connectTimeout = 60 * 1000; // 60 seconds
    // _dio.options.receiveTimeout = 60 * 1000; // 60 seconds
    _dio.options.baseUrl = endPoint;

    _dio.interceptors.add(
      AdLogger(
        compact: false,
      ),
    );

    return _dio;
  }

  Future<ADResponseState> post({
    required String path,
    required String params,
    Map<String, dynamic>? apiQueryParameters,
    Map<String, dynamic>? header,
    int apiHitTimes = 0,
  }) async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    if (accessToken != null) {
      header?['Authorization'] = 'Bearer $accessToken';
    }
    Response? response;
    AksBaseResponse res;
    try {
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      response = await dio.post(
        path,
        data: params,
        queryParameters: apiQueryParameters,
      );

      res = AksBaseResponse.fromJson(response.data);
      return (response.statusCode == _success ||
              response.statusCode == _creation)
          ? ADResponseState.completed(response.data)
          : ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.other) {
          return (e.error != null) &&
                  (e.error as SocketException).osError?.errorCode != null
              ? ADResponseState.error(noInternetMessage, '51')
              : ADResponseState.error(e.toString(), '');
        } else if (e.response?.statusCode == _unAuthorized) {
          if (ProfileSingleton.profileSingleton.isLoggedIn) {
            final refreshRes =
                await callApiForRefreshToken(apiHitTimes: apiHitTimes);
            return refreshRes
                ? await post(
                    path: path,
                    params: params,
                    apiQueryParameters: apiQueryParameters,
                    header: header,
                    apiHitTimes: apiHitTimes + 1,
                  )
                : ADResponseState.error(
                    'Uh oh! Something went wrong.',
                    'ADLEX01',
                  );
          } else {
            return ADResponseState.error(
              'Uh oh! Something went wrong.',
              'ADLEX01',
            );
          }
        } else if (e.type == DioErrorType.response &&
            e.response?.statusCode == _notFound) {
          return ADResponseState.error(
            'Something went wrong',
            '404',
            {},
            _notFound,
          );
        } else {
          try {
            res = AksBaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error,
              res.errorCode,
              response?.headers.map,
            );
          } catch (e) {
            return ADResponseState.error(
              'Uh oh! Something went wrong.',
              'ADLEX01',
            );
          }
        }
      } else {
        return ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
      }
    }
  }

  Future<ADResponseState> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    int apiHitTimes = 0,
  }) async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    if (accessToken != null) {
      header?['Authorization'] = 'Bearer $accessToken';
    }
    Response? response;
    AksBaseResponse res;
    try {
      // final Dio dio = _dio ?? _createDio(baseUrl);
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      response = await dio.get(path, queryParameters: queryParameters);
      return (response.statusCode == _success ||
              response.statusCode == _creation)
          ? ADResponseState.completed(response.data)
          : ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.other) {
          return (e.error != null) &&
                  (e.error as SocketException).osError?.errorCode != null
              ? ADResponseState.error(noInternetMessage, '51')
              : ADResponseState.error(e.toString(), '');
        } else if (e.response?.statusCode == _unAuthorized) {
          if (ProfileSingleton.profileSingleton.isLoggedIn) {
            final refreshRes =
                await callApiForRefreshToken(apiHitTimes: apiHitTimes);
            return refreshRes
                ? await get(
                    path: path,
                    header: header,
                    queryParameters: queryParameters,
                    apiHitTimes: apiHitTimes + 1,
                  )
                : ADResponseState.error(
                    'Uh oh! Something went wrong.',
                    'ADLEX01',
                  );
          } else {
            return ADResponseState.error(
              'Uh oh! Something went wrong.',
              'ADLEX01',
            );
          }
        } else if (e.type == DioErrorType.response &&
            e.response?.statusCode == _notFound) {
          return ADResponseState.error(
            'Something went wrong',
            '404',
            {},
            _notFound,
          );
        } else {
          try {
            res = AksBaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error,
              res.errorCode,
              response?.headers.map,
            );
          } catch (e) {
            return ADResponseState.error(
              'Uh oh! Something went wrong.',
              'ADLEX01',
            );
          }
        }
      } else {
        return ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
      }
    }
  }

  Future<bool> callApiForRefreshToken({required int apiHitTimes}) async {
    final Map<String, dynamic> refreshTokenHeader = {
      'clientId': clientId,
    };
    try {
      final Dio dio = _createDio(Environment.instance.configuration.apiBaseUrl);
      dio.options.headers.addAll(refreshTokenHeader);
      //
      // final sharedPreferences = await SharedPreferences.getInstance();
      // final accessToken =
      //     sharedPreferences.getString(SecureStorageKeys.accessToken);
      // final refreshToken =
      //     sharedPreferences.getString(SecureStorageKeys.refreshToken);
      final accessToken = await SharedPrefsUtils()
          .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
      final refreshToken = await SharedPrefsUtils()
          .getValueFromPrefs(SharedPrefUtilsKeys.refreshToken);
      final params = {};
      params['accessToken'] = accessToken;
      params['refreshToken'] = refreshToken;

      final Response response = await dio.post(
        SessionApiUrls.refreshToken,
        data: jsonEncode(params),
      );
      final BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if (!baseResponse.status) {
        return false;
      } else {
        final data = baseResponse.data as Map<String, dynamic>;
        final String accessToken = data['accessToken'].toString();
        final refreshToken = data['refreshToken'];
        await SharedPrefsUtils().putKeyValuePairInPrefs(
          SharedPrefUtilsKeys.accessToken,
          accessToken,
        );
        await SharedPrefsUtils().putKeyValuePairInPrefs(
          SharedPrefUtilsKeys.refreshToken,
          refreshToken,
        );
        // final sharedPreferences = await SharedPreferences.getInstance();
        /* final storedAccessToken = await sharedPreferences.setString(
          SecureStorageKeys.accessToken,
          accessToken,
        );
        adLog('stored successfully $storedAccessToken');*/

        /*  final storedRefreshToken = await sharedPreferences.setString(
          SecureStorageKeys.refreshToken,
          refreshToken,
        );
        adLog('stored successfully $storedRefreshToken');*/
        return true;
      }
    } catch (e) {
      if ((e is DioError && e.response?.statusCode == _forbidden) &&
          apiHitTimes < _apiHitTimesLimit) {
        return true;
      } else {
        if (!isRefreshTokenExpire.value) {
          updateRefreshTokenExpire();
        }
        return false;
      }
    }
  }
}

ValueNotifier<bool> isRefreshTokenExpire = ValueNotifier<bool>(false);

void updateRefreshTokenExpire() {
  isRefreshTokenExpire.value = true;
}
