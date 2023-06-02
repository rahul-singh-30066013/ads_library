/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model_main.g.dart';

@JsonSerializable()
class DashboardModelMain {
  DashboardModelMain({
    this.storyViewWidget,
    required this.airportDashboardItems,
  });

  DutyFreeDashboardItem? storyViewWidget;
  List<DutyFreeDashboardItem>? airportDashboardItems;

  factory DashboardModelMain.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelMainFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelMainToJson(this);

  @override
  String toString() => json.encode(toJson());
}
