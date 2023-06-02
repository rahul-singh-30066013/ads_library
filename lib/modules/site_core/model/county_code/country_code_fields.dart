/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_code_item.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CountryCodeFields {
  final List<CountryCodeItem>? items;

  const CountryCodeFields({this.items});

  @override
  String toString() => 'CountryCodeFields(items: $items)';

  factory CountryCodeFields.fromJson(Map<String, dynamic> json) =>
      CountryCodeFields(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => CountryCodeItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };

  CountryCodeFields copyWith({
    List<CountryCodeItem>? items,
  }) {
    return CountryCodeFields(
      items: items ?? this.items,
    );
  }
}
