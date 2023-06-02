/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';

class LoginModelUtils {
  String countryCode;
  String mobileNumber;
  bool isOtpViaWhatsAppEnabled;
  SignInStatusModel? signInStatusModel;
  CountryCodeData? countryCodeData;
  String? sourceId;
  String? referCode;

  LoginModelUtils({
    required this.countryCode,
    required this.mobileNumber,
    required this.isOtpViaWhatsAppEnabled,
    required this.signInStatusModel,
    this.countryCodeData,
    this.sourceId,
    this.referCode,
  });
}
