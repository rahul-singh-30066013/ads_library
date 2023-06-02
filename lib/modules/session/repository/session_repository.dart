/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/more/models/response/profile_image_response.dart';
import 'package:adani_airport_mobile/modules/more/models/response/profile_response.dart';
import 'package:adani_airport_mobile/modules/more/models/response/verify_email_otp_response.dart';
import 'package:adani_airport_mobile/modules/session/models/active_cart/response/get_active_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/request/sign_out_request.dart';
import 'package:adani_airport_mobile/modules/session/models/request/validate_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/response/send_otp_response.dart';
import 'package:adani_airport_mobile/modules/session/models/response/validate_otp_response.dart';
import 'package:adani_airport_mobile/network/authenticator/authenticator_api_urls.dart';
import 'package:adani_airport_mobile/network/session/session_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// this repository class will use for overall session
/// to communicate with the ui class and api client, it contains the data to manipulate,if required
/// and return back to the screen.
class SessionRepository {
  final ADApiClient _adApiClientAuthenticator =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);
  final ADApiClient _adApiClient =
      ADApiClient(baseUrl: Environment.instance.configuration.apiBaseUrl);

  Future<ADResponseState> sendOtp({
    required SendOtpRequest sendOtpRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await _adApiClient.post(
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

//to send otp on email
  Future<ADResponseState> sendEmailOtp({
    required SendEmailOtpRequest sendEmailOtpRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await _adApiClient.post(
      path: AuthenticatorApiUrls.sendEmailOTP,
      params: jsonEncode(sendEmailOtpRequest),
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

  /// validate email OTP
  Future<ADResponseState> validateEmailOTP({
    required ValidateOtpRequest validateOtpRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await _adApiClient.post(
      path: AuthenticatorApiUrls.validateEmailOTP,
      params: jsonEncode(validateOtpRequest),
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      return ADResponseState.completed(
        VerifyEmailOtpResponse.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

  Future<ADResponseState> getProfile() async {
    ///Creating request body for the fetch flights
    ///device id not set when this api is called so get device id by calling this here
    await ProfileSingleton.profileSingleton.getDeviceId();
    final ADResponseState response = await _adApiClient.get(
      path: SessionApiUrls.getProfile,
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      return ADResponseState.completed(
        ProfileModel.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

  Future<ADResponseState> sendProfile({
    required ProfileModel profileModel,
    bool update = false,
  }) async {
    ///Creating request body for the fetch flights
    final ADResponseState response = !update
        ? await _adApiClient.post(
            path: SessionApiUrls.updateProfile,
            params: jsonEncode(profileModel),
            header: APIHeaderUtils.identityServerHeader(),
          )
        : await _adApiClient.patch(
            path: SessionApiUrls.updateProfile,
            params: jsonEncode(profileModel),
            header: APIHeaderUtils.identityServerHeader(),
          );
    if (response.data != null) {
      return ADResponseState.completed(
        ProfileResponse.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

//to send/update fcm token to backend
  Future<ADResponseState> sendFCMToBackend({
    required ProfileModel profileModel,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await _adApiClient.post(
      path: SessionApiUrls.updateProfile,
      params: jsonEncode(profileModel),
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      return ADResponseState.completed(
        ProfileModel.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

  /// validateOTP
  Future<ADResponseState> validateOTP({
    required ValidateOtpRequest validateOtpRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await _adApiClient.post(
      path: SessionApiUrls.validateOTP,
      params: jsonEncode(validateOtpRequest),
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      return ADResponseState.completed(
        ValidateOtpResponse.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

  /// LogOut Api
  Future<ADResponseState> signOut({
    required SignOutRequest signOutRequest,
  }) async {
    ///Creating request body for the fetch flights

    final ADResponseState response = await _adApiClient.post(
      path: SessionApiUrls.signOut,
      params: jsonEncode(signOutRequest),
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      return response;
    }
    return ADResponseState.error(response.message);
  }

  /// getActiveCart
  Future<ADResponseState> getActiveCart() async {
    ///Creating request body for the fetch getActiveCart
    adLog(
      'user log in ${ProfileSingleton.profileSingleton.isLoggedIn}',
      className: this,
    );
    final ADResponseState response = await _adApiClientAuthenticator.get(
      path: AuthenticatorApiUrls.getActiveCart,
      header: APIHeaderUtils.flightBookingHeaders(
        isGuestLoggedIn: !ProfileSingleton.profileSingleton.isLoggedIn,
        anonymousKeyName: 'annonymousId',
      ),
    );
    adLog(
      'getActiveCart response '
      '$response',
      className: this,
    );
    if (response.data != null) {
      return ADResponseState.completed(
        GetActiveCartResponseModel.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

  /// get profile image
  Future<ADResponseState> getProfileImage() async {
    final ADResponseState response = await _adApiClient.get(
      path: SessionApiUrls.profileImage,
      header: APIHeaderUtils.identityServerHeader(),
    );
    if (response.data != null) {
      return ADResponseState.completed(
        ProfileImageResponse.fromJson(response.data ?? {}),
      );
    }
    return ADResponseState.error(response.message);
  }

  Future<ADResponseState> sendProfileImage(File savedFile) async {
    final result = await _adApiClient.uploadFile(
      path: SessionApiUrls.profileImage,
      header: APIHeaderUtils.flightBookingHeaders(),
      fileToUpload: savedFile,
    );
    return result.data != null
        ? ADResponseState.completed('Success')
        : ADResponseState.error(result.message);
  }
}
