/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out_request.freezed.dart';
part 'sign_out_request.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SignOutRequest with _$SignOutRequest {
  const factory SignOutRequest(
    String accessToken,
    String refreshToken,
  ) = _SignOutRequest;

  factory SignOutRequest.fromJson(Map<String, dynamic> json) =>
      _$SignOutRequestFromJson(json);
}
