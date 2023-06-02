/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:collection';
import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_add_to_cart_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_coupon/duty_free_apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_coupon/duty_free_get_coupon_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_passenger_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_filter_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_cart_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_promotion_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/network/duty_free/duty_free_api_urls.dart';
import 'package:adani_airport_mobile/network/promo_apis/promo_api_urls.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DutyFreeRepository {
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

  ADApiClient _cartApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  /// Get product list api
  Future<ADResponseState> getDutyFreeProducts({
    required DutyFreeProductListRequest catalogRequest,
    required CancelToken? cancelToken,
  }) async {
    const bool defaultVal = false;
    final request = catalogRequest.toJson()
      ..removeWhere(
        (key, value) =>
            value == null ||
            value.toString().isEmpty ||
            ((value is num?) ? (value ?? 0) <= 0 : defaultVal),
      );
    final ADResponseState response = await _adApiClient.postWithCancel(
      path: DutyFreeApiUrls.getDutyFreeProducts,
      params: jsonEncode(request),
      header: APIHeaderUtils.flightBookingHeaders(),
      cancelToken: cancelToken,
    );
    return response;
  }

  /// Get category list api
  void getDutyFreeCategory() {
    adLog('print');
    /*
    return ADResponseState.completed(
      response.data is List
          ? (response.data as List)
              .map((e) => DutyFreeCategoryDataModel.fromJson(e))
              .toList()
          : [],
    );
    */
  }

  /// get product in tab
  Future<ADResponseState> tabsApiCall({
    required DutyFreeProductListRequest catalogRequest,
    required String path,
  }) async {
    const bool defaultVal = false;
    final request = catalogRequest.toJson()
      ..removeWhere(
        (key, value) =>
            value == null ||
            value.toString().isEmpty ||
            ((value is num?) ? (value ?? 0) <= 0 : defaultVal),
      );
    final ADResponseState response = await _adApiClient.post(
      path: path,
      // path: DutyFreeApiUrls.getDutyFreeProducts,

      params: jsonEncode(request),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  /// Add to cart api
  Future<ADResponseState> addToCart({
    required DutyFreeAddToCartRequest addToCartRequest,
  }) async {
    _cartApiClient = ADApiClient(
      baseUrl: Environment.instance.configuration.apiBaseUrl,
    );
    final ADResponseState response = await _cartApiClient.post(
      path: DutyFreeApiUrls.addToCart,
      params: jsonEncode(addToCartRequest),
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    return response;
  }

  /// Get cart details api
  Future<ADResponseState> getCartDetails(
    String? oldUserAgentId, {
    bool isGuestLogin = false,
  }) async {
    Map<String, dynamic> apiHeader = APIHeaderUtils.flightBookingHeaders();
    if (isGuestLogin) {
      apiHeader = APIHeaderUtils.flightBookingHeaders(
        isGuestLoggedIn: isGuestLogin,
        oldAgentID: oldUserAgentId,
        anonymousKeyName: 'anonymousUserId',
      );
    }
    final Map<String, dynamic> queryParams = HashMap();
    queryParams['language'] = 'en';

    _cartApiClient = ADApiClient(
      baseUrl: Environment.instance.configuration.apiBaseUrl,
    );
    final ADResponseState response = await _cartApiClient.get(
      path: DutyFreeApiUrls.getCartDetails,
      header: apiHeader,
      queryParameters: queryParams,
    );

    return response;
  }

  /// Create order api
  Future<ADResponseState> updatePassengerDetails({
    required DutyFreePassengerDetails passengerDetails,
  }) async {
    adLog(passengerDetails.toJson().toString());
    //TODO will handle later as guest user Log in need to clear headers
    _cartApiClient = ADApiClient(
      baseUrl: Environment.instance.configuration.apiBaseUrl,
    );
    final ADResponseState response = await _cartApiClient.post(
      path: DutyFreeApiUrls.updatePassengerDetails,
      params: jsonEncode(passengerDetails),
      header: APIHeaderUtils.flightBookingHeaders(isGuestLoggedIn: false),
    );

    return response;
  }

  /// validate Pre-Order Discount api
  Future<ADResponseState> validatePreOrderDiscount({
    required DutyFreePassengerDetails preOrderDiscount,
  }) async {
    //TODO will handle later as guest user Log in need to clear headers
    _cartApiClient = ADApiClient(
      baseUrl: Environment.instance.configuration.apiBaseUrl,
    );
    final ADResponseState response = await _cartApiClient.post(
      path: DutyFreeApiUrls.validatePreOrderDiscount,
      params: jsonEncode(preOrderDiscount),
      header: APIHeaderUtils.flightBookingHeaders(isGuestLoggedIn: false),
    );
    if (response.viewStatus == Status.complete && response.data != null) {
      response.data = await compute(_parseDutyFreeResponse, response.data);
    }
    return response;
  }

  static DutyFreeCartResponse? _parseDutyFreeResponse(dynamic json) {
    try {
      return DutyFreeCartResponse.fromJson(json);
    } catch (e) {
      adLog(e.toString());
      return null;
    }
  }

  /// Get coupon
  Future<ADResponseState> getFilter({
    required DutyFreeProductFilterRequest dutyFreeProductFilterRequest,
    // required CancelToken? cancelToken,
  }) async {
    final ADResponseState response = await _adApiClient.postWithCancel(
      path: DutyFreeApiUrls.getProductFilters,
      params: jsonEncode(dutyFreeProductFilterRequest),
      header: APIHeaderUtils.flightBookingHeaders(),
      // cancelToken: cancelToken,
    );

    return response;
  }

  /// Get filter
  Future<ADResponseState> getCoupon({
    required DutyFreeGetCouponRequest dutyFreeGetCouponRequest,
  }) async {
    final ADResponseState response = await _cartApiClient.post(
      path: DutyFreeApiUrls.getCoupon,
      params: jsonEncode(dutyFreeGetCouponRequest),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  /// Get filter
  Future<ADResponseState> applyCoupon({
    required DutyFreeApplyCouponRequest applyCouponRequest,
  }) async {
    final ADResponseState response = await _cartApiClient.post(
      path: PromoApiUrls.applyCoupon,
      params: jsonEncode(applyCouponRequest),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  /// Remove duty free filter
  Future<ADResponseState> removeDutyFreeCart() async {
    final ADResponseState response = await _cartApiClient.post(
      path: DutyFreeApiUrls.removeCartByUser,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: '',
    );

    return response;
  }

  Future<ADResponseState> removeMultipleOutOfStock(
    List<Map> outOfStockItems,
  ) async {
    final ADResponseState response = await _cartApiClient.post(
      path: DutyFreeApiUrls.removeMultipleItems,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(outOfStockItems),
    );

    return response;
  }

  Future<ADResponseState> validateCart() async {
    final ADResponseState response = await _cartApiClient.post(
      path: DutyFreeApiUrls.validateCart,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: '',
    );

    return response;
  }

  /// Remove duty free filter
  Future<ADResponseState> dutyFreeBankOffer() async {
    final Map<String, dynamic> mapRequest = HashMap();
    mapRequest['placeholderName'] = 'main';
    mapRequest['item'] =
        '/sitecore/content/AirportHome/DutyfreeHome/BankOffers';
    mapRequest['sc_lang'] = 'en';
    mapRequest['sc_apikey'] = '%7BB5AC63B3-9934-4423-8FF9-F619303AC8DF%7D';
    mapRequest['isApp'] = false;
    final ADResponseState response = await _adApiClient.get(
      path: DutyFreeApiUrls.dutyFreeBankOffer,
      header: APIHeaderUtils.flightBookingHeaders(),
      queryParameters: mapRequest,
    );

    return response;
  }

  // /// Remove duty free filter
  // Future<ADResponseState> dutyFreeImportantInformation(String storeType) async {
  //   final Map<String, dynamic> mapRequest = HashMap();
  //   mapRequest['placeholderName'] = 'main';
  //   mapRequest['item'] =
  //   '/sitecore/content/AirportHome/DutyfreeHome/information';
  //   mapRequest['sc_lang'] = 'en';
  //   mapRequest['sc_storetype'] = storeType;
  //   mapRequest['sc_apikey'] = '%7BB5AC63B3-9934-4423-8FF9-F619303AC8DF%7D';
  //   mapRequest['isApp'] = false;
  //   final ADResponseState response = await _adApiClient.get(
  //     path: DutyFreeApiUrls.dutyFreeBankOffer,
  //     header: APIHeaderUtils.flightBookingHeaders(),
  //     queryParameters: mapRequest,
  //   );
  //
  //   return response;
  // }

  // Future<void> dutyFreeImportantInformationAndCancellationPolicy(
  //   DutyFreeState dutyfreeState, {
  //   String? storeType,
  // }) async {
  //   // print('Statussssss1 ${dutyfreeState.importantInformationStatus}');
  //   if (dutyfreeState.importantInformationStatus == Status.loading) {
  //     return;
  //   }
  //   // print('Statussssss2 $storeType');
  //   dutyfreeState.importantInformationStatus = Status.loading;
  //   dutyfreeState.importantInformationPolicyList.clear();
  //   dutyfreeState.cancellationPolicyList.clear();
  //
  //   final currentStoreType =
  //       storeType ?? dutyfreeState.terminalModel.value.code;
  //   final String url =
  //       'sitecore/api/layout/placeholder/jss?placeholderName=main&item=/sitecore/content/AirportHome/DutyfreeHome/information&sc_storetype=$currentStoreType&sc_lang=en&sc_apikey=%7BE12C376F-64C4-4051-B169-0328EE0B04C9%7D';
  //   // print('Statussssss2 $url');
  //
  //   try {
  //     await _adApiClient
  //         .get(
  //       path: url,
  //       siteCore: true,
  //       header: APIHeaderUtils.siteCoreHeader(),
  //     )
  //         .then((ADResponseState value) {
  //       // print('Statussssss2 $value');
  //       if (value.viewStatus == Status.complete &&
  //           value.data != null &&
  //           value.data is List) {
  //         for (final Map element in value.data) {
  //           if (element['fields'] != null) {
  //             final Map<String, dynamic> fields =
  //                 element['fields'] as Map<String, dynamic>;
  //             if (fields['contentList'] != null) {
  //               final List<dynamic> contentItemsList =
  //                   fields['contentList'] as List<dynamic>;
  //               for (final Map item in contentItemsList) {
  //                 final String title = item['title'] as String;
  //                 final List<dynamic> linesList =
  //                     item['lines'] as List<dynamic>;
  //                 for (final Map lineItem in linesList) {
  //                   final DutyFreeImportantPoliciesResponse policiesResponse =
  //                       DutyFreeImportantPoliciesResponse(
  //                     line: '',
  //                     title: title,
  //                     linkText: '',
  //                     linkURL: '',
  //                   );
  //
  //                   if (lineItem['line'] != null) {
  //                     final String line = lineItem['line'] as String;
  //                     policiesResponse.line = line;
  //                   }
  //                   final List<dynamic> linkList =
  //                       lineItem['links'] as List<dynamic>;
  //                   if (linkList.isNotEmpty) {
  //                     for (final Map element in linkList) {
  //                       if (element['linkURL'] != null) {
  //                         final String linkUrl = element['linkURL'] as String;
  //                         final String linkText = element['linkText'] as String;
  //                         final String link = element['link'] as String;
  //                         final String textToBeReplaced2 = '\$$link\$';
  //                         final String textToBeReplaced = '\$$link\$.';
  //                         policiesResponse
  //                           ..line = policiesResponse.line
  //                               .replaceAll(textToBeReplaced, '')
  //                           ..linkURL = linkUrl
  //                           ..linkText = linkText
  //                           ..line.replaceAll(textToBeReplaced2, '');
  //
  //                         // print('sdvfdsfcds ${policiesResponse.linkURL}');
  //                         // print('sdvfdsfcds ${policiesResponse.line}');
  //                         // print('sdvfdsfcds ${policiesResponse.linkText}');
  //                       }
  //                     }
  //                   }
  //
  //                   if (title == 'Important Information') {
  //                     dutyfreeState.importantInformationPolicyList
  //                         .add(policiesResponse);
  //                   } else {
  //                     dutyfreeState.cancellationPolicyList
  //                         .add(policiesResponse);
  //                   }
  //                 }
  //
  //                 // final titlse = item['title'] as String;
  //                 // // print('contentList $title');
  //                 // final offerText = titlse.replaceAll(' T&C', '');
  //                 // final richText = item['richText'] as String;
  //                 // final DutyFreeProductPromotionModel tempData =
  //                 // DutyFreeProductPromotionModel(
  //                 //   displayText: offerText,
  //                 //   tc: richText,
  //                 // );
  //                 // promotionData.add(tempData);
  //                 // return msdd;
  //               }
  //             }
  //           }
  //         }
  //       }
  //       dutyfreeState.importantInformationStatus = Status.complete;
  //     });
  //     // final List<DutyFreeDashboardItem> dashboardItems =
  //     // List.empty(growable: true);
  //     // if (response.data != null) {
  //     //
  //     // }
  //   } catch (e) {
  //     ADResponseState.error('Please try again after some time');
  //   }
  //   // return promotionData;
  // }

  Future<ADResponseState?> dutyFreeImportantInformationAndCancellationPolicy({
    required String storeType,
    required String airportCode,
    required String cityName,
  }) async {
    final String url =
        'sitecore/api/layout/placeholder/jss?placeholderName=main&item=/sitecore/content/AirportHome/DutyFreeAirports/$cityName/information&sc_storetype=$storeType&sc_lang=en&sc_apikey=${SiteCoreApiUrls.siteCoreApiKey}&sc_airport=$airportCode';
    // print('url $url');
    ADResponseState? response;
    try {
      response = await _adApiClient.get(
        path: url,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
    } catch (e) {
      ADResponseState.error('Please try again after some time');
    }
    return response;

    // return promotionData;
  }

  Future<ADResponseState> getAllCategories({
    required String storeType,
    required bool ageAbove25,
  }) async {
    final Map<String, dynamic> mapRequest = HashMap();
    mapRequest['placeholderName'] = 'main';
    mapRequest['item'] =
        '/sitecore/content/AirportHome/DutyfreeAirports/${selectedAirportsData?.city}/categories';
    mapRequest['sc_lang'] = 'en';
    mapRequest['sc_apikey'] = '{B5AC63B3-9934-4423-8FF9-F619303AC8DF}';
    mapRequest['isApp'] = true;
    mapRequest['showOnHomepage'] = true;
    mapRequest['sc_restricted'] = !ageAbove25;
    mapRequest['sc_storetype'] = storeType;
    mapRequest['application'] = 'app';
    mapRequest['sc_airport'] = selectedAirportsData?.airportCode ?? '';

    final ADResponseState response = await _adApiClient.get(
      siteCore: true,
      path: DutyFreeApiUrls.categories,
      header: APIHeaderUtils.siteCoreHeader(),
      queryParameters: mapRequest,
    );

    return response;
  }

  Future<List<DutyFreeProductPromotionModel>> getDutyFreebankOffers(
    DutyFreeState dutyfreeState,
  ) async {
    dutyfreeState.bankOfferStatus.value = Status.loading;
    const String url =
        'sitecore/api/layout/placeholder/jss?placeholderName=main&item=/sitecore/content/AirportHome/DutyfreeHome/BankOffers&sc_lang=en&sc_apikey=%7BB5AC63B3-9934-4423-8FF9-F619303AC8DF%7D&isApp=false';
    final List<DutyFreeProductPromotionModel> promotionData =
        List.empty(growable: true);
    try {
      await _adApiClient
          .get(
        path: url,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      )
          .then((ADResponseState value) {
        dutyfreeState.bankOfferStatus.value = Status.complete;
        if (value.viewStatus == Status.complete &&
            value.data != null &&
            value.data is List) {
          for (final Map element in value.data) {
            if (element['fields'] != null) {
              final Map<String, dynamic> fields =
                  element['fields'] as Map<String, dynamic>;
              if (fields['contentItems'] != null) {
                final List<dynamic> contentItems =
                    fields['contentItems'] as List<dynamic>;
                for (final Map item in contentItems) {
                  // final name = i['name'] as String;
                  final title = item['title'] as String;
                  final offerText = title.replaceAll(' T&C', '');
                  final richText = item['richText'] as String;
                  final DutyFreeProductPromotionModel tempData =
                      DutyFreeProductPromotionModel(
                    displayText: offerText,
                    tc: richText,
                  );
                  promotionData.add(tempData);
                  // return msdd;
                }
              }
            }
          }
        }
      });
      // final List<DutyFreeDashboardItem> dashboardItems =
      // List.empty(growable: true);
      // if (response.data != null) {
      //
      // }
    } catch (e) {
      ADResponseState.error('Please try again after some time');
    }
    return promotionData;
  }

  Future<ADResponseState> createOrder() async {
    final ADResponseState response = await _cartApiClient.get(
      path: DutyFreeApiUrls.createOrder,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = await compute(_parseOrderResponse, response.data);
    }
    return response;
  }

  DutyFreeCartResponse _parseOrderResponse(dynamic json) {
    return DutyFreeCartResponse.fromJson(json);
  }
}
