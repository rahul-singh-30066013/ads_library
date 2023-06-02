/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_booking_request_model.freezed.dart';
part 'cancel_booking_request_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CancelBookingRequestModel with _$CancelBookingRequestModel {
  const factory CancelBookingRequestModel({
    required String orderReferenceId,
    required List<int> passengerIdList,
  }) = _CancelBookingRequestModel;

  factory CancelBookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CancelBookingRequestModelFromJson(json);
}
