/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:intl/intl.dart';

///This will used to create FlightFareCalenderRequestBody
class FlightFareCalenderRequestBody {
  FlightFareCalenderRequestBody({
    List<CalenderOriginDestinationInformation>? originDestinationInformation,
    List<CalenderPassengers>? passengers,
  }) {
    _originDestinationInformation = originDestinationInformation;
    _passengers = passengers;
  }

  List<CalenderOriginDestinationInformation>? _originDestinationInformation;
  List<CalenderPassengers>? _passengers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_originDestinationInformation != null) {
      map['OriginDestinationInformation'] =
          _originDestinationInformation?.map((v) => v.toJson()).toList();
    }
    if (_passengers != null) {
      map['Passengers'] = _passengers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Type : "ADT"
/// Count : 2
class CalenderPassengers {
  CalenderPassengers({
    String? type,
    int? count,
  }) {
    _type = type;
    _count = count;
  }

  CalenderPassengers.fromJson(Map<String, dynamic> json) {
    _type = json['Type'];
    _count = json['Count'];
  }
  String? _type;
  int? _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Type'] = _type;
    map['Count'] = _count;
    return map;
  }
}

/// DepartureDateTime : {"WindowAfter":"25-01-2022","WindowBefore":"25-01-2023"}
/// OriginLocation : {"LocationCode":"DEL"}
/// DestinationLocation : {"LocationCode":"BLR"}
class CalenderOriginDestinationInformation {
  CalenderOriginDestinationInformation({
    CalenderDepartureDateTime? departureDateTime,
    CalenderLocation? originLocation,
    CalenderLocation? destinationLocation,
  }) {
    _departureDateTime = departureDateTime;
    _originLocation = originLocation;
    _destinationLocation = destinationLocation;
  }

  CalenderOriginDestinationInformation.fromJson(Map<String, dynamic> json) {
    _departureDateTime = json['DepartureDateTime'] != null
        ? CalenderDepartureDateTime.fromJson(json['DepartureDateTime'])
        : null;
    _originLocation = json['OriginLocation'] != null
        ? CalenderLocation.fromJson(json['OriginLocation'])
        : null;
    _destinationLocation = json['DestinationLocation'] != null
        ? CalenderLocation.fromJson(json['DestinationLocation'])
        : null;
  }
  CalenderDepartureDateTime? _departureDateTime;
  CalenderLocation? _originLocation;
  CalenderLocation? _destinationLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_departureDateTime != null) {
      map['DepartureDateTime'] = _departureDateTime?.toJson();
    }
    if (_originLocation != null) {
      map['OriginLocation'] = _originLocation?.toJson();
    }
    if (_destinationLocation != null) {
      map['DestinationLocation'] = _destinationLocation?.toJson();
    }
    return map;
  }
}

/// LocationCode : "DEL"
class CalenderLocation {
  CalenderLocation({
    String? locationCode,
    String? countryCode,
  }) {
    _locationCode = locationCode;
    _countryCode = countryCode;
  }

  CalenderLocation.fromJson(Map<String, dynamic> json) {
    _locationCode = json['LocationCode'];
    _countryCode = json['countryCode'];
  }
  String? _locationCode;
  String? _countryCode;

  String? get locationCode => _locationCode;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LocationCode'] = _locationCode;
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// WindowAfter : "25-01-2022"
/// WindowBefore : "25-01-2023"
class CalenderDepartureDateTime {
  CalenderDepartureDateTime({
    String? windowAfter,
    String? windowBefore,
  }) {
    _windowAfter = windowAfter;
    _windowBefore = windowBefore;
  }

  CalenderDepartureDateTime.fromJson(Map<String, dynamic> json) {
    _windowAfter = json['WindowAfter'];
    _windowBefore = json['WindowBefore'];
  }
  String? _windowAfter;
  String? _windowBefore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['WindowAfter'] = _windowAfter;
    map['WindowBefore'] = _windowBefore;
    return map;
  }
}

//this will create request body for fare calender api
class CreateFlightFareCalenderRequestBody {
  final String jsonBody;

  CreateFlightFareCalenderRequestBody({
    required this.jsonBody,
  });

  // Request model-fare calender
  factory CreateFlightFareCalenderRequestBody.fromBookingObject({
    required FlightBookingModel flightBookingModel,
    bool? isForArrival,
    DateTime? startDate,
    DateTime? endDate,
    bool? forOneAdultOnly,
  }) {
    final windowAfter = startDate ?? DateTime.now();
    final windowBefore = endDate ??
        DateTime.now().add(const Duration(days: kFareCalendarPricesDays));
    final formatter = DateFormat(Constant.dateFormat5);

    final forOneAdult = forOneAdultOnly ?? false;

    ///Passengers data - list
    final CalenderPassengers adtPassengers = CalenderPassengers(
      count: forOneAdult ? 1 : flightBookingModel.travellers?.adults,
      type: 'ADT',
    );
    final CalenderPassengers chdPassengers = CalenderPassengers(
      count: forOneAdult ? 0 : flightBookingModel.travellers?.children,
      type: 'CHD',
    );
    final CalenderPassengers infPassengers = CalenderPassengers(
      count: forOneAdult ? 0 : flightBookingModel.travellers?.infants,
      type: 'INF',
    );

    final List<CalenderPassengers> passengersList = [
      adtPassengers,
      chdPassengers,
      infPassengers,
    ];

    /// List Of OriginDestinationInformation
    final List<CalenderOriginDestinationInformation> originDestinationInfoList =
        [];

    final CalenderDepartureDateTime departureDateTime =
        CalenderDepartureDateTime(
      windowAfter: formatter.format(windowAfter),
      windowBefore: formatter.format(windowBefore),
    );

    CalenderLocation originLocation;
    CalenderLocation destinationLocation;

    if (isForArrival ?? false) {
      originLocation = CalenderLocation(
        locationCode: flightBookingModel.oneWayTrip?.toCity?.cityCode,
        countryCode: flightBookingModel.oneWayTrip?.toCity?.countryCode,
      );
      destinationLocation = CalenderLocation(
        locationCode: flightBookingModel.oneWayTrip?.fromCity?.cityCode,
        countryCode: flightBookingModel.oneWayTrip?.fromCity?.countryCode,
      );
    } else {
      originLocation = CalenderLocation(
        locationCode: flightBookingModel.oneWayTrip?.fromCity?.cityCode,
        countryCode: flightBookingModel.oneWayTrip?.fromCity?.countryCode,
      );
      destinationLocation = CalenderLocation(
        locationCode: flightBookingModel.oneWayTrip?.toCity?.cityCode,
        countryCode: flightBookingModel.oneWayTrip?.toCity?.countryCode,
      );
    }

    final CalenderOriginDestinationInformation
        originDestinationInformationOneWay =
        CalenderOriginDestinationInformation(
      departureDateTime: departureDateTime,
      destinationLocation: destinationLocation,
      originLocation: originLocation,
    );

    originDestinationInfoList.add(originDestinationInformationOneWay);

    final FlightFareCalenderRequestBody flightFareCalenderRequestBody =
        FlightFareCalenderRequestBody(
      originDestinationInformation: originDestinationInfoList,
      passengers: passengersList,
    );

    return CreateFlightFareCalenderRequestBody(
      jsonBody: jsonEncode(flightFareCalenderRequestBody),
    );
  }
}
