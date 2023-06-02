/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:typed_data';

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:flutter/material.dart';

/// app level constants defined here
final supportedLocalesList = [
  const Locale('en', ''),
  const Locale('hi', ''),
];
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

/// app name
const appName = 'Airport App';
const kFareCalendarApiHitTime = 1;
const kFareCalendarPricesDays = 365;
ValueNotifier<bool> homeScreenScrollToTop = ValueNotifier<bool>(false);
ValueNotifier<bool> moreScreenScrollToTop = ValueNotifier<bool>(false);
ValueNotifier<bool> servicesScreenScrollToTop = ValueNotifier<bool>(false);

String otherAirport =
    '{"airportName": "","airportCode": "","airportID": "","city": "Other","details": "","airportImage": "https://www.adanione.com/-/media/Project/AdaniAirport/Header/other_new.jpg","airportThumbnailImage": "","airportAddress": "Adani Corporate House, Shantigram, Near Vaishnodevi Circle, S G Highway, Ahmedabad-382421, Gujarat, India","terminalList": "","terminalsList": [],"colorCode": "0xffC82D4A","airportIcon": "https://www.adanione.com/-/media/Project/AdaniAirport/Header/adani-logo.svg","contactDetails": {"phone": {"name": "contactnumber","title": "Contact Number","richText": "+91-79-26565555"},"email": {"name": "","title": "","richText": ""}},"airportPrefixName": ""}';

AirportItemModel? selectedAirportsData;
ValueNotifier<String> selectedAirportNotifier = ValueNotifier<String>('');
ValueNotifier<String> apiNameNotifier = ValueNotifier<String>('');
String lastSelectedAirport = '';
String clientId = 'f3d35cce-de69-45bf-958c-4a8796f8ed37';
String userAgent = 'AdaniOne Mobile App - QWRhbmlPbmUgTW9iaWxlIEFwcA==';

///Contact Detail of User for using in Help And Support
ContactDetail? contactDetail;

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
