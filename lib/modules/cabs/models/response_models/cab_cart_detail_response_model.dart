/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/request_models/create_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/search_cab_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/update_cab_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';

class CabCartDetailResponseModel {
  CartDetail? cartDetail;
  String? oldAgentId;
  String? cartID;
  String? currencyCode;

  CabCartDetailResponseModel({
    this.cartDetail,
    this.oldAgentId,
    this.cartID,
    this.currencyCode,
  });

  CabCartDetailResponseModel.fromJson(Map<String, dynamic> json) {
    cartDetail = json['cartDetail'] != null
        ? CartDetail.fromJson(json['cartDetail'])
        : null;
    oldAgentId = json['oldAgentId'];
    cartID = json['cartID'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartDetail != null) {
      data['cartDetail'] = cartDetail?.toJson();
    }
    data['oldAgentId'] = oldAgentId;
    data['cartID'] = cartID;
    data['currencyCode'] = currencyCode;

    return data;
  }
}

class CartDetail {
  LocationDetails? pickup;
  LocationDetails? drop;
  TripInfo? tripInfo;
  PriceInfo? priceInfo;
  VehicleDetails? vehicleDetails;
  SecurityKey? securityKey;
  PromoDetails? promoDetails;
  UpdateCabCartRequestModel? contactDetail;
  BookingInfo? bookingInfo;
  ImportantInformation? importantInformation;
  UserInfo? userInfo;
  CabInfo? cabInfo;
  MerchantDetails? merchantDetails;

  CartDetail({
    this.pickup,
    this.drop,
    this.tripInfo,
    this.priceInfo,
    this.vehicleDetails,
    this.securityKey,
    this.bookingInfo,
    this.promoDetails,
    this.importantInformation,
    this.contactDetail,
    this.userInfo,
    this.cabInfo,
    this.merchantDetails,
  });

  CartDetail.fromJson(Map<String, dynamic> json) {
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
    bookingInfo = json['bookingInfo'] != null
        ? BookingInfo.fromJson(json['bookingInfo'])
        : null;
    promoDetails = json['promoDetails'] != null
        ? PromoDetails.fromJson(json['promoDetails'])
        : null;
    importantInformation = json['importantInformation'] != null
        ? ImportantInformation.fromJson(json['importantInformation'])
        : null;
    contactDetail = json['contactDetail'] != null
        ? UpdateCabCartRequestModel.fromJson(json['contactDetail'])
        : null;
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
    cabInfo =
        json['cabInfo'] != null ? CabInfo.fromJson(json['cabInfo']) : null;
    merchantDetails = json['merchantDetails'] != null
        ? MerchantDetails.fromJson(json['merchantDetails'])
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
    if (securityKey != null) {
      data['securityKey'] = securityKey?.toJson();
    }
    if (bookingInfo != null) {
      data['bookingInfo'] = bookingInfo?.toJson();
    }
    if (promoDetails != null) {
      data['promoDetails'] = promoDetails?.toJson();
    }
    if (importantInformation != null) {
      data['importantInformation'] = importantInformation?.toJson();
    }
    if (contactDetail != null) {
      data['contactDetail'] = contactDetail?.toJson();
    }
    if (userInfo != null) {
      data['userInfo'] = userInfo?.toJson();
    }
    if (contactDetail != null) {
      data['cabInfo'] = cabInfo?.toJson();
    }
    if (merchantDetails != null) {
      data['merchantDetails'] = merchantDetails?.toJson();
    }
    return data;
  }
}

class BookingInfo {
  String? bookingID;
  String? providerBookingID;
  int? bookingDate;
  String? status;
  String? otp;
  String? carNumber;
  String? carName;
  String? carModelName;
  String? driverName;
  String? driverPhone;
  bool? isInvoiceDownload;
  bool? isAutoCancelled;
  bool? isFreeCancellation;
  int? lastUpdateTime;
  String? freeCancellationTime;
  String? autoCancelledTime;
  KioskInfo? kioskInfo;

  BookingInfo({
    this.bookingID,
    this.providerBookingID,
    this.bookingDate,
    this.status,
    this.otp,
    this.carNumber,
    this.carName,
    this.carModelName,
    this.driverName,
    this.driverPhone,
    this.isInvoiceDownload,
    this.isAutoCancelled,
    this.isFreeCancellation,
    this.lastUpdateTime,
    this.freeCancellationTime,
    this.autoCancelledTime,
    this.kioskInfo,
  });

  BookingInfo.fromJson(Map<String, dynamic> json) {
    bookingID = json['bookingID'];
    providerBookingID = json['providerBookingID'];
    bookingDate = json['bookingDate'];
    status = json['status'];
    otp = json['otp'];
    carNumber = json['carNumber'];
    carName = json['carName'];
    carModelName = json['carModelName'];
    driverName = json['driverName'];
    driverPhone = json['driverPhone'];
    isInvoiceDownload = json['isInvoiceDownload'];
    isAutoCancelled = json['isAutoCancelled'];
    isFreeCancellation = json['isFreeCancellation'];
    lastUpdateTime = json['lastUpdateTime'];
    freeCancellationTime = json['freeCancellationTime'];
    autoCancelledTime = json['autoCancelledTime'];
    kioskInfo = json['kioskInfo'] != null
        ? KioskInfo.fromJson(json['kioskInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bookingID'] = bookingID;
    data['providerBookingID'] = providerBookingID;
    data['bookingDate'] = bookingDate;
    data['status'] = status;
    data['otp'] = otp;
    data['carNumber'] = carNumber;
    data['carName'] = carName;
    data['carModelName'] = carModelName;
    data['driverName'] = driverName;
    data['driverPhone'] = driverPhone;
    data['isInvoiceDownload'] = isInvoiceDownload;
    data['isAutoCancelled'] = isAutoCancelled;
    data['isFreeCancellation'] = isFreeCancellation;
    data['lastUpdateTime'] = lastUpdateTime;
    data['freeCancellationTime'] = freeCancellationTime;
    data['autoCancelledTime'] = autoCancelledTime;
    if (kioskInfo != null) {
      data['kioskInfo'] = kioskInfo;
    }

    return data;
  }
}

class KioskInfo {
  String? boardingMsg;
  String? contact;
  String? kioskInstruction;
  String? landmark;
  String? locateInstruction;
  String? locationDetail;
  String? latitude;
  String? longitude;
  String? name;
  String? navigateMsg;
  String? thumb;

  KioskInfo({
    this.boardingMsg,
    this.contact,
    this.kioskInstruction,
    this.landmark,
    this.locateInstruction,
    this.locationDetail,
    this.latitude,
    this.longitude,
    this.name,
    this.navigateMsg,
    this.thumb,
  });

  KioskInfo.fromJson(Map<String, dynamic> json) {
    boardingMsg = json['boardingMsg'];
    contact = json['contact'];
    kioskInstruction = json['kioskInstruction'];
    landmark = json['landmark'];
    locateInstruction = json['locateInstruction'];
    locationDetail = json['locationDetail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    navigateMsg = json['navigateMsg'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardingMsg'] = boardingMsg;
    data['contact'] = contact;
    data['kioskInstruction'] = kioskInstruction;
    data['landmark'] = landmark;
    data['locateInstruction'] = locateInstruction;
    data['locationDetail'] = locationDetail;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    data['navigateMsg'] = navigateMsg;
    data['thumb'] = thumb;
    return data;
  }
}

class ContactDetail {
  String? category;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? email;
  String? gstNumber;
  String? companyName;
  String? address;

  ContactDetail({
    this.category,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.email,
    this.gstNumber,
    this.companyName,
    this.address,
  });

  ContactDetail.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    gstNumber = json['gstNumber'];
    companyName = json['companyName'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['mobileNumber'] = mobileNumber;
    data['email'] = email;
    data['gstNumber'] = gstNumber;
    data['companyName'] = companyName;
    data['address'] = address;
    return data;
  }
}

class UserInfo {
  String? name;
  String? email;
  String? phoneNumber;
  String? countryCode;
  String? firstName;

  UserInfo({
    this.name,
    this.email,
    this.phoneNumber,
    this.countryCode,
    this.firstName,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
    firstName = json['firstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['countryCode'] = countryCode;
    data['firstName'] = firstName;
    return data;
  }
}

class MerchantDetails {
  int? merchantId;
  String? merchantName;
  int? merchantChargeId;
  String? storeCode;

  MerchantDetails({
    this.merchantId,
    this.merchantName,
    this.merchantChargeId,
    this.storeCode,
  });

  MerchantDetails.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchantId'];
    merchantName = json['merchantName'];
    merchantChargeId = json['merchantChargeId'];
    storeCode = json['storeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchantId'] = merchantId;
    data['merchantName'] = merchantName;
    data['merchantChargeId'] = merchantChargeId;
    data['storeCode'] = storeCode;
    return data;
  }
}
