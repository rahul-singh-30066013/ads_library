/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/cancellation_policies/cancellation_policies_model.dart'
    as policies;
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/get_flights_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_request_model/get_packages_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_response_model/get_packages_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/important_information/important_information_model.dart'
    as important_information;
import 'package:adani_airport_mobile/modules/pranaam_service/model/reschedule/reschedule_booking_request_model/reschedule_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/flight_details_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/terms_and_conditions/terms_and_conditions.dart'
    as terms;
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart';
import 'package:adani_airport_mobile/network/pranaam_api/pranaam_api_urls.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///this class is used to get data from api for all the sub modules of Pranaam services.
class PranaamAppDataRepository {
  ///TODO marked for removal when data from site core api is available.
  final ServiceBookingDetails _serviceBookingDetails =
      ServiceBookingDetails.getInstance();
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);
  final ADApiClient adApiClientMongo =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  List<ServiceModel> getAllServicesData() {
    return _serviceBookingDetails.getServices();
  }

  List<TravelSectorModel> getAllTravelSectorData() {
    return _serviceBookingDetails.getTravelSectorData();
  }

  List<FlightDetailsModel> getAllFlightsDetailData() {
    return _serviceBookingDetails.getFlightDetailsData();
  }

  List<PranaamFlights> getFilteredFlightList(
    List<PranaamFlights> flights,
    String userSearchString,
  ) {
    if (userSearchString.isEmpty) {
      return [];
    }
    /* userSearchString =
        _serviceBookingDetails.handleSearchString(userSearchString);*/
    return userSearchString.isNotEmpty
        ? _serviceBookingDetails.airportSearchFromList(
            flights,
            userSearchString,
          )
        : [];
  }

  List<Country> getFilteredCountryList(
    List<Country> countryList,
    String userSearchString,
  ) {
    if (userSearchString.isEmpty) {
      return [];
    }
    return userSearchString.isNotEmpty
        ? _serviceBookingDetails.countrySearchFromList(
            countryList,
            userSearchString,
          )
        : [];
  }

  Future<ADResponseState> getFlights(
    Map<String, dynamic> getFlightsRequestModel,
  ) async {
    //TODO remove compute as singleton create new object
    final ADResponseState response = await adApiClientMongo.post(
      path: PranaamApiUrls.getFlights,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(getFlightsRequestModel),
    );

    if (response.viewStatus == Status.complete) {
      response.data = GetFlightsResponseModel.fromJson(response.data);
    }
    return response;
  }

  //
  // Future<ADResponseState> getStandAloneFlights(
  //   Map<String, dynamic> getFlightsRequestModel,
  // ) async {
  //   //TODO remove compute as singleton create new object
  //   final ADResponseState response = await adApiClientMongo.post(
  //     path: PranaamApiUrls.getStandAloneFlights,
  //     header: APIHeaderUtils.flightBookingHeaders(),
  //     params: jsonEncode(getFlightsRequestModel),
  //   );
  //
  //   if (response.viewStatus == Status.complete) {
  //     response.data = GetFlightsResponseModel.fromJson(response.data);
  //   }
  //   return response;
  // }

  ///TODO don't do api calling in compute.
  static Future<ADResponseState> getFlightsDataInCompute(
    Map<String, dynamic> getFlightsRequestModel,
  ) async {
    final ADApiClient adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);
    final ADResponseState response = await adApiClient.post(
      path: PranaamApiUrls.getFlights,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(getFlightsRequestModel),
    );

    if (response.viewStatus == Status.complete) {
      response.data = GetFlightsResponseModel.fromJson(response.data);
    }

    return response;
  }

  ///
  Future<ADResponseState> fetchPackages(
    GetPackagesRequestModel getPackagesRequestModel,
  ) async {
    ///Creating request body for the fetch flights
    try {
      final ADResponseState response = await adApiClientMongo.post(
        path: PranaamApiUrls.getPackages,
        header: APIHeaderUtils.flightBookingHeaders(),
        params: jsonEncode(getPackagesRequestModel),
      );
      if (response.viewStatus == Status.complete) {
        response.data = await compute(_parseJsonInBackground, response.data);
      }
      return response;
    } catch (e) {
      return ADResponseState.error('Something went wrong');
    }
  }

  static Data _parseJsonInBackground(dynamic encodedJson) {
    // adLog('isolate id compute ${Service.getIsolateID(Isolate.current)}');
    return Data.fromJson(encodedJson);
  }

  ///API to get the terms and conditions from Site core.
  Future<ADResponseState> fetchTermsAndConditions(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      adLog('fetchTermsAndConditions response ${response.data}');
      response.data = await compute(
        _parseTermsAndConditions,
        (response.data as List).first,
      );
    } else {
      final jsonString =
          await rootBundle.loadString(JsonAssets.pranaamTermsAndConditions);
      final parsed = json.decode(jsonString);
      response
        ..viewStatus = Status.complete
        ..data = await compute(
          _parseTermsAndConditions,
          parsed,
        );
    }
    return response;
  }

  ///API to get the cancellation policies from Site core.
  Future<ADResponseState> fetchCancellationPolicies(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      adLog('fetchCancellationPolicies response ${response.data}');
      response.data = await compute(
        _parseCancellationPolicies,
        (response.data as List).first,
      );
    } else {
      final jsonString =
          await rootBundle.loadString(JsonAssets.pranaamCancellationPolicies);
      final parsed = json.decode(jsonString);
      response
        ..viewStatus = Status.complete
        ..data = await compute(
          _parseCancellationPolicies,
          parsed,
        );
    }
    return response;
  }

  ///API to get the Important Information from Site core.
  Future<ADResponseState> fetchImportantInformation(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      adLog('fetchImportantInformation response ${response.data}');
      response.data = await compute(
        _parseImportantInformation,
        (response.data as List).first,
      );
    } else {
      final jsonString =
          await rootBundle.loadString(JsonAssets.pranaamImportantInformation);
      final parsed = json.decode(jsonString);
      response
        ..viewStatus = Status.complete
        ..data = await compute(
          _parseImportantInformation,
          parsed,
        );
    }
    return response;
  }

  Future<ADResponseState> rescheduleBooking(
    RescheduleBookingRequestModel rescheduleBookingRequestModel,
  ) async {
    final ADResponseState response = await adApiClientMongo.post(
      path: PranaamApiUrls.rescheduleBooking,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(rescheduleBookingRequestModel),
    );
    // if (response.viewStatus == Status.complete) {
    //   response.data = await compute(_parseJsonInBackground, response.data);
    // }
    return response;
  }

  static important_information.Element _parseImportantInformation(
    dynamic encodedJson,
  ) {
    return important_information.Element.fromJson(encodedJson);
  }

  static terms.Element _parseTermsAndConditions(
    dynamic encodedJson,
  ) {
    return terms.Element.fromJson(encodedJson);
  }

  static policies.Element _parseCancellationPolicies(
    dynamic encodedJson,
  ) {
    return policies.Element.fromJson(encodedJson);
  }
}
