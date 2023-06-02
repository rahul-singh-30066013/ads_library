/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class Wallet {
  const Wallet({this.walletCode});

  final String? walletCode;

  @override
  String toString() => 'Wallet(walletCode: $walletCode)';

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        walletCode: json['walletCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'walletCode': walletCode,
      };
}
