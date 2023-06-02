/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_refund_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_refund_responses.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';

/// this model class is used to receive response for flight booking cancel

class FlightBookingCancelResponseModel {
  FlightBookingCancelResponseModel({
    int? txnId,
    String? status,
    CancelRefundResponses? cancelRefundResponses,
    String? cancelType,
  }) {
    _txnId = txnId;
    _status = status;
    _cancelRefundResponses = cancelRefundResponses;
    _cancelType = cancelType;
  }

  FlightBookingCancelResponseModel.fromJson(Map<String, dynamic> json) {
    _txnId = json['txnId'];
    _status = json['status'];
    if (json['refund'] != null) {
      _cancelRefundResponses = CancelRefundResponses.fromJson(json['refund']);
    }
    _cancelType = getCancelTypeFromCancelInfo(
      _cancelRefundResponses?.cancelRefundInfo ?? [],
    );
  }
  int? _txnId;
  String? _status;
  CancelRefundResponses? _cancelRefundResponses;
  String? _cancelType;

  int? get txnId => _txnId;
  String? get status => _status;
  CancelRefundResponses? get cancelRefundResponses => _cancelRefundResponses;
  String? get getCancelType => _cancelType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['txnId'] = _txnId;
    map['status'] = _status;
    if (_cancelRefundResponses != null) {
      map['refund'] = _cancelRefundResponses?.toJson();
    }
    return map;
  }
}

//TODO will update method, change to get all passenger cancellation Status
String getCancelTypeFromCancelInfo(
  List<CancelRefundInfo>? cancelRefundResponses,
) {
  final cancelRefundResponse = cancelRefundResponses ?? [];
  String bookingType = '-';
  for (int type = 0; type < cancelRefundResponse.length; type++) {
    final CancelRefundInfo cancelRefundObj = cancelRefundResponse[type];
    bookingType = cancelRefundObj.bookingStatus == BookingStatusType.Q
        ? 'Booking cancelled'
        : 'Booking Partially Cancelled';
    break;
  }
  return bookingType;
}
