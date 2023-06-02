/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';

class SearchCabResponseModel {
  bool? isCabAvailableLater;
  int? isCabAvailableLaterTime;
  String? cabLoyaltyPercentage;
  List<CabItineraries>? cabItineraries;
  String? currencyCode;

  SearchCabResponseModel({
    this.isCabAvailableLater,
    this.isCabAvailableLaterTime,
    this.cabLoyaltyPercentage,
    this.cabItineraries,
    this.currencyCode,
  });

  SearchCabResponseModel.fromJson(Map<String, dynamic> json) {
    isCabAvailableLater = json['isCabAvailableLater'];
    isCabAvailableLaterTime = json['isCabAvailableLaterTime'];
    cabLoyaltyPercentage = json['cabLoyaltyPercentage'];
    if (json['cabItineraries'] != null) {
      cabItineraries = <CabItineraries>[];
      for (final Map<String, dynamic> result in json['cabItineraries']) {
        cabItineraries?.add(CabItineraries.fromJson(result));
      }
    }
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isCabAvailableLater'] = isCabAvailableLater;
    data['isCabAvailableLaterTime'] = isCabAvailableLaterTime;
    data['cabLoyaltyPercentage'] = cabLoyaltyPercentage;
    if (cabItineraries != null) {
      data['cabItineraries'] = cabItineraries?.map((v) => v.toJson()).toList();
    }
    data['currencyCode'] = currencyCode;
    return data;
  }
}

class CabItineraries {
  int? maximumAmount;
  int? minimumAmount;
  bool? isInstantBooking;
  List<CabItinerary>? cabItinerary;
  SecurityKey? securityKey;

  CabItineraries({
    this.maximumAmount,
    this.minimumAmount,
    this.isInstantBooking,
    this.cabItinerary,
    this.securityKey,
  });

  CabItineraries.fromJson(Map<String, dynamic> json) {
    maximumAmount = json['maximumAmount'];
    minimumAmount = json['minimumAmount'];
    isInstantBooking = json['isInstantBooking'];
    if (json['cabItinerary'] != null) {
      cabItinerary = <CabItinerary>[];
      for (final Map<String, dynamic> result in json['cabItinerary']) {
        cabItinerary?.add(CabItinerary.fromJson(result));
      }
    }
    securityKey = json['securityKey'] != null
        ? SecurityKey.fromJson(json['securityKey'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximumAmount'] = maximumAmount;
    data['minimumAmount'] = minimumAmount;
    data['isInstantBooking'] = isInstantBooking;
    if (cabItinerary != null) {
      data['cabItinerary'] = cabItinerary?.map((v) => v.toJson()).toList();
    }
    if (securityKey != null) {
      data['securityKey'] = securityKey?.toJson();
    }
    return data;
  }
}

class CabItinerary {
  VehicleDetails? vehicleCategory;
  PriceInfo? priceInfo;
  CabInfo? cabInfo;
  Supplier? supplier;

  CabItinerary({this.vehicleCategory, this.priceInfo, this.cabInfo});

  CabItinerary.fromJson(Map<String, dynamic> json) {
    vehicleCategory = json['vehicleCategory'] != null
        ? VehicleDetails.fromJson(json['vehicleCategory'])
        : null;
    priceInfo = json['priceInfo'] != null
        ? PriceInfo.fromJson(json['priceInfo'])
        : null;
    cabInfo =
        json['cabInfo'] != null ? CabInfo.fromJson(json['cabInfo']) : null;
    supplier =
        json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vehicleCategory != null) {
      data['vehicleCategory'] = vehicleCategory?.toJson();
    }
    if (priceInfo != null) {
      data['priceInfo'] = priceInfo?.toJson();
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

class Supplier {
  String? id;
  String? name;
  String? contact;
  String? logo;

  Supplier({
    this.id,
    this.name,
    this.contact,
    this.logo,
  });

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['contact'] = contact;
    data['logo'] = logo;
    return data;
  }
}

class VehicleDetails {
  num? vehicleCategoryID;
  String? vehicleKey;
  String? vehicleTypeID;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleImage;
  String? rideDetailSharedTime;
  String? adlCabCategory;

  VehicleDetails({
    this.vehicleCategoryID,
    this.vehicleKey,
    this.vehicleTypeID,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleImage,
    this.rideDetailSharedTime,
    this.adlCabCategory,
  });

  VehicleDetails.fromJson(Map<String, dynamic> json) {
    vehicleCategoryID = json['vehicleCategoryID'];
    vehicleKey = json['vehicleKey'];
    vehicleTypeID = json['vehicleTypeID'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleImage = json['vehicleImage'];
    rideDetailSharedTime = json['rideDetailSharedTime'];
    adlCabCategory = json['adlCabCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleCategoryID'] = vehicleCategoryID;
    data['vehicleKey'] = vehicleKey;
    data['vehicleTypeID'] = vehicleTypeID;
    data['vehicleType'] = vehicleType;
    data['vehicleNumber'] = vehicleNumber;
    data['vehicleImage'] = vehicleImage;
    data['rideDetailSharedTime'] = rideDetailSharedTime;
    data['adlCabCategory'] = adlCabCategory;
    return data;
  }
}

class PriceInfo {
  String? currencyCode;
  String? paymentMode;
  num? basePrice;
  num? totalAmount;
  num? discountPrice;
  num? loyalty;
  String? loyaltyPercentage;
  Taxes? taxes;
  String? referenceId;
  num? taxAmount;
  num? otherChargesAmount;
  LoyaltyPoints? loyaltyPoints;
  ExtraCharges? extraCharges;

  PriceInfo({
    this.currencyCode,
    this.paymentMode,
    this.basePrice,
    this.totalAmount,
    this.discountPrice,
    this.taxes,
    this.loyalty,
    this.loyaltyPercentage,
    this.referenceId,
    this.taxAmount,
    this.otherChargesAmount,
    this.loyaltyPoints,
    this.extraCharges,
  });

  PriceInfo.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currencyCode'];
    paymentMode = json['paymentMode'];
    basePrice = json['basePrice'];
    totalAmount = json['totalAmount'];
    discountPrice = json['discountPrice'];
    loyalty = json['loyalty'];
    loyaltyPercentage = json['loyaltyPercentage'];
    taxes = json['taxes'] != null ? Taxes.fromJson(json['taxes']) : null;
    referenceId = json['referenceId'];
    taxAmount = json['taxAmount'];
    otherChargesAmount = json['otherChargesAmount'];
    loyaltyPoints = json['loyaltyPoints'] != null
        ? LoyaltyPoints.fromJson(json['loyaltyPoints'])
        : null;
    extraCharges = json['extraCharges'] != null
        ? ExtraCharges.fromJson(json['extraCharges'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currencyCode'] = currencyCode;
    data['paymentMode'] = paymentMode;
    data['basePrice'] = basePrice;
    data['totalAmount'] = totalAmount;
    data['discountPrice'] = discountPrice;
    data['loyalty'] = loyalty;
    data['loyaltyPercentage'] = loyaltyPercentage;
    data['referenceId'] = referenceId;
    data['taxAmount'] = taxAmount;
    data['otherChargesAmount'] = otherChargesAmount;
    data['loyaltyPoints'] = loyaltyPoints?.toJson();
    if (taxes != null) {
      data['taxes'] = taxes?.toJson();
    }
    if (extraCharges != null) {
      data['extraCharges'] = extraCharges?.toJson();
    }
    return data;
  }
}

class Taxes {
  List<Tax>? tax;

  Taxes({this.tax});

  Taxes.fromJson(Map<String, dynamic> json) {
    if (json['tax'] != null) {
      tax = <Tax>[];
      for (final Map<String, dynamic> result in json['tax']) {
        tax?.add(Tax.fromJson(result));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tax != null) {
      data['tax'] = tax?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tax {
  String? taxCode;
  num? amount;

  Tax({this.taxCode, this.amount});

  Tax.fromJson(Map<String, dynamic> json) {
    taxCode = json['taxCode'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxCode'] = taxCode;
    data['amount'] = amount;
    return data;
  }
}

class SecurityKey {
  String? searchId;
  String? serviceType;
  String? secretID;
  String? secretKey;
  String? providerName;
  String? providerImage;
  String? providerCode;
  String? adlProviderImage;
  bool? isGSTEnable;

  SecurityKey({
    this.serviceType,
    this.searchId,
    this.providerName,
    this.providerImage,
    this.providerCode,
    this.secretID,
    this.secretKey,
    this.adlProviderImage,
    this.isGSTEnable,
  });

  SecurityKey.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    searchId = json['searchId'];
    secretKey = json['secretKey'];
    secretID = json['secretID'];
    providerName = json['providerName'];
    providerImage = json['providerImage'];
    providerCode = json['providerCode'];
    adlProviderImage = json['adlProviderImage'];
    isGSTEnable = json['isGSTEnable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceType'] = serviceType;
    data['searchId'] = searchId;
    data['secretKey'] = secretKey;
    data['secretID'] = secretID;
    data['providerName'] = providerName;
    data['providerImage'] = providerImage;
    data['providerCode'] = providerCode;
    data['adlProviderImage'] = adlProviderImage;
    data['isGSTEnable'] = isGSTEnable;
    return data;
  }
}

class CabInfo {
  bool? isAC;
  int? maxCapacity;
  String? fuelType;
  String? extraKMPrice;
  String? kmDistance;
  String? duration;
  String? cancellationKey;
  String? cancellationText;
  String? luggage;
  bool? isKiosk;

  CabInfo({
    this.isAC,
    this.maxCapacity,
    this.fuelType,
    this.extraKMPrice,
    this.kmDistance,
    this.duration,
    this.cancellationKey,
    this.cancellationText,
    this.luggage,
    this.isKiosk,
  });

  CabInfo.fromJson(Map<String, dynamic> json) {
    isAC = json['isAC'];
    maxCapacity = json['maxCapacity'];
    fuelType = json['fuelType'];
    extraKMPrice = json['extraKmPrice'];
    kmDistance = json['kmDistance'];
    duration = json['duration'];
    cancellationKey = json['cancellationKey'];
    cancellationText = json['cancellationText'];
    luggage = json['luggage'];
    isKiosk = json['isKiosk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAC'] = isAC;
    data['maxCapacity'] = maxCapacity;
    data['fuelType'] = fuelType;
    data['extraKmPrice'] = extraKMPrice;
    data['kmDistance'] = kmDistance;
    data['duration'] = duration;
    data['cancellationKey'] = cancellationKey;
    data['cancellationText'] = cancellationText;
    data['luggage'] = luggage;
    data['isKiosk'] = isKiosk;
    return data;
  }
}

class ExtraCharges {
  num? extraKmFare;
  num? waitingCharge;
  num? totalChargesAmount;
  Taxes? taxes;

  ExtraCharges({
    this.extraKmFare,
    this.waitingCharge,
    this.totalChargesAmount,
    this.taxes,
  });

  ExtraCharges.fromJson(Map<String, dynamic> json) {
    extraKmFare = json['extraKmFare'];
    waitingCharge = json['waitingCharge'];
    totalChargesAmount = json['totalChargesAmount'];
    taxes = json['taxes'] != null ? Taxes.fromJson(json['taxes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extraKmFare'] = extraKmFare;
    data['waitingCharge'] = waitingCharge;
    data['totalChargesAmount'] = totalChargesAmount;
    if (taxes != null) {
      data['taxes'] = taxes?.toJson();
    }
    return data;
  }
}
