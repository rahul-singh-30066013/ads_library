/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
class CabBookingStatusResponseModel {
  String? bookingStatus;
  int? lastUpdateTime;

  CabBookingStatusResponseModel({
    this.bookingStatus,
    this.lastUpdateTime,
  });

  CabBookingStatusResponseModel.fromJson(Map<String, dynamic> json) {
    bookingStatus = json['bookingStatus'];
    lastUpdateTime = json['lastUpdateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bookingStatus'] = bookingStatus;
    data['lastUpdateTime'] = lastUpdateTime;
    return data;
  }
}
