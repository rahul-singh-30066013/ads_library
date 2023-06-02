/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class MaxLength {
  final String? value;

  const MaxLength({this.value});

  @override
  String toString() => 'MaxLength(value: $value)';

  factory MaxLength.fromJson(Map<String, dynamic> json) => MaxLength(
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };

  MaxLength copyWith({
    String? value,
  }) {
    return MaxLength(
      value: value ?? this.value,
    );
  }
}
