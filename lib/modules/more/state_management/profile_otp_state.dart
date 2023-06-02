/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/models/request/validate_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/repository/session_repository.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to mange state of profile otp verification
class ProfileOtpState extends BaseViewModel {
  int? otpDigit;
  final SessionRepository _sessionRepository = SessionRepository();

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
  String otpStr = '';
  String sourceId = '';

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
            style: ADTextStyle400.size14.copyWith(
              color: ADColors.white,
            ),
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

  //to validate email otp
  Future<ADResponseState> validateEmailOTP({
    required String source,
    required String otp,
    String? referCode,
  }) async {
    otpStr = otp;
    apiState = ADResponseState.loading();
    notifyListeners();
    apiState = await _sessionRepository.validateEmailOTP(
      validateOtpRequest: ValidateOtpRequest(
        source,
        getOtp(),
        referCode,
      ),
    );
    apiState = apiState.viewStatus == Status.complete
        ? ADResponseState.completed(apiState.data)
        : ADResponseState.error(apiState.message);
    notifyListeners();
    return apiState;
  }

  //to send otp on email
  Future<ADResponseState> sendEmailOtp({
    required SendEmailOtpRequest sendEmailOtpRequest,
  }) async {
    apiState.viewStatus = Status.loading;
    isResendingOTP = true;
    notifyListeners();
    return _sessionRepository.sendEmailOtp(
      sendEmailOtpRequest: sendEmailOtpRequest,
    );
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
