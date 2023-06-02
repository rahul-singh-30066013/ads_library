/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/api_client/ad_logger.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/network/constants/api_base_urls.dart';
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
const String serverError = '500';

///This class is use for call api.
class ADApiClient {
  final String baseUrl;
  Dio? _dio;
  final int _unAuthorized = 401;
  final int _forbidden = 403;
  final int _notFound = 404;

  ADApiClient({required this.baseUrl}) {
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

  final int statusSuccess = 200;

  ///Fetch data for Google search Data from google.
  Future<ADResponseState> fetchGoogleSearchData({
    required String path,
    CancelToken? cancelToken,
  }) async {
    try {
      final Dio dio = _dio ?? _createDio(ApiBaseUrls.googleMapBaseURL);
      final Response response = await dio.get(path, cancelToken: cancelToken);
      return response.statusCode == statusSuccess
          ? ADResponseState.completed(response.data)
          : ADResponseState.error(response.statusMessage);
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
    }
  }

  /// Handy method to make http POST request, which is a alias of  [dio.fetch(RequestOptions)].
  Future<ADResponseState> post({
    required String path,
    required String params,
    Map<String, dynamic>? apiQueryParameters,
    Map<String, dynamic>? header,
    bool? siteCore,
    int apiHitTimes = 0,
  }) async {
    if (siteCore == null) {
      // final sharedPreferences = await SharedPreferences.getInstance();
      // final accessToken =
      //     sharedPreferences.getString(SecureStorageKeys.accessToken);
      final accessToken = await SharedPrefsUtils()
          .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
      if (accessToken != null) {
        header?['Authorization'] = 'Bearer $accessToken';
      }
    }
    Response? response;
    BaseResponse res;
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
      if (siteCore == null) {
        res = BaseResponse.fromJson(response.data);
        if (!res.status) {
          return ADResponseState(
            Status.error,
            res.data,
            res.error?.description,
            res.error?.code,
            response.headers.map,
          );
        }
        return ADResponseState.completed(
          res.data,
          res.code,
          response.headers.map,
        );
      } else {
        res = BaseResponse.fromSiteCoreJson(response.data);
        if (!res.status) {
          return ADResponseState.error(
            res.error?.description,
            res.error?.code,
            response.headers.map,
          );
        }
        return ADResponseState.completed(
          res.data,
          res.code,
          response.headers.map,
        );
      }
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
            res = BaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
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

  Future<ADResponseState> trainManInvoicePostApi({
    required String path,
    required String params,
    Map<String, dynamic>? header,
  }) async {
    Response? response;
    const int success=200;
    try {
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
        dio.options.responseType = ResponseType.bytes;
        // dio.options.contentType = 'application/';
      }
      response = await dio.post(
        path,
        data: params,
      );
      return response.statusCode == success ? ADResponseState.completed(response.data, response.statusCode.toString(), response.headers.map) : ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
    } catch (e) {
      return ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
    }
  }

  /// Handy method to make http GET request, which is a alias of  [dio.fetch(RequestOptions)].

  Future<ADResponseState> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    bool? siteCore,
    bool siteCoreDictionary = false,
    int apiHitTimes = 0,
  }) async {
    if (siteCore == null) {
      // final sharedPreferences = await SharedPreferences.getInstance();
      // final accessToken =
      //     sharedPreferences.getString(SecureStorageKeys.accessToken);

      final accessToken = await SharedPrefsUtils()
          .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
      if (accessToken != null) {
        header?['Authorization'] = 'Bearer $accessToken';
      }
    }
    Response? response;
    BaseResponse res;
    try {
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      response = await dio.get(path, queryParameters: queryParameters);

      if (siteCore == null) {
        res = BaseResponse.fromJson(response.data);
        if (!res.status) {
          return ADResponseState.error(
            res.error?.description,
            res.error?.code,
            response.headers.map,
          );
        }
        return ADResponseState.completed(
          res.data,
          res.code,
          response.headers.map,
        );
      } else {
        if (siteCoreDictionary) {
          res = BaseResponse.fromSiteCoreDictionaryJson(response.data);
          if ((res.data as Map).isEmpty) {
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
              response.headers.map,
            );
          } else {
            final data = res.data as Map;
            return ADResponseState.completed(
              data,
              res.code,
              response.headers.map,
            );
          }
        } else {
          res = BaseResponse.fromSiteCoreJson(response.data);
          if ((res.data as List).isEmpty) {
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
              response.headers.map,
            );
          } else {
            final data = res.data as List;
            return ADResponseState.completed(
              data,
              res.code,
              response.headers.map,
            );
          }
        }
      }
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
            res = BaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
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
        return ADResponseState.error(
          'Uh oh! Something went wrong.',
          'ADLEX01',
        );
      }
    }
  }

  Future<ADResponseState> put({
    required String path,
    required String params,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    int apiHitTimes = 0,
  }) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // final accessToken =
    //     sharedPreferences.getString(SecureStorageKeys.accessToken);

    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);

    if (accessToken != null) {
      header?['Authorization'] = 'Bearer $accessToken';
    }
    Response? response;
    BaseResponse res;
    try {
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      response =
          await dio.put(path, queryParameters: queryParameters, data: params);
      res = BaseResponse.fromJson(response.data);
      if (!res.status) {
        return ADResponseState.error(
          res.error?.description,
          res.error?.code,
          response.headers.map,
        );
      }
      return ADResponseState.completed(
        res.data,
        res.code,
        response.headers.map,
      );
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
                ? await put(
                    path: path,
                    params: params,
                    header: header,
                    queryParameters: queryParameters,
                    apiHitTimes: apiHitTimes + 1,
                  )
                : ADResponseState.error('Uh oh! Something went wrong.', '');
          } else {
            return ADResponseState.error('Uh oh! Something went wrong.', '');
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
            res = BaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
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

  Future<ADResponseState> patch({
    required String path,
    required String params,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    int apiHitTimes = 0,
  }) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // final accessToken =
    //     sharedPreferences.getString(SecureStorageKeys.accessToken);

    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);

    if (accessToken != null) {
      header?['Authorization'] = 'Bearer $accessToken';
    }
    Response? response;
    BaseResponse res;
    try {
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      response =
          await dio.patch(path, queryParameters: queryParameters, data: params);
      res = BaseResponse.fromJson(response.data);
      if (!res.status) {
        return ADResponseState.error(
          res.error?.description,
          res.error?.code,
          response.headers.map,
        );
      }
      return ADResponseState.completed(
        res.data,
        res.code,
        response.headers.map,
      );
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
                ? await patch(
                    path: path,
                    params: params,
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
            res = BaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
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

  Future<ADResponseState> delete({
    required String path,
    required String params,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    int apiHitTimes = 0,
  }) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // final accessToken =
    //     sharedPreferences.getString(SecureStorageKeys.accessToken);
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    if (accessToken != null) {
      header?['Authorization'] = 'Bearer $accessToken';
    }
    Response? response;
    BaseResponse res;
    try {
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      response = await dio.delete(
        path,
        queryParameters: queryParameters,
        data: params,
      );
      res = BaseResponse.fromJson(response.data);
      if (!res.status) {
        return ADResponseState.error(
          res.error?.description,
          res.error?.code,
          response.headers.map,
        );
      }
      return ADResponseState.completed(
        res.data,
        res.code,
        response.headers.map,
      );
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
                ? await delete(
                    path: path,
                    params: params,
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
            res = BaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
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

  /// Handy method to make http POST request, which is a alias of  [dio.fetch(RequestOptions)].
  Future<ADResponseState> postWithCancel({
    required String path,
    required String params,
    Map<String, dynamic>? apiQueryParameters,
    Map<String, dynamic>? header,
    int apiHitTimes = 0,
    CancelToken? cancelToken,
  }) async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    if (accessToken != null) {
      header?['Authorization'] = 'Bearer $accessToken';
    }
    Response? response;
    BaseResponse res;
    try {
      final Dio dio = _dio ?? _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      response = await dio.post(
        path,
        data: params,
        queryParameters: apiQueryParameters,
        cancelToken: cancelToken,
      );
      res = BaseResponse.fromJson(response.data);
      if (!res.status) {
        return ADResponseState.error(
          res.error?.description,
          res.error?.code,
          response.headers.map,
        );
      }
      return ADResponseState.completed(
        res.data,
        res.code,
        response.headers.map,
      );
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.other) {
          return (e.error != null) &&
                  (e.error as SocketException).osError?.errorCode != null
              ? ADResponseState.error(noInternetMessage, '51')
              : ADResponseState.error(e.toString(), '');
        } else if (e.type == DioErrorType.cancel) {
          return ADResponseState.error(
            'Uh oh! Something went wrong.',
            e.type.name,
          );
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
            if (e.response?.data != null) {
              res = BaseResponse.fromJson(e.response?.data);
              return ADResponseState.error(
                res.error?.description,
                res.error?.code,
                response?.headers.map,
              );
            }
          } catch (e) {
            return ADResponseState.error(
              'Uh oh! Something went wrong.',
              'ADLEX01',
            );
          }

          return ADResponseState.error(
            'Uh oh! Something went wrong.',
            'ADLEX01',
          );
        }
      } else {
        return ADResponseState.error('Uh oh! Something went wrong.', 'ADLEX01');
      }
    }
  }

  /// Handy method to make http POST request for uploading any file.
  Future<ADResponseState> uploadFile({
    required String path,
    required File fileToUpload,
    Map<String, dynamic>? header,
    int apiHitTimes = 0,
  }) async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    if (accessToken != null) {
      header?['Authorization'] = 'Bearer $accessToken';
    }
    Response? response;
    BaseResponse res;
    try {
      final Dio dio = _createDio(baseUrl);
      if (header != null) {
        dio.options.headers.addAll(header);
      }
      dio.options.headers.addAll(
        {
          'Content-Type': 'multipart/form-data',
        },
      );
      final String fileName = fileToUpload.path.split('/').last;
      final FormData data = FormData.fromMap({
        'files': await MultipartFile.fromFile(
          fileToUpload.path,
          filename: fileName,
        ),
      });
      response = await dio.post(
        path,
        data: data,
      );
      res = BaseResponse.fromJson(response.data);
      if (!res.status) {
        return ADResponseState(
          Status.error,
          res.data,
          res.error?.description,
          res.error?.code,
          response.headers.map,
        );
      }
      return ADResponseState.completed(
        res.data,
        res.code,
        response.headers.map,
      );
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
                ? await uploadFile(
                    path: path,
                    fileToUpload: fileToUpload,
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
            res = BaseResponse.fromJson(e.response?.data);
            return ADResponseState.error(
              res.error?.description,
              res.error?.code,
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
}

const String noInternetMessage =
    'No internet connection detected, please try again.';

ValueNotifier<bool> isRefreshTokenExpire = ValueNotifier<bool>(false);

void updateRefreshTokenExpire() {
  isRefreshTokenExpire.value = true;
}
