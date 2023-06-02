/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'duty_free_booking.g.dart';

@JsonSerializable()
class DutyFreeBooking {
  String? materialName;
  String? skuCode;
  String? skuName;
  num? quantity;
  String? unit;
  String? size;
  List<String?>? imageUrl;
  String? storeName;
  String? airportCode;
  String? refundStatus;
  dynamic pickupDate;

  DutyFreeBooking();

  factory DutyFreeBooking.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeBookingFromJson(json);

  Map<String, dynamic> toJson() => _$DutyFreeBookingToJson(this);
}
