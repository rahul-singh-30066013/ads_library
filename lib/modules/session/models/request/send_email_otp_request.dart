/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_email_otp_request.freezed.dart';
part 'send_email_otp_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SendEmailOtpRequest with _$SendEmailOtpRequest {
  const factory SendEmailOtpRequest(String emailAddress) = _SendEmailOtpRequest;

  factory SendEmailOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$SendEmailOtpRequestFromJson(json);
}
