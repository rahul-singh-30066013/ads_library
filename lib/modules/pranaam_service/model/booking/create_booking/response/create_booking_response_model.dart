/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_booking_response_model.freezed.dart';
part 'create_booking_response_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CreateBookingResponseModel with _$CreateBookingResponseModel {
  const factory CreateBookingResponseModel({
    @Default(0) int bookingId,
    @Default(0) int customerId,
  }) = _CreateBookingResponseModel;

  factory CreateBookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingResponseModelFromJson(json);
}
