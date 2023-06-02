/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/fields.dart';
import 'package:flutter/foundation.dart';

@immutable
class CityResponse {
  const CityResponse({
    this.fields,
  });

  final Fields? fields;

  List<CityDetailModel> getCityDetails(AirportListType airportListType) {
    if (airportListType == AirportListType.popular) {
      return fields?.popularAirportList ?? [];
    } else if (airportListType == AirportListType.international) {
      return fields?.internationalAirportList ?? [];
    } else if (airportListType == AirportListType.pranaam) {
      return fields?.pranaamAirportList ?? [];
    } else if (airportListType == AirportListType.other) {
      return fields?.domesticOtherAirportList ?? [];
    }
    {
      return fields?.listAirportApp ?? [];
    }
  }

  @override
  String toString() {
    return 'Element(fields: $fields)';
  }

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        fields: json['fields'] == null
            ? null
            : Fields.fromJson(json['fields'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'fields': fields?.toJson(),
      };

// @override
// bool operator ==(Object other) {
//   if (identical(other, this)) return true;
//   return other is Element && other.fields == fields;
// }
//
// @override
// int get hashCode => fields.hashCode;
}

enum AirportListType {
  popular,
  international,
  pranaam,
  all,
  other,
}
