/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math' as math;

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/traveller_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';

//this state class is used for TravellerAndClassState
class TravellerAndClassState extends BaseViewModel {
  // A tally map to maintain count and status of each traveller type.
  Map<TravellerType, TravellerStatus> travellersTally = {};
  static const int pranaamTravellerCount = 10;
  static const int flightTravellerCount = 9;
  TravellerAndClassState({this.isPranaam = false})
      : overallTravellersCountThreshhold =
            isPranaam ? pranaamTravellerCount : flightTravellerCount;

  bool isPranaam = false;

  // Method to populate the initial data into all travellers types and class. By default it takes pre-defined values, otherwise it takes the provided values.
  void populateTravellers({
    int? adults,
    int? children,
    int? infants,
    TravelClass? travelClass,
  }) {
    final int _adultThreshhold =
        isPranaam ? pranaamTravellerCount : flightTravellerCount;
    const int _childrenThreshhold = 8;
    final int _infantsThreshhold = _adultThreshhold;
    bool _isThreshholdReached =
        (adults ?? 1) + (children ?? 0) >= overallTravellersCountThreshhold;
    overallTravellersCount = (adults ?? 1) + (children ?? 0);
    if (isPranaam) {
      _isThreshholdReached = (adults ?? 1) + (children ?? 0) + (infants ?? 0) >=
          overallTravellersCountThreshhold;
      overallTravellersCount = (adults ?? 1) + (children ?? 0) + (infants ?? 0);
    }
    final TravellerStatus _adultsStatus = TravellerStatus(
      currentCount: adults ?? 1,
      threshhold: _adultThreshhold,
      incrementEnabled:
          (adults ?? 1) < _adultThreshhold && !_isThreshholdReached,
    );
    final TravellerStatus _childrenStatus = TravellerStatus(
      currentCount: children ?? 0,
      threshhold: _childrenThreshhold,
      incrementEnabled:
          (children ?? 0) < _childrenThreshhold && !_isThreshholdReached,
    );
    final TravellerStatus _infantsStatus = isPranaam
        ? TravellerStatus(
            currentCount: infants ?? 0,
            threshhold: _infantsThreshhold,
            incrementEnabled:
                (infants ?? 0) < _infantsThreshhold && !_isThreshholdReached,
          )
        : TravellerStatus(
            currentCount: infants ?? 0,
            threshhold: _infantsThreshhold,
            incrementEnabled: (infants ?? 0) <
                math.min(_infantsThreshhold, _adultsStatus.currentCount),
          );

    travellersTally = {
      TravellerType.adults: _adultsStatus,
      TravellerType.children: _childrenStatus,
      TravellerType.infants: _infantsStatus,
    };
    currentTravelClass = travelClass ?? TravelClass.values.first;
  }

  // To maintain the present overall and maximum threshhold of number of all passangers.
  int overallTravellersCount = 1;
  final int overallTravellersCountThreshhold;

  // To maintain the traveller class.
  List<TravelClass> travelClassDomain = TravelClass.values;
  TravelClass currentTravelClass = TravelClass.values.first;

  // Method to fetch the present number of passangers for the given traveller type.
  int currentCountForPassengerType(TravellerType type) =>
      travellersTally[type]!.currentCount;

  // Method to update the icrementing status for the given traveller type.
  void updateIncrementStatusFor(
    TravellerType type,
    int ceilCount,
  ) {
    travellersTally[type]?.incrementEnabled =
        (travellersTally[type]?.currentCount ?? 0) < ceilCount;
  }

  List<TravelClass> travelClassDomainWithType({required bool isDomestic}) {
    if (isDomestic) {
      final items = List.of(TravelClass.values);
      final object = items.removeLast();
      adLog(object.toString());
      return items;
    }
    return TravelClass.values;
  }

  // Method to trigger updating the number of passengers of given traveller type, if allowed.
  void updateTravellerCount({
    required TravellerType type,
    required int count,
  }) {
    final bool isIncrementScenario =
        count > travellersTally[type]!.currentCount;
    if (!isIncrementScenario || checkForThreshhold(type)) {
      updateOverallCount(type, count, travellersTally[type]!.threshhold);
      if (type == TravellerType.adults) {
        updateOverallCount(
          TravellerType.infants,
          travellersTally[TravellerType.infants]!.currentCount,
          travellersTally[type]!.currentCount,
        );
        updateIncrementStatusFor(
          TravellerType.infants,
          travellersTally[TravellerType.adults]!.currentCount,
        );
      } else if (type == TravellerType.infants) {
        updateOverallCount(
          type,
          travellersTally[type]!.currentCount,
          travellersTally[TravellerType.adults]!.currentCount,
        );
        updateIncrementStatusFor(
          type,
          travellersTally[TravellerType.adults]!.currentCount,
        );
      }
    }
    evaluateOverallThreshhold();
    notifyListeners();
  }

  // Method to update the count for number of passengers for the given traveller type.
  void updateOverallCount(
    TravellerType type,
    int minA,
    int minB,
  ) {
    if (isPranaam) {
      overallTravellersCount -= travellersTally[type]!.currentCount;
      travellersTally[type]!.currentCount = math.min(minA, minB);
      overallTravellersCount += travellersTally[type]!.currentCount;
      return;
    }
    if (type == TravellerType.infants) {
      travellersTally[type]!.currentCount = math.min(minA, minB);
    } else {
      overallTravellersCount -= travellersTally[type]!.currentCount;
      travellersTally[type]!.currentCount = math.min(minA, minB);
      overallTravellersCount += travellersTally[type]!.currentCount;
    }
  }

  // Method to evaluate if the maximum threshhold for overall number of passangers is reached.
  void evaluateOverallThreshhold() {
    if (overallTravellersCount >= overallTravellersCountThreshhold) {
      disableAllTravellerTypes();
    } else {
      setAllTravellerTypesDefault();
    }
  }

  // Method to disbale the status of ability to increment the number of passengers/travellers of all traveller types.
  void disableAllTravellerTypes() {
    for (final element in travellersTally.entries) {
      if (element.key != TravellerType.infants) {
        travellersTally[element.key]!.incrementEnabled = false;
      }
      if (isPranaam) {
        travellersTally[element.key]!.incrementEnabled = false;
      }
    }
  }

  // Method to set the status of incremental ability of each pasanger/traveller type to default.
  // Here, default implies that each passenger/traveller type is synced up with pre-defined highest possible values.
  void setAllTravellerTypesDefault() {
    for (final element in travellersTally.entries) {
      updateIncrementStatusFor(
        element.key,
        element.key == TravellerType.infants
            ? math.min(
                travellersTally[TravellerType.adults]!.currentCount,
                travellersTally[element.key]!.threshhold,
              )
            : travellersTally[element.key]!.threshhold,
      );
    }
  }

  // Method to check if the threshhold value is reached while increment, for the given passenger/traveller type.
  bool checkForThreshhold(TravellerType type) {
    if (isPranaam) {
      return overallTravellersCount < overallTravellersCountThreshhold;
    }
    return type == TravellerType.infants ||
        overallTravellersCount < overallTravellersCountThreshhold;
  }

  // Method to evaluate the status of ability of decrementing the number of passenger/traveller, for the given type and the decremented count.
  bool isDecrementEnabled(TravellerType travellerType, int passengerCount) {
    return passengerCount > (travellerType == TravellerType.adults ? 1 : 0);
  }

  // Method to evaluate the status of ability of incrementing the number of passenger/traveller, for the given type and the incremented count.
  bool isIncrementEnabledFor(TravellerType type) {
    return travellersTally[type]!.incrementEnabled;
  }
}

// A class to maintain present number and maximum possible number of passengers of any type. And based on that, it also manages if the number can further be incremented or not.
class TravellerStatus {
  // Present number of passengers.
  int currentCount;
  // Maximum possible number of passengers.
  int threshhold;
  // If the number can be incremented or not.
  bool incrementEnabled;

  TravellerStatus({
    required this.currentCount,
    required this.threshhold,
    required this.incrementEnabled,
  });
}
