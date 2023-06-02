/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class CountryCode {
  final String? value;

  const CountryCode({this.value});

  @override
  String toString() => 'CountryCode(value: $value)';

  factory CountryCode.fromJson(Map<String, dynamic> json) => CountryCode(
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };

  CountryCode copyWith({
    String? value,
  }) {
    return CountryCode(
      value: value ?? this.value,
    );
  }
}
