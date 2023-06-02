/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/payment_info.dart';

//this model class is used for PaymentModes, that will reference from flight booking
class PaymentModes {
  PaymentModes({
    String? type,
    double? amount,
    List<PaymentInfo>? paymentInfo,
  }) {
    _type = type;
    _amount = amount;
    _paymentInfo = paymentInfo;
  }

  PaymentModes.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _amount = json['amount'];
    if (json['paymentInfo'] != null) {
      _paymentInfo = [];
      for (final object in json['paymentInfo'] as List) {
        final PaymentInfo paymentInfo = PaymentInfo.fromJson(object);
        _paymentInfo?.add(paymentInfo);
      }
    }
  }
  String? _type;
  double? _amount;
  List<PaymentInfo>? _paymentInfo;

  String? get type => _type;
  double? get amount => _amount;
  List<PaymentInfo>? get paymentInfo => _paymentInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['amount'] = _amount;
    if (_paymentInfo != null) {
      map['paymentInfo'] = _paymentInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
