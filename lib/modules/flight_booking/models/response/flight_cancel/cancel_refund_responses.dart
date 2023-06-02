/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_refund_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/refund_total.dart';

/// this model class is connected with flight booking cancel response model to get cancel related thing
class CancelRefundResponses {
  CancelRefundResponses({
    String? cancelId,
    RefundTotal? refundTotal,
    List<CancelRefundInfo>? cancelRefundInfo,
  }) {
    _cancelId = cancelId;
    _cancelRefundInfo = cancelRefundInfo;
    _refundTotal = refundTotal;
  }

  CancelRefundResponses.fromJson(Map<String, dynamic> json) {
    if (json['cancelId'] != null) {
      _cancelId = json['cancelId'].toString();
    }
    if (json['total'] != null) {
      _refundTotal = RefundTotal.fromJson(json['total']);
    }
    if (json['paxInfo'] != null) {
      _cancelRefundInfo = [];
      for (final object in json['paxInfo'] as List) {
        final CancelRefundInfo cancelRefundInfo =
            CancelRefundInfo.fromJson(object);
        _cancelRefundInfo?.add(cancelRefundInfo);
      }
    }
  }
  String? _cancelId;
  RefundTotal? _refundTotal;
  List<CancelRefundInfo>? _cancelRefundInfo;

  String? get cancelId => _cancelId;
  RefundTotal? get refundTotal => _refundTotal;
  List<CancelRefundInfo>? get cancelRefundInfo => _cancelRefundInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cancelId'] = _cancelId;
    if (_refundTotal != null) {
      map['total'] = _refundTotal?.toJson();
    }
    if (_cancelRefundInfo != null) {
      map['cancelRefundInfo'] =
          _cancelRefundInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
