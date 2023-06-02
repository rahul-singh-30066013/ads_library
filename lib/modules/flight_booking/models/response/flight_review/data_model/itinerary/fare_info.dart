/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// this class is used to receive FareInfo model for itinerary

class FareInfo {
  FareInfo({
    int? segRef,
    String? fareBasisCode,
    bool? refundable,
    String? fareKey,
  }) {
    _segRef = segRef;
    _fareBasisCode = fareBasisCode;
    _refundable = refundable;
    _fareKey = fareKey;
  }

  FareInfo.fromJson(Map<String, dynamic> json) {
    _segRef = json['segRef'];
    _fareBasisCode = json['fareBasisCode'];
    _refundable = json['refundable'];
    _fareKey = json['fareKey'];
  }
  int? _segRef;
  String? _fareBasisCode;
  bool? _refundable;
  String? _fareKey;

  int? get segRef => _segRef;
  String? get fareBasisCode => _fareBasisCode;
  bool? get refundable => _refundable;
  String? get fareKey => _fareKey;
}
