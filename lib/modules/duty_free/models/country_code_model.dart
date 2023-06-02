/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_code_model.g.dart';

@JsonSerializable()
class CountryCodeModel {
  List<CountryCodeData> countryCodes = [];

  CountryCodeModel({required this.countryCodes});

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryCodeModelToJson(this);
}

@JsonSerializable()
class CountryCodeData {
  @JsonKey(name: 'country_code')
  String? countryCode;
  String? name;
  @JsonKey(name: 'calling_code')
  String? callingCode;
  String? flag;
  String? max;
  String? min;

  CountryCodeData({
    this.countryCode,
    this.name,
    this.callingCode,
    this.flag,
    this.max,
    this.min,
  });

  /// this method is use for when user not select country code
  factory CountryCodeData.defaultValue() {
    return CountryCodeData(
      countryCode: 'IN',
      callingCode: '+91',
      flag:
          '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png?h=39&iar=0&w=60&hash=5190E21452F6BADC10EE1257FEF2F7F7',
      name: 'India',
      max: '10',
      min: '6',
    );
  }

  factory CountryCodeData.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountryCodeDataToJson(this);
}
