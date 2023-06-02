/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class PaymentCard {
  const PaymentCard({
    this.customerToken,
    this.cardNumber,
    this.cvv,
    this.cardHolderName,
    this.cardExpiryYear,
    this.cardExpiryMonth,
    this.isCardToBeSaved,
  });

  final String? customerToken;
  final String? cardNumber;
  final String? cvv;
  final String? cardHolderName;
  final String? cardExpiryYear;
  final String? cardExpiryMonth;
  final bool? isCardToBeSaved;

  @override
  String toString() {
    return 'Card(customerToken: $customerToken, cardNumber: $cardNumber, cvv: $cvv, cardHolderName: $cardHolderName, cardExpiryYear: $cardExpiryYear, cardExpiryMonth: $cardExpiryMonth, isCardToBeSaved: $isCardToBeSaved)';
  }

  factory PaymentCard.fromJson(Map<String, dynamic> json) => PaymentCard(
        customerToken: json['customerToken'] as String?,
        cardNumber: json['cardNumber'] as String?,
        cvv: json['cvv'] as String?,
        cardHolderName: json['cardHolderName'] as String?,
        cardExpiryYear: json['cardExpiryYear'] as String?,
        cardExpiryMonth: json['cardExpiryMonth'] as String?,
        isCardToBeSaved: json['isCardToBeSaved'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'customerToken': customerToken,
        'cardNumber': cardNumber,
        'cvv': cvv,
        'cardHolderName': cardHolderName,
        'cardExpiryYear': cardExpiryYear,
        'cardExpiryMonth': cardExpiryMonth,
        'isCardToBeSaved': isCardToBeSaved,
      };
}
