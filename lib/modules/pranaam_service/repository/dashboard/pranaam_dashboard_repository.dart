/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_master_data.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/services.dart';

///this class is used to get business logic for Pranaam Dashboard Api.
class PranaamDashboardRepository {
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

  Future<ADResponseState> getDashBoardItemsListFromJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        final List<DashboardItem> dashboardItems = List.empty(growable: true);
        if ((parsed as Map)['elements'] is List) {
          for (final Map<dynamic, dynamic> element
              in parsed['elements'] as List) {
            adLog('message');
            final widgetData = element['fields'];
            // ignore: avoid_dynamic_calls
            if (widgetData != null && widgetData['widget'] != null) {
              dashboardItems.add(
                DashboardItem.fromJson(
                  (element['fields'] as Map)['widget'],
                ),
              );
            }
          }
        }
        return ADResponseState.completed(dashboardItems);
      });

  ///API to get the dashboard for Pranaam.
  Future<ADResponseState> fetchPranaamHome(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      final PranaamDashboardSiteCoreResponse pranaamDashboardSiteCoreResponse =
          PranaamDashboardSiteCoreResponse.fromJson(
        (response.data as List).first,
      );
      response.data = pranaamDashboardSiteCoreResponse.elements.isNotEmpty
          ? pranaamDashboardSiteCoreResponse
          : response.data = null;
      adLog(' rrrrr ${response.toString()}');
    }
    return ADResponseState.completed(null);
  }

  Future<ADResponseState> getPranaamDashBoardItems({
    required String path,
    required Map<String, String> queryParams,
  }) async {
    final List<DashboardItem> dashboardItems = List.empty(growable: true);
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
          adLog('message');
          final widgetData = element['fields'];
          // ignore: avoid_dynamic_calls
          if (widgetData != null && widgetData['widget'] != null) {
            dashboardItems.add(
              DashboardItem.fromJson(
                (element['fields'] as Map)['widget'],
              ),
            );
          }
        }
        return ADResponseState.completed(dashboardItems);
      }
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
    return ADResponseState.error('Something went wrong');
  }

  ///API to get the master data for Pranaam.
  Future<ADResponseState> fetchPranaamMasterData(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data =
          PranaamBaseResponse.parseJson((response.data as List).first);
      adLog('fetchPranaamMasterData response ${response.toString()}');
    }
    return response;
  }
}
