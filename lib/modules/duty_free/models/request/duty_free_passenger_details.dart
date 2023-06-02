/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_passenger_details.freezed.dart';
part 'duty_free_passenger_details.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreePassengerDetails with _$DutyFreePassengerDetails {
  const factory DutyFreePassengerDetails({
    String? orderRemarks,
    // @Default('144') String customerId,
    @Default('') String customerName,
    @Default('') String passportNumber,
    @Default('') String passportExpiry,
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
    @Default(false) bool isAssistance, //isAssistance
    @Default('') String assistanceCode,
  }) = _DutyFreePassengerDetails;

  factory DutyFreePassengerDetails.fromJson(Map<String, dynamic> json) =>
      _$DutyFreePassengerDetailsFromJson(json);
}
