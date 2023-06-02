/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/network/offers/offers_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// this repository class will be used for flight booking only for sitecore APIs
/// to communicate with the ui class and api client, it contains the data to manipulate,if required
/// and return back to the screen.
class FlightBookingRepositorySitecore {
  final ADApiClient adApiClientSiteCore =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

  ///this is used to fetch point balance
  Future<ADResponseState> fetchOffers({
    required Map<String, dynamic> queryParameters,
  }) async {
    final ADResponseState response = await adApiClientSiteCore.post(
      path: OffersApiUrls.offers,
      params: jsonEncode(queryParameters),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data = OfferItems.fromJson(response.data);
    }
    return response;
  }
}
