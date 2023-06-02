/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// this model class used to received refund price breakup- will receive data on cancel review screen
class RefundBreakup {
  RefundBreakup({
    double? grossAmount,
    double? paidAmount,
    double? netAmount,
    double? couponDiscount,
    double? airlineCharge,
    double? partnerFee,
    double? convenienceFe,
    double? insuranceAmt,
    double? serviceTax,
    double? amendFee,
    double? cleartripServiceTax,
    double? totalRefundAmount,
    double? zeroCancellationFee,
    RefundPaymentDetails? paymentDetails,
    RefundPaymentDetails? refundDetails,
  }) {
    _grossAmount = grossAmount;
    _paidAmount = paidAmount;
    _netAmount = netAmount;
    _couponDiscount = couponDiscount;
    _airlineCharge = airlineCharge;
    _partnerFee = partnerFee;
    _convenienceFe = convenienceFe;
    _serviceTax = serviceTax;
    _amendFee = amendFee;
    _cleartripServiceTax = cleartripServiceTax;
    _totalRefundAmount = totalRefundAmount;
    _insuranceAmt = insuranceAmt;
    _zeroCancellationFee = zeroCancellationFee;
    _paymentDetails = paymentDetails;
    _refundDetails = refundDetails;
  }

  double get totalBankPaid =>
      (_grossAmount ?? 0) +
      (_insuranceAmt ?? 0) +
      (_convenienceFe ?? 0) +
      (_zeroCancellationFee ?? 0);
  double get totalOffersAmount =>
      (_paymentDetails?.promo ?? 0) + (_paymentDetails?.loyalty ?? 0);
  double get totalPaid => totalBankPaid - totalOffersAmount;

  RefundBreakup.fromJson(Map<String, dynamic> json) {
    _grossAmount = json['grossAmount'] != null
        ? double.parse(json['grossAmount'].toString())
        : 0;
    _paidAmount = json['paidAmount'] != null
        ? double.parse(json['paidAmount'].toString())
        : 0;
    _netAmount = json['netAmount'] != null
        ? double.parse(json['netAmount'].toString())
        : 0;
    _couponDiscount = json['couponDiscount'] != null
        ? double.parse(json['couponDiscount'].toString())
        : 0;
    _airlineCharge = json['airlineCharge'] != null
        ? double.parse(json['airlineCharge'].toString())
        : 0;
    _partnerFee = json['partnerFee'] != null
        ? double.parse(json['partnerFee'].toString())
        : 0;
    _convenienceFe = json['convenienceFee'] != null
        ? double.parse(json['convenienceFee'].toString())
        : 0;
    _serviceTax = json['serviceTax'] != null
        ? double.parse(json['serviceTax'].toString())
        : 0;
    _amendFee = json['amendFee'] != null
        ? double.parse(json['amendFee'].toString())
        : 0;
    _cleartripServiceTax = json['cleartripService_tax'] != null
        ? double.parse(json['cleartripService_tax'].toString())
        : 0;
    _totalRefundAmount = json['totalRefundAmount'] != null
        ? double.parse(json['totalRefundAmount'].toString())
        : 0;
    _insuranceAmt = json['insuranceAmt'] != null
        ? double.parse(json['insuranceAmt'].toString())
        : 0;
    _zeroCancellationFee = json['zeroCancellationFee'] != null
        ? double.parse(json['zeroCancellationFee'].toString())
        : 0;
    _paymentDetails = json['paymentDetails'] != null
        ? RefundPaymentDetails.fromJson(json['paymentDetails'])
        : null;
    _refundDetails = json['refundDetails'] != null
        ? RefundPaymentDetails.fromJson(json['refundDetails'])
        : null;
  }
  double? _grossAmount;
  double? _paidAmount;
  double? _netAmount;
  double? _couponDiscount;
  double? _airlineCharge;
  double? _partnerFee;
  double? _convenienceFe;
  double? _serviceTax;
  double? _amendFee;
  double? _cleartripServiceTax;
  double? _totalRefundAmount;
  double? _insuranceAmt;
  double? _zeroCancellationFee;
  RefundPaymentDetails? _paymentDetails;
  RefundPaymentDetails? _refundDetails;

  double? get grossAmount => _grossAmount;
  double? get paidAmount => _paidAmount;
  double? get netAmount => _netAmount;
  double? get couponDiscount => _couponDiscount;
  double? get airlineCharge => _airlineCharge;
  double? get partnerFee => _partnerFee;
  double? get convenienceFe => _convenienceFe;
  double? get serviceTax => _serviceTax;
  double? get amendFee => _amendFee;
  double? get cleartripServiceTax => _cleartripServiceTax;
  double? get totalRefundAmount => _totalRefundAmount;
  double? get insuranceAmt => _insuranceAmt;
  double? get zeroCancellationFee => _zeroCancellationFee;
  RefundPaymentDetails? get paymentDetails => _paymentDetails;
  RefundPaymentDetails? get refundDetails => _refundDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['grossAmount'] = _grossAmount;
    map['paidAmount'] = _paidAmount;
    map['netAmount'] = _netAmount;
    map['couponDiscount'] = _couponDiscount;
    map['airlineCharge'] = _airlineCharge;
    map['partnerFee'] = _partnerFee;
    map['convenienceFee'] = _convenienceFe;
    map['serviceTax'] = _serviceTax;
    map['amendFee'] = _amendFee;
    map['cleartripService_tax'] = _cleartripServiceTax;
    map['totalRefundAmount'] = _totalRefundAmount;
    map['insuranceAmt'] = _insuranceAmt;
    map['zeroCancellationFee'] = _zeroCancellationFee;
    if (_paymentDetails != null) {
      map['paymentDetails'] = _paymentDetails?.toJson();
    }
    if (_refundDetails != null) {
      map['refundDetails'] = _refundDetails?.toJson();
    }
    return map;
  }
}

class RefundPaymentDetails {
  RefundPaymentDetails({
    double? bank,
    double? loyalty,
    double? promo,
    double? waiveOff,
  }) {
    _bank = bank;
    _loyalty = loyalty;
    _promo = promo;
    _waiveOff = waiveOff;
  }

  RefundPaymentDetails.fromJson(Map<String, dynamic> json) {
    _bank = json['bank'] != null ? double.parse(json['bank'].toString()) : 0;
    _loyalty =
        json['loyalty'] != null ? double.parse(json['loyalty'].toString()) : 0;
    _promo = json['promo'] != null ? double.parse(json['promo'].toString()) : 0;
    _waiveOff = json['waiveOff'] != null
        ? double.parse(json['waiveOff'].toString())
        : 0;
  }
  double? _bank;
  double? _loyalty;
  double? _promo;
  double? _waiveOff;

  double? get bank => _bank;
  double? get loyalty => _loyalty;
  double? get promo => _promo;
  double? get waiveOff => _waiveOff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank'] = _bank;
    map['loyalty'] = _loyalty;
    map['promo'] = _promo;
    map['waiveOff'] = _waiveOff;
    return map;
  }
}
