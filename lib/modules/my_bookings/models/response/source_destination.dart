/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class SourceDestination {
  const SourceDestination({
    this.locationCode,
    this.terminal,
    this.name,
    this.city,
    this.country,
  });

  final String? locationCode;
  final String? terminal;
  final String? name;
  final String? city;
  final String? country;

  @override
  String toString() {
    return 'To(locationCode: $locationCode, terminal: $terminal, name: $name, city: $city, country: $country)';
  }

  factory SourceDestination.fromJson(Map<String, dynamic> json) =>
      SourceDestination(
        locationCode: json['locationCode'] as String?,
        terminal: json['terminal'] as String?,
        name: json['name'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'locationCode': locationCode,
        'terminal': terminal,
        'name': name,
        'city': city,
        'country': country,
      };

  SourceDestination copyWith({
    String? locationCode,
    String? terminal,
    String? name,
    String? city,
    String? country,
  }) {
    return SourceDestination(
      locationCode: locationCode ?? this.locationCode,
      terminal: terminal ?? this.terminal,
      name: name ?? this.name,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is SourceDestination &&
        other.locationCode == locationCode &&
        other.terminal == terminal &&
        other.name == name &&
        other.city == city &&
        other.country == country;
  }

  @override
  int get hashCode =>
      locationCode.hashCode ^
      terminal.hashCode ^
      name.hashCode ^
      city.hashCode ^
      country.hashCode;
}
