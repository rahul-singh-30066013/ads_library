/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/themes/model/salute_count_response_model.dart';
import 'package:adani_airport_mobile/network/theme/theme_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class SaluteRepository {
  final ADApiClient adApiClient = ADApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );
  /// get count of salutes
  Future<ADResponseState> fetchSaluteCount({
    required Map<String, dynamic> queryParameters,
  }) async {
    final ADResponseState response = await adApiClient.post(
      path: ThemeApiUrls.getSaluteCount,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(queryParameters),
    );
    if (response.viewStatus == Status.complete) {
      // adLog(response.data);
      response.data = SaluteCountResponseModel.fromJson(response.data);
    }
    return response;
  }

  /// set count for tap to salute
  Future<ADResponseState> setSaluteCount({
    required Map<String, dynamic> queryParameters,
  }) async {
    final ADResponseState response = await adApiClient.post(
      path: ThemeApiUrls.setSaluteCount,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(queryParameters),
    );
    if (response.viewStatus == Status.complete) {
      adLog(response.data.toString());
    }
    return response;
  }
}
