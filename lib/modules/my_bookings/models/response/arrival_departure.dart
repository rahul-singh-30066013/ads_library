/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:flutter/foundation.dart';

@immutable
class ArrivalDeparture {
  const ArrivalDeparture({this.date, this.time});

  final String? date;
  final String? time;

  @override
  String toString() => 'Arrival(date: $date, time: $time)';

  factory ArrivalDeparture.fromJson(Map<String, dynamic> json) =>
      ArrivalDeparture(
        date: FlightUtils.getConvertedDateStringInDdMMYYYY(
          json['date'] ?? 'N/A',
        ),
        time: json['time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'time': time,
      };

  ArrivalDeparture copyWith({
    String? date,
    String? time,
  }) {
    return ArrivalDeparture(
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is ArrivalDeparture &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode => date.hashCode ^ time.hashCode;
}
