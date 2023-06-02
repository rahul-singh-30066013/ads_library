/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_request.freezed.dart';
part 'send_otp_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SendOtpRequest with _$SendOtpRequest {
  const factory SendOtpRequest(
    String phoneNumber,
    String countryCode,
   {@Default(false) bool isWhatsapp,}
  ) = _SendOtpRequest;

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$SendOtpRequestFromJson(json);
}
