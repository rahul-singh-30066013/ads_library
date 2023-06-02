/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/other_services_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/generic_bottom_sheet.dart';

List<BottomSheetRowModel> bottomSheetTitleList = [
  BottomSheetRowModel(
    text: 'Mr.',
  ),
  BottomSheetRowModel(
    text: 'Ms.',
  ),
  BottomSheetRowModel(
    text: 'Mrs.',
  ),
];
const String pinCodeRegexIndia = '^((?!(0))[0-9]{6})';
const String pinCodeRegexApartFromIndia = '^[a-zA-Z0-9]{5,10}';

List<OtherServices> otherServicesList = [
  OtherServices(
    'Baby Strollers',
    'Can I make changes after two days of booking?',
    'lib/assets/images/pranaam/baby_strollers.png',
  ),
  OtherServices(
    'Kids Area',
    'Can I make changes after two days of booking?',
    'lib/assets/images/pranaam/baby_strollers.png',
  ),
];

///SiteCore API constants
const String itemKey = 'item';
const String siteCoreLanguageKey = 'sc_lang';
const String siteCoreDefaultLanguageValue = 'en';
const String siteCoreApiKey = 'sc_apikey';
const String isCallFromAppKey = 'isApp';
const String isCallNotFromAppValue = 'false';
const String isCallFromAppValue = 'true';
const String listsKey = 'lists';
const String listsDefaultValue = 'all';
const String countryCodeKey = 'countrycode';
const String stateCodeKey = 'statecode';
const String cityCode = 'citycode';
const String infotype = 'infotype';
const String insurance = 'insurance';
const String zeroCancellation = 'zeroCancellation';
const String status = 'status';
