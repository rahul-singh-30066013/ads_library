/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will ued for origin destination option for priced itinerary

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/flight_segment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/technical_stops.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';

class OriginDestinationOption {
  OriginDestinationOption({
    this.flightSegment,
    this.technicalStops,
    this.fareKey,
    this.fareRefundable,
    required this.directionInd,
    this.combinedOperatingAirline,
    this.journeyCancelable,
  });

  final List<FlightSegment>? flightSegment;
  final TechnicalStops? technicalStops;
  final String? fareKey;
  final String directionInd;
  final bool? fareRefundable;
  final String? combinedOperatingAirline;
  final bool? journeyCancelable;

  FlightSegment get flightSegmentDetails =>
      flightSegment?.first ?? FlightSegment();

  FlightSegment get getLowestSeatFlightSegment {
    final List<FlightSegment> sortedList = [...?flightSegment];
    adLog('sortedList');
    sortedList.sort((a, b) => a.seatAvailable.compareTo(b.seatAvailable));
    return sortedList.first;
  }

  int get flightDuration {
    int duration = 0;
    if (technicalStops != null && technicalStops?.stopDetail != null) {
      technicalStops?.stopDetail?.forEach((element) {
        duration = duration + element.duration;
      });
    }
    if (flightSegment != null) {
      flightSegment?.forEach((element) {
        duration = duration + (element.durationNum ?? 0);
      });
    }
    return duration;
  }

  String get uniqueKey {
    String _uniqueKey = '';
    if (flightSegment != null) {
      flightSegment?.forEach((element) {
        _uniqueKey = _uniqueKey + element.uniqueKey;
      });
    }
    return _uniqueKey;
  }

  bool get isTerminalChange {
    final flights = flightSegment ?? [];
    for (final element in flights) {
      if (element.isTerminalChange ?? false) {
        return true;
      }
    }
    return false;
  }

  bool get isAirportChange {
    final flights = flightSegment ?? [];
    for (final element in flights) {
      if (element.isAirportChange ?? false) {
        return true;
      }
    }
    return false;
  }

  ///This is to find the each journey is having multi carrier or not
  int get isMultiCarrier {
    final List<String> carrierList = [];
    int _isMultiCarrier = 0;
    if (flightSegment != null) {
      flightSegment?.forEach((element) {
        if (!carrierList.contains(element.validatingCarrier ?? '')) {
          carrierList.add(element.validatingCarrier ?? '');
        }
      });
      if (carrierList.isNotEmpty) {
        _isMultiCarrier = carrierList.length - 1;
      }
    }
    return _isMultiCarrier;
  }

  String get flightDepartureCityCode =>
      flightSegment?.first.departureAirport?.locationCode ?? '';

  String get flightDepartureCityName =>
      flightSegment?.first.departureAirport?.city ?? '';

  String get flightArrivalCityCode =>
      flightSegment?.last.arrivalAirport?.locationCode ?? '';

  String get flightArrivalCityName =>
      flightSegment?.last.arrivalAirport?.city ?? '';

  String get flightDepartureDate => flightSegment?.first.departureDate ?? '';

  String get flightDepartureEpoch =>
      flightSegment?.first.departureTimeEpoch ?? '';

  String get validatingCarrier => flightSegment?.first.validatingCarrier ?? '';

  String get flightDepartureTime => flightSegment?.first.departureTime ?? '';

  int get flightDepartureNumTime => flightSegment?.first.departureNumTime ?? 0;

  String get flightArrivalDate => flightSegment?.last.arrivalDate ?? '';

  String get flightArrivalTime => flightSegment?.last.arrivalTime ?? '';

  String get flightArrivalTimeEpoch =>
      flightSegment?.last.arrivalTimeEpoch ?? '';

  int get flightArrivalNumTime => flightSegment?.last.arrivalNumTime ?? 0;

  int get stops => technicalStops?.noOfStops ?? 0;

  OriginDestinationOption copyWith({
    List<FlightSegment>? flightSegment,
    TechnicalStops? technicalStops,
    String? fareKey,
    required String directionInd,
    bool? fareRefundable,
    bool? journeyCancelable,
  }) =>
      OriginDestinationOption(
        flightSegment: flightSegment ?? this.flightSegment,
        technicalStops: technicalStops ?? this.technicalStops,
        fareKey: fareKey ?? this.fareKey,
        directionInd: directionInd,
        fareRefundable: fareRefundable ?? this.fareRefundable,
        journeyCancelable: journeyCancelable ?? this.journeyCancelable,
      );

  factory OriginDestinationOption.fromJson(Map<String, dynamic> json) {
    final List<FlightSegment> flightSegment = [];
    final operatingAirline = <dynamic>{};
    final List listObject = json['flightSegment'] as List;
    for (int index = 0; index < listObject.length; index++) {
      final flightSegmentObj = FlightSegment.fromJson(listObject[index]);
      flightSegment.add(flightSegmentObj);
      final added =
          operatingAirline.add(flightSegmentObj.operatingAirline?.code);
      adLog('$added');
    }
    return OriginDestinationOption(
      flightSegment: flightSegment,
      technicalStops: json['technicalStops'] == null
          ? null
          : TechnicalStops.fromJson(json['technicalStops']),
      fareKey: json['fareKey'] ?? '',
      fareRefundable: json['fareRefundable'] ?? false,
      directionInd: json['directionInd'] ?? '',
      combinedOperatingAirline: operatingAirline.join(),
      journeyCancelable: json['journeyCancelable'] ?? false,
    );
  }
}
