/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used for flight segment-itinerary

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/airport.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/cabin.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/ting_airline.dart';

class FlightSegment {
  final String? duration;

  FlightSegment({
    this.duration,
    this.departureAirport,
    this.arrivalAirport,
    this.marketingAirline,
    this.operatingAirline,
    this.flightNumber,
    this.departureDate,
    this.departureTime,
    this.departureTimeZone,
    this.arrivalDate,
    this.arrivalTime,
    this.arrivalTimeZone,
    this.flightId,
    this.supplier,
    this.validatingCarrier,
    this.departureNumTime,
    this.arrivalNumTime,
    this.durationNum,
    this.departureTimeEpoch,
    this.arrivalTimeEpoch,
    this.chekinBaggage,
    this.cabinBaggage,
    this.baggageInfoNote,
    this.cabin,
    this.dayChange,
    this.seat,
    this.isTerminalChange,
    this.isAirportChange,
    this.transitVisaMessage,
    this.rph,
  });

  final Airport? departureAirport;
  final Airport? arrivalAirport;
  final TingAirline? marketingAirline;
  final TingAirline? operatingAirline;
  final String? flightNumber;
  final String? departureDate;
  final String? departureTime;
  final String? departureTimeZone;
  final String? arrivalDate;
  final String? arrivalTime;
  final String? arrivalTimeZone;
  final String? flightId;
  final String? supplier;
  final String? validatingCarrier;
  final int? departureNumTime;
  final int? arrivalNumTime;
  final int? durationNum;
  final String? departureTimeEpoch;
  final String? arrivalTimeEpoch;
  final String? cabinBaggage;
  final String? chekinBaggage;
  final String? baggageInfoNote;
  final Cabin? cabin;
  final bool? dayChange;
  final int? seat;
  final bool? isTerminalChange;
  final bool? isAirportChange;
  final String? transitVisaMessage;
  final int? rph;

  FlightSegment copyWith({
    String? duration,
    Airport? departureAirport,
    Airport? arrivalAirport,
    TingAirline? marketingAirline,
    TingAirline? operatingAirline,
    String? flightNumber,
    String? departureDate,
    String? departureTime,
    String? departureTimeZone,
    String? arrivalDate,
    String? arrivalTime,
    String? arrivalTimeZone,
    String? flightId,
    String? supplier,
    String? validatingCarrier,
    int? departureNumTime,
    int? arrivalNumTime,
    int? durationNum,
    String? departureTimeEpoch,
    String? arrivalTimeEpoch,
    String? cabinBaggage,
    String? chekinBaggage,
    String? baggageInfoNote,
    Cabin? cabin,
    bool? dayChange,
    int? seat,
    bool? isTerminalChange,
    bool? isAirportChange,
    String? transitVisaMessage,
    int? rph,
  }) =>
      FlightSegment(
        duration: duration ?? this.duration,
        departureAirport: departureAirport ?? this.departureAirport,
        arrivalAirport: arrivalAirport ?? this.arrivalAirport,
        marketingAirline: marketingAirline ?? this.marketingAirline,
        operatingAirline: operatingAirline ?? this.operatingAirline,
        flightNumber: flightNumber ?? this.flightNumber,
        departureDate: departureDate ?? this.departureDate,
        departureTime: departureTime ?? this.departureTime,
        departureTimeZone: departureTimeZone ?? this.departureTimeZone,
        arrivalDate: arrivalDate ?? this.arrivalDate,
        arrivalTime: arrivalTime ?? this.arrivalTime,
        arrivalTimeZone: arrivalTimeZone ?? this.arrivalTimeZone,
        flightId: flightId ?? this.flightId,
        supplier: supplier ?? this.supplier,
        validatingCarrier: validatingCarrier ?? this.validatingCarrier,
        departureNumTime: departureNumTime ?? this.departureNumTime,
        arrivalNumTime: arrivalNumTime ?? this.arrivalNumTime,
        durationNum: durationNum ?? this.durationNum,
        departureTimeEpoch: departureTimeEpoch ?? this.departureTimeEpoch,
        arrivalTimeEpoch: arrivalTimeEpoch ?? this.arrivalTimeEpoch,
        cabinBaggage: cabinBaggage ?? this.cabinBaggage,
        chekinBaggage: chekinBaggage ?? this.chekinBaggage,
        baggageInfoNote: baggageInfoNote ?? this.baggageInfoNote,
        cabin: cabin ?? this.cabin,
        dayChange: dayChange ?? this.dayChange,
        seat: seat ?? this.seat,
        isTerminalChange: isTerminalChange ?? this.isTerminalChange,
        isAirportChange: isAirportChange ?? this.isAirportChange,
        transitVisaMessage: transitVisaMessage ?? this.transitVisaMessage,
        rph: rph ?? this.rph,
      );

  factory FlightSegment.fromJson(Map<String, dynamic> json) => FlightSegment(
        duration: json['duration'],
        departureAirport: json['departureAirport'] == null
            ? null
            : Airport.fromJson(json['departureAirport']),
        arrivalAirport: json['arrivalAirport'] == null
            ? null
            : Airport.fromJson(json['arrivalAirport']),
        marketingAirline: json['marketingAirline'] == null
            ? null
            : TingAirline.fromJson(json['marketingAirline']),
        operatingAirline: json['operatingAirline'] == null
            ? null
            : TingAirline.fromJson(json['operatingAirline']),
        flightNumber: json['flightNumber'],
        departureDate: json['departureDate'],
        departureTime: json['departureTime'],
        departureTimeZone: json['departureTimeZone'],
        arrivalDate: json['arrivalDate'],
        arrivalTime: json['arrivalTime'],
        arrivalTimeZone: json['arrivalTimeZone'],
        flightId: json['flightID'],
        supplier: json['supplier'],
        validatingCarrier: json['validatingCarrier'],
        departureTimeEpoch: json['departureTimeEpoch'],
        arrivalTimeEpoch: json['arrivalTimeEpoch'],
        departureNumTime: _getNumberTime(time: json['departureTime']),
        arrivalNumTime: _getNumberTime(time: json['arrivalTime']),
        durationNum: _getNumberDuration(duration: json['duration']),
        cabinBaggage: json['cabinBaggage'],
        chekinBaggage: json['chekinBaggage'],
        baggageInfoNote: json['baggageInfoNote'],
        cabin: json.containsKey('cabin') ? Cabin.fromJson(json['cabin']) : null,
        dayChange: json['dayChange'],
        seat: int.parse(json['seat'] ?? '0'),
        isTerminalChange: json['isTerminalChange'],
        isAirportChange: json['isAirportChange'],
        transitVisaMessage: json['transitVisaMessage'],
        rph: int.parse(json['rph'] ?? '0'),
      );

  String get uniqueKey => '$validatingCarrier$flightNumber$departureTimeEpoch';
  int get seatAvailable => (seat ?? 0).toInt();
  bool get isDayChange => dayChange ?? false;

  static int _getNumberTime({String? time}) {
    //TODO:Need to change to standard number format
    final timeStr = time ?? '';
    if (timeStr.contains(':')) {
      return int.parse(timeStr.replaceAll(':', ''));
    }
    return 0;
  }

  static int _getNumberDuration({String? duration}) {
    //TODO:Need to change to standard number format
    final durationStr = duration ?? '0';
    return int.parse(durationStr);
  }
}
