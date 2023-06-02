/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';

//this model class is used for PaymentInfo, that will reference from flight booking
class PaymentInfo {
  PaymentInfo({
    String? fieldName,
    String? fieldValue,
  }) {
    _fieldName = fieldName;
    _fieldValue = fieldValue;
  }

  PaymentInfo.fromJson(Map<String, dynamic> json) {
    _fieldName = json['fieldName'];
    _fieldValue = json['fieldValue'];
  }
  String? _fieldName;
  String? _fieldValue;

  String? get fieldName => _fieldName;
  String? get fieldValue => _fieldValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fieldName'] = _fieldName;
    map['fieldValue'] = _fieldValue;
    return map;
  }
}

class SelectedItineraryToConfirmation {
  final FlightViewItineraryResponseModel flightViewItineraryResponseModel;
  final String tripId;
  SelectedItineraryToConfirmation({
    required this.flightViewItineraryResponseModel,
    required this.tripId,
  });
}
