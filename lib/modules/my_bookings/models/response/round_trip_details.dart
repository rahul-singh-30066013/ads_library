/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/my_bookings/models/response/arrival.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/from.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'round_trip_details.g.dart';

@JsonSerializable()
class RoundTripDetails {
  Arrival? departure;
  Arrival? arrival;
  From? from;
  From? to;

  RoundTripDetails();

  factory RoundTripDetails.fromJson(Map<String, dynamic> json) =>
      _$RoundTripDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RoundTripDetailsToJson(this);
}
