/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this model class is used for pricing breakup for flight booking response
class PricingBreakup {
  PricingBreakup({
    String? pricingId,
    double? baseFare,
    double? couponCashback,
    double? totalTaxes,
    double? convenienceFees,
    String? paxStatus,
    double? ccfFee,
    double? discountedCCFFee,
  }) {
    _pricingId = pricingId;
    _baseFare = baseFare;
    _couponCashback = couponCashback;
    _totalTaxes = totalTaxes;
    _convenienceFees = convenienceFees;
    _paxStatus = paxStatus;
    _ccfFee = ccfFee;
    _discountedCCFFee = discountedCCFFee;
  }
  PricingBreakup.fromJson(Map<String, dynamic> json) {
    _pricingId = json['pricingId'];
    _baseFare = json['baseFare'] != null
        ? double.parse(json['baseFare'].toString())
        : 0;
    _couponCashback = json['couponCashback'] != null
        ? double.parse(json['couponCashback'].toString())
        : 0;
    _totalTaxes = json['totalTaxes'] != null
        ? double.parse(json['totalTaxes'].toString())
        : 0;
    _convenienceFees = json['convenienceFees'] != null
        ? double.parse(json['convenienceFees'].toString())
        : 0;
    _paxStatus = json['paxStatus'];
    _ccfFee =
        json['ccfFee'] != null ? double.parse(json['ccfFee'].toString()) : 0;
    _discountedCCFFee = json['discountedCCFFee'] != null
        ? double.parse(json['discountedCCFFee'].toString())
        : 0;
  }
  String? _pricingId;
  double? _baseFare;
  double? _couponCashback;
  double? _totalTaxes;
  double? _convenienceFees;
  String? _paxStatus;
  double? _ccfFee;
  double? _discountedCCFFee;

  String? get pricingId => _pricingId;
  double? get baseFare => _baseFare;
  double? get couponCashback => _couponCashback;
  double? get totalTaxes => _totalTaxes;
  double? get convenienceFees => _convenienceFees;
  String? get paxStatus => _paxStatus;
  double? get ccfFee => _ccfFee;
  double? get discountedCCFFee => _discountedCCFFee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pricingId'] = _pricingId;
    map['baseFare'] = _baseFare;
    map['couponCashback'] = _couponCashback;
    map['totalTaxes'] = _totalTaxes;
    map['convenienceFees'] = _convenienceFees;
    map['paxStatus'] = _paxStatus;
    map['ccfFee'] = _ccfFee;
    map['discountedCCFFee'] = _discountedCCFFee;
    return map;
  }
}
