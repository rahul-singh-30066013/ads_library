/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class CallingCode {
  final String? value;

  const CallingCode({this.value});

  @override
  String toString() => 'CallingCode(value: $value)';

  factory CallingCode.fromJson(Map<String, dynamic> json) => CallingCode(
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };

  CallingCode copyWith({
    String? value,
  }) {
    return CallingCode(
      value: value ?? this.value,
    );
  }
}
