/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_otp_request.freezed.dart';
part 'validate_otp_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ValidateOtpRequest with _$ValidateOtpRequest {
  const factory ValidateOtpRequest(
    String source,
    String otpCode,
    String? referralCode,
  ) = _ValidateOtpRequest;

  factory ValidateOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$ValidateOtpRequestFromJson(json);
}
