/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
class FilteredVendorDataRequestModel {
  String? language;
  String? vendorCode;
  String? airport;
  String? tripType;
  String? cabSchedule;
  String? cabBookingType;
  String? cancellationCode;
  bool? isPreBooking;

  FilteredVendorDataRequestModel({
    this.language,
    this.vendorCode,
    this.airport,
    this.tripType,
    this.cabSchedule,
    this.cabBookingType,
    this.cancellationCode,
    this.isPreBooking,
  });

  FilteredVendorDataRequestModel.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    vendorCode = json['vendorCode'];
    airport = json['airport'];
    tripType = json['tripType'];
    cabSchedule = json['cabSchedule'];
    cabBookingType = json['cabBookingType'];
    cancellationCode = json['cancellationCode'];
    isPreBooking = json['isPreBooking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language'] = language;
    data['vendorCode'] = vendorCode;
    data['airport'] = airport;
    data['tripType'] = tripType;
    data['cabSchedule'] = cabSchedule;
    data['cabBookingType'] = cabBookingType;
    data['cancellationCode'] = cancellationCode;
    data['isPreBooking'] = isPreBooking;
    return data;
  }
}
