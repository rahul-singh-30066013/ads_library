/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/my_bookings/models/response/cab_booking/cab_booking.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/duty_free_booking.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/flight_booking.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/pranaam_booking.dart';
import 'package:adani_airport_mobile/modules/train/train_man_order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fields.g.dart';

@JsonSerializable()
class Fields {
  @JsonKey(name: 'flightbookingDetail')
  FlightBooking? flightbookingDetail;
  @JsonKey(name: 'dutyfreeDetail')
  DutyFreeBooking? dutyfreeDetail;
  @JsonKey(name: 'pranaamDetail')
  PranaamBooking? pranaamDetail;
  @JsonKey(name: 'cabDetail')
  CabBooking? cabDetail;
  @JsonKey(name: 'trainmanDetail')
  TrainManOrder? trainManOrder;

  Fields();

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);
}
