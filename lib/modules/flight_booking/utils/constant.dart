/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:typed_data';

class Constant {
  static String dateFormat = 'dd MMM, EE';
  static String dateFormat2 = 'EE, dd MMM yy';
  static String dateFormat3 = 'dd MMM yyyy';
  static String dateFormat4 = 'dd MMM, EE, yy';
  static String dateFormat5 = 'dd-MM-yyyy';
  static String dateFormat6 = 'dd MMM, EEE';
  static String dateFormat7 = 'HH:mm';
  static String dateFormat8 = 'EE, MMM dd';
  static String dateFormat9 = 'd MMM, EEE';
  static String dateFormat10 = 'd MMM';
  static String dateFormat11 = 'dd/MM/yyyy';
  static String dateFormat12 = 'yyyy-MM-dd HH:mm:ss';
  static String dateFormat13 = 'dd MMM yyyy, hh:mm a';
  static String dateFormat14 = 'dd MMM ';
  static String dateFormat15 = 'hh:mm a';
  static String dateFormat16 = 'MM/dd/yyyy hh:mm:ss aa';
  static String dateFormat17 = 'yyyy/MM/dd';
  static String dateFormat18 = 'EE, dd MMM';
  static String dateFormat19 = 'EEE, dd MMM yyyy';
  static String dateFormat20 = 'dd MMM yyyy';
  static String dateFormat21 = 'yyyy-MM-dd';
  static String dateFormat22 = "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static String dateFormat23 = 'yyyy-MM-dd HH:mm';
  static String dateFormat24 = "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  final Uint8List kTransparentImage = Uint8List.fromList(<int>[
    0x89,
    0x50,
    0x4E,
    0x47,
    0x0D,
    0x0A,
    0x1A,
    0x0A,
    0x00,
    0x00,
    0x00,
    0x0D,
    0x49,
    0x48,
    0x44,
    0x52,
    0x00,
    0x00,
    0x00,
    0x01,
    0x00,
    0x00,
    0x00,
    0x01,
    0x08,
    0x06,
    0x00,
    0x00,
    0x00,
    0x1F,
    0x15,
    0xC4,
    0x89,
    0x00,
    0x00,
    0x00,
    0x0A,
    0x49,
    0x44,
    0x41,
    0x54,
    0x78,
    0x9C,
    0x63,
    0x00,
    0x01,
    0x00,
    0x00,
    0x05,
    0x00,
    0x01,
    0x0D,
    0x0A,
    0x2D,
    0xB4,
    0x00,
    0x00,
    0x00,
    0x00,
    0x49,
    0x45,
    0x4E,
    0x44,
    0xAE,
  ]);
}

const String phoneNumberPattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
const String emailIdPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

const String userNameRegex = '^[A-Za-z][A-Za-z0-9_]{7,29}';

/// Recent Flight city shared Preference key
const String keyToRecent = 'toRecentList';
const String keyFromRecent = 'fromRecentList';
const String keyToRecentPrannam = 'toRecentListParnam';
const String keyFromRecentPranaam = 'fromRecentListParnam';
const String keySelectedAirport = 'selectedAirport';
//Current flight booking order -TODO need to remove when we have data from api
const String keyCurrentFlightBooking = 'currentFlightBooking';
const String keyToLastSearch = 'lastSearch';

const String amexCard = r'^3[47][0-9]{0,13}$';
const String visaCard = r'^4[0-9]{1,12}(?:[0-9]{6})?$';
const String masterCard = r'^5[1-5][0-9]{0,14}$';
const String dinnerCard = r'^3(?:0[0-5]|[68][0-9])[0-9]{0,}$';
const String maestroCard = r'(5018|5020|5038|6304|6759|6761|6763)[0-9]{0,15}$';
const String rupayCard =
    r'^(508[1-9][0-9]{1})|(6069[1-9][0-9]{1})|(607[0-8][0-9]{1})|(6079[0-8][0-9]{1})|(608[0-5][0-9]{1})|(6521[0-9][0-9]{1})|(652[0-9][0-9]{1})|(6530[0-9]{1})|(6531[0-4][0-9]{1})$';
const String visaMasterCard = r'(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$';
const String upiValidate = r'^[\w.-]+@[\w]+$';
const String cardNameValidator = r'^\s+|\s+$';
const String keyCountryCodeData = 'countryCodeData';

//Checkout api Business Type
const String businessTypeFlightBooking = 'FlightBooking';
const String businessTypeCabBooking = 'CabBooking';
const String businessTypeDutyFree = 'DutyFree';
const String businessTypePranaam = 'Pranaam';
const String businessTypeRetail = 'Retail';
const String businessTypeCarParking = 'CarParking';
const String businessTypeFoodAndBeverages = 'FoodAndBeverages';

/// class to define all SharedPreferenceKeys
class SharedPreferenceKeys {
  static const String keyListOfAirports = 'listOfAirportsKey';
  static const String keyListOfAirLines = 'listOfAirlinesKey';
  static const String keyListOfCountryCodes = 'listOfCountryCodesKey';
  static const String keyMasterData = 'masterDataKey';
  static const String keyCitiesData = 'citiesDataKey';
  static const String keyListOfAdaniAirports = 'listOfAdaniAirports';

  static const String keyAirportListLastTimeStamp =
      'airportListLastTimeStampKey';
  static const String keyAirLineListLastTimeStamp =
      'airlineListLastTimeStampKey';
  static const String keyCountryCodeListLastTimeStamp =
      'countryCodeLastTimeStampKey';
  static const String keyMasterDataLastTimeStamp = 'masterDataLastTimeStampKey';
  static const String keyCitiesDataLastTimeStamp = 'citiesDataLastTimeStampKey';
  static const String keyAdaniAirportListLastTimeStamp =
      'adaniAirportListLastTimeStampKey';
  static const String keyCartCount = 'keyCartCount';
  static const String keyUpcomingInitialRemovedOrders =
      'keyUpcomingInitialRemovedOrders';
  static const String keyUpcomingFinalRemovedOrders =
      'keyUpcomingFinalRemovedOrders';
  static const String saluteStatus = 'saluteStatus';
}

class SharedPrefUtilsKeys {
  //to store-retrieve accessToken, refreshToken
  static const String accessToken = 'accessTokenKey';
  static const String refreshToken = 'refreshTokenKey';
  static const String userIDFromToken = 'userIDFromToken';
  static const String todayDate = 'todayDate';

  //to store-retrieve user detail
  static const String keyUserProfileData = 'userProfileData';
  static const String recentAddresses = 'resentAddresses';
  static const String recentAirports = 'recentAirports';
}
