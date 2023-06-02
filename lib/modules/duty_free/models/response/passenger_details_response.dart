/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'passenger_details_response.freezed.dart';
part 'passenger_details_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PassengerDetailsResponse with _$PassengerDetailsResponse {
  const factory PassengerDetailsResponse({
    String? orderRemarks,
    @Default('144') String customerId,
    @Default('') String customerName,
    @Default('') String passportNumber,
    @Default('') String customerPassportExpiry,
    @Default(0) num totalAmount,
    @Default('') String pickupDate,
    @Default('') String pickupTime,
    @Default('') String flightNo,
    @Default('') String flightTime,
    @Default('') String customerDOB,
    @Default('') String countryDialCode,
    @Default('') String mobile,
    @Default('') String emailId,
    @Default('') String countryCode,
    @Default('') String countryName,
    @Default('') String assistanceCode,
  }) = _PassengerDetailsResponse;

  factory PassengerDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PassengerDetailsResponseFromJson(json);
}
