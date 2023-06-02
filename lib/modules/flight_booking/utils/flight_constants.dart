/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/generic_bottom_sheet.dart';

const kAdult = 'adult';
const kChild = 'child';
const kInfant = 'infant';
const kAdultCode = 'ADT';
const kChildCode = 'CHD';
const kInfantCode = 'INF';
const kMstr = 'Mstr';
const kMiss = 'Miss';
const kMr = 'Mr';
const kMs = 'Ms';
const kMrs = 'Mrs';
const keyToCheckMr = 'mr';
const keyToCheckMs = 'ms';
const keyToCheckMrs = 'mrs';
const keyToCheckMale = 'mstr';
const keyToCheckFemale = 'miss';
const kNationalityCode = 'IN';
const kMrDot = 'Mr.';
const kMsDot = 'Ms.';
const kMrsDot = 'Mrs.';
const kMstrDot = 'Mstr.';

const int minimumTimeRequiredToCancel = 120;

//to show title of passenger in traveller screen
List<BottomSheetRowModel> bottomFlightSheetTitleList = [
  BottomSheetRowModel(
    text: 'mr',
  ),
  BottomSheetRowModel(
    text: 'ms',
  ),
  BottomSheetRowModel(
    text: 'mrs',
  ),
];
//to show passenger gender in traveller screen
List<BottomSheetRowModel> bottomFlightSheetGenderList = [
  BottomSheetRowModel(
    text: 'mstr',
  ),
  BottomSheetRowModel(
    text: 'miss',
  ),
];
