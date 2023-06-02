/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_code_value.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CountryFlag {
  final CountryCodeValue? value;

  const CountryFlag({this.value});

  @override
  String toString() => 'CountryFlag(value: $value)';

  factory CountryFlag.fromJson(Map<String, dynamic> json) => CountryFlag(
        value: json['value'] == null
            ? null
            : CountryCodeValue.fromJson(json['value'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'value': value?.toJson(),
      };

  CountryFlag copyWith({
    CountryCodeValue? value,
  }) {
    return CountryFlag(
      value: value ?? this.value,
    );
  }
}
