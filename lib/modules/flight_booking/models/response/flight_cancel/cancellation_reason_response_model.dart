/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_reason.dart';

/// this model class is used to receive response for flight cancellation list

class CancellationReasonResponseModel {
  CancellationReasonResponseModel({
    List<CancelReason>? cancelReason,
  }) {
    _cancelReason = cancelReason;
  }

  CancellationReasonResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['cancelReason'] != null) {
      _cancelReason = [];
      for (final object in json['cancelReason'] as List) {
        final CancelReason cancelReason = CancelReason.fromJson(object);
        _cancelReason?.add(cancelReason);
      }
    }
  }

  List<CancelReason>? _cancelReason;

  List<CancelReason>? get cancelReason => _cancelReason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cancelReason != null) {
      map['cancelReason'] = _cancelReason?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
