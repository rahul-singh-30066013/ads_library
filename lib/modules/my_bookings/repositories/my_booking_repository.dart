/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/network/authenticator/authenticator_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/foundation.dart';

// const _mapKeyQueryParams = 'mapKeyQueryParams';
// const _mapKeyHeader = 'mapKeyHeader';
// const _baseUrl = 'baseUrl';

/// this repository class will use for my booking/order section
/// to communicate with the ui class and api client, it contains the data to manipulate,if required
/// and return back to the screen.
class MyBookingRepository {
  final ADAksApiClient adApiClient =
      ADAksApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  ///API to get itinerary details.
  Future<ADResponseState> getBookings(
    String? bookType,
    int? pageSize,
    int? pageIndex,
  ) async {
    final ADResponseState response = await adApiClient.get(
      path:
          '${AuthenticatorApiUrls.myBookings}${'?limit=$pageSize'}${'&page=$pageIndex'}${'&type=$bookType'}',
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = await compute(_parseMyBookingsBackground, response.data);
    }
    return response;
  }

  ///API to get the upcoming orders
  // Future<ADResponseState> getUpcomingBookings() async {
  //   final Map upcomingBookingsRequestData = {};
  //
  //   upcomingBookingsRequestData[_mapKeyHeader] =
  //       APIHeaderUtils.flightBookingHeaders();
  //
  //   upcomingBookingsRequestData[_mapKeyQueryParams] =
  //       SessionApiUrls.upcomingBookings +
  //           ProfileSingleton.profileSingleton.userID;
  //
  //   upcomingBookingsRequestData[_baseUrl] =
  //       Environment.instance.configuration.apiBaseUrl;
  //
  //   final ADResponseState adResponseState = await compute(
  //     _getUpcomingBookingsInCompute,
  //     upcomingBookingsRequestData,
  //   );
  //
  //   return adResponseState;
  // }

  ///API to get the upcoming orders

  Future<ADResponseState> getUpcomingBookings() async {
    final ADResponseState response = await adApiClient.get(
      path: '${AuthenticatorApiUrls.myBookings}?latest=true',
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_getUpcomingBookingsInCompute, response.data);
    }
    return response;
  }

  static MyBookingResponseModel _getUpcomingBookingsInCompute(
    dynamic encodedJson,
  ) {
    return MyBookingResponseModel.upcomingFromJson(encodedJson);
  }

  static MyBookingResponseModel _parseMyBookingsBackground(
    dynamic encodedJson,
  ) {
    return MyBookingResponseModel.fromJson(encodedJson);
  }

// static Future<ADResponseState> _getUpcomingBookingsInCompute(
//   Map upcomingBookingsRequestData,
// ) async {
//   final ADApiClient adApiClient =
//       ADApiClient(baseUrl: upcomingBookingsRequestData[_baseUrl]);
//   final Map<String, dynamic> apiHeaders =
//       upcomingBookingsRequestData[_mapKeyHeader];
//   final ADResponseState response = await adApiClient.get(
//     path:
//         '${upcomingBookingsRequestData[_mapKeyQueryParams]}?isUpcomingOnly=true',
//     header: apiHeaders,
//   );
//
//   if (response.viewStatus == Status.complete) {
//     response.data = MyBookingResponseModel.upcomingFromJson(response.data);
//   }
//   return response;
// }
}
