/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_response.freezed.dart';
part 'send_otp_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SendOtpResponse with _$SendOtpResponse {
  const factory SendOtpResponse({
    required String phoneNumber,
    String? email,
    required bool isRegistered,
  }) = _SendOtpResponse;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseFromJson(json);
}
