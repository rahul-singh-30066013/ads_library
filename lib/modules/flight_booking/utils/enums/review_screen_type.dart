// ignore_for_file: constant_identifier_names

/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// ReviewScreenType enum is used to identify the from where review details widget being called,
/// *[flightList] is used for flight list screen.
/// *[flightPayment] is used for payment screen.
enum ReviewScreenType {
  flightList,
  flightPayment,
  traveller,
}

/// PriceChangeType enum to for price change
enum PriceChangeType {
  I,
  S,
  D,
}

//to use for screen type booking order screen to show addition item on screen
enum BookingConfirmationScreenType {
  flightBookingConfirmation,
  flightBookingOrder,
}

/// BookingStatusType enum to for booking type from api
/// Z// Confirmed
// PF// Confirmed
// F// Failed
// P// Confirmed
// H// Confirmed
// Q// Cancelled
// K// Refunded
// PQ// Partially Cancelled
// PZ// Partially Booked
// PK// Partially Reschedule
// A// Awaited pnr
// PI// demo field
// ignore: non_constant_identifier_names
enum BookingStatusType {
  Z,
  F,
  P,
  H,
  Q,
  K,
  PQ,
}

enum GenericBottomSheetScreenType {
  flightTraveller,
  pranaamService,
}

/// loyalty component enum
enum LoyaltyShowScreenType {
  flight,
  pranaam,
  dutyFree,
}

enum PromoType {
  ADL,
  MERCHANT,
  INSTANT_BANK_DISCOUNT,
  CASH_BACK,
  REWARD_POINTS
}

enum PaymentErrorCodes {
  flight_booking_price_increased,
  flight_booking_price_decreased,
  flight_booking_check_price_failed,
  cab_unavailable_intercity,
  cab_time_difference,
  invalid_vpa
}
