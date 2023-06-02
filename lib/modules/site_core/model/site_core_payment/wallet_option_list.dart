/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class WalletOptionList {
  final String? walletCode;
  final String? walletName;
  final bool? isActive;
  final String? walletSmallIcon;
  final String? walletLargeIcon;

  const WalletOptionList({
    this.walletCode,
    this.walletName,
    this.isActive,
    this.walletSmallIcon,
    this.walletLargeIcon,
  });

  @override
  String toString() {
    return 'WalletOptionList(walletCode: $walletCode, walletName: $walletName, isActive: $isActive, walletSmallIcon: $walletSmallIcon, walletLargeIcon: $walletLargeIcon)';
  }

  factory WalletOptionList.fromJson(Map<String, dynamic> json) {
    return WalletOptionList(
      walletCode: json['walletCode'] as String?,
      walletName: json['walletName'] as String?,
      isActive: json['isActive'] as bool?,
      walletSmallIcon: json['walletSmallIcon'] as String?,
      walletLargeIcon: json['walletLargeIcon'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'walletCode': walletCode,
        'walletName': walletName,
        'isActive': isActive,
        'walletSmallIcon': walletSmallIcon,
        'walletLargeIcon': walletLargeIcon,
      };

  WalletOptionList copyWith({
    String? walletCode,
    String? walletName,
    bool? isActive,
    String? walletSmallIcon,
    String? walletLargeIcon,
  }) {
    return WalletOptionList(
      walletCode: walletCode ?? this.walletCode,
      walletName: walletName ?? this.walletName,
      isActive: isActive ?? this.isActive,
      walletSmallIcon: walletSmallIcon ?? this.walletSmallIcon,
      walletLargeIcon: walletLargeIcon ?? this.walletLargeIcon,
    );
  }
}
