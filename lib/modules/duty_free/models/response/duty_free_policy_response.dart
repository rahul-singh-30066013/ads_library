/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_policy_response.freezed.dart';
part 'duty_free_policy_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreePolicyResponse with _$DutyFreePolicyResponse {
  const factory DutyFreePolicyResponse(
    String? title,
    String? text,
    List<String>? lines,
  ) = _DutyFreePolicyResponse;

  factory DutyFreePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DutyFreePolicyResponseFromJson(json);
}
