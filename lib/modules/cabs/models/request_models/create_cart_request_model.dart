/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/request_models/search_cab_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';

class CreateCartRequestModel {
  LocationDetails? pickup;
  LocationDetails? drop;
  TripInfo? tripInfo;
  PriceInfo? priceInfo;
  VehicleDetails? vehicleDetails;
  SecurityKey? securityKey;
  PromoDetails? promoDetails;
  CabInfo? cabInfo;
  Supplier? supplier;

  CreateCartRequestModel({
    this.pickup,
    this.drop,
    this.tripInfo,
    this.priceInfo,
    this.vehicleDetails,
    this.securityKey,
    this.promoDetails,
    this.cabInfo,
    this.supplier,
  });

  CreateCartRequestModel.fromJson(Map<String, dynamic> json) {
    pickup = json['pickup'] != null
        ? LocationDetails.fromJson(json['pickup'])
        : null;
    drop = json['drop'] != null ? LocationDetails.fromJson(json['drop']) : null;
    tripInfo =
        json['tripInfo'] != null ? TripInfo.fromJson(json['tripInfo']) : null;
    priceInfo = json['priceInfo'] != null
        ? PriceInfo.fromJson(json['priceInfo'])
        : null;
    vehicleDetails = json['vehicleDetails'] != null
        ? VehicleDetails.fromJson(json['vehicleDetails'])
        : null;
    securityKey = json['securityKey'] != null
        ? SecurityKey.fromJson(json['securityKey'])
        : null;
    promoDetails = json['promoDetails'] != null
        ? PromoDetails.fromJson(json['promoDetails'])
        : null;
    cabInfo =
        json['cabInfo'] != null ? CabInfo.fromJson(json['cabInfo']) : null;
    supplier =
        json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pickup != null) {
      data['pickup'] = pickup?.toJson();
    }
    if (drop != null) {
      data['drop'] = drop?.toJson();
    }
    if (tripInfo != null) {
      data['tripInfo'] = tripInfo?.toJson();
    }
    if (priceInfo != null) {
      data['priceInfo'] = priceInfo?.toJson();
    }
    if (vehicleDetails != null) {
      data['vehicleDetails'] = vehicleDetails?.toJson();
    }
    if (securityKey != null) {
      data['securityKey'] = securityKey?.toJson();
    }
    if (promoDetails != null) {
      data['promoDetails'] = promoDetails?.toJson();
    }
    if (cabInfo != null) {
      data['cabInfo'] = cabInfo?.toJson();
    }
    if (supplier != null) {
      data['supplier'] = supplier?.toJson();
    }
    return data;
  }
}

class TripInfo {
  String? airportName;
  String? terminal;
  int? bookingDate;
  String? tripType;
  bool? isRideNow;
  String? airportCode;
  String? terminalGate;
  bool? isFromAirport;
  bool? isShowFCTimer;

  TripInfo({
    this.airportName,
    this.terminal,
    this.bookingDate,
    this.tripType,
    this.isRideNow,
    this.airportCode,
    this.terminalGate,
    this.isFromAirport,
    this.isShowFCTimer,
  });

  TripInfo.fromJson(Map<String, dynamic> json) {
    airportName = json['airportName'];
    terminal = json['terminal'];
    bookingDate = json['bookingDate'];
    tripType = json['tripType'];
    isRideNow = json['isRideNow'];
    airportCode = json['airportCode'];
    terminalGate = json['terminalGate'];
    isFromAirport = json['isFromAirport'];
    isShowFCTimer = json['isShowFCTimer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airportName'] = airportName;
    data['terminal'] = terminal;
    data['bookingDate'] = bookingDate;
    data['tripType'] = tripType;
    data['isRideNow'] = isRideNow;
    data['airportCode'] = airportCode;
    data['terminalGate'] = terminalGate;
    data['isFromAirport'] = isFromAirport;
    data['isShowFCTimer'] = isShowFCTimer;
    return data;
  }
}

class PromoDetails {
  String? promoCode;
  num? promoValue;

  PromoDetails({this.promoCode, this.promoValue});

  PromoDetails.fromJson(Map<String, dynamic> json) {
    promoCode = json['promoCode'];
    promoValue = json['promoValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['promoCode'] = promoCode;
    data['promoValue'] = promoValue;
    return data;
  }
}
