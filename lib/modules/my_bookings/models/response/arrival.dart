/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'arrival.g.dart';

@JsonSerializable()
class Arrival {
  String? date;
  String? time;
  String? flightName;
  String? flightNumber;
  String? orderStatus;

  Arrival();

  factory Arrival.fromJson(Map<String, dynamic> json) =>
      _$ArrivalFromJson(json);

  Map<String, dynamic> toJson() => _$ArrivalToJson(this);
}
