/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_otp_response.freezed.dart';
part 'validate_otp_response.g.dart';

ValidateOtpResponse validateOtpResponseFromJson(String str) =>
    ValidateOtpResponse.fromJson(json.decode(str));

String validateOtpResponseToJson(ValidateOtpResponse data) =>
    json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ValidateOtpResponse with _$ValidateOtpResponse {
  const factory ValidateOtpResponse({
    required bool isRegistered,
    required String accessToken,
    required String refreshToken,
    required int expiry,
  }) = _ValidateOtpResponse;

  factory ValidateOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateOtpResponseFromJson(json);
}
