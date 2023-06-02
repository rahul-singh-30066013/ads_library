/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight air-itinerary pricing info

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/passenger_type_quantity.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/total.dart';

class AirItineraryPricingInfo {
  AirItineraryPricingInfo({
    this.totalFare,
    this.totalBaseFare,
    this.totalTax,
    this.totalFee,
    this.passengerTypeQuantity,
    this.discounts,
    this.remark,
  });

  final Total? totalFare;
  final Total? totalBaseFare;
  final Total? totalTax;
  final Total? totalFee;
  final List<PassengerTypeQuantity>? passengerTypeQuantity;
  final Total? discounts;
  final String? remark;

  int get price => (totalFare?.amount ?? 0).toInt();

  int get unitPrice =>
      (passengerTypeQuantity?.first.totalFare?.perPaxAmount ?? 0).toInt();
  double get calculatedBaseFare => getBaseFare();
  double get calculatedTotalFare => getTotalFare();
  double get calculatedFareWithoutCCF => getFareWithoutCF();
  double get calculatedTax => getTaxes();

  Map<String, double> getPriceSummary() {
    final Map<String, double> taxesMap = {};
    passengerTypeQuantity?.forEach((element) {
      element.taxes?.tax?.forEach((taxElement) {
        final taxKey = taxElement.taxCode ?? '';
        final double? taxAmount = taxElement.amount;
        if (taxAmount != null && taxKey.isNotEmpty) {
          final double newTaxAmount = taxesMap[taxKey] ?? 0;
          taxesMap.addAll({taxKey: taxAmount + newTaxAmount});
        }
      });
    });
    return taxesMap;
  }

  double getBaseFare() {
    double totalBaseFare = 0;
    passengerTypeQuantity?.forEach((element) {
      totalBaseFare =
          totalBaseFare + (element.baseFare?.amount ?? 0).toDouble();
      /*  element.baseFare?.tax?.forEach((taxElement) {
        final taxKey = taxElement.taxCode ?? '';
        final double? taxAmount = taxElement.amount;
        if (taxAmount != null && taxKey.isNotEmpty) {
          final double newTaxAmount = taxesMap[taxKey] ?? 0;
          taxesMap.addAll({taxKey: taxAmount + newTaxAmount});
        }
      });*/
    });
    return totalBaseFare;
  }

  double getTotalFare() {
    double totalFare = 0;
    passengerTypeQuantity?.forEach((element) {
      totalFare = totalFare + (element.totalFare?.amount ?? 0).toDouble();
    });
    return totalFare;
  }

  double getFareWithoutCF() {
    double totalFareWithoutCCF = 0;
    passengerTypeQuantity?.forEach((element) {
      totalFareWithoutCCF = totalFareWithoutCCF +
          (element.baseFare?.amount ?? 0).toDouble() +
          (element.taxes?.amount ?? 0).toDouble();
    });
    return totalFareWithoutCCF;
  }

  double getTaxes() {
    double totalTaxes = 0;
    passengerTypeQuantity?.forEach((element) {
      totalTaxes = totalTaxes + (element.taxes?.amount ?? 0).toDouble();
    });
    return totalTaxes;
  }

  AirItineraryPricingInfo copyWith({
    Total? totalFare,
    Total? totalBaseFare,
    Total? totalTax,
    Total? totalFee,
  }) =>
      AirItineraryPricingInfo(
        totalFare: totalFare ?? this.totalFare,
        totalBaseFare: totalBaseFare ?? this.totalBaseFare,
        totalTax: totalTax ?? this.totalTax,
        totalFee: totalFee ?? this.totalFee,
      );

  factory AirItineraryPricingInfo.fromJson(Map<String, dynamic> json) =>
      AirItineraryPricingInfo(
        totalFare: json['totalFare'] == null
            ? null
            : Total.fromJson(json['totalFare']),
        totalBaseFare: json['totalBaseFare'] == null
            ? null
            : Total.fromJson(json['totalBaseFare']),
        totalTax:
            json['totalTax'] == null ? null : Total.fromJson(json['totalTax']),
        totalFee:
            json['totalFee'] == null ? null : Total.fromJson(json['totalFee']),
        passengerTypeQuantity: json['passengerTypeQuantity'] == null
            ? null
            : List<PassengerTypeQuantity>.from(
                (json['passengerTypeQuantity'] as List).map(
                  (x) => PassengerTypeQuantity.fromJson(x),
                ),
              ),
        discounts: json['discounts'] == null
            ? null
            : Total.fromJson(json['discounts']),
        remark: json['remark'],
      );
}
