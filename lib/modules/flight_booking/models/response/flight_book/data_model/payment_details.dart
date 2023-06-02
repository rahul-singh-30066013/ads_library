/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/booking_payment_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/cancelled_refund_breakup.dart';

//this  model class is used for PaymentDetails related to flight booking
class PaymentDetails {
  PaymentDetails({
    String? currency,
    String? couponCode,
    BookingPaymentBreakup? bookingPaymentBreakup,
    List<PaymentModes?>? paymentModes,
    List<CancelledRefundBreakup?>? refundBreakup,
    num? travelInsuranceFare,
    RefundBreakupDetails? refundBreakupDetails,
    num? zeroCancellationFee,
  }) {
    _currency = currency;
    _couponCode = couponCode;
    _bookingPaymentBreakup = bookingPaymentBreakup;
    _paymentModes = paymentModes;
    _refundBreakup = refundBreakup;
    _travelInsuranceFare = travelInsuranceFare;
    _refundBreakupDetails = refundBreakupDetails;
    _zeroCancellationFee = zeroCancellationFee;
  }

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    _currency = json['currency'];
    _couponCode = json['couponCode'];
    if (json['paymentModes'] != null) {
      final modes = <PaymentModes>[];
      for (final object in json['paymentModes'] as List) {
        final PaymentModes paymentMode = PaymentModes.fromJson(object);
        modes.add(paymentMode);
      }
      _paymentModes = modes;
    }
    _bookingPaymentBreakup = json['bookingPaymentBreakup'] != null
        ? BookingPaymentBreakup.fromJson(json['bookingPaymentBreakup'])
        : null;
    if (json['refundBreakup'] != null) {
      final modes = <CancelledRefundBreakup>[];
      for (final object in json['refundBreakup'] as List) {
        final CancelledRefundBreakup refundBreakup =
            CancelledRefundBreakup.fromJson(object);
        modes.add(refundBreakup);
      }
      _refundBreakup = modes;
    }
    _travelInsuranceFare = json['travelInsuranceFare'];
    _refundBreakupDetails = json['refundBreakupDetails'] != null
        ? RefundBreakupDetails.fromJson(json['refundBreakupDetails'])
        : null;
    _zeroCancellationFee = json['zeroCancellationFee'];
  }
  String? _currency;
  String? _couponCode;
  List<PaymentModes?>? _paymentModes;
  BookingPaymentBreakup? _bookingPaymentBreakup;
  List<CancelledRefundBreakup?>? _refundBreakup;
  num? _travelInsuranceFare;
  RefundBreakupDetails? _refundBreakupDetails;
  num? _zeroCancellationFee;

  String? get currency => _currency;
  String? get couponCode => _couponCode;
  List<PaymentModes?>? get paymentModes => _paymentModes;
  BookingPaymentBreakup? get bookingPaymentBreakup => _bookingPaymentBreakup;
  List<CancelledRefundBreakup?>? get refundBreakup => _refundBreakup;
  num? get travelInsuranceFare => _travelInsuranceFare;
  num? get zeroCancellationFee => _zeroCancellationFee;
  double? get loyaltyApplied => _getLoyaltyApplied();
  double? get promoApplied => _getPromoApplied();
  double? get bankPaidAmount => _getBankPaidAmount();
  double? get loyaltyRefunded => _getLoyaltyRefunded();
  double? get promoRefunded => _getPromoRefunded();
  RefundBreakupDetails? get refundBreakupDetails => _refundBreakupDetails;
  double get cancellationAirfareCharges => _getAirfareCancellationCharges();
  double get partnerCancellationCharges => _getPartnerCancellationCharges();
  double get getGrossChargesForCancelledPax =>
      _getGrossChargesForCancelledPax();

  double _getGrossChargesForCancelledPax() {
    double total = 0;
    refundBreakup?.forEach((element) {
      total = total + (element?.refundComponents?.grossAmount ?? 0).toDouble();
    });
    return total;
  }

  double _getAirfareCancellationCharges() {
    double total = 0;
    refundBreakup?.forEach((element) {
      total =
          total + (element?.refundComponents?.airlineCharges ?? 0).toDouble();
    });
    return total;
  }

  double _getPartnerCancellationCharges() {
    double total = 0;
    refundBreakup?.forEach((element) {
      total =
          total + (element?.refundComponents?.partnerCharges ?? 0).toDouble();
    });
    return total;
  }

  List<String> getPaymentModes() {
    final payments = paymentModes ?? [];
    final paymentModeCodes = <String>[];
    for (final object in payments) {
      if ((object?.amount ?? 0) > 0) {
        paymentModeCodes.add(object?.transactionCode ?? '');
      }
    }
    return paymentModeCodes;
  }

  List<String> getOrderedPaymentModes() {
    final payments = paymentModes ?? [];
    final paymentModeCodes = <String>[];
    for (final object in payments) {
      if ((object?.amount ?? 0) >= 1 &&
          (object?.transactionType ?? '').toLowerCase() == 'order' &&
          (object?.transactionCode ?? '').toLowerCase() != 'loyalty' &&
          (object?.transactionCode ?? '').toLowerCase() != 'promo') {
        paymentModeCodes.add(object?.transactionCode ?? '');
      }
    }
    return paymentModeCodes;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = _currency;
    map['couponCode'] = _couponCode;
    map['paymentModes'] = _paymentModes;
    if (_bookingPaymentBreakup != null) {
      map['bookingPaymentBreakup'] = _bookingPaymentBreakup?.toJson();
    }
    map['refundBreakup'] = _refundBreakup;
    return map;
  }

  double _getLoyaltyApplied() {
    double totalLoyaltyApplied = 0;
    paymentModes?.forEach((element) {
      if (element?.transactionCode == 'Loyalty' &&
          element?.transactionType?.toLowerCase() == 'order') {
        totalLoyaltyApplied =
            totalLoyaltyApplied + (element?.amount ?? 0).toDouble();
      }
    });
    return totalLoyaltyApplied;
  }

  double _getLoyaltyRefunded() {
    double totalLoyaltyRefunded = 0;
    paymentModes?.forEach((element) {
      if (element?.transactionCode == 'Loyalty' &&
          element?.transactionType?.toLowerCase() == 'refund') {
        totalLoyaltyRefunded =
            totalLoyaltyRefunded + (element?.amount ?? 0).toDouble();
      }
    });
    return totalLoyaltyRefunded;
  }

  double _getPromoApplied() {
    double totalPromoApplied = 0;
    paymentModes?.forEach((element) {
      if (element?.transactionCode == 'Promo' &&
          element?.transactionType?.toLowerCase() == 'order') {
        totalPromoApplied =
            totalPromoApplied + (element?.amount ?? 0).toDouble();
      }
    });
    return totalPromoApplied;
  }

  double _getPromoRefunded() {
    double totalPromoRefunded = 0;
    paymentModes?.forEach((element) {
      if (element?.transactionCode == 'Promo' &&
          element?.transactionType?.toLowerCase() == 'refund') {
        totalPromoRefunded =
            totalPromoRefunded + (element?.amount ?? 0).toDouble();
      }
    });
    return totalPromoRefunded;
  }

  double _getBankPaidAmount() {
    final payments = paymentModes ?? [];
    double totalPaid = 0;
    for (final object in payments) {
      if ((object?.amount ?? 0) >= 1 &&
          (object?.transactionType ?? '').toLowerCase() == 'order' &&
          (object?.transactionCode ?? '').toLowerCase() != 'loyalty' &&
          (object?.transactionCode ?? '').toLowerCase() != 'promo') {
        totalPaid = totalPaid + (object?.amount ?? 0).toDouble();
      }
    }
    return totalPaid;
  }
}

// to parse refund breakup details
class RefundBreakupDetails {
  RefundBreakupDetails({
    double? cancelationFee,
    double? convenienceFee,
    double? insuranceAmt,
    double? bank,
    double? loyalty,
    double? promo,
    double? waiveOff,
  }) {
    _cancelationFee = cancelationFee;
    _convenienceFee = convenienceFee;
    _bank = bank;
    _loyalty = loyalty;
    _promo = promo;
    _waiveOff = waiveOff;
    _insuranceAmt = insuranceAmt;
  }

  RefundBreakupDetails.fromJson(Map<String, dynamic> json) {
    _cancelationFee = json['cancelationFee'] != null
        ? double.parse(json['cancelationFee'].toString())
        : 0;
    _convenienceFee = json['convenienceFee'] != null
        ? double.parse(json['convenienceFee'].toString())
        : 0;
    _bank = json['bank'] != null ? double.parse(json['bank'].toString()) : 0;
    _loyalty =
        json['loyalty'] != null ? double.parse(json['loyalty'].toString()) : 0;
    _promo = json['promo'] != null ? double.parse(json['promo'].toString()) : 0;
    _waiveOff = json['waiveOff'] != null
        ? double.parse(json['waiveOff'].toString())
        : 0;
    _insuranceAmt = json['insuranceAmt'] != null
        ? double.parse(json['insuranceAmt'].toString())
        : 0;
  }
  double? _cancelationFee;
  double? _convenienceFee;
  double? _bank;
  double? _loyalty;
  double? _promo;
  double? _waiveOff;
  double? _insuranceAmt;

  double? get cancelationFee => _cancelationFee;
  double? get convenienceFee => _convenienceFee;
  double? get bank => _bank;
  double? get loyalty => _loyalty;
  double? get promo => _promo;
  double? get waiveOff => _waiveOff;
  double? get insuranceAmt => _insuranceAmt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cancelationFee'] = _cancelationFee;
    map['convenienceFee'] = _convenienceFee;
    map['bank'] = _bank;
    map['loyalty'] = _loyalty;
    map['promo'] = _promo;
    map['waiveOff'] = _waiveOff;
    map['insuranceAmt'] = _insuranceAmt;
    return map;
  }
}
