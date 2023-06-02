/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class ConfirmPaymentResponse {
  final String? orderStatus;
  final num? amount;
  final String? referenceId;
  final String? orderId;
  final String? paymentId;
  final String? bookingId;
  final String? loyaltyReferenceId;
  final num? loyaltyAmount;

  const ConfirmPaymentResponse({
    this.orderStatus,
    this.amount,
    this.referenceId,
    this.orderId,
    this.paymentId,
    this.bookingId,
    this.loyaltyReferenceId,
    this.loyaltyAmount,
  });

  @override
  String toString() {
    return 'ConfirmPaymentResponse(orderStatus: $orderStatus, amount: $amount, referenceId: $referenceId, orderId: $orderId, paymentId: $paymentId)';
  }

  factory ConfirmPaymentResponse.fromJson(Map<String, dynamic> json) {
    return ConfirmPaymentResponse(
      orderStatus: json['orderStatus'] as String?,
      amount: json['amount'] as num?,
      referenceId: json['referenceId'] as String?,
      orderId: json['orderId'] as String?,
      paymentId: json['paymentId'] as String?,
      bookingId: json['bookingId'] as String?,
      loyaltyAmount: json['loyaltyAmount'] as num?,
      loyaltyReferenceId: json['loyaltyReferenceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'orderStatus': orderStatus,
        'amount': amount,
        'referenceId': referenceId,
        'orderId': orderId,
        'paymentId': paymentId,
        'bookingId': bookingId,
        'loyaltyAmount': loyaltyAmount,
        'loyaltyReferenceId': loyaltyReferenceId,
      };
}
