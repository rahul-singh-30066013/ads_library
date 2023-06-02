/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_details_response.freezed.dart';
part 'payment_details_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PaymentDetailsResponse with _$PaymentDetailsResponse {
  const factory PaymentDetailsResponse({
    @Default('') String transactionMode,
    @Default('') String transactionCode,
    @Default('') String status,
  }) = _PaymentDetailsResponse;

  factory PaymentDetailsResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentDetailsResponseFromJson(json);
}
