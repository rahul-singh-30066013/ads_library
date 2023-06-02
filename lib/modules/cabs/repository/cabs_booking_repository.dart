/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_coupon_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_address_details_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/cab_booking_cancellation_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/create_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/filtered_vendor_data_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/search_cab_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/sos_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/update_cab_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_booking_status_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cancel_reason_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/postal_code_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/network/cab_booking/cab_booking_api_urls.dart';
import 'package:adani_airport_mobile/network/common_service/common_service_api_urls.dart';
import 'package:adani_airport_mobile/network/constants/api_base_urls.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CabsBookingRepository {
  final ADApiClient _adSiteCoreApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);
  final ADApiClient _adGoogleMapClient =
      ADApiClient(baseUrl: ApiBaseUrls.googleMapBaseURL);
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);
  final ADAksApiClient adAksApiClient = ADAksApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  ///Api to Fatch Airports List Cabs
  Future<ADResponseState> fetchAirportListForCabs(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await _adSiteCoreApiClient.get(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParameters: queryParams,
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(
        _parseAirportListForCabsBackground,
        response.data,
      );
    }
    return response;
  }

  static AdaniAirportsElement _parseAirportListForCabsBackground(
    dynamic encodedJson,
  ) {
    return AdaniAirportsElement.fromJson(
      (encodedJson as List).first,
    );
  }

  ///Fetch data for dashboard from server.
  Future<ADResponseState> fetchCabBookingLandingPageData({
    required Map<String, String> queryParams,
  }) async {
    try {
      final ADResponseState response = await _adSiteCoreApiClient.get(
        path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
        queryParameters: queryParams,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      return _parseLandingPageItems(response.data);
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error(
        'Your gateway to goodness welcomes you soon.',
      );
    }
  }

  ///Fetch data for LandingPageItems from local json.
  Future<ADResponseState> fetchLandingPageItemsFromLocalJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        return _parseLandingPageItems(parsed);
      });

  ADResponseState _parseLandingPageItems(dynamic data) {
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
        }
      }
      return ADResponseState.completed(dashboardItems, '200');
    }
  }

  ///Fetch data for Google search Data from google.
  CancelToken cancelToken = CancelToken();
  final int statusSuccess = 200;

  Future<ADResponseState> fetchGoogleAddressSearchData({
    required String query,
    required AirportTerminalDetailModel? selectedAirportTerminalDetailModel,
  }) async {
    try {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel();
        cancelToken = CancelToken();
      }
      final ADResponseState response =
          await _adGoogleMapClient.fetchGoogleSearchData(
        path:
            '${ApiBaseUrls.autoCompleteAPIEndPoint}input=$query&language=en&location=${double.parse(
          selectedAirportTerminalDetailModel?.latitude ?? '28.4458626',
        )}%2C${double.parse(
          selectedAirportTerminalDetailModel?.longitude ?? '77.0399492',
        )}&radius=${AppConstantRemote().appConstantRemoteModel?.cabSearchRadiusInMeters ?? 100000}&components=country%3Ain&key=${AppConstantRemote().appConstantRemoteModel?.googleApiKey ?? ApiBaseUrls.googleAPIKey}',
        cancelToken: cancelToken,
      );
      return parseGoogleSearchResponse(response);
    } catch (e) {
      return ADResponseState.error(
        'Something went wrong..',
      );
    }
  }

  Future<ADResponseState> parseGoogleSearchResponse(
    ADResponseState response,
  ) async {
    if (response.viewStatus == Status.complete) {
      final DestinationSearchAddressModel? destinationAddressModel =
          DestinationSearchAddressModel.fromJson(response.data);
      return destinationAddressModel?.predictions?.isNotEmpty ?? false
          ? ADResponseState.completed(
              destinationAddressModel?.predictions,
            )
          : ADResponseState.error('Location not found.');
    } else {
      return ADResponseState.error(response.message);
    }
  }

  ///Fetch data for Place details from google.
  Future<ADResponseState> fetchPlaceDetailsByPlaceId({
    required SearchAddressModel searchAddressModel,
  }) async {
    try {
      final ADResponseState response =
          await _adGoogleMapClient.fetchGoogleSearchData(
        path:
            '${ApiBaseUrls.placeDetailAPIEndPoint}placeid=${searchAddressModel.placeId.toString()}&key=${AppConstantRemote().appConstantRemoteModel?.googleApiKey ?? ApiBaseUrls.googleAPIKey}',
      );
      return parsePlaceDetailsResponse(searchAddressModel, response);
    } catch (e) {
      return ADResponseState.error(
        'Something went wrong..',
      );
    }
  }

  Future<ADResponseState> parsePlaceDetailsResponse(
    SearchAddressModel searchAddressModel,
    ADResponseState response,
  ) async {
    if (response.viewStatus == Status.complete) {
      try {
        final DestinationAddressDetailsModel? destinationAddressDetailsModel =
            DestinationAddressDetailsModel.fromJson(response.data);
        destinationAddressDetailsModel?.result?.formattedAddress =
            searchAddressModel.description;
        return destinationAddressDetailsModel?.result != null
            ? ADResponseState.completed(
                destinationAddressDetailsModel?.result,
                response.statusCode.toString(),
              )
            : ADResponseState.error('Location not found.');
      } catch (e) {
        return ADResponseState.error(
          'Something went wrong..',
        );
      }
    } else {
      return ADResponseState.error(response.message);
    }
  }

  /// this api is use to fetch cab itineraries
  Future<ADResponseState> fetchCabItineraries({
    required SearchCabRequestModel searchCabRequestModel,
  }) async {
    ///Creating request body for the fetch flights
    final ADResponseState response = await _adApiClient.post(
      path: CabBookingApiUrls.getCabBookingSearchCab,
      params: jsonEncode(searchCabRequestModel),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(getSearchCabDataInCompute, response.data);
    }
    return response;
  }

  static SearchCabResponseModel getSearchCabDataInCompute(
    dynamic encodedJson,
  ) {
    return SearchCabResponseModel.fromJson(encodedJson);
  }

  /// this api is use to fetch cab itineraries
  Future<ADResponseState> createCabCart({
    required CreateCartRequestModel createCartRequestModel,
  }) async {
    ///Creating request body for the fetch flights
    final ADResponseState response = await _adApiClient.post(
      path: CabBookingApiUrls.createCabBookingCart,
      params: jsonEncode(createCartRequestModel),
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    return response;
  }

  Future<ADResponseState> fetchCabCartDetail({
    String? oldAgentID,
  }) async {
    final ADResponseState response = await _adApiClient.get(
      path: CabBookingApiUrls.getCabBookingCartDetails,
      header: (oldAgentID ?? '').isNotEmpty
          ? APIHeaderUtils.flightBookingHeaders(
              isGuestLoggedIn: oldAgentID?.isNotEmpty,
              oldAgentID: oldAgentID,
            )
          : APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(getCabCartDetailDataInCompute, response.data);
    }
    return response;
  }

  static CabCartDetailResponseModel getCabCartDetailDataInCompute(
    dynamic encodedJson,
  ) {
    return CabCartDetailResponseModel.fromJson(encodedJson);
  }

  Future<ADResponseState> updateCabCartDetail({
    required UpdateCabCartRequestModel updateCabCartRequestModel,
  }) async {
    ///Creating request body for the fetch flights
    final ADResponseState response = await _adApiClient.post(
      path: CabBookingApiUrls.updateContactDetail,
      params: jsonEncode(updateCabCartRequestModel),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  /// Get coupon code list
  Future<ADResponseState> getCoupon({
    required CabBookingCouponRequest dutyFreeGetCouponRequest,
    required String oldAgentID,
  }) async {
    final ADResponseState response = await _adApiClient.post(
      path: CabBookingApiUrls.couponList,
      params: jsonEncode(dutyFreeGetCouponRequest),
      header: APIHeaderUtils.flightBookingHeaders(
        isGuestLoggedIn: oldAgentID.isNotEmpty,
        oldAgentID: oldAgentID,
      ),
    );
    return response;
  }

  /// Apply coupon code
  Future<ADResponseState> applyCoupon({
    required CabBookingApplyCouponRequest applyCouponRequest,
    required String oldAgentID,
  }) async {
    final ADResponseState response = await _adApiClient.post(
      path: CabBookingApiUrls.applyCoupon,
      params: jsonEncode(applyCouponRequest),
      header: APIHeaderUtils.flightBookingHeaders(
        isGuestLoggedIn: oldAgentID.isNotEmpty,
        oldAgentID: oldAgentID,
      ),
    );
    return response;
  }

  /// Apply coupon code
  Future<ADResponseState> removeCoupon({
    required CabBookingApplyCouponRequest applyCouponRequest,
  }) async {
    final ADResponseState response = await _adApiClient.post(
      path: CabBookingApiUrls.removeCoupon,
      params: jsonEncode(applyCouponRequest),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  // Future<ADResponseState> getCabBookingOrderDetails({
  //   required String bookingId,
  // }) async {
  //   final ADResponseState response = await _adApiClient.get(
  //     path: '${CabBookingApiUrls.getCabBookingOrderDetails}/$bookingId',
  //     header: APIHeaderUtils.flightBookingHeaders(),
  //   );
  //   if (response.viewStatus == Status.complete) {
  //     response.data =
  //         await compute(getFlightStatusDataInCompute, response.data);
  //   }
  //   return response;
  // }

  static CabOrderDetailResponseModel getFlightStatusDataInCompute(
    dynamic encodedJson,
  ) {
    return CabOrderDetailResponseModel.fromJson(encodedJson);
  }

  // Future<ADResponseState> getCabBookingStatus({
  //   required String bookingId,
  // }) async {
  //   final ADResponseState response = await _adApiClient.get(
  //     path: '${CabBookingApiUrls.getCabBookingStatus}/$bookingId',
  //     header: APIHeaderUtils.flightBookingHeaders(),
  //   );
  //   if (response.viewStatus == Status.complete) {
  //     response.data =
  //         await compute(getBookingStatusDataInCompute, response.data);
  //   }
  //   return response;
  // }

  static CabBookingStatusResponseModel getBookingStatusDataInCompute(
    dynamic encodedJson,
  ) {
    return CabBookingStatusResponseModel.fromJson(encodedJson);
  }

  ///Fetch data for VendorInformation from sitecore.
  Future<ADResponseState> fetchVendorInformation({
    required FilteredVendorDataRequestModel filteredVendorDataRequestModel,
  }) async {
    try {
      final ADResponseState response = await _adSiteCoreApiClient.post(
        path: SiteCoreApiUrls.siteCoreCabBookingVendorInfo,
        header: APIHeaderUtils.siteCoreHeader(),
        params: jsonEncode(filteredVendorDataRequestModel),
      );
      response.data = await compute(
        parseVendorInformationResponseDataInCompute,
        response.data,
      );
      return response;
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error(
        'Your gateway to goodness welcomes you soon.',
      );
    }
  }

  static FilteredVendorDataResponseModel
      parseVendorInformationResponseDataInCompute(
    dynamic encodedJson,
  ) {
    return FilteredVendorDataResponseModel.fromJson(encodedJson);
  }

  Future<ADResponseState> cabBookingPreCancellationApiCall({
    required String orderReferenceId,
  }) async {
    final ADResponseState response = await _adApiClient.get(
      path:
          '${CabBookingApiUrls.getCabBookingPreCancellation}/$orderReferenceId',
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  /// bookingCancel
  Future<ADResponseState> cabBookingCancellationApiCall({
    required CabBookingCancellationRequest? request,
  }) async {
    final ADResponseState response = await adAksApiClient.post(
      path: CabBookingApiUrls.postCabBookingCancellation,
      params: jsonEncode(request),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  /// sos alert Vander
  Future<ADResponseState> cabBookingSosAlertApiCall({
    required SosRequestModel? request,
  }) async {
    final ADResponseState response = await adAksApiClient.post(
      path: CabBookingApiUrls.postCabBookingSOS,
      params: jsonEncode(request),
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    return response;
  }

  Future<ADResponseState> fetchCabBookingCancelReasonData({
    required Map<String, String> queryParams,
  }) async {
    try {
      final ADResponseState response = await _adSiteCoreApiClient.get(
        path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
        queryParameters: queryParams,
        siteCore: true,
        header: APIHeaderUtils.siteCoreHeader(),
      );
      return _parseCabBookingCancelReasonItems(response.data);
    } catch (e) {
      adLog('exception $e');
      return ADResponseState.error(
        'Something went wrong.',
      );
    }
  }

  ADResponseState _parseCabBookingCancelReasonItems(dynamic data) {
    CancelReasonResponseModel cancelReasonResponseModel;
    if ((data as List).isEmpty) {
      return ADResponseState.error(
        'Something went wrong.',
        serverError,
      );
    } else {
      for (final Map<dynamic, dynamic> element in data) {
        final widgetData = element['fields'];
        if (widgetData != null) {
          cancelReasonResponseModel = CancelReasonResponseModel.fromJson(
            widgetData,
          );
          return ADResponseState.completed(cancelReasonResponseModel, '200');
        }
      }
    }
    return ADResponseState.error(
      'Something went wrong.',
      serverError,
    );
  }

  Future<ADResponseState> fetchPostalCodeData({
    required String query,
  }) async {
    final ADResponseState response = await _adApiClient.get(
      path: '${CommonServiceApiUrls.postalCodeDataApi}$query',
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    try {
      if (response.viewStatus == Status.complete && response.data != null) {
        final data = PostalCodeResponseModel.fromJson(response.data);
        response.data =
            data.results?.isNotEmpty ?? false ? data.results?.first : null;
      }
      return response;
    } catch (e) {
      return response;
    }
  }
}
