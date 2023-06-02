/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class NetBanking {
  const NetBanking({this.payCode});

  final String? payCode;

  @override
  String toString() => 'NetBanking(payCode: $payCode)';

  factory NetBanking.fromJson(Map<String, dynamic> json) => NetBanking(
        payCode: json['payCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'payCode': payCode,
      };
}
