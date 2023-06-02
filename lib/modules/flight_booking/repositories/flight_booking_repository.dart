/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:adani_airport_mobile/api_client/ad_aks_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/api_client/ad_logger.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_address_details_location_model.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/potential_earning_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/get_eligible_offer/get_eligible_offer_request.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/email_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_add_pax_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_booking_cancel_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_check_price_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_create_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_fare_calender_request_body.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/FbV2ResponseCancelModel.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancellation_reason_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/flight_fare_info_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_fare/data_model/flight_fare_calender_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_create_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_itinerary_price_change.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/pranaam_banner_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/traveller_passenger_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/check_out_response.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/pay_now_response.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/payment_confirm_response/placement_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/session/models/response/sign_in_offer_list_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/important_info.dart';
import 'package:adani_airport_mobile/network/common_service/common_service_api_urls.dart';
import 'package:adani_airport_mobile/network/flights_api/flights_api_urls.dart';
import 'package:adani_airport_mobile/network/pranaam_api/pranaam_api_urls.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

/// this repository class will use for overall booking session
/// to communicate with the ui class and api client, it contains the data to manipulate,if required
/// and return back to the screen.
class FlightBookingRepository {
  final ADApiClient adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  final ADApiClient adApiClientSiteCore =
      ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

  final ADAksApiClient adAksApiClient = ADAksApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  FlightBookingDetails flightBookingDetailsInstance =
      FlightBookingDetails.getInstance();

  ///TODO: Source Need to build the logic on selected airport to be fill in the source or Last saved
  ///TODO: Blank or Last saved date
  FlightBookingModel getFlightBookingModel() {
    return flightBookingDetailsInstance.getData();
  }

  FlightBookingModel getDeepLinkFlightBookingModel(
    FlightBookingDeepLinkModel? flightBookingDeepLinkModel,
    BuildContext context,
  ) {
    final List<CityDetailModel> mainAirportCityList = [];
    final read = context.read<SiteCoreStateManagement>();
    if (read.airportCityList.isNotEmpty) {
      mainAirportCityList.addAll(read.airportCityList);
    }
    if (read.domesticOtherAirportCityList.isNotEmpty) {
      mainAirportCityList.addAll(read.domesticOtherAirportCityList);
    }
    if (read.internationAirportCityList.isNotEmpty) {
      mainAirportCityList.addAll(read.internationAirportCityList);
    }

    return flightBookingDetailsInstance.getDeepLinkData(
      flightBookingDeepLinkModel,
      mainAirportCityList,
    );
  }

  List<CityDetailModel> getPopularAndRecentCitiesList(
    BuildContext context,
  ) {
    return flightBookingDetailsInstance.getPopularAndRecentCitiesList(
      context,
    );
  }

  ///API to get the fare calender values.
  Future<ADResponseState> fetchFlightFare({
    required FlightBookingModel flightBookingModel,
    required bool isArrival,
  }) async {
    ///Creating request body for the fetch data
    final String params = CreateFlightFareCalenderRequestBody.fromBookingObject(
      flightBookingModel: flightBookingModel,
      forOneAdultOnly: true,
      isForArrival: isArrival,
    ).jsonBody;

    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.fareCalendar,
      params: params,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = await compute(_parseFlightFareBackground, response.data);
    }
    return response;
  }

  ///API to get the fare calender values.
  Future<ADResponseState> fetchFlightFareOnSRP({
    required FlightBookingModel flightBookingModel,
    required List<DateTime> fetchFareForDates,
  }) async {
    ///Creating request body for the fetch data
    //TODO: Need to update the start date & end date
    final List<DateTime> date = fetchFareForDates;

    final String params = CreateFlightFareCalenderRequestBody.fromBookingObject(
      flightBookingModel: flightBookingModel,
      startDate: date.first,
      endDate: date.last,
      forOneAdultOnly: false,
      isForArrival: false,
    ).jsonBody;

    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.fareCalendar,
      params: params,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = await compute(_parseFlightFareBackground, response.data);
    }
    return response;
  }

  static FlightFareCalenderResponseModel _parseFlightFareBackground(
    dynamic encodedJson,
  ) {
    return FlightFareCalenderResponseModel.fromJson(encodedJson);
  }

  Future<ADResponseState> fetchFlightList({
    required FlightBookingModel flightBookingModel,
  }) async {
    ///Creating request body for the fetch flights
    final String params =
        FlightRequestModel(flightBookingModel: flightBookingModel)
            .createFlightListRequestBody();
    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.searchFlight,
      params: params,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      ///Making this class because ISOLATE thread can not access the data from main thread
      final FlightListIsolateModel isolateModel = FlightListIsolateModel(
        jsonData: response.data,
        airlineInfo: FlightUtils.airlineInfo,
        departureFlightCountMap: FlightUtils.departureFlightCountMap,
        arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
        internationalAirportMap: FlightUtils.internationalAirportMap,
      );
      response.data = await compute(
        _parseFlightListBackground,
        isolateModel,
      );
    }
    return response;
  }

  static FlightListModel _parseFlightListBackground(
    FlightListIsolateModel model,
  ) {
    return FlightListModel.fromJson(
      model,
    );
  }

  ///API to get itinerary details.
  //ignore: long-parameter-list
  Future<ADResponseState> viewItinerary({
    required String itineraryId,
    bool isCCFRequired = false,
    bool? isInsured,
    bool? requiredInsurance,
    String? reviewedID,
    bool? requiredZeroCancellation,
    bool? isZeroCancellation,
  }) async {
    bool isNewUser = false;
    final String currentUserID = ProfileSingleton.profileSingleton.userID;
    if (currentUserID != reviewedID) {
      isNewUser = true;
    }
    final ADResponseState response = await adApiClient.get(
      path: isCCFRequired
          ? '${FLightsApiUrls.viewItinerary}/$itineraryId?isCCFRequired=true'
          : requiredInsurance ?? false
              ? '${FLightsApiUrls.viewItinerary}/$itineraryId?isCCFRequired=false&isInsured=$isInsured'
              : requiredZeroCancellation ?? false
                  ? '${FLightsApiUrls.viewItinerary}/$itineraryId?isCCFRequired=false&IsZeroCancellationOpt=$isZeroCancellation'
                  : '${FLightsApiUrls.viewItinerary}/$itineraryId',
      header: APIHeaderUtils.flightBookingHeaders(
        isGuestLoggedIn: isNewUser,
        oldAgentID: reviewedID,
      ),
    );

    if (response.viewStatus == Status.complete) {
      ///Making this class because ISOLATE thread can not access the data from main thread
      final FlightListIsolateModel isolateModel = FlightListIsolateModel(
        jsonData: response.data,
        airlineInfo: FlightUtils.airlineInfo,
        departureFlightCountMap: FlightUtils.departureFlightCountMap,
        arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
        internationalAirportMap: FlightUtils.internationalAirportMap,
      );
      response.data =
          await compute(_parseViewItineraryBackground, isolateModel);
    }
    return response;
  }

  static FlightViewItineraryResponseModel _parseViewItineraryBackground(
    FlightListIsolateModel model,
  ) {
    return FlightViewItineraryResponseModel.fromJson(model);
  }

  ///API to create Itinerary-basically to start session for booking.
  Future<ADResponseState> createItinerarySession(
    SelectedFlightModel selectedFlightModel,
  ) async {
    ///Creating request body for the itinerary
    final FlightCreateItineraryRequestModel flightCreateItineraryRequestModel =
        FlightCreateItineraryRequestModel.createRequestBody(
      selectedFlightModel: selectedFlightModel,
    );

    final params = flightCreateItineraryRequestModel.createItineraryRequestBody;

    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.createItinerary,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: params,
    );

    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_parseCreateItinerarySessionBackground, response.data);
    }
    return response;
  }

  static FlightCreateItineraryResponseModel
      _parseCreateItinerarySessionBackground(dynamic encodedJson) {
    return FlightCreateItineraryResponseModel.fromJson(encodedJson);
  }

  Future<ADResponseState> updatePassengerDetailsSession(
    TravellerPassengerDetailRequestModel travellerPassengerDetailRequestModel,
    String itineraryId,
    String reviewedID,
  ) async {
    bool isNewUser = false;
    final String paramsData = jsonEncode(travellerPassengerDetailRequestModel);
    final String currentUserID = ProfileSingleton.profileSingleton.userID;
    if (currentUserID != reviewedID) {
      isNewUser = true;
    }
    final ADResponseState response = await adApiClient.put(
      path: '${FLightsApiUrls.updatePassenger}/$itineraryId',
      params: paramsData,
      header: APIHeaderUtils.flightBookingHeaders(
        isGuestLoggedIn: isNewUser,
        oldAgentID: reviewedID,
      ),
    );

    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_parseUpdatePassengerDetailBackground, response.data);
    }
    return response;
  }

  Future<ADResponseState> fetchGoogleAddressByPinCode({
    required String query,
  }) async {
    final ADResponseState response = await adApiClient.get(
      path: '${CommonServiceApiUrls.postalCodeDataApi}$query',
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    try {
      if (response.viewStatus == Status.complete && response.data != null) {
        final data =
            DestinationAddressDetailsLocationModel.fromJson(response.data);
        response.data =
            data.results?.isNotEmpty ?? false ? data.results?.first : null;
      }
      return response;
    } catch (e) {
      return response;
    }
  }

  static TravellerPassengerResponseModel _parseUpdatePassengerDetailBackground(
    dynamic encodedJson,
  ) {
    return TravellerPassengerResponseModel.fromJson(encodedJson);
  }

  ///API to check price change.
  Future<ADResponseState> checkPrice(
    String itineraryId,
    PricingSummary pricingSummary,
  ) async {
    final ADResponseState response = await adApiClient.post(
      path: '${FLightsApiUrls.checkPrice}/$itineraryId',
      header: APIHeaderUtils.flightBookingHeaders(),
      params: FlightCheckPriceRequestModel(pricingSummary: pricingSummary)
          .createPriceCheckRequestBody(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = await compute(_parseCheckPriceBackground, response.data);
    }
    return response;
  }

  static FlightItineraryPriceChange _parseCheckPriceBackground(
    dynamic encodedJson,
  ) {
    return FlightItineraryPriceChange.fromJson(encodedJson);
  }

  ///API call for booking trip.
  Future<ADResponseState> getOrder(
    String orderRefId,
  ) async {
    final ADResponseState response = await adAksApiClient.get(
      path: '${FLightsApiUrls.getOrder}/$orderRefId',
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      final FlightListIsolateModel isolateModel = FlightListIsolateModel(
        jsonData: response.data,
        airlineInfo: FlightUtils.airlineInfo,
        departureFlightCountMap: FlightUtils.departureFlightCountMap,
        arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
        internationalAirportMap: FlightUtils.internationalAirportMap,
      );
      response.data =
          await compute(_parseCommonOrderBaseResponse, isolateModel);
    }
    return response;
  }

  static CommonOrderDetailBaseResponse _parseCommonOrderBaseResponse(
    FlightListIsolateModel model,
  ) {
    return CommonOrderDetailBaseResponse.fromJson(model);
  }

  Future<ADResponseState> getPotentialEarning(
    String orderRefId, {
    bool? isLatest = false,
  }) async {
    const potentialEarning = '/potential-earning';
    final ADResponseState response = await adAksApiClient.get(
      path: '${FLightsApiUrls.potentialEarning}/$orderRefId$potentialEarning',
      header: APIHeaderUtils.flightBookingHeaders(),
      queryParameters: {
        'isLatest': isLatest,
      },
    );

    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_parsePotentialEarningBookBackground, response.data);
    }
    return response;
  }

  static PotentialEarningResponseModel _parsePotentialEarningBookBackground(
    dynamic encodedJson,
  ) {
    return PotentialEarningResponseModel.fromJson(encodedJson);
  }

  ///API call to check view trip.
  Future<ADResponseState> viewTrip(
    String tripId,
    String cancelId,
  ) async {
    final ADResponseState response = await adApiClient.get(
      path: '${FLightsApiUrls.viewTrip}/$tripId',
      queryParameters: cancelId.isNotEmpty ? {'cancelledId': cancelId} : null,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      final FlightListIsolateModel isolateModel = FlightListIsolateModel(
        jsonData: response.data,
        airlineInfo: FlightUtils.airlineInfo,
        departureFlightCountMap: FlightUtils.departureFlightCountMap,
        arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
        internationalAirportMap: FlightUtils.internationalAirportMap,
      );
      response.data = await compute(_parseViewTripBackground, isolateModel);
    }
    return response;
  }

  static FlightViewTripResponseModel _parseViewTripBackground(
    FlightListIsolateModel model,
  ) {
    return FlightViewTripResponseModel.fromJson(
      model,
      null,
      null,
    );
  }

  //Api to request payment as per user selected option
  Future<ADResponseState> requestPayment({
    required String requestModel,
  }) async {
    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.payNow,
      params: requestModel,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(_parsePaymentDataBackground, response.data);
    }
    return response;
  }

  static PayNowResponse _parsePaymentDataBackground(dynamic encodedJson) {
    return PayNowResponse.fromJson(encodedJson);
  }

  ///API call to cancelFlightBooking.
  Future<ADResponseState> cancelFlightBooking(
    SelectedPaxTripToCancel selectedPaxTripToCancel,
  ) async {
    final ADResponseState response = await adAksApiClient.post(
      path: FLightsApiUrls.cancelTrip,
      header: APIHeaderUtils.tempFlightBookingHeaders(),
      params: FlightBookingCancelRequestModel().createBookingCancelRequestBody(
        selectedPaxTripToCancel,
      ),
    );
    response.data = response.viewStatus == Status.complete
        ? await compute(_parseCancelFlightBookingBackground, response.data)
        : null;
    return response;
  }

  static FbV2ResponseCancelModel _parseCancelFlightBookingBackground(
    dynamic encodedJson,
  ) {
    return FbV2ResponseCancelModel.fromJson(encodedJson);
  }

  ///API call to getCancellationReasons.
  Future<ADResponseState> getCancellationReasons(
    String tripId,
  ) async {
    final ADResponseState response = await adAksApiClient.get(
      path: '${FLightsApiUrls.cancellationReasons}/$tripId',
      header: APIHeaderUtils.tempFlightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_parseCancelReasonBackground, response.data);
    }
    return response;
  }

  static CancellationReasonResponseModel _parseCancelReasonBackground(
    dynamic encodedJson,
  ) {
    return CancellationReasonResponseModel.fromJson(encodedJson);
  }

  ///API call to flightRefundInfo.
  Future<ADResponseState> flightRefundInfo(
    SelectedPaxTripToCancel selectedPaxTripToCancel,
  ) async {
    final ADResponseState response = await adAksApiClient.post(
      path: FLightsApiUrls.refundInfo,
      header: APIHeaderUtils.tempFlightBookingHeaders(),
      params: FlightBookingCancelRequestModel().createBookingCancelRequestBody(
        selectedPaxTripToCancel,
      ),
    );
    if (response.viewStatus == Status.complete) {
      response.data = await compute(_parseRefundInfoBackground, response.data);
    }
    return response;
  }

  static FlightFareInfoResponseModel _parseRefundInfoBackground(
    dynamic encodedJson,
  ) {
    return FlightFareInfoResponseModel.fromJson(encodedJson);
  }

  Future<ADResponseState> getCouponList(
    String? itineraryId,
  ) async {
    final GetEligibleOfferRequest request = GetEligibleOfferRequest(
      itineraryId: itineraryId ?? '',
    );
    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.couponList,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(request),
    );

    if (response.data != null) {
      return ADResponseState.completed(
        CouponListResponse.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

  Future<ADResponseState> getSignInOfferList() async {
    final ADResponseState response = await adAksApiClient.get(
      path: FLightsApiUrls.signInOffer,
      header: APIHeaderUtils.flightBookingHeaders(),
    );

    if (response.viewStatus == Status.complete) {
      response.data = response.data is List
          ? (response.data as List)
              .map<SignInOffer>(
                (e) => SignInOffer.fromJson(e),
              )
              .toList()
          : [];
      return ADResponseState.completed(response.data);
    }
    return ADResponseState.error(response.errorCode);
  }

  Future<ADResponseState> applyCoupon({
    required ApplyCouponRequest applyCouponRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.applyCouponForFlight,
      params: jsonEncode(applyCouponRequest),
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      final FlightListIsolateModel isolateModel = FlightListIsolateModel(
        jsonData: response.data,
        airlineInfo: FlightUtils.airlineInfo,
        departureFlightCountMap: FlightUtils.departureFlightCountMap,
        arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
        internationalAirportMap: FlightUtils.internationalAirportMap,
      );
      response.data =
          await compute(_parseViewItineraryBackground, isolateModel);
    }
    return response;
  }

  Future<ADResponseState> removeCoupon({
    required ApplyCouponRequest applyCouponRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await adApiClient.post(
      path: FLightsApiUrls.removeCouponForFlight,
      params: jsonEncode(applyCouponRequest),
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      final FlightListIsolateModel isolateModel = FlightListIsolateModel(
        jsonData: response.data,
        airlineInfo: FlightUtils.airlineInfo,
        departureFlightCountMap: FlightUtils.departureFlightCountMap,
        arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
        internationalAirportMap: FlightUtils.internationalAirportMap,
      );
      response.data =
          await compute(_parseViewItineraryBackground, isolateModel);
    }
    return response;
  }

  ///API call to get invoice for current trip.
  Future<ADResponseState> downloadInvoice(
    String tripId,
    String bookingId,
    String businessType,
    BuildContext context,
  ) async {
    //to send GA event for download invoice
    FlightBookingGaAnalytics().downloadInvoiceAnalyticsData();
    final File oldFile = await _localFile(tripId);
    if (oldFile.existsSync()) {
      adLog('showing old file');
      final oldFileData = await OpenFile.open(oldFile.path);
      adLog('file downloaded${oldFile.path},$oldFileData');
      return ADResponseState.completed('Success');
    } else {
      final dio = _createDio(
        Environment.instance.configuration.apiBaseUrl,
      );

      final token = await getToken();
      final Map<String, String> map = {
        'channelId': Platform.isAndroid ? 'Android' : 'iOS',
        'traceId': ProfileSingleton.profileSingleton.apiTraceId,
        'language': 'en',
        'Authorization': 'Bearer $token',
        'User-Agent': userAgent,
      };
      File? file;
      try {
        ProcessDialog.showLoadingDialog(context);
        final Response result = await dio.get(
          '${FLightsApiUrls.downloadInvoiceForTrip}$tripId&subType=$businessType',
          options: Options(
            headers: map,
            contentType: 'application/pdf',
            responseType: ResponseType.bytes,
          ),
        );
        if (result.data != null) {
          file = await writeDataToFile(
            bookingId,
            result,
          );
          ProcessDialog.closeLoadingDialog(context);
          if (file.path.isNotEmpty) {
            final fileData = await OpenFile.open(file.path);
            adLog('file downloaded${file.path},$fileData');
          }
        } else {
          SnackBarUtil.showSnackBar(
            context,
            'oops_something_went_wrong'.localize(context),
          );
        }
      } catch (e) {
        if (e is DioError) {
          if (e.type == DioErrorType.other) {
            return (e.error != null) &&
                    (e.error as SocketException).osError?.errorCode != null
                ? ADResponseState.error(noInternetMessage, '51')
                : ADResponseState.error(e.toString(), '');
          }
        } else {
          return ADResponseState.error('Failed', '');
        }
        ProcessDialog.closeLoadingDialog(context);
        SnackBarUtil.showSnackBar(
          context,
          'oops_something_went_wrong'.localize(context),
        );
      }
      return file != null
          ? ADResponseState.completed('Success')
          : ADResponseState.error('Failed', '');
    }
  }

  Future<String> getToken() async {
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    return accessToken ?? '';
  }

  ///Once download is completed we will write data to the file
  Future<File> writeDataToFile(String invoiceID, Response response) async {
    final file = await _localFile(invoiceID);
    final Uint8List data = response.data;
    final ByteBuffer buffer = data.buffer;
    final Uint8List fileList = buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    final List<int> writableListByte = fileList.cast<int>();
    return file.writeAsBytes(writableListByte);
  }

  ///The method will create a file with defined name
  Future<File> _localFile(String id) async {
    final path = await _localPath;
    return File('$path${Platform.pathSeparator}Invoice_$id.pdf');
  }

  ///This method will return a cache/original path to save the file
  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    // final directory = await getApplicationSupportDirectory();
// openFile(directory);
    return directory.path;
  }

  Dio _createDio(String endPoint) {
    final Dio _dio = Dio();
    // _dio.options.connectTimeout = 60 * 1000; // 60 seconds
    // _dio.options.receiveTimeout = 60 * 1000; // 60 seconds
    _dio.options.baseUrl = endPoint;

    _dio.interceptors.add(
      AdLogger(
        compact: false,
      ),
    );
    return _dio;
  }

  ///this is used to return pranaam upsell
  Future<ADResponseState> getPranaamUpSellResponse(
    String tripId,
    Map<String, String> queryParameters,
  ) async {
    final ADResponseState response = await adApiClient.get(
      path: '${CommonServiceApiUrls.getUpsell}/$tripId',
      queryParameters: queryParameters,
      header: APIHeaderUtils.flightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data = PranaamBannerModel.fromJson(response.data);
    }
    return response;
  }

  /// to fetch flight information
  Future<ADResponseState> fetchFlightInformationPolicies(
    Map<String, String>? queryParams,
  ) async {
    final ADResponseState response = await adApiClientSiteCore.get(
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

  ///API call to send email to user.
  Future<ADResponseState> emailItinerary(
    EmailItineraryRequestModel emailItineraryRequestModel,
    BuildContext context,
  ) async {
    ProcessDialog.showLoadingDialog(context);
    final ADResponseState response = await adAksApiClient.post(
      path: FLightsApiUrls.emailItinerary,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: emailItineraryRequestModel
          .createEmailItineraryRequestBody(emailItineraryRequestModel),
    );
    if (response.viewStatus == Status.complete) {
      SnackBarUtil.showSnackBar(
        context,
        'itinerary_sent_to'.localize(context) +
            (emailItineraryRequestModel.email ?? ''),
      );
      //to send GA event for email itinerary complete
      FlightBookingGaAnalytics().emailItineraryStartEndAnalyticsData(1);
    } else {
      SnackBarUtil.showSnackBar(
        context,
        'oops_something_went_wrong'.localize(context),
      );
    }
    ProcessDialog.closeLoadingDialog(context);
    return response;
  }

  Future<ADResponseState> checkoutPayment({
    required String requestModel,
    required bool isForReschedule,
    required bool isForUpgrade,
  }) async {
    final ADResponseState response = await adAksApiClient.post(
      path: isForReschedule
          ? PranaamApiUrls.rescheduleCheckout
          : isForUpgrade
              ? PranaamApiUrls.upgradeCheckout
              : FLightsApiUrls.checkOut,
      params: requestModel,
      header: APIHeaderUtils.tempFlightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_parseCheckOutDataBackground, response.data);
    }
    return response;
  }

  static CheckOutResponse _parseCheckOutDataBackground(dynamic encodedJson) {
    return CheckOutResponse.fromJson(encodedJson);
  }

  Future<ADResponseState> placement({
    required String requestModel,
    required bool isForReschedule,
    required bool isForUpgrade,
  }) async {
    final ADResponseState response = await adAksApiClient.post(
      path: isForReschedule
          ? PranaamApiUrls.reschedulePlacement
          : isForUpgrade
              ? PranaamApiUrls.upgradePlacement
              : FLightsApiUrls.placement,
      params: requestModel,
      header: APIHeaderUtils.tempFlightBookingHeaders(),
    );
    if (response.viewStatus == Status.complete) {
      response.data =
          await compute(_parsePlacementDataBackground, response.data);
    }
    return response;
  }

  static PlacementResponse _parsePlacementDataBackground(
    dynamic encodedJson,
  ) {
    return PlacementResponse.fromJson(encodedJson);
  }
}
