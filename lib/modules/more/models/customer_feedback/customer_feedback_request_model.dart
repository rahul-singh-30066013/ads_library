/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_feedback_request_model.freezed.dart';
part 'customer_feedback_request_model.g.dart';

/// this is the model class for customer feedback request
@Freezed(makeCollectionsUnmodifiable: false)
abstract class CustomerFeedbackRequestModel
    with _$CustomerFeedbackRequestModel {
  const factory CustomerFeedbackRequestModel({
    @Default('') String name,
    @Default('') String email,
    @Default('') String airport,
    @Default('') String type,
    @Default('') String description,
    @Default('') String mobileNumber,
    @Default('') String countryCode,
    FlightDetails? flightDetails,
  }) = _CustomerFeedbackRequestModel;

  factory CustomerFeedbackRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerFeedbackRequestModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class FlightDetails with _$FlightDetails {
  const factory FlightDetails({
    @Default('') String flightNumber,
    @Default('') String flightDate,
  }) = _FlightDetails;

  factory FlightDetails.fromJson(Map<String, dynamic> json) =>
      _$FlightDetailsFromJson(json);
}
