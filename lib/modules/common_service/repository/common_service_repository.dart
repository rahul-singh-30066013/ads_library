/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/common_service/models/weather_data_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/network/common_service/common_service_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// this repository class will be used for fetching common service related data
class CommonServiceRepository {
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  ///fetches weather data
  Future<ADResponseState> getWeatherData(
    String path,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: path,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.data != null) {
      return ADResponseState.completed(
        WeatherDataModel.fromJson(response.data ?? {}),
        '',
        response.header,
      );
    }
    return ADResponseState.error(response.message, response.errorCode);
  }

  Future<ADResponseState> deleteUserAccount() async {
    final ADResponseState response = await _adApiClient.get(
      path: CommonServiceApiUrls.deleteUserAccount,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response.viewStatus == Status.complete
        ? ADResponseState.completed(response.data)
        : ADResponseState.error(response.message);
  }
}
