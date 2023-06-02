/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/pricing_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/loyalty_points.dart';

///this class will used for booking payment breakup, will created once booked itinerary
class BookingPaymentBreakup {
  BookingPaymentBreakup({
    num? total,
    String? partnerPaymentId,
    List<PricingBreakup>? pricingBreakup,
  }) {
    _total = total;
    _partnerPaymentId = partnerPaymentId;
    _pricingBreakup = pricingBreakup;
  }

  BookingPaymentBreakup.fromJson(Map<String, dynamic> json) {
    _total = json['total'] as num?;
    _partnerPaymentId = json['partnerPaymentId'];
    if (json['pricingBreakup'] != null) {
      _pricingBreakup = [];
      for (final object in json['pricingBreakup'] as List) {
        final PricingBreakup pricingBreakup = PricingBreakup.fromJson(object);
        _pricingBreakup?.add(pricingBreakup);
      }
    }
  }
  num? _total;
  String? _partnerPaymentId;
  List<PricingBreakup>? _pricingBreakup;

  double? get total => (_total ?? 0).toDouble();
  String? get partnerPaymentId => _partnerPaymentId;
  List<PricingBreakup>? get pricingBreakup => _pricingBreakup;
  double get calculatedAirfareCharges => _getAirfareCharges();
  double get calculateTaxFees => _getTaxesFee();
  double get calculateCCFFees => _getCCFFee();
  double get calculateDiscountedCCFFees => _getDiscountedCCFFee();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['partnerPaymentId'] = _partnerPaymentId;
    if (_pricingBreakup != null) {
      map['pricingBreakup'] = _pricingBreakup?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  double _getAirfareCharges() {
    double totalBaseFare = 0;
    pricingBreakup?.forEach((element) {
      totalBaseFare = totalBaseFare + (element.baseFare ?? 0).toDouble();
    });
    return totalBaseFare;
  }

  double _getTaxesFee() {
    double totalTaxFee = 0;
    pricingBreakup?.forEach((element) {
      totalTaxFee = totalTaxFee + (element.totalTaxes ?? 0).toDouble();
    });
    return totalTaxFee;
  }

  double _getCCFFee() {
    double ccfFee = 0;
    pricingBreakup?.forEach((element) {
      ccfFee = ccfFee + (element.ccfFee ?? 0).toDouble();
    });
    return ccfFee;
  }

  double _getDiscountedCCFFee() {
    double disCcfFee = 0;
    pricingBreakup?.forEach((element) {
      disCcfFee = disCcfFee + (element.discountedCCFFee ?? 0).toDouble();
    });
    return disCcfFee;
  }
}

class PaymentModes {
  PaymentModes({
    num? amount,
    String? transactionMode,
    String? transactionCode,
    String? transactionType,
    String? status,
    LoyaltyPoints? loyaltyPoints,
  }) {
    _amount = amount;
    _transactionMode = transactionMode;
    _transactionCode = transactionCode;
    _transactionType = transactionType;
    _status = status;
    _loyaltyPoints = loyaltyPoints;
  }

  PaymentModes.fromJson(Map<String, dynamic> json) {
    _amount = json['amount'];
    _transactionMode = json['transactionMode'];
    _transactionCode = json['transactionCode'];
    _transactionType = json['transactionType'];
    _status = json['status'];
    _loyaltyPoints = json['loyaltyPoints'] != null
        ? LoyaltyPoints.fromJson(json['loyaltyPoints'])
        : null;
  }

  num? _amount;
  String? _transactionMode;
  String? _transactionCode;
  String? _transactionType;
  String? _status;
  LoyaltyPoints? _loyaltyPoints;

  num? get amount => _amount;
  String? get transactionMode => _transactionMode;
  String? get transactionCode => _transactionCode;
  String? get status => _status;
  LoyaltyPoints? get loyaltyPoints => _loyaltyPoints;
  String? get transactionType => _transactionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['transactionMode'] = _transactionMode;
    map['transactionCode'] = _transactionCode;
    map['transactionType'] = _transactionType;
    map['status'] = _status;
    if (_loyaltyPoints != null) {
      map['loyaltyPoints'] = _loyaltyPoints?.toJson();
    }
    return map;
  }
}
