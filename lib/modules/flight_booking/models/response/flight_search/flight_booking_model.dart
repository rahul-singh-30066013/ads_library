/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';

/// this is the request class that contains all the booking details.
class FlightBookingModel {
  /// *[tripType] used to identify the the trip type.
  TripType tripType;

  /// *[oneWayTrip] contains oneway trip details.
  TripDetailModel? oneWayTrip;

  /// *[oneWayTrip] contains return trip details.
  TripDetailModel? roundTrip;

  /// *[tripType] contains number of travellers and their travel class.
  Travellers? travellers;

  FlightBookingModel({
    required this.tripType,
    this.oneWayTrip,
    this.roundTrip,
    this.travellers,
  });

  FlightBookingModel copy() {
    return FlightBookingModel(
      tripType: tripType,
      oneWayTrip: oneWayTrip,
      roundTrip: roundTrip,
      travellers: travellers,
    );
  }

  bool get isDomesticDepartureCity => oneWayTrip?.fromCity?.isDomestic ?? false;
  bool get isDomesticArrivalCity => oneWayTrip?.toCity?.isDomestic ?? false;

  @override
  String toString() {
    return 'FlightBookingModel{tripType: $tripType, oneWayTrip: $oneWayTrip, '
        'roundTrip: $roundTrip, travellers: $travellers}';
  }

  factory FlightBookingModel.fromJson(Map<String, dynamic> json) {
    final String trip = json['tripType'];

    return FlightBookingModel(
      tripType: TripType.values.byName(trip),
      oneWayTrip: TripDetailModel.fromJson(json['oneWayTrip']),
      roundTrip: TripDetailModel.fromJson(json['roundTrip']),
      travellers: Travellers.fromJson(json['travellers']),
    );
  }

  Map<String, dynamic> toJson() => {
        'tripType': tripType.name,
        'oneWayTrip': oneWayTrip,
        'roundTrip': roundTrip,
        'travellers': travellers,
      };
}
