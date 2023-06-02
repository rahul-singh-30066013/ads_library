/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will used to receive response for price change api
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';

class FlightItineraryPriceChange {
  FlightItineraryPriceChange({
    this.tripId,
    this.isPriceChanges,
    this.priceChangeType,
    this.pricingSummary,
  });
  String? tripId;
  bool? isPriceChanges;
  PriceChangeType? priceChangeType;
  PricingSummary? pricingSummary;
  FlightItineraryPriceChange.fromJson(Map<String, dynamic> json) {
    tripId = json['tripId'];
    isPriceChanges = json['isPriceChanges'];
    if (json['priceChangeType'] != null) {
      final String changeType = json['priceChangeType'];
      priceChangeType = PriceChangeType.values.byName(changeType);
    }
    pricingSummary = json['pricingSummary'] != null
        ? PricingSummary.fromJson(json['pricingSummary'])
        : null;
  }
}
