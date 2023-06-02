/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/duty_free/models/duty_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/duty_payment_confirmation.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/services.dart';

/// This Repository class is used to define all the methods (API) related to duty free module,

class DutyFreeRepository {
  Future<ADResponseState> getDutyPaymentConfirmationList(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        return ADResponseState.completed(
          DutyPaymentConfirmation.fromJson(parsed),
        );
      });

  Future<ADResponseState> getDutyConfirmationSummaryFromJson(String jsonPath) =>
      Future.delayed(const Duration(seconds: 1), () async {
        final jsonString = await rootBundle.loadString(jsonPath);
        final parsed = json.decode(jsonString);
        return ADResponseState.completed(DutyConfirmation.fromJson(parsed));
      });
}
