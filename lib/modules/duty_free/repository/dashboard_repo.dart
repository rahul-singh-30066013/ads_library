/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/dashboard_model_main.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/how_to_shop_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/param_package_model.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/services.dart';

///this class is used to get business logic for our Api.
class DashboardRepo {
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

  ///Fetch data for dashboard from server.
  Future<ADResponseState> fetchDashBoardData({
    required Map<String, String> queryParams,
  }) async {
    try {
      final ADResponseState response = await _adApiClient.get(
        path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
        queryParameters: queryParams,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      adLog('response : $response');
      return _parseDashboardItems(response.data);
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error(
        'Your gateway to goodness welcomes you soon.',
      );
    }
  }

  ///Fetch data for dashboard from local json.
  Future<ADResponseState> fetchDashBoardDataFromLocalJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString) as Map;
        return _parseDashboardItems(parsed['elements']);
      });

  ///Fetch data for services from server.
  Future<ADResponseState> fetchServicesData({
    required Map<String, String> queryParams,
  }) async {
    try {
      final ADResponseState response = await _adApiClient.get(
        path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
        queryParameters: queryParams,
        header: APIHeaderUtils.siteCoreHeader(),
        siteCore: true,
      );
      adLog('response : $response');
      return _parseDashboardItems(response.data);
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error(
        'Your gateway to goodness welcomes you soon.',
      );
    }
  }

  ADResponseState _parseDashboardItems(dynamic data) {
    final List<DutyFreeDashboardItem> dashboardItems =
        List.empty(growable: true);
    if ((data as List).isEmpty) {
      return ADResponseState.error(
        'Your gateway to goodness welcomes you soon.',
        serverError,
      );
    } else {
      for (final Map<dynamic, dynamic> element in data) {
        final widgetData = element['fields'];
        // ignore: avoid_dynamic_calls
        if (widgetData != null && widgetData['widget'] != null) {
          final DutyFreeDashboardItem dutyFreeDashboardItem =
              DutyFreeDashboardItem.fromJson(
            (element['fields'] as Map)['widget'],
          );
          dashboardItems.add(dutyFreeDashboardItem);
          //Contact details for Help and supports
          if ((dutyFreeDashboardItem.widgetType?.contains('homeTileWidget') ??
                  false) &&
              (dutyFreeDashboardItem.widgetItems?.isNotEmpty ?? false)) {
            if (dutyFreeDashboardItem.widgetItems?.first.uniqueId
                    .contains('1001') ??
                false) {
              contactDetail =
                  dutyFreeDashboardItem.widgetItems?.first.contactDetail;
            }
          }
        }
      }
      return ADResponseState.completed(dashboardItems, '200');
    }
  }

  Future<ADResponseState> getDutyFreeDashBoardItems({
    bool isAgeAbove25 = false,
    String storeType = 'departure',
  }) async {
    final String url =
        'sitecore/api/layout/placeholder/jss?placeholderName=main&item=/sitecore/content/AirportHome/DutyFreeAirports/${selectedAirportsData?.city}&sc_lang=en&sc_apikey=${SiteCoreApiUrls.siteCoreApiKey}&showOnHomepage=true&sc_restricted=${!isAgeAbove25}&sc_storetype=$storeType&application=app&sc_airport=${selectedAirportsData?.airportCode ?? ''}';
    try {
      final ADResponseState response = await _adApiClient.get(
        path: url,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      final List<DutyFreeDashboardItem> dashboardItems =
          List.empty(growable: true);
      if (response.viewStatus == Status.complete && response.data != null) {
        if (response.data is List) {
          for (final Map<dynamic, dynamic> element in response.data as List) {
            final params = element['params'];
            if (params != null && !isAgeAbove25) {
              if (params is Map &&
                      (params['restricted'] != null &&
                          params['restricted'] == isAgeAbove25.toString()) ||
                  (params as Map)['restricted'] == null) {
                dashboardItems.add(
                  DutyFreeDashboardItem.fromJson(
                    (element['fields'] as Map)['widget'],
                  ),
                );
              }
            } else {
              dashboardItems.add(
                DutyFreeDashboardItem.fromJson(
                  (element['fields'] as Map)['widget'],
                ),
              );
            }
            if (dashboardItems.isNotEmpty &&
                (dashboardItems.last.widgetItems?.isNotEmpty ?? false) &&
                !isAgeAbove25 &&
                (element['componentName'] == null ||
                    element['componentName'].toString().toLowerCase() !=
                            'brand' &&
                        element['componentName'].toString().toLowerCase() !=
                            'dutyfreenavigation')) {
              dashboardItems.last.widgetItems
                  ?.removeWhere((element) => element.restricted);
            }

            if (element['componentName'] != null &&
                element['componentName'].toString().toLowerCase() ==
                    'dutyfreenavigation') {
              dashboardItems.last.widgetItems
                  ?.sort((a, b) => a.sortorder.compareTo(b.sortorder));
              dashboardItems.last.widgetItems
                  ?.sort((a, b) => a.disableForAirport ? 1 : -1);
            }

            if (dashboardItems.isNotEmpty) {
              // dashboardItems.last.widgetItems?.removeWhere(
              //   (element) =>
              //       element.storeType.isNotEmpty &&
              //       element.storeType.toLowerCase() != storeType,
              // );
              if (dashboardItems.last.widgetItems?.isEmpty ?? false) {
                adLog(dashboardItems.removeLast().toString());
              }
            }
          }
        }
      }
      return ADResponseState.completed(dashboardItems);
    } catch (e) {
      return ADResponseState.error('Please try again after some time');
    }
  }

  Future<ADResponseState> howToShopFromJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        return ADResponseState.completed(HowToShopModel.fromJson(parsed).shop);
      });

  Future<ADResponseState> packageListFromJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        return ADResponseState.completed(
          ParamPackageModel.fromJson(parsed).items,
        );
      });

  Future<ADResponseState> getAirportBoardItemsListFromJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);

        final List<DutyFreeDashboardItem> dashboardItems =
            List.empty(growable: true);
        DutyFreeDashboardItem? storyViewDashboardItems;

        if (parsed != null) {
          if ((parsed as Map)['elements'] is List) {
            for (final Map<dynamic, dynamic> element
                in parsed['elements'] as List) {
              final DutyFreeDashboardItem airportDashboardItems =
                  DutyFreeDashboardItem.fromJson(
                (element['fields'] as Map)['widget'],
              );
              if (airportDashboardItems.widgetType == 'storyView') {
                storyViewDashboardItems = airportDashboardItems;
              } else {
                dashboardItems.add(airportDashboardItems);
              }
            }
          }
        }

        return ADResponseState.completed(
          DashboardModelMain(
            storyViewWidget: storyViewDashboardItems,
            airportDashboardItems: dashboardItems,
          ),
        );
      });
}
