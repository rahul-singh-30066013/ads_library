/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class CountryName {
  final String? value;

  const CountryName({this.value});

  @override
  String toString() => 'CountryName(value: $value)';

  factory CountryName.fromJson(Map<String, dynamic> json) => CountryName(
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };

  CountryName copyWith({
    String? value,
  }) {
    return CountryName(
      value: value ?? this.value,
    );
  }
}
