/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: avoid_positional_boolean_parameters

import 'package:json_annotation/json_annotation.dart';

part 'app_config_model.g.dart';

@JsonSerializable()
class AppConfigModel {
  @JsonKey(name: 'appVersion')
  String appVersion;
  @JsonKey(name: 'isForceUpgrade')
  bool isForceUpgrade;
  @JsonKey(name: 'isMaintenance')
  bool isMaintenance;
  @JsonKey(name: 'iosLink')
  String iosLink;
  @JsonKey(name: 'androidLink')
  String androidLink;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'actionTitle')
  String actionTitle;
  @JsonKey(name: 'cancelTitle')
  String cancelTitle;

  AppConfigModel(
    this.isForceUpgrade,
    this.appVersion,
    this.iosLink,
    this.androidLink,
    this.title,
    this.message,
    this.actionTitle,
    this.cancelTitle,
    this.isMaintenance,
  );

  factory AppConfigModel.fromJson(Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigModelToJson(this);
}
