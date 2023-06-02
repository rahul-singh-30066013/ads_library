/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

part of 'deep_link_manager.dart';

enum DeepLinkType {
  flightBooking,
  referCode,
  dutyFree,
  pranaam,
  porter,
  cart,
  flightStatus,
  orders,
  profile,
  offers,
  cabs,
  referAndEarn,
  feedback,
  none,
  republic,
  offerDetail,
  staticPages,
  homepage,
  trainman,

  /// only to log Event
  logDeepLinkEvent,
}

enum DeepLinkSource {
  appsflyer,
  webEngage,
  firebase,
  chatBot,
  native,
  none,
}

enum DutyFreeRoutes {
  dashBoard,
  productCatalogPage,
  productPage,
}

Map<String, DeepLinkType> lobsMap = {
  'cb': DeepLinkType.cabs,
  'ct': DeepLinkType.cart,
  'df': DeepLinkType.dutyFree,
  'fb': DeepLinkType.flightBooking,
  'fd': DeepLinkType.feedback,
  'fs': DeepLinkType.flightStatus,
  'home': DeepLinkType.homepage,
  'od': DeepLinkType.orders,
  'of': DeepLinkType.offers,
  'ofd': DeepLinkType.offerDetail,
  'pf': DeepLinkType.profile,
  'pm': DeepLinkType.pranaam,
  'po': DeepLinkType.porter,
  'rae': DeepLinkType.referAndEarn,
  'rc': DeepLinkType.referCode,
  'rp': DeepLinkType.republic,
  'sp': DeepLinkType.staticPages,
  'tm': DeepLinkType.trainman,
};

Map<String, DeepLinkType> orderLobsMap = {
  'FlightBooking': DeepLinkType.flightBooking,
  'Dutyfree': DeepLinkType.dutyFree,
  'Pranaam': DeepLinkType.pranaam,
};

Map<String, DutyFreeRoutes> dutyFreeRoutesMap = {
  'dashBoard': DutyFreeRoutes.dashBoard,
  'productPage': DutyFreeRoutes.productPage,
  'productCatalogPage': DutyFreeRoutes.productCatalogPage,
};

//airport code key
String airportCodeKey = 'airportCode';
//lobs
String lineOfBusinessKey = 'lob';
//route
String linkRouteKey = 'route';
//data
String linkDataKey = 'data';
//store type key
String storeTypeKey = 'storeType';
//material group key
String materialGroupKey = 'materialGroup';
//referCode
String referralCode = 'referalCode';

String uniqueId = 'uniqueId';

String title = 'title';

Map<String, DeepLinkType> firebaseRoutesMap = {
  '/flight-booking': DeepLinkType.flightBooking,
  '/offers': DeepLinkType.offers,
  '/login': DeepLinkType.referCode,
  '/contact-us': DeepLinkType.feedback,
  '/loyalty-rewards': DeepLinkType.referCode,
  '/loyalty-rewards/refer-earn': DeepLinkType.referAndEarn,
  '/my-account/orders': DeepLinkType.orders,
};

class UtmParamsModel {
  final String utmSource;
  final String utmMedium;
  final String utmCampaign;

  UtmParamsModel({
    required this.utmSource,
    required this.utmCampaign,
    required this.utmMedium,
  });

  factory UtmParamsModel.fromJson(Map<String, String> json) => UtmParamsModel(
        utmSource: json['utm_source'] ?? 'NA',
        utmCampaign: json['utm_campaign'] ?? 'NA',
        utmMedium: json['utm_medium'] ?? 'NA',
      );
}

class FlightBookingDeepLinkModel {
  String? fromCity;
  String? toCity;
  String? tripType;
  String? departureDate;
  String? arrivalDate;
  String? travelClass;
  String? adult;
  String? child;
  String? infant;

  FlightBookingDeepLinkModel({
    this.fromCity = '',
    this.toCity = '',
    this.tripType = 'O',
    this.departureDate = '',
    this.arrivalDate = '',
    this.travelClass = 'ECO',
    this.adult = '1',
    this.child = '0',
    this.infant = '0',
  });

  FlightBookingDeepLinkModel.fromJson(Map<String, dynamic> json) {
    fromCity = json['fromCity'] ?? '';
    toCity = json['toCity'] ?? '';
    tripType = json['tripType'] ?? 'O';
    departureDate = json['departureDate'] ?? '';
    arrivalDate = json['arrivalDate'] ?? '';
    travelClass = json['travelClass'] ?? 'ECO';
    adult = json['adult'] ?? '1';
    child = json['child'] ?? '0';
    infant = json['infant'] ?? '0';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fromCity'] = fromCity;
    json['toCity'] = toCity;
    json['tripType'] = tripType;
    json['departureDate'] = departureDate;
    json['arrivalDate'] = arrivalDate;
    json['travelClass'] = travelClass;
    json['adult'] = adult;
    json['child'] = child;
    json['infant'] = infant;
    return json;
  }
}

class DutyFreeDeepLinkDataModel {
  final String? storeType;
  final String? materialGroup;
  final String? materialGroupTitle;
  final String? slug;
  final String? skuCode;

  DutyFreeDeepLinkDataModel({
    this.storeType,
    this.materialGroup,
    this.materialGroupTitle,
    this.slug,
    this.skuCode,
  });

  DutyFreeDeepLinkDataModel.fromJson(Map<String, dynamic> json)
      : storeType = json['storeType'] as String?,
        materialGroup = json['materialGroup'] as String?,
        materialGroupTitle = json['materialGroupTitle'] as String?,
        slug = json['slug'] as String?,
        skuCode = json['skuCode'] as String?;

  Map<String, dynamic> toJson() => {
        'storeType': storeType,
        'materialGroup': materialGroup,
        'materialGroupTitle': materialGroupTitle,
        'slug': slug,
        'skuCode': skuCode,
      };
}
