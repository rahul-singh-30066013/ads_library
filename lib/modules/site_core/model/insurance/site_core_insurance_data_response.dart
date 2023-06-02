/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/insurance/site_core_insurance_field.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SiteCoreInsuranceDataResponse {
  final String? uid;
  final String? componentName;
  final String? dataSource;
  final SiteCoreInsuranceField? fields;

  const SiteCoreInsuranceDataResponse({
    this.uid,
    this.componentName,
    this.dataSource,
    this.fields,
  });

  @override
  String toString() {
    return 'Element( fields: $fields)';
  }

  factory SiteCoreInsuranceDataResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      SiteCoreInsuranceDataResponse(
        fields: json['fields'] == null
            ? null
            : SiteCoreInsuranceField.fromJson(
                json['fields'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'fields': fields?.toJson(),
      };

  SiteCoreInsuranceDataResponse copyWith({
    SiteCoreInsuranceField? fields,
  }) {
    return SiteCoreInsuranceDataResponse(
      fields: fields ?? this.fields,
    );
  }
}
