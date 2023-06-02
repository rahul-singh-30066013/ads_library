/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'cab_booking.g.dart';

@JsonSerializable()
class CabBooking {
  String? bookingID;
  String? vehicleType;
  String? vehicleImage;
  String? locationCode;

  CabBooking();

  factory CabBooking.fromJson(Map<String, dynamic> json) =>
      _$CabBookingFromJson(json);

  Map<String, dynamic> toJson() => _$CabBookingToJson(this);
}
