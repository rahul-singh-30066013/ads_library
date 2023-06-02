/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/payment_fields.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SiteCorePaymentParentResponse {
  final PaymentFields? fields;

  const SiteCorePaymentParentResponse({
    this.fields,
  });

  @override
  String toString() {
    return 'SiteCorePaymentParentResponse(fields: $fields)';
  }

  factory SiteCorePaymentParentResponse.fromJson(Map<String, dynamic> json) {
    return SiteCorePaymentParentResponse(
      fields: json['fields'] == null
          ? null
          : PaymentFields.fromJson(json['fields'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'fields': fields?.toJson(),
      };

  SiteCorePaymentParentResponse copyWith({
    PaymentFields? fields,
  }) {
    return SiteCorePaymentParentResponse(
      fields: fields ?? this.fields,
    );
  }
}
