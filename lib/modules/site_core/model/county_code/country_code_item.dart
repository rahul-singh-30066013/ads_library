/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_code_inner_fields.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CountryCodeItem {
  final String? id;
  final String? url;
  final String? name;
  final String? displayName;
  final CountryCodeInnerFields? fields;

  const CountryCodeItem({
    this.id,
    this.url,
    this.name,
    this.displayName,
    this.fields,
  });

  @override
  String toString() {
    return 'CountryCodeItem(id: $id, url: $url, name: $name, displayName: $displayName, fields: $fields)';
  }

  factory CountryCodeItem.fromJson(Map<String, dynamic> json) {
    return CountryCodeItem(
      id: json['id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      fields: json['fields'] == null
          ? null
          : CountryCodeInnerFields.fromJson(
              json['fields'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'name': name,
        'displayName': displayName,
        'fields': fields?.toJson(),
      };

  CountryCodeItem copyWith({
    String? id,
    String? url,
    String? name,
    String? displayName,
    CountryCodeInnerFields? fields,
  }) {
    return CountryCodeItem(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      fields: fields ?? this.fields,
    );
  }
}
