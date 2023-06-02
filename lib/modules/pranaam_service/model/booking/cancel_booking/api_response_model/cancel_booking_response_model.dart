/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_booking_response_model.freezed.dart';
part 'cancel_booking_response_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CancelBookingResponseModel with _$CancelBookingResponseModel {
  const factory CancelBookingResponseModel({
    @JsonKey(name: 'isSuccess') @Default(false) bool isSuccess,
    @JsonKey(name: 'message') @Default('') String message,
  }) = _CancelBookingResponseModel;

  factory CancelBookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CancelBookingResponseModelFromJson(json);
}
