/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';

//this model class is used for price validate request model
class FlightCheckPriceRequestModel {
  FlightCheckPriceRequestModel({
    PricingSummary? pricingSummary,
  }) {
    _pricingSummary = pricingSummary;
  }
  PricingSummary? _pricingSummary;

  FlightCheckPriceRequestModel copyWith({
    PricingSummary? pricingSummary,
  }) {
    return FlightCheckPriceRequestModel(
      pricingSummary: pricingSummary ?? _pricingSummary,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pricingSummary'] = _pricingSummary;
    return map;
  }

  ///createPriceCheckRequestBody string param prepare
  String createPriceCheckRequestBody() {
    final FlightCheckPriceRequestModel flightCheckPriceRequestModel =
        FlightCheckPriceRequestModel().copyWith(
      pricingSummary: _pricingSummary,
    );

    return jsonEncode(flightCheckPriceRequestModel);
  }
}
