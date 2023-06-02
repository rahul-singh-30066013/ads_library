/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_otp_response.freezed.dart';
part 'verify_email_otp_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class VerifyEmailOtpResponse with _$VerifyEmailOtpResponse {
  const factory VerifyEmailOtpResponse({
    bool? isSuccess,
    String? successMessage,
  }) = _VerifyEmailOtpResponse;

  factory VerifyEmailOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpResponseFromJson(json);
}
