/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/network/duty_free/duty_free_api_urls.dart';
import 'package:adani_airport_mobile/network/offers/offers_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/base/base_response.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/services.dart';

class OfferRepository {
  final ADApiClient adApiClient = ADApiClient(
    baseUrl: Environment.instance.configuration.cmsBaseUrl,
  );
  final ADApiClient adApiClientAd = ADApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );
  final ADAksApiClient adAksApiClient = ADAksApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  ///API to get the dashboard for offer.
  Future<ADResponseState> fetchOfferHomeData({
    required String path,
    required Map<String, String> queryParams,
  }) async {
    final ADApiClient _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    try {
      final ADResponseState adResponseState = await _adApiClient.get(
        path: path,
        queryParameters: queryParams,
        header: APIHeaderUtils.siteCoreHeader(),
        siteCore: true,
      );
      adLog('response : $adResponseState');
      if (adResponseState.data != null &&
          adResponseState.data is List &&
          adResponseState.viewStatus == Status.complete) {
        adResponseState.data = (adResponseState.data as List)
            .map<Elements>(
              (e) => Elements.fromJson(e),
            )
            .toList();
      }
      return adResponseState;
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
  }

  ///API to get the dashboard for offer.
  Future<ADResponseState> fetchRedeemData({
    required String path,
    required Map<String, String> queryParams,
  }) async {
    final ADApiClient _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    try {
      final ADResponseState adResponseState = await _adApiClient.get(
        path: path,
        queryParameters: queryParams,
        header: APIHeaderUtils.siteCoreHeader(),
        siteCore: true,
      );
      adLog('response redeem: $adResponseState');
      if (adResponseState.data != null &&
          adResponseState.data is List &&
          adResponseState.viewStatus == Status.complete) {
        adResponseState.data = (adResponseState.data as List)
            .map<Elements>(
              (e) => Elements.fromJson(e),
            )
            .toList();
      }
      return adResponseState;
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
  }

  ///this is used to fetch offers on SRP
  Future<ADResponseState> fetchOffersOnSRP({
    required Map<String, dynamic> queryParameters,
  }) async {
    return getSRPOfferResponse(OffersApiUrls.offersSRP, queryParameters);
  }

  /// to fetch SRP offer
  Future<ADResponseState> getSRPOfferResponse(
    String path,
    Map<String, dynamic> queryParameters,
  ) async {
    final ADResponseState response = await adAksApiClient.get(
      path: path,
      queryParameters: queryParameters,
      // params: jsonEncode(queryParameters),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data = CouponListResponse.fromJson(response.data);
    }
    return response;
  }

  ///this is used to fetch offers
  Future<ADResponseState> fetchOffers({
    required Map<String, dynamic> queryParameters,
  }) async {
    return getOfferResponse(OffersApiUrls.offers, queryParameters);
  }

  ///this is used to fetch unlock offers
  Future<ADResponseState> fetchUnlockedOffers({
    required Map<String, dynamic> queryParameters,
  }) async {
    return getOfferResponse(OffersApiUrls.getUnlockedOffers, queryParameters);
  }

  ///this is used to return offers response
  Future<ADResponseState> getOfferResponse(
    String path,
    Map<String, dynamic> queryParameters,
  ) async {
    final ADResponseState response = await adApiClient.post(
      path: path,
      params: jsonEncode(queryParameters),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data = OfferItems.fromJson(response.data);
    }
    return response;
  }

  ///Fetch data for dashboard from local json.
  Future<ADResponseState> fetchDashBoardDataFromLocalJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        return _parseDashboardItems(parsed);
      });

  ADResponseState _parseDashboardItems(dynamic data) {
    final BaseResponse res = BaseResponse.fromSiteCoreJson(data);
    return res.data == null
        ? ADResponseState.error(res.error?.description, res.error?.code)
        : ADResponseState.completed(
            OfferDashboardResponse.fromJson(data),
            res.code,
          );
  }

  /// Get product list api
  Future<ADResponseState> getDutyFreeProducts({
    required DutyFreeProductListRequest catalogRequest,
  }) async {
    final ADApiClient _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    const bool defaultVal = false;
    final request = catalogRequest.toJson()
      ..removeWhere(
        (key, value) =>
            value == null ||
            value.toString().isEmpty ||
            ((value is num?) ? (value ?? 0) <= 0 : defaultVal),
      );
    final ADResponseState response = await _adApiClient.post(
      path: DutyFreeApiUrls.getDutyFreeProducts,
      params: jsonEncode(request),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }
}
