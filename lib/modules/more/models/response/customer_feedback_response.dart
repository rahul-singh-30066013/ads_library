/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_feedback_response.freezed.dart';
part 'customer_feedback_response.g.dart';

/// this is the model class for customer feedback request
@Freezed(makeCollectionsUnmodifiable: false)
abstract class CustomerFeedbackResponse with _$CustomerFeedbackResponse {
  const factory CustomerFeedbackResponse({
    IncidentDetail? incidentDetail,
  }) = _CustomerFeedbackResponse;

  factory CustomerFeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerFeedbackResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class IncidentDetail with _$IncidentDetail {
  const factory IncidentDetail({
    @Default('') String incidentId,
  }) = _IncidentDetail;

  factory IncidentDetail.fromJson(Map<String, dynamic> json) =>
      _$IncidentDetailFromJson(json);
}
