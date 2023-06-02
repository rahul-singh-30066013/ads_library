/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'dart:convert';

//this class will used to request email itinerary from booking detail screen
class EmailItineraryRequestModel {
  EmailItineraryRequestModel({
    String? email,
    String? tripId,
  }) {
    _email = email;
    _tripId = tripId;
  }
  String? _email;
  String? _tripId;

  String? get email => _email;
  String? get tripId => _tripId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emailId'] = _email;
    map['orderReferenceId'] = _tripId;
    return map;
  }

  ///create Booking RequestBody string param prepare
  String createEmailItineraryRequestBody(
    EmailItineraryRequestModel emailItineraryRequestModel,
  ) {
    return jsonEncode(emailItineraryRequestModel);
  }
}
