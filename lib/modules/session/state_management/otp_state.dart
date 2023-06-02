/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/get_cart_on_user_basis.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dialog/loyalty_diaglog_screen.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/request/validate_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/response/validate_otp_response.dart';
import 'package:adani_airport_mobile/modules/session/repository/session_repository.dart';
import 'package:adani_airport_mobile/modules/session/screens/otp/verify_otp_screen.dart';
import 'package:adani_airport_mobile/modules/session/utils/login_model_utils.dart';
import 'package:adani_airport_mobile/modules/train/ga_analytics/train_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/jwt_token_decoder.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/profile/user_profile.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used to manage the state of VerifyOtp.
class OtpState extends BaseViewModel {
  int? otpDigit;
  final SessionRepository sessionRepository = SessionRepository();

  /// Initiate loading state for api hit
  ADResponseState apiState = ADResponseState.init();

  /// Initiate loading state for api hit
  ADResponseState moreOptionResendState = ADResponseState.init();

  ///*[isResendOTPEnabled] is used to show the resent otp option.
  bool isResendOTPEnabled = false;

  ///*[isResendingOTP] is used to notify the selector to show to progress til response.
  bool isResendingOTP = false;

  ///*[isOtpCompleted] is used enable the disable the button.
  bool isOtpCompleted = false;

  ///*[wasOtpResent] is used to check if otp was sent again
  bool wasOtpResent = false;
  String otpStr = '';

  LoginModelUtils? loginModelUtils;

  /// this method is used to update the isResendOTPEnabled variable
  void updateResendOTPButton({required bool isResend}) {
    isResendOTPEnabled = isResend;
    notifyListeners();
  }

  void updateView({required bool isOtpCompleted}) {
    this.isOtpCompleted = isOtpCompleted;
    notifyListeners();
  }

  String getOtp() {
    final otpHash = convertOTPIntoHash(otpStr);
    return isOtpCompleted ? otpHash : '';
  }

  Future<bool> validateOTP({
    required BuildContext context,
    required String source,
    required String mobileNumber,
    required CountryCodeData countryCodeData,
    String? referCode,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    apiState.viewStatus = Status.loading;
    notifyListeners();
    bool isLoggedIn = false;

    final ADResponseState responseState = await sessionRepository.validateOTP(
      validateOtpRequest: ValidateOtpRequest(
        source,
        getOtp(),
        referCode,
      ),
    );

    ///Used for analytics
    final String type = context.read<AppSessionState>().sendOtpTo.abbr ?? '';
    final String label =
        wasOtpResent ? OtpLabel.resend.name : OtpLabel.direct.name;
    if (responseState.viewStatus == Status.complete) {
      final ValidateOtpResponse validateOtpResponse = responseState.data;
      final userData = await ProfileSingleton.profileSingleton
          .readUserProfile(SharedPrefUtilsKeys.keyUserProfileData);
      adLog('userprofile validateOTP value : ${userData.userId}');

      // fetching userid from token for GA events
      final String jwtToken = validateOtpResponse.accessToken;
      final Map<String, dynamic>? decodedTokenData =
          JwtTokenDecoder.decode(jwtToken);
      final String? userId = decodedTokenData?['sub'];

      await SharedPrefsUtils().putKeyValuePairInPrefs(
        SharedPrefUtilsKeys.userIDFromToken,
        userId ?? '',
      );
      // setting user id in flightBookingGAObject global object for future use
      Analytics.flightBookingGAObject?[Parameters.user_id.name] = userId ?? '';

      // Register UsedId on all analytic platform.
      FlightBookingGaAnalytics().registerUserIdAnalyticsData(userId: userId);

      // login data for analytics
      if (loginModelUtils?.signInStatusModel?.lob == trainBooking) {
        TrainBookingGaAnalytics().signUpSuccessfulAnalyticsData(
          userId ?? '',
          isRegistered:
              (responseState.data as ValidateOtpResponse).isRegistered,
          label: label,
          type: type,
        );
      } else if (loginModelUtils?.signInStatusModel?.lob ==
          CabConstants.cabBooking) {
        CabGoogleAnalytics().otpVerifiedSuccessAnalyticsData(
          type,
          label,
          isRegistered:
              (responseState.data as ValidateOtpResponse).isRegistered,
          signInFromPopup: loginModelUtils?.signInStatusModel?.loginFromPopup,
        );
        CabGoogleAnalytics().loginAndLogoutSuccessfulAnalyticsData(
          userId ?? '',
          isRegistered:
              (responseState.data as ValidateOtpResponse).isRegistered,
          label: label,
          type: type,
        );
      } else {
        FlightBookingGaAnalytics().otpVerifiedSuccessAnalyticsData(
          type,
          label,
          isRegistered:
              (responseState.data as ValidateOtpResponse).isRegistered,
          signInFromPopup: loginModelUtils?.signInStatusModel?.loginFromPopup,
          categoryName: loginModelUtils?.signInStatusModel?.currentRouteName ==
                      genericCartScreen &&
                  context.read<AppSessionState>().cartType == CartType.dutyFree
              ? 'duty_free'
              : null,
        ); // otp verified success for analytics

        FlightBookingGaAnalytics().loginAndLogoutSuccessfulAnalyticsData(
          userId ?? '',
          isRegistered:
              (responseState.data as ValidateOtpResponse).isRegistered,
          label: label,
          type: type,
          signInFromPopup: loginModelUtils?.signInStatusModel?.loginFromPopup,
          categoryName: loginModelUtils?.signInStatusModel?.currentRouteName ==
                      genericCartScreen &&
                  context.read<AppSessionState>().cartType == CartType.dutyFree
              ? 'duty_free'
              : null,
        );
      }


      if (!(responseState.data as ValidateOtpResponse).isRegistered) {
        // sign up data for analytics
        // identifies first time user
        FlightBookingGaAnalytics().signUpSuccessfulAnalyticsData(
          userId ?? '',
          isRegistered:
              (responseState.data as ValidateOtpResponse).isRegistered,
          label: label,
          type: type,
        );
      }


      String oldAgentId = '';
      if (!userData.isLoggedIn) {
        oldAgentId = userData.userId;
      }
      adLog('oldAgentId validateOTP after value : $oldAgentId');
      await _initialStorageAfterLogin(
        validateOtpResponse,
        mobileNumber,
        countryCodeData,
      );
      context.read<AppSessionState>().getUpcomingBookings();
      context
          .read<AppSessionState>()
          .updateIsRegistered(isRegistered: !validateOtpResponse.isRegistered);
      if (loginModelUtils?.signInStatusModel?.currentRouteName ==
              genericCartScreen ||
          loginModelUtils?.signInStatusModel?.currentRouteName == cart) {
        await GetCartOnUserBasis().getCartData(context, oldAgentId: oldAgentId);
      } else {
        getCart(context);
      }
      final appSessionState = context.read<AppSessionState>();
      await appSessionState.getProfileDetails();
      await appSessionState.parseProfileImage();

      final profileData = context.read<AppSessionState>().profileModel;

        FlightBookingGaAnalytics().saveProfileDataAnalyticsEvent(
          profileData: profileData,
        ); // Save Profile Data

      // final value = await context.read<AppSessionState>().getBookings(
      //       bookType: BookingHistory().bookingType(BookingTabType.shopping),
      //     );
      // adLog(value.toString());

      ///storing new profile after login

      ///after login apis calls related to Cart, Booking and profile

      apiState.viewStatus = Status.complete;
      isLoggedIn = true;
      isRefreshTokenExpire.value = false;

      // getView(
      //   context: context,
      //   dialogEnm: DialogTypeEnm.snackBar,
      //   duration: four,
      //   message: 'we_have_login'.localize(context),
      //   backgroundColor: context.adColors.black,
      // );
      if (!validateOtpResponse.isRegistered &&
          (loginModelUtils?.signInStatusModel?.popUpRequired ?? false)) {
        if (AppConstantRemote().appConstantRemoteModel?.isRewardEnabled ??
            false) {
          LoyaltyDiaglogScreen.showLoadingDialog(
            context,
            buttonRequired:
                loginModelUtils?.signInStatusModel?.currentRouteName ==
                    tabRoute,
          );
        }
      } else {
        Future.delayed(const Duration(milliseconds: 200), () {
          showToast(
            context,
            const Color(0xff01ad75),
            SvgAssets.icCircleSuccess,
            Text(
              'we_have_login'.localize(context),
              style: ADTextStyle600.size14.copyWith(color: ADColors.white),
            ),
          );
        });
      }
      notifyListeners();
      return isLoggedIn;
    } else {
      apiState.viewStatus = Status.complete;
      FlightBookingGaAnalytics().signInFailAnalyticsData(
        type: type,
        label: label,
        signInFromPopup: loginModelUtils?.signInStatusModel?.loginFromPopup,
      );
      FlightBookingGaAnalytics().signInVerificationFailAnalyticsData(
        responseState.message,
        responseState.errorCode,
        type: type,
        label: label,
        signInFromPopup: loginModelUtils?.signInStatusModel?.loginFromPopup,
      );
      getView(
        context: context,
        dialogEnm: DialogTypeEnm.snackBar,
        duration: six,
        message: responseState.message,
        backgroundColor: context.adColors.black,
      );
      await HapticFeedback.lightImpact();
      notifyListeners();
      return isLoggedIn;
    }
  }

  void getCart(BuildContext context) {
    GetCartOnUserBasis().getCartData(context);
  }

  void showToast(
    BuildContext context,
    Color? color,
    String? iconPath,
    Widget textWidget, {
    int? toastDuration,
  }) {
    Widget text;
    text = textWidget is Text
        ? Text(
            textWidget.data ?? '',
            style: ADTextStyle400.size14.copyWith(color: ADColors.white),
          )
        : textWidget;

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.k_8),
      ),
      margin: EdgeInsets.only(
        bottom: context.k_60,
        left: context.k_16,
        right: context.k_16,
      ),
      backgroundColor: color,
      duration: Duration(seconds: toastDuration ?? 3),
      content: Row(
        children: [
          IconFromAsset(
            iconPath: iconPath ?? SvgAssets.icCircleSuccess,
            height: context.scaled(20),
            width: context.scaled(20),
          ),
          ADSizedBox(
            width: context.k_10,
          ),
          // getSizedBoxWithWidth(context.scaled(12)),
          Expanded(child: text),
        ],
      ),
    );
    final valueOfSnack = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    adLog(valueOfSnack.toString());
  }

  Future<void> _initialStorageAfterLogin(
    ValidateOtpResponse validateOtpResponse,
    String mobileNumber,
    CountryCodeData? countryCodeData,
  ) async {
    final userProfile = UserProfile(
      isLoggedIn: true,
      userId: mobileNumber,
      accessToken: validateOtpResponse.accessToken,
      refreshToken: validateOtpResponse.refreshToken,
      countryCodeData: countryCodeData,
    );
    await ProfileSingleton.profileSingleton.writeUserProfile(
      SharedPrefUtilsKeys.keyUserProfileData,
      userProfile,
    );
    ProfileSingleton.profileSingleton.userProfile = userProfile;

    await SharedPrefsUtils().putKeyValuePairInPrefs(
      SharedPrefUtilsKeys.accessToken,
      validateOtpResponse.accessToken,
    );
    await SharedPrefsUtils().putKeyValuePairInPrefs(
      SharedPrefUtilsKeys.refreshToken,
      validateOtpResponse.refreshToken,
    );

    // final sharedPreferences = await SharedPreferences.getInstance();
    /*  final storedAccessToken = await sharedPreferences.setString(
      SecureStorageKeys.accessToken,
      validateOtpResponse.accessToken,
    );
    adLog('stored successfully $storedAccessToken');*/

    /*  final storedRefreshToken = await sharedPreferences.setString(
      SecureStorageKeys.refreshToken,
      validateOtpResponse.refreshToken,
    );
    adLog('stored successfully $storedRefreshToken');*/
  }

  //TODO comment as of now Abdul will fix it
/*  Future<void> _initialNetworksCallAfterLogin(BuildContext context) async {
    final userData = await ProfileSingleton.profileSingleton
        .readUserProfile(keyUserProfileData);
    adLog('userprofile validateOTP value : ${userData.userId}');

    String oldAgentId = '';
    if (!userData.isLoggedIn) {
      oldAgentId = userData.userId;
    }
    adLog('oldAgentId validateOTP after value : $oldAgentId');

    if (oldAgentId.isEmpty) {
      await GetCartOnUserBasis().getCartData(context);
    } else {
      await GetCartOnUserBasis().getCartData(context, oldAgentId: oldAgentId);
    }
    await context.read<AppSessionState>().getProfileDetails();
    await context.read<AppSessionState>().getBookings();
  }*/

  final SessionRepository _sessionRepository = SessionRepository();

  Future<ADResponseState> sendOtp({
    required SendOtpRequest sendOtpRequest,
  }) async {
    apiState.viewStatus = Status.loading;
    isResendingOTP = true;
    notifyListeners();
    return _sessionRepository.sendOtp(sendOtpRequest: sendOtpRequest);
  }

  /// This is used to avoid the otpState dispose issue on opening the second time.
  @override
  // ignore: must_call_super
  void dispose() => adLog('this');

  String convertOTPIntoHash(String otp) {
    final hashOTP = sha256.convert(utf8.encode(otp)).toString();
    return hashOTP;
  }
}

enum OtpType {
  sms,
  whatsApp,
}

extension OtpTypeAbbr on OtpType {
  String? get abbr {
    switch (this) {
      case OtpType.sms:
        return 'sms';
      case OtpType.whatsApp:
        return 'whatsapp';
      default:
        return null;
    }
  }
}
