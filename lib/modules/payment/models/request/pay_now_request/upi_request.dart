/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/foundation.dart';

@immutable
class UpiRequest {
  final String? vpa;
  final bool? isUpiToBeSaved;
  final String? upiOption;

  const UpiRequest({this.vpa, this.isUpiToBeSaved, this.upiOption});

  @override
  String toString() {
    return 'UpiRequest(vpa: $vpa, isUpiToBeSaved: $isUpiToBeSaved, upiOption: $upiOption)';
  }

  factory UpiRequest.fromJson(Map<String, dynamic> json) => UpiRequest(
        vpa: json['vpa'] as String?,
        isUpiToBeSaved: json['is_Upi_To_Be_Saved'] as bool?,
        upiOption: json['upi_Option'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'vpa': vpa,
        'is_Upi_To_Be_Saved': isUpiToBeSaved,
        'upi_Option': upiOption,
      };
}
