/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class BillingAddress {
  const BillingAddress({
    this.firstName,
    this.lastName,
  });

  final String? firstName;
  final String? lastName;

  @override
  String toString() {
    return 'BillingAddress(firstName: $firstName, lastName: $lastName)';
  }

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
      };
}
