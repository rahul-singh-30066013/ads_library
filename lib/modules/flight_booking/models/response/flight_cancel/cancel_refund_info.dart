/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';

/// this model class is connected with flight booking cancel response model to get cancel related thing

class CancelRefundInfo {
  CancelRefundInfo({
    String? cancelledTime,
    int? bookingInfoId,
    String? paxInfo,
    String? sector,
    BookingStatusType? bookingStatus,
    num? supplierCharge,
    num? convenienceFeeCharged,
    double? refundAmount,
    num? apiWalletRefundAmount,
  }) {
    _cancelledTime = cancelledTime;
    _bookingInfoId = bookingInfoId;
    _paxInfo = paxInfo;
    _sector = sector;
    _bookingStatus = bookingStatus;
    _supplierCharge = supplierCharge;
    _convenienceFeeCharged = convenienceFeeCharged;
    _refundAmount = refundAmount;
    _apiWalletRefundAmount = apiWalletRefundAmount;
  }

  CancelRefundInfo.fromJson(Map<String, dynamic> json) {
    _cancelledTime = json['cancelledTime'];
    _bookingInfoId = json['bookingInfoId'];
    _paxInfo = json['paxInfo'];
    _sector = json['sector'];
    final String statusType = json['bookingStatus'];
    _bookingStatus = BookingStatusType.values.byName(statusType);
    _supplierCharge = json['supplierCharge'];
    _convenienceFeeCharged = json['convenienceFeeCharged'];
    _refundAmount = json['refundAmount'] != null
        ? double.parse(json['refundAmount'].toString())
        : 0;
    _apiWalletRefundAmount = json['apiWalletRefundAmount'];
  }
  String? _cancelledTime;
  int? _bookingInfoId;
  String? _paxInfo;
  String? _sector;
  BookingStatusType? _bookingStatus;
  num? _supplierCharge;
  num? _convenienceFeeCharged;
  double? _refundAmount;
  num? _apiWalletRefundAmount;

  String? get cancelledTime => _cancelledTime;
  int? get bookingInfoId => _bookingInfoId;
  String? get paxInfo => _paxInfo;
  String? get sector => _sector;
  BookingStatusType? get bookingStatus => _bookingStatus;
  num? get supplierCharge => _supplierCharge;
  num? get convenienceFeeCharged => _convenienceFeeCharged;
  double? get refundAmount => _refundAmount;
  num? get apiWalletRefundAmount => _apiWalletRefundAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cancelledTime'] = _cancelledTime;
    map['bookingInfoId'] = _bookingInfoId;
    map['paxInfo'] = _paxInfo;
    map['sector'] = _sector;
    map['bookingStatus'] = _bookingStatus;
    map['supplierCharge'] = _supplierCharge;
    map['convenienceFeeCharged'] = _convenienceFeeCharged;
    map['refundAmount'] = _refundAmount;
    map['apiWalletRefundAmount'] = _apiWalletRefundAmount;
    return map;
  }
}
