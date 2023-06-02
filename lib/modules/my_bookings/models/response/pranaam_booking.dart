/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/my_bookings/models/response/arrival.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/from.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/round_trip_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pranaam_booking.g.dart';

@JsonSerializable()
class PranaamBooking {
  String? serviceAirport;
  String? serviceType;
  String? packageName;
  String? bookingDate;
  String? travelSector;
  Arrival? departure;
  Arrival? arrival;
  From? from;
  From? to;
  String? serviceDateTime;
  String? flightName;
  String? refundStatus;
  RoundTripDetails? roundTripDetails;
  String? imageUrl;
  String? pranaamBookingType;
  int? itemCount;
  int? serviceEpochTimeStamp;

  PranaamBooking();

  factory PranaamBooking.fromJson(Map<String, dynamic> json) =>
      _$PranaamBookingFromJson(json);

  Map<String, dynamic> toJson() => _$PranaamBookingToJson(this);
}
