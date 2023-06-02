/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

/// this class is used to receive pricing summary object for view itinerary
@immutable
class PricingSummary {
  final num? baseFare;
  final num? discount;
  final num? markup;
  final num? taxes;
  final num? totalFare;
  final num? convenienceFee;
  final num? ccfFee;
  final num? discountedCCFFee;
  final num? travelInsuranceFare;
  final num? zeroCancellationFee;
  final num? discountedZeroCancelFee;

  const PricingSummary({
    this.baseFare,
    this.discount,
    this.markup,
    this.taxes,
    this.totalFare,
    this.convenienceFee,
    this.ccfFee,
    this.discountedCCFFee,
    this.travelInsuranceFare,
    this.zeroCancellationFee,
    this.discountedZeroCancelFee,
  });

  @override
  String toString() {
    return 'PricingSummary(baseFare: $baseFare, discount: $discount, markup: $markup, taxes: $taxes, totalFare: $totalFare, convenienceFee: $convenienceFee, ccfFee: $ccfFee, discountedCCFFee: $discountedCCFFee,travelInsuranceFare: $travelInsuranceFare,zeroCancellationFee: $zeroCancellationFee,discountedZeroCancelFee: $discountedZeroCancelFee)';
  }

  factory PricingSummary.fromJson(Map<String, dynamic> json) {
    return PricingSummary(
      baseFare: json['baseFare'] as num?,
      discount: json['discount'] as num?,
      markup: json['markup'] as num?,
      taxes: json['taxes'] as num?,
      totalFare: json['totalFare'] as num?,
      convenienceFee: json['convenienceFee'] as num?,
      ccfFee: json['ccfFee'] as num?,
      discountedCCFFee: json['discountedCCFFee'] as num?,
      travelInsuranceFare: json['travelInsuranceFare'] as num?,
      zeroCancellationFee: json['zeroCancellationFee'] as num?,
      discountedZeroCancelFee: json['discountedZeroCancelFee'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (baseFare != null) {
      map['baseFare'] = baseFare;
    }
    if (discount != null) {
      map['discount'] = discount;
    }
    if (markup != null) {
      map['markup'] = markup;
    }
    if (taxes != null) {
      map['taxes'] = taxes;
    }
    if (totalFare != null) {
      map['totalFare'] = totalFare;
    }
    if (convenienceFee != null) {
      map['convenienceFee'] = convenienceFee;
    }
    if (ccfFee != null) {
      map['ccfFee'] = ccfFee;
    }
    if (discountedCCFFee != null) {
      map['discountedCCFFee'] = discountedCCFFee;
    }
    if (travelInsuranceFare != null) {
      map['travelInsuranceFare'] = travelInsuranceFare;
    }
    if (zeroCancellationFee != null) {
      map['zeroCancellationFee'] = zeroCancellationFee;
    }
    if (discountedZeroCancelFee != null) {
      map['discountedZeroCancelFee'] = discountedZeroCancelFee;
    }
    return map;
  }

  PricingSummary copyWith({
    num? baseFare,
    num? discount,
    num? markup,
    num? taxes,
    num? totalFare,
    num? convenienceFee,
    num? ccfFee,
    num? discountedCCFFee,
    num? travelInsuranceFare,
    num? zeroCancellationFee,
    num? discountedZeroCancelFee,
  }) {
    return PricingSummary(
      baseFare: baseFare ?? this.baseFare,
      discount: discount ?? this.discount,
      markup: markup ?? this.markup,
      taxes: taxes ?? this.taxes,
      totalFare: totalFare ?? this.totalFare,
      convenienceFee: convenienceFee ?? this.convenienceFee,
      ccfFee: ccfFee ?? this.ccfFee,
      discountedCCFFee: discountedCCFFee ?? this.discountedCCFFee,
      travelInsuranceFare: travelInsuranceFare ?? this.travelInsuranceFare,
      zeroCancellationFee: zeroCancellationFee ?? this.zeroCancellationFee,
      discountedZeroCancelFee:
          discountedZeroCancelFee ?? this.discountedZeroCancelFee,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is PricingSummary &&
        other.baseFare == baseFare &&
        other.discount == discount &&
        other.markup == markup &&
        other.taxes == taxes &&
        other.totalFare == totalFare &&
        other.convenienceFee == convenienceFee &&
        other.ccfFee == ccfFee &&
        other.discountedCCFFee == discountedCCFFee &&
        other.travelInsuranceFare == travelInsuranceFare &&
        other.zeroCancellationFee == zeroCancellationFee &&
        other.discountedZeroCancelFee == discountedZeroCancelFee;
  }

  @override
  int get hashCode =>
      baseFare.hashCode ^
      discount.hashCode ^
      markup.hashCode ^
      taxes.hashCode ^
      totalFare.hashCode ^
      convenienceFee.hashCode ^
      ccfFee.hashCode ^
      discountedCCFFee.hashCode ^
      travelInsuranceFare.hashCode ^
      zeroCancellationFee.hashCode ^
      discountedZeroCancelFee.hashCode;
}
