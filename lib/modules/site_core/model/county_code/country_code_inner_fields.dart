/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/county_code/calling_code.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_code.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_flag.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_name.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/max_length.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/min_length.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CountryCodeInnerFields {
  final CallingCode? callingCode;
  final CountryName? countryName;
  final CountryCode? countryCode;
  final CountryFlag? countryFlag;
  final MaxLength? maxLength;
  final MinLength? minLength;

  const CountryCodeInnerFields({
    this.callingCode,
    this.countryName,
    this.countryCode,
    this.countryFlag,
    this.maxLength,
    this.minLength,
  });

  factory CountryCodeInnerFields.fromJson(Map<String, dynamic> json) =>
      CountryCodeInnerFields(
        callingCode: json['CallingCode'] == null
            ? null
            : CallingCode.fromJson(json['CallingCode'] as Map<String, dynamic>),
        countryName: json['CountryName'] == null
            ? null
            : CountryName.fromJson(json['CountryName'] as Map<String, dynamic>),
        countryCode: json['CountryCode'] == null
            ? null
            : CountryCode.fromJson(json['CountryCode'] as Map<String, dynamic>),
        countryFlag: json['CountryFlag'] == null
            ? null
            : CountryFlag.fromJson(json['CountryFlag'] as Map<String, dynamic>),
        maxLength: json['maxLength'] == null
            ? null
            : MaxLength.fromJson(json['maxLength'] as Map<String, dynamic>),
        minLength: json['minLength'] == null
            ? null
            : MinLength.fromJson(json['minLength'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'CallingCode': callingCode?.toJson(),
        'CountryName': countryName?.toJson(),
        'CountryCode': countryCode?.toJson(),
        'CountryFlag': countryFlag?.toJson(),
        'maxLength': maxLength?.toJson(),
        'minLength': minLength?.toJson(),
      };

  CountryCodeInnerFields copyWith({
    CallingCode? callingCode,
    CountryName? countryName,
    CountryCode? countryCode,
    CountryFlag? countryFlag,
    MaxLength? maxLength,
    MinLength? minLength,
  }) {
    return CountryCodeInnerFields(
      callingCode: callingCode ?? this.callingCode,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
      countryFlag: countryFlag ?? this.countryFlag,
      maxLength: maxLength ?? this.maxLength,
      minLength: minLength ?? this.minLength,
    );
  }
}
