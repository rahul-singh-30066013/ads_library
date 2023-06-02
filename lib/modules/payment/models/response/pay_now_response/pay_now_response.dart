/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/card_response.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/netbanking_response.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/wallet_response.dart';
import 'package:flutter/foundation.dart';

@immutable
class PayNowResponse {
  const PayNowResponse({
    this.cardResponse,
    this.netBankingResponse,
    this.walletResponse,
    this.referenceId,
    this.content,
    this.paymentID,
    this.orderID,
    this.loyaltyReferenceId,
    this.loyaltyReferenceID,
    this.pgType,
  });

  final CardResponse? cardResponse;
  final NetBankingResponse? netBankingResponse;
  final WalletResponse? walletResponse;
  final String? referenceId;
  final String? paymentID;
  final String? orderID;
  final String? loyaltyReferenceId;
  final String? loyaltyReferenceID;
  final String? content;
  final String? pgType;

  @override
  String toString() {
    return 'Data(cardResponse: $cardResponse, netBankingResponse: $netBankingResponse, walletResponse: $walletResponse, referenceId: $referenceId, loyaltyReferenceId: $loyaltyReferenceId, loyaltyReferenceID: $loyaltyReferenceID)';
  }

  factory PayNowResponse.fromJson(Map<String, dynamic> json) => PayNowResponse(
        cardResponse: json['cardResponse'] == null
            ? null
            : CardResponse.fromJson(
                json['cardResponse'] as Map<String, dynamic>,
              ),
        netBankingResponse: json['netbankingResponse'] == null
            ? null
            : NetBankingResponse.fromJson(
                json['netbankingResponse'] as Map<String, dynamic>,
              ),
        walletResponse: json['walletResponse'] == null
            ? null
            : WalletResponse.fromJson(
                json['walletResponse'] as Map<String, dynamic>,
              ),
        referenceId: json['referenceID'] as String?,
        loyaltyReferenceId: json['loyaltyReferenceId'] as String?,
        loyaltyReferenceID: json['loyaltyReferenceID'] as String?,
        paymentID: json['paymentID'] as String?,
        orderID: (json['orderID'] as String?) ?? json['orderId'] as String?,
        content: json['content'] as String?,
        pgType: json['pg'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'cardResponse': cardResponse?.toJson(),
        'netbankingResponse': netBankingResponse?.toJson(),
        'walletResponse': walletResponse?.toJson(),
        'referenceId': referenceId,
        'loyaltyReferenceId': loyaltyReferenceId,
        'loyaltyReferenceID': loyaltyReferenceID,
        'content': content,
        'pgType': pgType,
      };
}
