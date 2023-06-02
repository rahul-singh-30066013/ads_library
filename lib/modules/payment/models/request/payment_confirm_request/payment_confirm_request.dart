/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class PaymentConfirmRequest {
  const PaymentConfirmRequest({
    this.orderId,
    this.paymentId,
    this.refrenceID,
    this.referenceId,
    this.loyaltyReferenceId,
  });

  final String? orderId;
  final String? paymentId;
  final String? referenceId;
  final String? refrenceID;
  final String? loyaltyReferenceId;

  factory PaymentConfirmRequest.fromJson(Map<String, dynamic> json) =>
      PaymentConfirmRequest(
        orderId: json['orderId'] as String?,
        paymentId: json['paymentId'] as String?,
        referenceId: json['referenceId'] as String?,
        refrenceID: json['referenceID'] as String?,
        loyaltyReferenceId: json['loyaltyReferenceId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'paymentId': paymentId,
        'referenceId': referenceId,
        'referenceID': refrenceID,
        'loyaltyReferenceId': loyaltyReferenceId,
      };

  @override
  String toString() {
    return 'PaymentConfirmRequest{orderId: $orderId, paymentId: $paymentId,refrenceID:$refrenceID,loyaltyReferenceId:$loyaltyReferenceId}';
  }
}
