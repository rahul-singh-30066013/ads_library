/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/more/models/request/update_profile_request_model.dart';
import 'package:adani_airport_mobile/modules/more/models/update_profile/update_profile_display_model/update_profile_form_builder.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/repository/session_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/cupertino.dart';

/// this class is use for api call for profile and state maintain
class UpdateProfileState extends ADBaseViewModel {
  UpdateProfileFormBuilder? updateProfileFormBuilder;

  /// this object is use for manage api call
  final SessionRepository sessionRepository = SessionRepository();

  /// Initiate loading state for api hit
  ADResponseState getProfile = ADResponseState.loading();

  /// this object is use for manage profile data
  ProfileModel profileModel = const ProfileModel();

  bool loadingUserProfile = true;

  ValueNotifier<bool> loadingProfileImage = ValueNotifier(true);

  bool isAllFieldValidated = false;

  bool checkForTravel = false;

  bool checkForLocation = false;

  bool isScreenInitiallyLoading = true;

  String valueForVerifyEmail = '';

  ADResponseState sendOtpResponseState = ADResponseState.init();

  ///It will get profile data
  Future<void> getProfileAndAvatarsApi(
    SiteCoreStateManagement siteCoreStateManagement,
  ) async {
    await siteCoreStateManagement.fetchAvatars();
    await sessionRepository
        .getProfile()
        .then((value) => _updateGetProfile(value));
  }

  void updateValueForLocation({required bool value}) {
    checkForLocation = value;
    notifyListeners();
  }

  void updateValueForTravel({required bool value}) {
    checkForTravel = value;
    notifyListeners();
  }

  void updateValueForVerifyEmail({required String value}) {
    valueForVerifyEmail = value;
    notifyListeners();
  }

  ///It will get profile data
  Future<ADResponseState> sendProfileApi(
    String userProfileImage,
  ) async {
    if (updateProfileFormBuilder != null) {
      if (getProfile.viewStatus != Status.loading) {
        getProfile = ADResponseState.loading();
        notifyListeners();
      }
      final ProfileModel profileModel =
          UpdateProfileRequestModel().createUpdateProfileModel(
        updateProfileFormBuilder,
        userProfileImage,
        this.profileModel.personInfo?.addresses ?? [],
      );

      final ADResponseState responseState = await sessionRepository.sendProfile(
        profileModel: profileModel,
      );
      _updateSendProfile(responseState);
      return responseState.viewStatus == Status.complete
          ? ADResponseState.completed(
              profileModel,
            )
          : responseState;
    }
    return ADResponseState.error('somethingWentWrong');
  }

  /// this method is use for update response state behalf on Api
  void _updateSendProfile(
    ADResponseState response,
  ) {
    loadingUserProfile = false;
    loadingProfileImage.value = false;
    getProfile = response;
    notifyListeners();
  }

  ///It will update get profile ADResponseState
  void _updateGetProfile(ADResponseState response) {
    getProfile = response;
    if (getProfile.data != null) {
      profileModel = getProfile.data;
    }
    loadingUserProfile = false;
    loadingProfileImage.value = false;
    notifyListeners();
  }

  void resetState() {
    loadingUserProfile = true;
    isScreenInitiallyLoading = true;
    getProfile = ADResponseState.loading();
    notifyListeners();
  }

  //to send otp on email
  Future<ADResponseState> sendEmailOtp({
    required SendEmailOtpRequest sendEmailOtpRequest,
  }) async {
    sendOtpResponseState = ADResponseState.loading();
    notifyListeners();
    sendOtpResponseState = await sessionRepository.sendEmailOtp(
      sendEmailOtpRequest: sendEmailOtpRequest,
    );
    notifyListeners();
    return sendOtpResponseState;
  }

  ///It will save profile image
  Future<ADResponseState> sendProfileImageApi(File savedFile) async {
    final ADResponseState responseState =
        await sessionRepository.sendProfileImage(savedFile);
    loadingProfileImage.value = false;
    return responseState;
  }
}
