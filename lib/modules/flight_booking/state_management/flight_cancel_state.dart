/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class FlightCancelState extends ADBaseViewModel {
  ADResponseState cancelTravellerResponse = ADResponseState.init();

  List<FlightReviewDetailInfo>? flightReviewDetailModel;

  FlightCancelState({this.flightReviewDetailModel});

  void updateTravellerSelection(
    PassengerTicketInfo? passengerTicketInfo, {
    required bool value,
  }) {
    passengerTicketInfo?.cancellablePaxInfoList?.status = value;
    notifyListeners();
  }

  PaxTuple get tuple => isSelectionValid();

  ///use to get all the selected pax only together on all journey
  List<PassengerTicketInfo> selectedPaxToCancel() {
    final List<FlightReviewDetailInfo> _flightReviewDetailModel =
        flightReviewDetailModel ?? [];
    final List<PassengerTicketInfo> _selectedPax = [];
    for (final flightJourneyObject in _flightReviewDetailModel) {
      final List<PassengerTicketInfo> passengerTicketInfoList =
          flightJourneyObject.passengerListInJourney?.cancellablePaxInfoList ??
              [];
      for (final paxObject in passengerTicketInfoList) {
        if (paxObject.cancellablePaxInfoList?.status ?? false) {
          _selectedPax.add(paxObject);
        }
      }
    }
    return _selectedPax;
  }

  ///Selected adult to cancel should always have similar number of infant as well
  PaxTuple isSelectionValid() {
    final List<FlightReviewDetailInfo> _flightReviewDetailModel =
        flightReviewDetailModel ?? [];

    final List<PassengerTicketInfo> _selectedPax = [];

    for (final flightJourneyObject in _flightReviewDetailModel) {
      final List<PassengerTicketInfo> passengerTicketInfoList =
          flightJourneyObject.passengerListInJourney?.cancellablePaxInfoList ??
              [];

      int unselectedAdultCount = 0;
      int unselectedInfantCount = 0;
      int unselectedChildCount = 0;

      for (final paxObject in passengerTicketInfoList) {
        if ((paxObject.cancellablePaxInfoList?.passengerTypeCode ==
                kAdultCode) &&
            !(paxObject.cancellablePaxInfoList?.status ?? false)) {
          unselectedAdultCount = unselectedAdultCount + 1;
        } else if ((paxObject.cancellablePaxInfoList?.passengerTypeCode ==
                kChildCode) &&
            !(paxObject.cancellablePaxInfoList?.status ?? false)) {
          unselectedChildCount = unselectedChildCount + 1;
        } else if ((paxObject.cancellablePaxInfoList?.passengerTypeCode ==
                kInfantCode) &&
            !(paxObject.cancellablePaxInfoList?.status ?? false)) {
          unselectedInfantCount = unselectedInfantCount + 1;
        }

        if (paxObject.cancellablePaxInfoList?.status ?? false) {
          _selectedPax.add(paxObject);
        }
      }

      ///Number of adult traveller should always be greater then or equal to child.
      if (unselectedChildCount != 0 && unselectedAdultCount == 0) {
        return PaxTuple(
          selectedPax: _selectedPax,
          isAdultInfantCaseValid: true,
          isAdultChildCaseValid: false,
          isEmpty: false,
        );
      }

      ///Number of adult traveller should always be greater then or equal to infants.
      if (unselectedAdultCount < unselectedInfantCount) {
        return PaxTuple(
          selectedPax: _selectedPax,
          isAdultInfantCaseValid: false,
          isAdultChildCaseValid: true,
          isEmpty: false,
        );
      }
    }

    ///All empty case
    if (_selectedPax.isEmpty) {
      return PaxTuple(
        selectedPax: _selectedPax,
        isAdultInfantCaseValid: false,
        isAdultChildCaseValid: false,
        isEmpty: true,
      );
    }

    ///All valid case
    return PaxTuple(
      selectedPax: _selectedPax,
      isAdultInfantCaseValid: true,
      isAdultChildCaseValid: true,
      isEmpty: false,
    );
  }
}

class PaxTuple {
  final List<PassengerTicketInfo> selectedPax;
  final bool isAdultInfantCaseValid;
  final bool isAdultChildCaseValid;
  final bool isEmpty;

  PaxTuple({
    required this.selectedPax,
    required this.isAdultInfantCaseValid,
    required this.isAdultChildCaseValid,
    required this.isEmpty,
  });
}
