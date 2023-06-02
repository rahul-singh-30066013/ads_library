/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// this class is used as FlightCreateItinerary response model to receive api response
class FlightCreateItineraryResponseModel {
  FlightCreateItineraryResponseModel({
    String? itineraryId,
  }) {
    _itineraryId = itineraryId;
  }

  FlightCreateItineraryResponseModel.fromJson(Map<String, dynamic> json) {
    _itineraryId = json['itineraryId'];
  }
  String? _itineraryId;

  String? get itineraryId => _itineraryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itineraryId'] = _itineraryId;
    return map;
  }
}
