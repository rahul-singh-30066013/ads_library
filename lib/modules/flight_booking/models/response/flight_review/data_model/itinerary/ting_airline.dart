/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight info
import 'package:flutter/foundation.dart';

@immutable
class TingAirline {
  const TingAirline({
    this.code,
    this.flightNumber,
    this.name,
  });

  final String? code;
  final String? flightNumber;
  final String? name;

  TingAirline copyWith({
    String? code,
    String? flightNumber,
    String? name,
  }) =>
      TingAirline(
        code: code ?? this.code,
        flightNumber: flightNumber ?? this.flightNumber,
        name: name ?? this.name,
      );

  factory TingAirline.fromJson(Map<String, dynamic> json) => TingAirline(
        code: json['code'],
        flightNumber: json['flightNumber'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'flightNumber': flightNumber,
        'name': name,
      };

  @override
  String toString() {
    return 'Airline(code: $code, flightNumber: $flightNumber, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is TingAirline &&
        other.code == code &&
        other.flightNumber == flightNumber &&
        other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ flightNumber.hashCode ^ name.hashCode;
}
