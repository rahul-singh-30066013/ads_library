/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// ServiceTypeEnum enum is used to get Travel Sectors,
/// *[departure] => Domestic and International
/// *[arrival] => Domestic and International
/// *[roundTrip] => Domestic and International
/// *[transit] => Domestic to Domestic, International to International,
/// Domestic to International and International to Domestic
enum ServiceTypeEnum {
  departure,
  arrival,
  roundTrip,
  transit,
}

enum TransitFlagsEnum {
  transitTrue,
  transitFalse,
}

const Map<TransitFlagsEnum, String> transitFlagName = {
  TransitFlagsEnum.transitTrue: '1',
  TransitFlagsEnum.transitFalse: '',
};
