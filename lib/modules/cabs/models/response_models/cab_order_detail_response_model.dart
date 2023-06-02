/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/request_models/create_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/search_cab_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/update_cab_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';

class CabOrderDetailResponseModel {
  LocationDetails? pickup;
  LocationDetails? drop;
  TripInfo? tripInfo;
  PriceInfo? priceInfo;
  VehicleDetails? vehicleDetails;
  BookingInfo? bookingInfo;
  UserInfo? userInfo;
  CabInfo? cabInfo;
  Supplier? supplierInfo;
  SecurityKey? securityKey;
  PromoDetails? promoDetails;
  RefundInfo? refundInfo;
  OverallStatus? overallStatus;
  UpdateCabCartRequestModel? contactDetails;

  CabOrderDetailResponseModel({
    this.pickup,
    this.drop,
    this.tripInfo,
    this.priceInfo,
    this.vehicleDetails,
    this.bookingInfo,
    this.userInfo,
    this.cabInfo,
    this.supplierInfo,
    this.securityKey,
    this.promoDetails,
    this.refundInfo,
    this.overallStatus,
    this.contactDetails,
  });

  CabOrderDetailResponseModel.fromJson(Map<String, dynamic> json) {
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
    bookingInfo = json['bookingInfo'] != null
        ? BookingInfo.fromJson(json['bookingInfo'])
        : null;
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    cabInfo =
        json['cabInfo'] != null ? CabInfo.fromJson(json['cabInfo']) : null;
    supplierInfo = json['supplierInfo'] != null
        ? Supplier.fromJson(json['supplierInfo'])
        : null;
    securityKey = json['securityKey'] != null
        ? SecurityKey.fromJson(json['securityKey'])
        : null;
    promoDetails = json['promoDetails'] != null
        ? PromoDetails.fromJson(json['promoDetails'])
        : null;
    refundInfo = json['refundInfo'] != null
        ? RefundInfo.fromJson(json['refundInfo'])
        : null;
    overallStatus = json['overallStatus'] != null
        ? OverallStatus.fromJson(json['overallStatus'])
        : null;
    contactDetails = json['contactDetail'] != null
        ? UpdateCabCartRequestModel.fromJson(json['contactDetail'])
        : null;
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
    if (bookingInfo != null) {
      data['bookingInfo'] = bookingInfo?.toJson();
    }
    if (userInfo != null) {
      data['userInfo'] = userInfo?.toJson();
    }
    if (cabInfo != null) {
      data['cabInfo'] = cabInfo?.toJson();
    }
    if (supplierInfo != null) {
      data['supplierInfo'] = supplierInfo?.toJson();
    }
    if (securityKey != null) {
      data['securityKey'] = securityKey?.toJson();
    }
    if (promoDetails != null) {
      data['promoDetails'] = promoDetails?.toJson();
    }
    if (refundInfo != null) {
      data['refundInfo'] = refundInfo?.toJson();
    }
    if (overallStatus != null) {
      data['overallStatus'] = overallStatus?.toJson();
    }
    if (contactDetails != null) {
      data['contactDetail'] = contactDetails?.toJson();
    }

    return data;
  }
}

class UserInfo {
  String? name;
  String? email;
  String? phoneNumber;
  String? countryCode;
  String? firstName;

  UserInfo({this.name, this.email, this.phoneNumber, this.countryCode});

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
    countryCode = json['firstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['countryCode'] = countryCode;
    data['firstName'] = countryCode;
    return data;
  }
}

class RefundInfo {
  String? referenceId;
  List<RefundDetails>? refundDetails;
  PaymentDetails? paymentDetails;
  num? totalPaid;
  num? totalRefund;
  num? promoRefund;
  num? loyaltyRefund;
  num? bankRefund;
  num? cancelationCharges;

  RefundInfo({
    this.referenceId,
    this.refundDetails,
    this.paymentDetails,
    this.totalPaid,
    this.totalRefund,
    this.promoRefund,
    this.loyaltyRefund,
    this.bankRefund,
    this.cancelationCharges,
  });

  RefundInfo.fromJson(Map<String, dynamic> json) {
    referenceId = json['referenceId'];
    totalPaid = json['totalPaid'];
    totalRefund = json['totalRefund'];
    promoRefund = json['promoRefund'];
    loyaltyRefund = json['loyaltyRefund'];
    bankRefund = json['bankRefund'];
    cancelationCharges = json['cancelationCharges'];

    if (json['refundDetails'] != null) {
      refundDetails = <RefundDetails>[];
      for (final Map<String, dynamic> result in json['refundDetails']) {
        refundDetails?.add(RefundDetails.fromJson(result));
      }
    }
    paymentDetails = json['paymentDetails'] != null
        ? PaymentDetails.fromJson(json['paymentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referenceId'] = referenceId;
    data['totalPaid'] = totalPaid;
    data['totalRefund'] = totalRefund;
    data['promoRefund'] = promoRefund;
    data['loyaltyRefund'] = loyaltyRefund;
    data['bankRefund'] = bankRefund;
    data['cancelationCharges'] = cancelationCharges;

    if (refundDetails != null) {
      data['refundDetails'] = refundDetails?.map((v) => v.toJson()).toList();
    }
    if (paymentDetails != null) {
      data['paymentDetails'] = paymentDetails?.toJson();
    }
    return data;
  }
}

class RefundDetails {
  String? paymentMode;
  num? amount;
  String? status;
  String? rrn;
  String? transactionDate;

  RefundDetails({
    this.paymentMode,
    this.amount,
    this.status,
    this.rrn,
    this.transactionDate,
  });

  RefundDetails.fromJson(Map<String, dynamic> json) {
    paymentMode = json['paymentMode'];
    amount = json['amount'];
    status = json['status'];
    rrn = json['rrn'];
    transactionDate = json['transactionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentMode'] = paymentMode;
    data['amount'] = amount;
    data['status'] = status;
    data['rrn'] = rrn;
    data['transactionDate'] = transactionDate;
    return data;
  }
}

class PaymentDetails {
  num? bank;
  int? loyalty;
  int? promo;

  PaymentDetails({this.bank, this.loyalty, this.promo});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    loyalty = json['loyalty'];
    promo = json['promo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank'] = bank;
    data['loyalty'] = loyalty;
    data['promo'] = promo;
    return data;
  }
}

class LoyaltyPoints {
  int? pendingRewardPoints;
  int? earnedRewardPoints;
  int? burnedRewardPoints;

  LoyaltyPoints({
    this.pendingRewardPoints,
    this.earnedRewardPoints,
    this.burnedRewardPoints,
  });

  LoyaltyPoints.fromJson(Map<String, dynamic> json) {
    pendingRewardPoints = json['pendingRewardPoints'];
    earnedRewardPoints = json['earnedRewardPoints'];
    burnedRewardPoints = json['burnedRewardPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pendingRewardPoints'] = pendingRewardPoints;
    data['earnedRewardPoints'] = earnedRewardPoints;
    data['burnedRewardPoints'] = burnedRewardPoints;
    return data;
  }
}

class OverallStatus {
  List<StatusHistory>? statusHistory;

  OverallStatus({
    this.statusHistory,
  });

  OverallStatus.fromJson(Map<String, dynamic> json) {
    if (json['statusHistory'] != null) {
      statusHistory = <StatusHistory>[];
      for (final Map<String, dynamic> result in json['statusHistory']) {
        statusHistory?.add(StatusHistory.fromJson(result));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (statusHistory != null) {
      data['statusHistory'] = statusHistory?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusHistory {
  String? status;
  String? modifiedOn;

  StatusHistory({
    this.status,
    this.modifiedOn,
  });

  StatusHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    modifiedOn = json['modifiedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['modifiedOn'] = modifiedOn;
    return data;
  }
}
