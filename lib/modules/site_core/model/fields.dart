/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class Fields {
  const Fields({
    this.listAirportApp,
    this.popularAirportList,
    this.internationalAirportList,
    this.pranaamAirportList,
    this.domesticOtherAirportList,
  });

  final List<CityDetailModel>? listAirportApp;
  final List<CityDetailModel>? popularAirportList;
  final List<CityDetailModel>? domesticOtherAirportList;
  final List<CityDetailModel>? internationalAirportList;
  final List<CityDetailModel>? pranaamAirportList;

  @override
  String toString() =>
      'Fields(listAirportApp: $listAirportApp, domesticAirportList: $popularAirportList, internationalAirportList: $internationalAirportList,pranaamAirportList: $pranaamAirportList)';

  factory Fields.fromJson(Map<String, dynamic> json) {
    final List<CityDetailModel> _allAirports = [];
    final List<CityDetailModel> _popularAirports = [];
    final List<CityDetailModel> _domesticOtherAirports = [];
    final List<CityDetailModel> _internationalAirports = [];
    final List<CityDetailModel> _pranaamAirports = [];

    final data = json['listAirportApp'] as List<dynamic>? ?? [];
    for (final object in data) {
      final cityData = CityDetailModel.fromJson(object as Map<String, dynamic>);
      if (cityData.isDomestic ?? false) {
        if (cityData.isPranaam ?? false) {
          _pranaamAirports.add(cityData);
        }
        if (cityData.isPopular ?? false) {
          _popularAirports.add(cityData);
        } else {
          _domesticOtherAirports.add(cityData);
        }
      } else {
        if (cityData.isPopular ?? false) {
          _popularAirports.add(cityData);
        } else {
          _internationalAirports.add(cityData);
        }
      }
      _allAirports.add(cityData);
    }
    return Fields(
      listAirportApp: _allAirports,
      popularAirportList: _popularAirports,
      internationalAirportList: _internationalAirports,
      pranaamAirportList: _pranaamAirports,
      domesticOtherAirportList: _domesticOtherAirports,
    );
  }

  Map<String, dynamic> toJson() => {
        'listAirportApp': listAirportApp?.map((e) => e.toJson()).toList(),
      };

// @override
// bool operator ==(Object other) {
// 	if (identical(other, this)) return true;
// 	return other is Fields &&
// 			listEquals(other.listAirportApp, listAirportApp);
// }
//
// @override
// int get hashCode => listAirportApp.hashCode;
}
