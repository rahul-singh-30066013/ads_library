/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/request_models/add_flight_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/saved_flight_model.dart';
import 'package:adani_airport_mobile/network/authenticator/authenticator_api_urls.dart';
import 'package:adani_airport_mobile/network/flights_api/flights_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/foundation.dart';

/// This Repository class is used to define all the methods (API) related to airport Booking screen,
const mapKeyQueryParams = 'mapKeyQueryParams';
const mapKeyHeader = 'mapKeyHeader';
const baseUrl = 'baseUrl';

class FlightStatusRepository {
  final ADApiClient adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  Future<ADResponseState> fetchFlightStatusList({
    required Map<String, dynamic> queryParameters,
    String cityCode = 'BOM',
  }) async {
    final ADResponseState response = await adApiClient.get(
      path: '${FLightsApiUrls.searchFlightStatus}/$cityCode',
      queryParameters: queryParameters,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(getFlightStatusDataInCompute, response.data);
    }
    return response;
  }

  static FlightStatusModel getFlightStatusDataInCompute(
    dynamic encodedJson,
  ) {
    return FlightStatusModel.fromJson(encodedJson);
  }

  Future<ADResponseState> addFlight({
    required AddFlightRequestModel addFlightRequestModel,
  }) async {
    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.addFlight,
      params: jsonEncode(addFlightRequestModel),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    // print(response);
    return response;
  }

  /// this api is use for get saved flight
  Future<ADResponseState> getSavedFlight({
    String? language,
    int? pageSize,
    int? pageIndex,
  }) async {
    final ADResponseState response = await adApiClient.get(
      path:
          '${AuthenticatorApiUrls.getSavedFlight}${'?pageSize=$pageSize'}${'&pageIndex=$pageIndex'}${'&language=$language'}',
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.data != null && response.viewStatus == Status.complete) {
      return ADResponseState.completed(
        SavedFlightModel.fromJson(response.data ?? {}),
      );
    }
    return response;
  }

  /// this api is use for get saved flight
  Future<ADResponseState> deleteSavedFlight({
    String? cardId,
  }) async {
    final ADResponseState response = await adApiClient.delete(
      params: cardId ?? '',
      path: '${AuthenticatorApiUrls.deleteSavedFlight}$cardId',
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      return ADResponseState.completed(
        SavedFlightModel.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }
}
