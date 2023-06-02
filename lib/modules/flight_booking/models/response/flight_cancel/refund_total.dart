/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

//this model class is used to receive refund total response model, it will connected on booking cancel flow - cancelRefundResponses
@immutable
class RefundTotal {
  const RefundTotal({
    this.supplierCharge,
    this.convenienceFeeCharged,
    this.refundAmount,
    this.apiWalletRefundAmount,
  });

  final num? supplierCharge;
  final num? convenienceFeeCharged;
  final num? refundAmount;
  final num? apiWalletRefundAmount;

  @override
  String toString() {
    return 'Total(supplierCharge: $supplierCharge, convenienceFeeCharged: $convenienceFeeCharged, refundAmount: $refundAmount, apiWalletRefundAmount: $apiWalletRefundAmount)';
  }

  factory RefundTotal.fromJson(Map<String, dynamic> json) => RefundTotal(
        supplierCharge: json['supplierCharge'] as num?,
        convenienceFeeCharged: json['convenienceFeeCharged'] as num?,
        refundAmount: json['refundAmount'] as num?,
        apiWalletRefundAmount: json['apiWalletRefundAmount'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'supplierCharge': supplierCharge,
        'convenienceFeeCharged': convenienceFeeCharged,
        'refundAmount': refundAmount,
        'apiWalletRefundAmount': apiWalletRefundAmount,
      };
}
