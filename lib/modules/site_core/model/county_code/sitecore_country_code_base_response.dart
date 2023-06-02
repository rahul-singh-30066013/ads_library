/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_code_fields.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SitecoreCountryCodeBaseResponse {
  final String? uid;
  final String? componentName;
  final String? dataSource;
  final CountryCodeFields? fields;

  const SitecoreCountryCodeBaseResponse({
    this.uid,
    this.componentName,
    this.dataSource,
    this.fields,
  });

  @override
  String toString() {
    return 'SitecoreCountryCodeBaseResponse(uid: $uid, componentName: $componentName, dataSource: $dataSource, fields: $fields)';
  }

  factory SitecoreCountryCodeBaseResponse.fromJson(Map<String, dynamic> json) {
    return SitecoreCountryCodeBaseResponse(
      uid: json['uid'] as String?,
      componentName: json['componentName'] as String?,
      dataSource: json['dataSource'] as String?,
      fields: json['fields'] == null
          ? null
          : CountryCodeFields.fromJson(json['fields'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'componentName': componentName,
        'dataSource': dataSource,
        'fields': fields?.toJson(),
      };

  SitecoreCountryCodeBaseResponse copyWith({
    String? uid,
    String? componentName,
    String? dataSource,
    CountryCodeFields? fields,
  }) {
    return SitecoreCountryCodeBaseResponse(
      uid: uid ?? this.uid,
      componentName: componentName ?? this.componentName,
      dataSource: dataSource ?? this.dataSource,
      fields: fields ?? this.fields,
    );
  }
}
