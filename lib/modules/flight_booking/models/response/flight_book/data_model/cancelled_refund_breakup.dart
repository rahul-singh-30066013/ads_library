/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

///this class will used for booking refund breakup
class CancelledRefundBreakup {
  CancelledRefundBreakup({
    num? total,
    int? refundDate,
    num? canceTtxnId,
    RefundComponents? refundComponents,
  }) {
    _total = total;
    _refundDate = refundDate;
    _canceTtxnId = canceTtxnId;
    _refundComponents = refundComponents;
  }

  CancelledRefundBreakup.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _refundDate = json['refundDate'];
    _canceTtxnId = json['canceTtxnId'];
    _refundComponents = json['refundComponents'] != null
        ? RefundComponents.fromJson(json['refundComponents'])
        : null;
  }

  num? _total;
  int? _refundDate;
  num? _canceTtxnId;
  RefundComponents? _refundComponents;

  num? get total => _total;
  int? get refundDate => _refundDate;
  num? get canceTtxnId => _canceTtxnId;
  RefundComponents? get refundComponents => _refundComponents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['refundDate'] = _refundDate;
    map['canceTtxnId'] = _canceTtxnId;
    if (_refundComponents != null) {
      map['refundComponents'] = _refundComponents?.toJson();
    }
    return map;
  }
}

//
class RefundComponents {
  RefundComponents({
    num? airlineCharges,
    num? convenienceFees,
    num? couponCashback,
    num? grossAmount,
    num? otherCharges,
    num? partnerCharges,
  }) {
    _airlineCharges = airlineCharges;
    _convenienceFees = convenienceFees;
    _couponCashback = couponCashback;
    _grossAmount = grossAmount;
    _otherCharges = otherCharges;
    _partnerCharges = partnerCharges;
  }

  RefundComponents.fromJson(Map<String, dynamic> json) {
    _airlineCharges = json['airlineCharges'];
    _convenienceFees = json['convenienceFees'];
    _couponCashback = json['couponCashback'];
    _grossAmount = json['grossAmount'];
    _otherCharges = json['otherCharges'];
    _partnerCharges = json['partnerCharges'];
  }

  num? _airlineCharges;
  num? _convenienceFees;
  num? _couponCashback;
  num? _grossAmount;
  num? _otherCharges;
  num? _partnerCharges;

  num? get airlineCharges => _airlineCharges;
  num? get convenienceFees => _convenienceFees;
  num? get couponCashback => _couponCashback;
  num? get grossAmount => _grossAmount;
  num? get otherCharges => _otherCharges;
  num? get partnerCharges => _partnerCharges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['airlineCharges'] = _airlineCharges;
    map['convenienceFees'] = _convenienceFees;
    map['couponCashback'] = _couponCashback;
    map['grossAmount'] = _grossAmount;
    map['otherCharges'] = _otherCharges;
    map['partnerCharges'] = _partnerCharges;
    return map;
  }
}
