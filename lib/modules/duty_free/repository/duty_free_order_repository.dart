/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/cancellation/duty_free_order_cancellation_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/reschedule_order_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/network/duty_free/duty_free_api_urls.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class DutyFreeOrderRepository {
  // final ADApiClient _adApiClient =
  //     ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

  final ADApiClient _cartApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  final ADAksApiClient _aDAksApiClient =
  ADAksApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);



  /// get product in tab
  Future<ADResponseState> orderCancellationApiCall({
    required DutyFreeOrderCancellationRequest request,
  }) async {
    final ADResponseState response = await _aDAksApiClient.post(
      path: DutyFreeApiUrls.orderCancellation,
      params: jsonEncode(request),
      header: APIHeaderUtils.tempFlightBookingHeaders(),
    );
    return response;
  }

  /// Remove duty free filter
  Future<ADResponseState> rescheduleOrder({
    required RescheduleOrderRequest request,
  }) async {
    final ADResponseState response = await _aDAksApiClient.post(
      path: DutyFreeApiUrls.rescheduleOrder,
      header: APIHeaderUtils.tempFlightBookingHeaders(),
      params: jsonEncode(request),
    );

    return response;
  }

  /// Cancel Order Details Data
  /// Get product list api
  Future<ADResponseState> getDutyFreeOrderDetailsByOrderId({
    required String orderId,
  }) async {
    final ADResponseState response = await _aDAksApiClient.get(
      path:
          '${DutyFreeApiUrls.getDutyFreeCancelOrderDetails}$orderId',
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  Future<DutyFreeDashboardItem?> getDutyFreeOtherServices(
      String cityName,) async {
    // DutyFreeDashboardItem item = const DutyFreeDashboardItem;

    try {
      final ADApiClient adApiClient = ADApiClient(
        baseUrl: Environment.instance.configuration.cmsBaseUrl,
      );

      final String moreServiceUrl =
          '${DutyFreeApiUrls.dutyFreeOtherServices}$cityName/services&sc_lang=en&sc_apikey=${SiteCoreApiUrls.siteCoreApiKey}&isApp=true';
      final ADResponseState response = await adApiClient.get(
        // path: DutyFreeApiUrls.dutyFreeOtherServices,
        path: moreServiceUrl,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      if (response.viewStatus == Status.complete && response.data != null) {
        final elements = List<Map>.from(response.data as List);
        if (elements.isNotEmpty) {
          final fields = elements.first['fields'] as Map;
          final widget = fields['widget'];
          final DutyFreeDashboardItem dutyFreeDashboardItem =
              DutyFreeDashboardItem.fromJson(widget).copyWith(
            aspectRatio: 1.034,
            subItemWidth: 0.64,
          );
          return dutyFreeDashboardItem;
        }
      }
    } catch (e) {
      adLog('Error ${e.toString()}');
    }
    return null;
  }
}
