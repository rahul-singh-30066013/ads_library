/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class CabConstants {
  static String cabBooking = 'cabBooking';
  static String cabTripType = 'ONE_WAY';
  static String a2c = 'A2C';
  static String c2a = 'C2A';
  static String rideNow = 'RN';
  static String rideLater = 'RL';
  static String driverAllocated = 'DA';
  static String kiosk = 'kiosk';

  ///These are default, available in remote config
  static int scheduleMinimumTimeMinutes = 15;
  static int scheduleMaximumTimeMinutes = 86400;
  static List<String> preferredVendorList = ['COR', 'MMT'];
  static bool isOneWayEnable = false;

  ///Important information replaceable TAGs
  static String distanceKey = '_DISTANCE_';
  static String pricePerKmKey = '_PRICEPERKM_';
  static String cabTypeKey = '_CABTYPE_';
  static String luggageBagsKey = '_LUGGAGEBAGS_';
  static String rideDetailSharedTimeKey = '_RIDEDETAILSHAREDTIME_';
}

///For Cab booking flow known Errors handling
enum CabBookingErrorCode {
  /// Cab Not available this Moment  Error Code
  cabB11,

  /// City OutSide Limits  Error Code
  cabB12,

  /// Selected Slot is not longer Available  at this Moments Error Code
  cabB13,

  /// Refund Amount Changed  Error Code
  cabB02,
}

extension CabBookingErrorCodeEnum on CabBookingErrorCode {
  String get name {
    switch (this) {
      case CabBookingErrorCode.cabB11:
        return 'CABB11';
      case CabBookingErrorCode.cabB12:
        return 'CABB12';
      case CabBookingErrorCode.cabB13:
        return 'CABB13';
      case CabBookingErrorCode.cabB02:
        return 'CABB02';
    }
  }
}
