/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'from.g.dart';

@JsonSerializable()
class From {
  String? locationCode;
  String? terminal;
  String? name;
  String? city;
  String? country;

  From();

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}
