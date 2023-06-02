/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/refund_breakup.dart';

/// this model class is used to receive Refund fare Breakup
class FlightFareInfoResponseModel {
  FlightFareInfoResponseModel({
    String? currency,
    RefundBreakup? refundBreakup,
    String? refundNotice,
    String? paymentMode,
    double? totalAmount,
    bool? isZeroCancellation,
    bool? isInfantCancelOnly,
  }) {
    _currency = currency;
    _refundBreakup = refundBreakup;
    _refundNotice = refundNotice;
    _totalAmount = totalAmount;
    _paymentMode = paymentMode;
    _isZeroCancellation = isZeroCancellation;
    _isInfantCancelOnly = isInfantCancelOnly;
  }

  FlightFareInfoResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      _currency = json['currency'] ?? '';
      _refundBreakup = json['refundBreakup'] != null
          ? RefundBreakup.fromJson(json['refundBreakup'])
          : null;
      _refundNotice = json['refundNotice'];
      _totalAmount = json['totalAmount'] != null
          ? double.parse(json['totalAmount'].toString())
          : 0;
      _paymentMode = json['paymentMode'];
      _isZeroCancellation = json['isZeroCancellation'];
      _isInfantCancelOnly = json['isInfantCancelOnly'];
    }
  }

  String? _currency;
  RefundBreakup? _refundBreakup;
  String? _refundNotice;
  double? _totalAmount;
  String? _paymentMode;
  bool? _isZeroCancellation;
  bool? _isInfantCancelOnly;

  String? get currency => _currency;

  RefundBreakup? get refundBreakup => _refundBreakup;

  String? get refundNotice => _refundNotice;

  double? get totalAmount => _totalAmount;

  String? get paymentMode => _paymentMode;

  bool? get isZeroCancellation => _isZeroCancellation;

  bool? get isInfantCancelOnly => _isInfantCancelOnly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = _currency;
    if (_refundBreakup != null) {
      map['refundBreakup'] = _refundBreakup?.toJson();
    }
    map['refundNotice'] = _refundNotice;
    map['totalAmount'] = _totalAmount;
    map['paymentMode'] = _paymentMode;
    map['isZeroCancellation'] = _isZeroCancellation;
    map['isInfantCancelOnly'] = _isInfantCancelOnly;
    return map;
  }
}
