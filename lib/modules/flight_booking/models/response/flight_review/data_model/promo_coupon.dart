/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

/// this class is used to receive pricing summary object for view itinerary
@immutable
class PromoCoupon {
  final String? promoCode;
  final double? offerValue;
  final String? promoValueType;
  final String? appliedMsg;
  final String? appliedMsgShort;

  const PromoCoupon({
    this.promoCode,
    this.offerValue,
    this.promoValueType,
    this.appliedMsg,
    this.appliedMsgShort,
  });

  factory PromoCoupon.fromJson(Map<String, dynamic> json) {
    return PromoCoupon(
      promoCode: json['promoCode'] as String?,
      offerValue: json['offerValue'] != null
          ? double.parse(json['offerValue'].toString())
          : 0,
      promoValueType: json['promoValueType'] as String?,
      appliedMsg: json['appliedMsg'] as String?,
      appliedMsgShort: json['appliedMsgShort'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (promoCode != null) {
      map['promoCode'] = promoCode;
    }
    if (offerValue != null) {
      map['offerValue'] = offerValue;
    }
    if (promoValueType != null) {
      map['markup'] = promoValueType;
    }
    if (appliedMsg != null) {
      map['appliedMsg'] = appliedMsg;
    }
    if (appliedMsgShort != null) {
      map['appliedMsgShort'] = appliedMsgShort;
    }
    return map;
  }

  PromoCoupon copyWith({
    String? promoCode,
    double? offerValue,
    String? promoValueType,
    String? appliedMsg,
    String? appliedMsgShort,
  }) {
    return PromoCoupon(
      promoCode: promoCode ?? this.promoCode,
      offerValue: offerValue ?? this.offerValue,
      promoValueType: promoValueType ?? this.promoValueType,
      appliedMsg: appliedMsg ?? this.appliedMsg,
      appliedMsgShort: appliedMsgShort ?? this.appliedMsgShort,
    );
  }
}
