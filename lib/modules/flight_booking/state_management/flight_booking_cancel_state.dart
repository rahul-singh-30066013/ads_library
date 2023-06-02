/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_booking_cancel_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancellation_reason_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/flight_fare_info_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// this class is used to manage the state of flight booking cancel Screen.
class FlightBookingCancelState extends BaseViewModel {
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  FlightViewTripResponseModel? flightBookingResponseModel;
  CancellationReasonResponseModel? cancellationReasonResponseModel;

  FlightFareInfoResponseModel? flightFareInfoResponseModel;

  /// Initiate loading state for api hit
  ADResponseState flightFairInfo = ADResponseState.loading();

  ///It will provide details related itinerary
  /* Future<void> viewTripDetails(
    String tripId,
  ) async {
    await _flightBookingRepository.viewTrip(tripId).then((value) {
      updateTripDetailsState(value);
    });
  }*/

  ///to make cancellation for flight booking
  Future<ADResponseState> cancelFlightBooking(
    SelectedPaxTripToCancel selectedPaxTripToCancel,
  ) async {
    if (flightFairInfo.viewStatus != Status.loading) {
      flightFairInfo.viewStatus = Status.loading;
      notifyListeners();
    }
    return _flightBookingRepository.cancelFlightBooking(
      selectedPaxTripToCancel,
    );
  }

  ///to make cancellation for flight booking
  Future<void> getCancellationReasons(
    String tripId,
  ) async {
    final value = await _flightBookingRepository.getCancellationReasons(tripId);
    updateCancellationReasonsState(value);
  }

  ///to make cancellation for flight booking
  Future<void> flightRefundInfo(
    SelectedPaxTripToCancel selectedPaxTripToCancel,
  ) async {
    await _flightBookingRepository
        .flightRefundInfo(
          selectedPaxTripToCancel,
        )
        .then((value) => updateFairInfoState(value));
  }

  ///It will update ADResponseState status related view itinerary
  void updateTripDetailsState(ADResponseState response) {
    flightBookingResponseModel = response.data;
    notifyListeners();
  }

  ///It will update ADResponseState status related view fair info
  void updateFairInfoState(ADResponseState response) {
    flightFairInfo = response;
    flightFareInfoResponseModel = flightFairInfo.data;
    notifyListeners();
  }

  void updateCancellationReasonsState(ADResponseState response) {
    flightFairInfo = response;
    cancellationReasonResponseModel = flightFairInfo.data;
    notifyListeners();
  }

  void updateBookingCancellationState(ADResponseState response) {
    flightFairInfo = response;
    notifyListeners();
  }
}
