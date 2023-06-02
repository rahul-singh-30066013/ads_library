/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used to receive airport object

class Airport {
  Airport({
    this.locationCode,
    this.terminal,
    this.city,
    this.name,
    this.country,
  });

  final String? locationCode;
  final String? terminal;
  final String? name;
  final String? city;
  final String? country;

  Airport copyWith({
    String? locationCode,
    String? terminal,
    String? name,
    String? city,
    String? country,
  }) =>
      Airport(
        locationCode: locationCode ?? this.locationCode,
        terminal: terminal ?? this.terminal,
        name: name ?? this.name,
        city: city ?? this.city,
        country: country ?? this.country,
      );

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        locationCode: json['locationCode'],
        terminal: json['terminal'],
        name: json['name'],
        city: json['city'],
        country: json['country'],
      );
}
