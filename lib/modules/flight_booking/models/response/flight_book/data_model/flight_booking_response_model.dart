/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this model class is used for FlightBookingResponseModel to receive response while create booking
class FlightBookingResponseModel {
  FlightBookingResponseModel({
    String? tripId,
    String? comment,
  }) {
    _tripId = tripId;
    _comment = comment;
  }
  FlightBookingResponseModel.fromJson(Map<String, dynamic> json) {
    _tripId = json['tripId'];
    _comment = json['comment'];
  }
  String? _tripId;
  String? _comment;

  String? get tripId => _tripId;
  String? get comment => _comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripId'] = _tripId;
    map['comment'] = _comment;
    return map;
  }
}
