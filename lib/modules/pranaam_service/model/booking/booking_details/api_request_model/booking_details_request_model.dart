/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// To parse this JSON data, do
//
//     final bookingDetailsRequestModel = bookingDetailsRequestModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_details_request_model.freezed.dart';
part 'booking_details_request_model.g.dart';

const int defaultBookingId = 3292;

@Freezed(makeCollectionsUnmodifiable: false)
class BookingDetailsRequestModel with _$BookingDetailsRequestModel {
  const factory BookingDetailsRequestModel({
    @JsonKey(name: 'tripId') @Default(0) int tripId,
    @JsonKey(name: 'bookingId') @Default(defaultBookingId) int bookingId,
  }) = _BookingDetailsRequestModel;

  factory BookingDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailsRequestModelFromJson(json);
}
