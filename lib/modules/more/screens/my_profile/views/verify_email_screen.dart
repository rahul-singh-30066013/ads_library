/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/verify_profile_template.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    Key? key,
    required this.emailId,
    this.fromChangeScreen,
    required this.verifyEmail,
    this.sourceId,
    this.fromBottomSheet,
  }) : super(key: key);

  final String emailId;
  final bool? fromChangeScreen;
  final ADTapCallbackWithValue verifyEmail;
  final String? sourceId;
  final bool? fromBottomSheet;

  @override
  Widget build(BuildContext context) {
    return VerifyProfileTemplate(
      title: 'verify_email_id'.localize(context),
      subtitle: '${'otp_sent_to'.localize(context)} $emailId',
      otpTo: OtpTo.email,
      arguments: [emailId],
      fromChangeScreen: fromChangeScreen,
      verifyEmailCallBack: verifyEmail,
      sourceId: sourceId,
      fromBottomSheet: fromBottomSheet,
    );
  }
}
