/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

/// this class is used to receive pricing summary object for view itinerary
@immutable
class Insurance {
  final bool? insured;
  final num? netAmt;
  final num? baseAmt;
  final num? discountAmt;
  final num? perPaxAmt;
  final num? perPaxDisAmt;
  // final String? quotationDetails;
  // final String? paymentDetails;

  const Insurance({
    this.insured,
    this.netAmt,
    this.baseAmt,
    this.discountAmt,
    this.perPaxAmt,
    this.perPaxDisAmt,
    // this.quotationDetails,
    // this.paymentDetails,
  });

  @override
  String toString() {
    return 'InsuranceSummary(insured: $insured, totalAmt: $netAmt, baseAmt: $baseAmt, discountAmt: $discountAmt, perPaxAmt: $perPaxAmt, perPaxDisAmt: $perPaxDisAmt,)';
  }

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
      insured: json['insured'] as bool?,
      netAmt: json['netAmt'] as num?,
      baseAmt: json['baseAmt'] as num?,
      discountAmt: json['discountAmt'] as num?,
      perPaxAmt: json['perPaxAmt'] as num?,
      perPaxDisAmt: json['perPaxDisAmt'] as num?,
      // quotationDetails: json['quotationDetails'] as String?,
      // paymentDetails: json['paymentDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (insured != null) {
      map['insured'] = insured;
    }
    if (netAmt != null) {
      map['netAmt'] = netAmt;
    }
    if (baseAmt != null) {
      map['baseAmt'] = baseAmt;
    }
    if (discountAmt != null) {
      map['discountAmt'] = discountAmt;
    }
    if (perPaxAmt != null) {
      map['perPaxAmt'] = perPaxAmt;
    }
    if (perPaxDisAmt != null) {
      map['perPaxDisAmt'] = perPaxDisAmt;
    }
    // if (quotationDetails != null) {
    //   map['ccfFee'] = quotationDetails;
    // }
    // if (paymentDetails != null) {
    //   map['discountedCCFFee'] = paymentDetails;
    // }
    return map;
  }

  Insurance copyWith({
    bool? insured,
    num? netAmt,
    num? baseAmt,
    num? discountAmt,
    num? perPaxAmt,
    num? perPaxDisAmt,
    // String? quotationDetails,
    // String? paymentDetails,
  }) {
    return Insurance(
      insured: insured ?? this.insured,
      netAmt: netAmt ?? this.netAmt,
      baseAmt: baseAmt ?? this.baseAmt,
      discountAmt: discountAmt ?? this.discountAmt,
      perPaxAmt: perPaxAmt ?? this.perPaxAmt,
      perPaxDisAmt: perPaxDisAmt ?? this.perPaxDisAmt,
      // quotationDetails: quotationDetails ?? this.quotationDetails,
      // paymentDetails: paymentDetails ?? this.paymentDetails,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is Insurance &&
        other.insured == insured &&
        other.netAmt == netAmt &&
        other.baseAmt == baseAmt &&
        other.discountAmt == discountAmt &&
        other.perPaxAmt == perPaxAmt &&
        other.perPaxDisAmt == perPaxDisAmt ;
        // other.quotationDetails == quotationDetails &&
        // other.paymentDetails == paymentDetails;
  }

  @override
  int get hashCode =>
      insured.hashCode ^
      netAmt.hashCode ^
      baseAmt.hashCode ^
      discountAmt.hashCode ^
      perPaxAmt.hashCode ^
      perPaxDisAmt.hashCode ;
      // quotationDetails.hashCode ^
      // paymentDetails.hashCode;
}
