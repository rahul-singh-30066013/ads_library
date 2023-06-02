/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

CountryCodesResponseModel countryCodesResponseModelFromJson(String str) =>
    CountryCodesResponseModel.fromJson(json.decode(str));

String countryCodesResponseModelToJson(CountryCodesResponseModel data) =>
    json.encode(data.toJson());

class CountryCodesResponseModel {
  CountryCodesResponseModel({
    required this.error,
    required this.msg,
    required this.data,
  });
  bool error;
  String msg;
  List<CountryCodesList> data;
  factory CountryCodesResponseModel.fromJson(Map<String, dynamic> json) =>
      CountryCodesResponseModel(
        error: json['error'],
        msg: json['msg'],
        data: List<CountryCodesList>.from(
          (json['data'] as List).map((x) => CountryCodesList.fromJson(x)),
        ),
      );
  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CountryCodesList {
  CountryCodesList({
    required this.name,
    required this.flag,
    required this.iso2,
    required this.iso3,
  });
  String name;
  String flag;
  String iso2;
  String iso3;
  factory CountryCodesList.fromJson(Map<String, dynamic> json) =>
      CountryCodesList(
        name: json['name'],
        flag: json['flag'],
        iso2: json['iso2'],
        iso3: json['iso3'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'flag': flag,
        'iso2': iso2,
        'iso3': iso3,
      };
}
