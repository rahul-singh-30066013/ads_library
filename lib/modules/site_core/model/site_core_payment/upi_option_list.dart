/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class UpiOptionList {
  final String? code;
  final String? upiLabel;
  final String? upiValue;
  final bool? isActive;
  final String? upiSmallIcon;
  final String? upiLargeIcon;
  final String? enterUpiLabel;
  final String? name;

  const UpiOptionList({
    this.code,
    this.upiLabel,
    this.upiValue,
    this.isActive,
    this.upiSmallIcon,
    this.upiLargeIcon,
    this.enterUpiLabel,
    this.name,
  });

  @override
  String toString() {
    return 'UpiOptionList(code: $code, upiLabel: $upiLabel, upiValue: $upiValue, isActive: $isActive, upiSmallIcon: $upiSmallIcon, upiLargeIcon: $upiLargeIcon, enterUpiLabel: $enterUpiLabel,name: $name)';
  }

  factory UpiOptionList.fromJson(Map<String, dynamic> json) => UpiOptionList(
        code: json['code'] as String?,
        upiLabel: json['upiLabel'] as String?,
        upiValue: json['upiValue'] as String?,
        isActive: json['isActive'] as bool?,
        upiSmallIcon: json['upiSmallIcon'] as String?,
        upiLargeIcon: json['upiLargeIcon'] as String?,
        enterUpiLabel: json['enterUpiLabel'] as String?,
    name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'upiLabel': upiLabel,
        'upiValue': upiValue,
        'isActive': isActive,
        'upiSmallIcon': upiSmallIcon,
        'upiLargeIcon': upiLargeIcon,
        'enterUpiLabel': enterUpiLabel,
        'name': name,
      };

  UpiOptionList copyWith({
    String? code,
    String? upiLabel,
    String? upiValue,
    bool? isActive,
    String? upiSmallIcon,
    String? upiLargeIcon,
    String? enterUpiLabel,
  }) {
    return UpiOptionList(
      code: code ?? this.code,
      upiLabel: upiLabel ?? this.upiLabel,
      upiValue: upiValue ?? this.upiValue,
      isActive: isActive ?? this.isActive,
      upiSmallIcon: upiSmallIcon ?? this.upiSmallIcon,
      upiLargeIcon: upiLargeIcon ?? this.upiLargeIcon,
      enterUpiLabel: enterUpiLabel ?? this.enterUpiLabel,
    );
  }
}
