/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// TravelClass enum is used to identify the travel class type,
/// *[economy] is used for Economy class.
/// *[premiumEconomy] is used for Premium Economy class.
/// *[business] is used for Business class.
/// *[first] is used for Business class.
enum TravelClass {
  economy,
  premiumEconomy,
  business,
  first,
}

/// this TripType is used to identify the trip type,
/// *[oneWay] is used for oneway trip.
/// *[roundTrip] is used for round trip.
enum TripType {
  oneWay,
  roundTrip,
}

enum FlightSort {
  byPrice,
  byDuration,
  byTime,
}

enum SortType {
  asc,
  des,
}

enum TimeType {
  earlyMorning,
  morning,
  midDay,
  evening,
  night,
}

enum StopType {
  nonStop,
  oneStop,
  moreStop,
}

enum FlightCompany {
  indiGo,
  spicejet,
  airasia,
  vistara,
  gofirst,
  airindia,
}

/// this TripType is used to identify the trip type,
/// *[O] is used for oneway trip.
/// *[R] is used for round trip.
enum ItineraryTripType {
  O,
  R,
}

//this enum is used to check for PaxType type in booking/detail screen
enum PaxType {
  adult,
  child,
  infant,
}

enum FlightBookingType {
  confirmed,
  cancelled,
  partiallyCancelled,
  none,
}
