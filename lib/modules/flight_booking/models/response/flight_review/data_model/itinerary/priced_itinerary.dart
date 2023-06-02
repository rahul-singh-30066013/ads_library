/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight segment-itinerary

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/air_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/air_itinerary_pricing_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/mini_rule.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/security_key.dart';

class PricedItinerary {
  PricedItinerary({
    this.airItinerary,
    this.airItineraryPricingInfo,
    this.directionInd,
    this.securityKey,
    this.miniRule,
    this.sequenceNumber,
    this.sectorInd,
  });

  final MiniRule? miniRule;
  final String? sequenceNumber;
  final AirItinerary? airItinerary;
  final AirItineraryPricingInfo? airItineraryPricingInfo;
  final String? directionInd;
  final String? sectorInd;
  final SecurityKey? securityKey;

  String get combinedAirlineCode =>
      airItinerary?.combinedOperatingAirline ?? '';

  ///used to get the standard departure time in local time zone
  DateTime get departureEPOCHTime => DateTime.fromMillisecondsSinceEpoch(
        int.parse(
          airItinerary?.firstFlightDetails.flightSegment?.first
                  .departureTimeEpoch ??
              '0',
        ),
        isUtc: true,
      );

  ///used to get the standard arrival time in local time zone
  DateTime get arrivalEPOCHTime => DateTime.fromMillisecondsSinceEpoch(
        int.parse(
          airItinerary
                  ?.firstFlightDetails.flightSegment?.last.arrivalTimeEpoch ??
              '0',
        ),
        isUtc: true,
      );

  AirItinerary get itinerary => airItinerary ?? AirItinerary();

  AirItineraryPricingInfo get priceInfo =>
      airItineraryPricingInfo ?? AirItineraryPricingInfo();

  bool get isDomestic => sectorInd?.toLowerCase() == 'd';

  ///This is to find the trip is international roundTrip or Oneway
  bool get isInternationRoundTrip => directionInd?.toLowerCase() == 'r';

  ///This is to find the complete trip is having multi carrier or not
  // bool get isMultiCarrier => itinerary.isMultiCarrier;

  PricedItinerary copyWith({
    AirItinerary? airItinerary,
    AirItineraryPricingInfo? airItineraryPricingInfo,
    String? directionInd,
    SecurityKey? securityKey,
  }) =>
      PricedItinerary(
        airItinerary: airItinerary ?? this.airItinerary,
        airItineraryPricingInfo:
            airItineraryPricingInfo ?? this.airItineraryPricingInfo,
        directionInd: directionInd ?? this.directionInd,
        securityKey: securityKey ?? this.securityKey,
      );

  factory PricedItinerary.fromJson(Map<String, dynamic> json) =>
      PricedItinerary(
        airItinerary: json['airItinerary'] == null
            ? null
            : AirItinerary.fromJson(json['airItinerary']),
        airItineraryPricingInfo: json['airItineraryPricingInfo'] == null
            ? null
            : AirItineraryPricingInfo.fromJson(json['airItineraryPricingInfo']),
        directionInd: json['directionInd'],
        sectorInd: json['sectorInd'],
        securityKey: json['securityKey'] == null
            ? null
            : SecurityKey.fromJson(json['securityKey']),
        miniRule: json['miniRule'] != null
            ? MiniRule.fromJson(json['miniRule'])
            : null,
        sequenceNumber: json['sequenceNumber'],
      );
}
