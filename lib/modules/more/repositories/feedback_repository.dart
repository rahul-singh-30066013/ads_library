/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/more/models/customer_feedback/customer_feedback_request_model.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/response/send_otp_response.dart';
import 'package:adani_airport_mobile/modules/site_core/repositories/site_core_repository.dart';
import 'package:adani_airport_mobile/network/more_api/more_api_urls.dart';
import 'package:adani_airport_mobile/network/session/session_api_urls.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class FeedbackRepository {
  final ADApiClient adApiClient = ADApiClient(
    baseUrl: Environment.instance.configuration.apiBaseUrl,
  );

  /// this is used to post feedback to server
  Future<ADResponseState> sendFeedback(
    CustomerFeedbackRequestModel request,
  ) {
    final Future<ADResponseState> responseState = adApiClient.post(
      path: MoreApiUrls.customerFeedback,
      header: APIHeaderUtils.flightBookingHeaders(),
      params: jsonEncode(
        request,
      ),
    );
    return responseState;
  }

  ///Fetch data for Feedback Form Layout from Sitecore.
  Future<ADResponseState> fetchFeedbackFormLayoutData({
    required Map<String, String> queryParams,
  }) async {
    return SiteCoreRepository().fetchFeedbackFormLayoutData(
      queryParams: queryParams,
    );
  }

  Future<ADResponseState> sendOtp({
    required SendOtpRequest sendOtpRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await adApiClient.post(
      path: SessionApiUrls.sendOTP,
      params: jsonEncode(sendOtpRequest),
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      return ADResponseState.completed(
        SendOtpResponse.fromJson(response.data ?? {}),
        '',
        response.header,
      );
    }
    return ADResponseState.error(response.message, response.errorCode);
  }
}
