/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class MinLength {
  final String? value;

  const MinLength({this.value});

  @override
  String toString() => 'MinLength(value: $value)';

  factory MinLength.fromJson(Map<String, dynamic> json) => MinLength(
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };

  MinLength copyWith({
    String? value,
  }) {
    return MinLength(
      value: value ?? this.value,
    );
  }
}
