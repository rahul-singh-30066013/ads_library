/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/more/models/customer_feedback/feedback_form_layout_models/feedback_form_layout_model_element.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/package_site_core_response/package_site_core_response.dart'
    as srp_packages;
import 'package:adani_airport_mobile/modules/site_core/model/airline/site_core_airline_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/avatars/avatars_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/modules/site_core/model/city_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/sitecore_country_code_base_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/important_info.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/site_core_insurance_data_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/site_core_payment_parent_response.dart';
import 'package:adani_airport_mobile/network/flights_api/flights_api_urls.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SiteCoreRepository {
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

  final ADAksApiClient adAksApiClient = ADAksApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  ///Api to Fatch Adain Airports List
  Future<ADResponseState> fetchAdaniAirportList(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(
        _parseAdaniAirportListBackground,
        response.data,
      );
    }
    return response;
  }

  static AdaniAirportsElement _parseAdaniAirportListBackground(
    dynamic encodedJson,
  ) {
    return AdaniAirportsElement.fromJson(
      (encodedJson as List).first,
    );
  }

  ///API to get the city airports detail.
  Future<ADResponseState> fetchAirportList(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(
        _parseFlightCityBackground,
        response.data,
      );
    }
    return response;
  }

  static CityResponse _parseFlightCityBackground(
    dynamic encodedJson,
  ) {
    return CityResponse.fromJson((encodedJson as List).first);
  }

  Future<ADResponseState> fetchPaymentDetail(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await adAksApiClient.get(
      path: FLightsApiUrls.paymentmethods,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(
        _parsePaymentDetailBackground,
        response.data,
      );
    }
    return response;
  }

  static SiteCorePaymentParentResponse _parsePaymentDetailBackground(
    dynamic encodedJson,
  ) {
    print(encodedJson);
    return SiteCorePaymentParentResponse.fromJson(
      (encodedJson['elements'] as List).first,
    );
  }

  Future<ADResponseState> fetchCountryCode(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(
        _parseCountryCodeBackground,
        response.data,
      );
    }
    return response;
  }

  static SitecoreCountryCodeBaseResponse _parseCountryCodeBackground(
    dynamic encodedJson,
  ) {
    return SitecoreCountryCodeBaseResponse.fromJson(
      (encodedJson as List).first,
    );
  }

  Future<ADResponseState> fetchAirlineList(
    Map<String, String>? queryParams,
  ) async {
    queryParams?['baseUrl'] = _adApiClient.baseUrl;
    return _getAirLinesDataInCompute(queryParams);
  }

  static Future<ADResponseState> _getAirLinesDataInCompute(
    Map<String, String>? queryParams,
  ) async {
    final ADApiClient _adApiClient = ADApiClient(
      baseUrl: queryParams?['baseUrl'] ??
          Environment.instance.configuration.cmsBaseUrl,
    );
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = SiteCoreAirlineResponse.fromJson(
        (response.data as List).first,
        Environment.instance.configuration.cmsImageBaseUrl,
      );
      final data = response.data as SiteCoreAirlineResponse;
      adLog('${data.params}');
    }
    return response;
  }

  ///API to get the masters.
  Future<ADResponseState> fetchMasters(
    Map<String, String>? queryParams,
  ) async {
    queryParams?['baseUrl'] = _adApiClient.baseUrl;
    return _getSiteCoreMasterDataInCompute(queryParams);
  }

  static Future<ADResponseState> _getSiteCoreMasterDataInCompute(
    Map<String, String>? queryParams,
  ) async {
    final ADApiClient _adApiClient = ADApiClient(
      baseUrl: queryParams?.remove('baseUrl') ??
          Environment.instance.configuration.cmsBaseUrl,
    );

    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = Element.fromJson((response.data as List).first);
    }
    return response;
  }

  ///API to get the SRP packages from Site core for pranaam.
  Future<ADResponseState> fetchSRPPackages(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(
        _parseSRPPackagesInBackground,
        response.data,
      );
    } else {
      final jsonString = await rootBundle
          .loadString(JsonAssets.siteCorePranaamPackageServices);
      final parsed = json.decode(jsonString);
      response
        ..viewStatus = Status.complete
        ..data = await compute(
          _parseSRPPackagesInBackground,
          parsed,
        );
    }
    return response;
  }

  static srp_packages.Element _parseSRPPackagesInBackground(
    dynamic encodedJson,
  ) {
    return srp_packages.Element.fromJson((encodedJson as List).first);
  }

  ///API to get the masters.
  Future<ADResponseState> fetchAllCitiesData(
    Map<String, String>? queryParams,
  ) async {
    queryParams?['baseUrl'] = _adApiClient.baseUrl;
    if (kDebugMode) {
      return _getSiteCoreCitiesDataInCompute(queryParams);
    }
    return compute(
      _getSiteCoreCitiesDataInCompute,
      queryParams,
    );
  }

  static Future<ADResponseState> _getSiteCoreCitiesDataInCompute(
    Map<String, String>? queryParams,
  ) async {
    final ADApiClient _adApiClient = ADApiClient(
      baseUrl: queryParams?.remove('baseUrl') ??
          Environment.instance.configuration.cmsBaseUrl,
    );
// final baseUrl = ;
// adLog('baseUrl $baseUrl');
    ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );

    if (response.viewStatus == Status.complete) {
      adLog('_getSiteCoreCitiesDataInCompute response ${response.data}');
      try {
        response.data =
            city_list.Element.fromJson((response.data as List).first);
      } catch (e) {
        adLog(
          '_getSiteCoreCitiesDataInCompute response exception while parsing$e',
        );

        /// any exception comes get data from local JSON
        response = ADResponseState.error('exception while parsing');
      }
    }

    return response;
  }

  ///API to get the language dictionary for app translation from site coer.
  Future<ADResponseState> fetchLanguageDictionary(
    Map<String, String>? queryParams,
    String languageCode,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: '${SiteCoreApiUrls.siteCoreFlightDictionaryBaseUrl}$languageCode?',
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
      siteCoreDictionary: true,
    );
    return response;
  }

  Future<ADResponseState> fetchFlightInformationPolicies(
    Map<String, dynamic>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(
        _parseInformationPoliciesBackground,
        response.data,
      );
    }
    return response;
  }

  static ImportantInfo _parseInformationPoliciesBackground(
    dynamic encodedJson,
  ) {
    return ImportantInfo.fromMap((encodedJson as List).first);
  }

  ///Fetch data for Feedback Form Layout from Sitecore.
  Future<ADResponseState> fetchFeedbackFormLayoutData({
    required Map<String, String> queryParams,
  }) async {
    try {
      final ADResponseState response = await _adApiClient.get(
        path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
        queryParameters: queryParams,
      );
      adLog('response : $response');
      return _parseFeedbackFormLayout(response);
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
  }

  ADResponseState _parseFeedbackFormLayout(ADResponseState response) {
    return response.viewStatus == Status.complete
        ? ADResponseState.completed(
            FeedbackFormLayoutModelElement.fromJson(
              (response.data as List).first,
            ),
            response.successCode,
          )
        : response;
  }

  Future<ADResponseState> fetchInsuranceData(
    Map<String, String>? queryParams,
  ) async {
    queryParams?['baseUrl'] = _adApiClient.baseUrl;
    return compute(
      _getInsuranceDataInCompute,
      queryParams,
    );
  }

  static Future<ADResponseState> _getInsuranceDataInCompute(
    Map<String, String>? queryParams,
  ) async {
    final ADApiClient _adApiClient = ADApiClient(
      baseUrl: queryParams?['baseUrl'] ??
          Environment.instance.configuration.cmsBaseUrl,
    );
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = SiteCoreInsuranceDataResponse.fromJson(
        (response.data as List).first,
      );
      final data = response.data as SiteCoreInsuranceDataResponse;
      adLog('${data.fields}');
    }
    return response;
  }

  ///Fetch avatars list
  Future<ADResponseState> fetchAvatars() async {
    try {
      final ADResponseState response = await _adApiClient.get(
        path:
            '${Environment.instance.configuration.cmsBaseUrl}${SiteCoreApiUrls.avatarsListUrl}',
        header: APIHeaderUtils.siteCoreHeader(),
      );
      adLog('response : $response');
      return _parseAvatarsList(response);
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error('Something went wrong');
    }
  }

  ADResponseState _parseAvatarsList(ADResponseState response) {
    return response.viewStatus == Status.complete
        ? ADResponseState.completed(
            AvatarsModel.fromJson(
              response.data,
            ),
            response.successCode,
          )
        : response;
  }
}
