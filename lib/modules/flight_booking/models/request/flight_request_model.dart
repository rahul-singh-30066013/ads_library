/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_search_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';

//this class will used to request Flight request on flight list screen
class FlightRequestModel {
  final FlightBookingModel flightBookingModel;

  FlightRequestModel({required this.flightBookingModel});

  ///create string param for createFlightListRequestBody Request model
  String createFlightListRequestBody() {
    final ProcessingInfo processingInfo = ProcessingInfo(
      sectorInd:
          (flightBookingModel.oneWayTrip?.fromCity?.isDomestic == false ||
                  flightBookingModel.oneWayTrip?.toCity?.isDomestic == false)
              ? 'I'
              : 'D',
      tripType: flightBookingModel.tripType == TripType.oneWay ? 'O' : 'R',
      countryCode: 'IN',
    );

    final DepartureDateTime departureDateTime = DepartureDateTime(
      windowAfter: _getFormattedDate(
        flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
      ), //'13-04-2022' - to check error code
    );

    final DepartureDateTime arrivalDateTime = DepartureDateTime(
      windowAfter: _getFormattedDate(
        flightBookingModel.roundTrip?.date ?? DateTime.now(),
      ),
    );

    final OriginLocation originLocation = OriginLocation(
      locationCode: flightBookingModel.oneWayTrip?.fromCity?.cityCode,
      countryCode: flightBookingModel.oneWayTrip?.fromCity?.countryCode,
    );
    final DestinationLocation destinationLocation = DestinationLocation(
      locationCode: flightBookingModel.oneWayTrip?.toCity?.cityCode,
      countryCode: flightBookingModel.oneWayTrip?.toCity?.countryCode,
    );

    final OriginLocation originLocationRoundTrip = OriginLocation(
      locationCode: flightBookingModel.oneWayTrip?.toCity?.cityCode,
      countryCode: flightBookingModel.oneWayTrip?.toCity?.countryCode,
    );

    final DestinationLocation destinationLocationRoundTrip =
        DestinationLocation(
      locationCode: flightBookingModel.oneWayTrip?.fromCity?.cityCode,
      countryCode: flightBookingModel.oneWayTrip?.fromCity?.countryCode,
    );

    final OriginDestinationInformation originDestinationInformation =
        OriginDestinationInformation(
      departureDateTime: departureDateTime,
      destinationLocation: destinationLocation,
      originLocation: originLocation,
      rph: '1',
    );

    final OriginDestinationInformation originDestinationInformationRoundTrip =
        OriginDestinationInformation(
      departureDateTime: arrivalDateTime,
      destinationLocation: destinationLocationRoundTrip,
      originLocation: originLocationRoundTrip,
      rph: '2',
    );

    /// List Of OriginDestinationInformation
    final List<OriginDestinationInformation> originDestinationInfoList = [
      originDestinationInformation,
    ];

    /// List Of OriginDestinationInformation for round trip
    final List<OriginDestinationInformation>
        originDestinationInfoRoundTripList = [
      originDestinationInformation,
      originDestinationInformationRoundTrip,
    ];

    final FarePref farePref = FarePref(
      fareDisplayCurrency: 'INR',
    );

    final CabinPref cabinPref = CabinPref(
      cabin: flightBookingModel.travellers?.travelClassAPIValue(),
    );
    final List<CabinPref> cabinPrefList = [
      cabinPref,
    ];

    final TravelPreferences travelPreferences =
        TravelPreferences(farePref: farePref, cabinPref: cabinPrefList);

    final FlightSearchRequestModel flightSearchRequestModel =
        FlightSearchRequestModel(
      processingInfo: processingInfo,
      originDestinationInformation:
          FlightUtils.isOnewayTrip(flightBookingModel.tripType)
              ? originDestinationInfoList
              : originDestinationInfoRoundTripList,
      travelPreferences: travelPreferences,
      passengers: travellerInformation(flightBookingModel.travellers),
    );

    return jsonEncode(flightSearchRequestModel);
  }

  String? _getFormattedDate(DateTime date) {
    const int month = 10;
    return '${date.day < month ? '0${date.day}' : date.day}-${date.month < month ? '0${date.month}' : date.month}-${date.year}';
  }

  List<Passengers> travellerInformation(Travellers? passengers) {
    final List<Passengers> listOfPassengers = [];
    final Passengers adultPassengers = Passengers(
      count: flightBookingModel.travellers?.adults,
      type: 'ADT',
    );
    listOfPassengers.add(adultPassengers);
    if ((passengers?.children ?? 0) > 0) {
      final Passengers childrenPassengers = Passengers(
        count: flightBookingModel.travellers?.children,
        type: 'CHD',
      );
      listOfPassengers.add(childrenPassengers);
    }
    if ((passengers?.infants ?? 0) > 0) {
      final Passengers infantPassengers = Passengers(
        count: flightBookingModel.travellers?.infants,
        type: 'INF',
      );
      listOfPassengers.add(infantPassengers);
    }
    return listOfPassengers;
  }
}
