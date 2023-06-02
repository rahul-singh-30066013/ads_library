/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyality_potential_response_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_balance_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dialog_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_history_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_item_detail_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_potential_request_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_refer_and_earn_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_retrieve_member_model.dart';
import 'package:adani_airport_mobile/network/loyalty/loyalty_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// This Repository class is used to define all the methods (API) related to loyalty screen,
class LoyaltyRepository {
  final ADAksApiClient adFinanceClient = ADAksApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  /// this is use to get completed transition list
  Future<ADResponseState> fetchTransactionList({
    required Map<String, dynamic> queryParameters,
  }) async {
    final ADResponseState response = await adFinanceClient.get(
      path: LoyaltyApiUrls.transactionHistoryUrl,
      header: APIHeaderUtils.flightBookingHeaders(),
      queryParameters: queryParameters,
    );
    if (response.viewStatus == Status.complete) {
      response.data = response.data is List
          ? (response.data as List)
              .map<LoyaltyHistoryData>(
                (e) => LoyaltyHistoryData.fromJson(e),
              )
              .toList()
          : [];
    }
    return response;
  }

  ///this is used to fetch point balance
  Future<ADResponseState> fetchPointBalance({
    required final queryParameters,
  }) async {
    final ADResponseState response = await adFinanceClient.get(
      path: LoyaltyApiUrls.pointBalanceUrl,
      queryParameters: queryParameters,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = LoyaltyBalanceModel.fromJson(response.data);
    }
    return response;
  }

  ///this is used to get order details
  Future<ADResponseState> fetchOrderDetails({
    required Map<String, dynamic> queryParameters,
  }) async {
    final ADResponseState response = await adFinanceClient.get(
      path: LoyaltyApiUrls.orderDetail,
      queryParameters: queryParameters,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = response.data is List
          ? (response.data as List)
              .map<LoyaltyItemDetailData>(
                (e) => LoyaltyItemDetailData.fromJson(e),
              )
              .toList()
          : [];
    }
    return response;
  }

  ///this is used to get pending order details
  Future<ADResponseState> fetchPendingTransactionList({
    required Map<String, dynamic> queryParameters,
  }) async {
    final ADResponseState response = await adFinanceClient.get(
      path: LoyaltyApiUrls.pendingHistoryUrl,
      header: APIHeaderUtils.flightBookingHeaders(),
      queryParameters: queryParameters,
    );

    if (response.viewStatus == Status.complete) {
      response.data = await response.data is List
          ? (response.data as List)
              .map<LoyaltyHistoryData>(
                (e) => LoyaltyHistoryData.fromJson(e),
              )
              .toList()
          : [];
    }
    return response;
  }

  ///this is used to fetch Refer Url
  Future<ADResponseState> fetchReferUrl() async {
    final ADResponseState response = await adFinanceClient.get(
      path: LoyaltyApiUrls.fetchReferUrl,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = LoyaltyRetrieveMemberModel.fromJson(response.data);
    }
    return response;
  }

  ///API to get the dashboard for loyalty.
  Future<ADResponseState> fetchLoyaltyHome({
    required String path,
    required Map<String, String> queryParams,
  }) async {
    final ADApiClient _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    try {
      final ADResponseState responseState = await _adApiClient.get(
        path: path,
        queryParameters: queryParams,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      adLog('response : $responseState');
      if (responseState.viewStatus == Status.complete &&
          responseState.data != null &&
          responseState.data is List) {
        responseState.data = (responseState.data as List)
            .map<Elements>(
              (e) => Elements.fromJson(e),
            )
            .toList();
      }
      return responseState;
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
  }

  ///API to get the dashboard for loyalty.
  Future<ADResponseState> fetchReferAndEarn({
    required String path,
    required Map<String, String> queryParams,
  }) async {
    final ADApiClient _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    final List<ReferAndEarnItem> referAndEarnItems = List.empty(growable: true);
    try {
      final ADResponseState responseState = await _adApiClient.get(
        path: path,
        queryParameters: queryParams,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      if (responseState.viewStatus == Status.complete &&
          responseState.data != null &&
          responseState.data is List) {
        for (final Map<dynamic, dynamic> element
            in responseState.data as List) {
          final widgetData = element['fields'];
          // ignore: avoid_dynamic_calls
          if (widgetData != null && widgetData['widget'] != null) {
            referAndEarnItems.add(
              ReferAndEarnItem.fromJson(
                (element['fields'] as Map)['widget'],
              ),
            );
          }
        }
      }
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
    return ADResponseState.completed(referAndEarnItems);
  }

  ///API to get the dashboard for loyalty.
  Future<ADResponseState> fetchDailog({
    required String path,
    required Map<String, String> queryParams,
  }) async {
    final ADApiClient _adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    final List<LoyaltyDialogItems> referAndEarnItems =
        List.empty(growable: true);
    try {
      final ADResponseState adResponseState = await _adApiClient.get(
        path: path,
        queryParameters: queryParams,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      adLog('response : $adResponseState');
      if (adResponseState.viewStatus == Status.complete &&
          adResponseState.data != null &&
          adResponseState.data is List) {
        for (final Map<dynamic, dynamic> element
            in adResponseState.data as List) {
          final widgetData = element['fields'];
          // ignore: avoid_dynamic_calls
          if (widgetData != null && widgetData['widget'] != null) {
            referAndEarnItems.add(
              LoyaltyDialogItems.fromJson(
                (element['fields'] as Map)['widget'],
              ),
            );
          }
        }
      }
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
    return ADResponseState.completed(referAndEarnItems);
  }

  Future<ADResponseState> potentialEarning({
    required LoyaltyPotentialRequestModel model,
    required String promoCode,
  }) async {
    final ADResponseState response = await adFinanceClient.post(
      path: '${LoyaltyApiUrls.potentialEarning}?promoCode=$promoCode',
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(model),
    );
    if (response.viewStatus == Status.complete) {
      response.data = LoyalityPotentialResponseModel.fromJson(response.data);
    }
    return response;
  }
}
