/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used to total breakage

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/taxes.dart';

class Total {
  Total({
    required this.amount,
    this.currencyCode,
    this.perPaxAmount,
    this.tax,
  });

  final double? perPaxAmount;
  final double? amount;
  final String? currencyCode;
  final List<Tax>? tax;

  Total copyWith({
    required double amount,
  }) =>
      Total(
        amount: amount,
      );

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        amount: json['amount'] != null
            ? double.parse(json['amount'].toString())
            : 0,
        perPaxAmount: json['perPaxAmount'] != null
            ? double.parse(json['perPaxAmount'].toString())
            : 0,
        currencyCode: json['currencyCode'] ?? 'INR',
        tax: json['tax'] != null ? getTaxList(json['tax']) : [],
      );
}

//to iterate tax
List<Tax> getTaxList(json) {
  final List<Tax> _tax = [];
  for (final object in json as List) {
    final Tax total = Tax.fromJson(object);
    _tax.add(total);
  }
  return _tax;
}
