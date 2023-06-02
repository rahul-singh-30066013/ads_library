/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';

///this class is used to create FlightCreateItineraryRequestModel to use as request body in create itinerary
const String fareClass = 'R';

class FlightCreateItineraryRequestModel {
  FlightCreateItineraryRequestModel({
    String? journeyKey,
    List<Flights>? flights,
  }) {
    _journeyKey = journeyKey;
    _flights = flights;
  }

  String? _journeyKey;
  List<Flights>? _flights;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_flights != null) {
      map['flights'] = _flights?.map((v) => v.toJson()).toList();
    }
    map['journeyKey'] = _journeyKey;
    return map;
  }

  factory FlightCreateItineraryRequestModel.createRequestBody({
    required SelectedFlightModel selectedFlightModel,
  }) {
    /// List Of OriginDestinationInformation
    final List<Flights> flightInfoList = [];
    String journeyKey = '';

    if (selectedFlightModel.isRoundTrip &&
        selectedFlightModel.pricedItinerary != null) {
      ///Special fare case Round Trip only

      journeyKey =
          selectedFlightModel.pricedItinerary?.itinerary.journeyKey ?? '';

      final OnwardFare onewayFare = OnwardFare(
        fareClass: fareClass,
        fareKey: selectedFlightModel.pricedItinerary?.itinerary
                .originDestinationOption?.first.fareKey ??
            '',
        price:
            selectedFlightModel.pricedItinerary?.priceInfo.totalFare?.amount ??
                0,
      );
      final OnwardFare returnFare = OnwardFare(
        fareClass: fareClass,
        fareKey: selectedFlightModel.pricedItinerary?.itinerary
                .originDestinationOption?.last.fareKey ??
            '',
        price:
            selectedFlightModel.pricedItinerary?.priceInfo.totalFare?.amount ??
                0,
      );

      flightInfoList.add(
        Flights(
          onwardFare: onewayFare,
          returnFare: returnFare,
        ),
      );
    } else if (selectedFlightModel.isRoundTrip &&
        selectedFlightModel.pricedItineraryList != null) {
      ///Normal fare case Round Trip
      journeyKey =
          selectedFlightModel.pricedItineraryList?.first.itinerary.journeyKey ??
              '';

      final OnwardFare onewayFare = OnwardFare(
        fareClass: fareClass,
        fareKey: selectedFlightModel.pricedItineraryList?.first.itinerary
                .originDestinationOption?.first.fareKey ??
            '',
        price: selectedFlightModel
                .pricedItineraryList?.first.priceInfo.totalFare?.amount ??
            0,
      );
      final OnwardFare returnFare = OnwardFare(
        fareClass: fareClass,
        fareKey: selectedFlightModel.pricedItineraryList?.last.itinerary
                .originDestinationOption?.first.fareKey ??
            '',
        price: selectedFlightModel
                .pricedItineraryList?.last.priceInfo.totalFare?.amount ??
            0,
      );

      flightInfoList.add(
        Flights(
          onwardFare: onewayFare,
          returnFare: returnFare,
        ),
      );
    } else {
      ///Normal fare case One Way Trip

      journeyKey =
          selectedFlightModel.pricedItinerary?.itinerary.journeyKey ?? '';

      final OnwardFare onewayFare = OnwardFare(
        fareClass: fareClass,
        fareKey: selectedFlightModel.pricedItinerary?.itinerary
                .originDestinationOption?.first.fareKey ??
            '',
        price:
            selectedFlightModel.pricedItinerary?.priceInfo.totalFare?.amount ??
                0,
      );

      flightInfoList.add(
        Flights(onwardFare: onewayFare),
      );
    }

    return FlightCreateItineraryRequestModel(
      journeyKey: journeyKey,
      flights: flightInfoList,
    );
  }

  ///Sample Request model
  String get createItineraryRequestBody => jsonEncode(this);
}

/// flight object including onward/return

class Flights {
  Flights({
    OnwardFare? onwardFare,
    OnwardFare? returnFare,
  }) {
    _onwardFare = onwardFare;
    _returnFare = returnFare;
  }

  OnwardFare? _onwardFare;
  OnwardFare? _returnFare;

  OnwardFare? get onwardFare => _onwardFare;

  OnwardFare? get returnFare => _returnFare;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_onwardFare != null) {
      map['onwardFare'] = _onwardFare?.toJson();
    }
    if (_returnFare != null) {
      map['returnFare'] = _returnFare?.toJson();
    }
    return map;
  }
}

//flight fare info object create here to sent in  itinerary request body

class OnwardFare {
  OnwardFare({
    String? fareKey,
    String? fareClass,
    double? price,
  }) {
    _fareKey = fareKey;
    _fareClass = fareClass;
    _price = price;
  }

  String? _fareKey;
  String? _fareClass;
  double? _price;

  String? get fareKey => _fareKey;

  String? get fareClass => _fareClass;

  double? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fareKey'] = _fareKey;
    map['fareClass'] = _fareClass;
    map['price'] = _price;
    return map;
  }
}

//this class will used to pass data from search screen to review screen
class SelectedFlightModel {
  final List<PricedItinerary>? pricedItineraryList;
  final PricedItinerary? pricedItinerary;
  final bool isRoundTrip;

  SelectedFlightModel({
    this.pricedItineraryList,
    this.pricedItinerary,
    required this.isRoundTrip,
  });

  PricedItinerary get _pricedItinerary => pricedItinerary ?? PricedItinerary();
  List<PricedItinerary> get _pricedItineraryList =>
      pricedItineraryList ?? [PricedItinerary()];

  List<PricedItinerary> get priceList =>
      (isRoundTrip && pricedItineraryList != null)
          ? _pricedItineraryList
          : [_pricedItinerary];

  factory SelectedFlightModel.forOnWayFareSelection({
    required PricedItinerary oneWaySelectedPricedItinerary,
  }) {
    return SelectedFlightModel(
      pricedItinerary: oneWaySelectedPricedItinerary,
      isRoundTrip: false,
    );
  }

  factory SelectedFlightModel.forNormalFareSelection({
    required PricedItinerary oneWaySelectedPricedItinerary,
    required PricedItinerary roundTripSelectedPricedItinerary,
  }) {
    return SelectedFlightModel(
      pricedItineraryList: [
        oneWaySelectedPricedItinerary,
        roundTripSelectedPricedItinerary,
      ],
      isRoundTrip: true,
    );
  }

  factory SelectedFlightModel.forSpecialFareSelection({
    required PricedItinerary selectedSpecialPricedItinerary,
  }) {
    return SelectedFlightModel(
      pricedItinerary: selectedSpecialPricedItinerary,
      isRoundTrip: true,
    );
  }
}
