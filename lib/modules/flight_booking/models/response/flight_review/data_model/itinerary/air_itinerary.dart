/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/origin_destination_option.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';

class AirItinerary {
  AirItinerary({
    this.journeyKey,
    this.originDestinationOption,
    this.combinedOperatingAirline,
  });

  final String? journeyKey;
  final List<OriginDestinationOption>? originDestinationOption;
  final String? combinedOperatingAirline;

  OriginDestinationOption get firstFlightDetails =>
      originDestinationOption?.first ??
      OriginDestinationOption(directionInd: '');

  OriginDestinationOption get lastFlightDetails =>
      originDestinationOption?.last ??
      OriginDestinationOption(directionInd: '');

  int get multiCarrierFlights {
    int _multiCarrier = 0;
    if (originDestinationOption != null) {
      originDestinationOption?.forEach((element) {
        if (element.isMultiCarrier > 0) {
          _multiCarrier = _multiCarrier + 1;
        }
      });
    }
    return _multiCarrier;
  }

  String get uniqueKey {
    String _uniqueKey = '';
    if (originDestinationOption != null) {
      originDestinationOption?.forEach((element) {
        _uniqueKey = _uniqueKey + element.uniqueKey;
      });
    }
    return _uniqueKey;
  }

  bool get isTerminalChange {
    final flights = originDestinationOption ?? [];
    for (final element in flights) {
      if (element.isTerminalChange) {
        return true;
      }
    }
    return false;
  }

  bool get isAirportChange {
    final flights = originDestinationOption ?? [];
    for (final element in flights) {
      if (element.isAirportChange) {
        return true;
      }
    }
    return false;
  }

  ///This is to find the complete trip is having multi carrier or not
  // bool get isMultiCarrier {
  //   bool _isMultiCarrier = false;
  //   if (originDestinationOption != null) {
  //     for (final OriginDestinationOption element
  //         in originDestinationOption ?? []) {
  //       final isMulti = element.isMultiCarrier;
  //       if (isMulti) {
  //         _isMultiCarrier = isMulti;
  //         break;
  //       }
  //     }
  //   }
  //   return _isMultiCarrier;
  // }

  AirItinerary copyWith({
    String? journeyKey,
    List<OriginDestinationOption>? originDestinationOption,
  }) =>
      AirItinerary(
        journeyKey: journeyKey ?? this.journeyKey,
        originDestinationOption:
            originDestinationOption ?? this.originDestinationOption,
      );

  factory AirItinerary.fromJson(Map<String, dynamic> json) {
    final List<OriginDestinationOption> originDestinationOption = [];
    final operatingAirline = <dynamic>{};
    final List listObject = json['originDestinationOption'] as List;
    for (int index = 0; index < listObject.length; index++) {
      final originDestinationObj =
          OriginDestinationOption.fromJson(listObject[index]);
      originDestinationOption.add(originDestinationObj);
      final added =
          operatingAirline.add(originDestinationObj.combinedOperatingAirline);
      adLog('$added');
    }
    adLog('$operatingAirline');
    return AirItinerary(
      journeyKey: json['journeyKey'],
      originDestinationOption: originDestinationOption,
      combinedOperatingAirline: operatingAirline.join(),
    );
  }
}
