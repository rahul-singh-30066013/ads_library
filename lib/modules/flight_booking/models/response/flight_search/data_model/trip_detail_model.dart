/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';

/// this class is used to contain the from and to city along with travel date.
class TripDetailModel {
  ///*[fromCity] used to contain from city details.
  CityDetailModel? fromCity;

  ///*[toCity] used to contain to city details.
  CityDetailModel? toCity;

  ///*[tripType] used to contain trip type.
  TripType? tripType;

  ///*[date] used to contain travel date.
  DateTime? date;

  TripDetailModel({
    this.tripType,
    this.fromCity,
    this.toCity,
    this.date,
  });

  TripDetailModel copy({
    DateTime? withDateTime,
  }) {
    return TripDetailModel(
      tripType: tripType,
      fromCity: fromCity,
      toCity: toCity,
      date: withDateTime ??
          FlightUtils.nextValidDate(sameDate: date ?? DateTime.now()),
    );
  }

  @override
  String toString() {
    return 'TripDetailModel{fromCity: $fromCity, toCity: $toCity, '
        'tripType: $tripType, date: $date}';
  }

  factory TripDetailModel.fromJson(Map<String, dynamic> json) {
    final String date = json['date'];
    return TripDetailModel(
      fromCity: CityDetailModel.fromJson(json['fromCity']),
      toCity: CityDetailModel.fromJson(json['toCity']),
      date: DateTime.parse(date),
    );
  }

  Map<String, dynamic> toJson() => {
        'fromCity': fromCity,
        'toCity': toCity,
        'date': date.toString(),
      };
}
