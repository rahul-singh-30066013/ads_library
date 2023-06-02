/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/saved_flight_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/repositories/flight_status_repository.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedFlightState extends ADBaseViewModel {
  final FlightStatusRepository _flightStatusRepository =
      FlightStatusRepository();

  ADResponseState flightListState = ADResponseState.loading();
  ADResponseState paginationState = ADResponseState.init();

  SavedFlightModel savedFlightResponse = const SavedFlightModel();

  bool isPullToRefresh = false;

  ///controller added to reset the position of saved flight tile
  ///when swiped for deleting/removal from list
  List<ScrollController> listingControllers = [];

  ///swiped index gets stored when user swipes tile for deletion
  int? swipedItemIndex;

  void setValueForPullToRefresh({required bool value}) {
    isPullToRefresh = value;
    notifyListeners();
  }

  /// this is use for get saved flight
  Future<void> getSavedFlightApi({
    int? pageIndex,
    int? pageSize,
    String? language,
  }) async {
    if (!isPullToRefresh) {
      if (savedFlightResponse.flights.isEmpty) {
        flightListState.viewStatus = Status.loading;
      } else {
        paginationState.viewStatus = Status.loading;
      }
      notifyListeners();
    }

    await _flightStatusRepository
        .getSavedFlight(
          pageIndex: pageIndex,
          pageSize: pageSize,
          language: language,
        )
        .then((value) => _updateResponseSavedFlightList(value));
  }

  ///It will update get profile ADResponseState
  void _updateResponseSavedFlightList(ADResponseState response) {
    // if (isPullToRefresh) {
    //   isPullToRefresh = false;
    //   // savedFlightResponse = response.data;
    // }

    if (response.viewStatus == Status.complete && response.data != null) {
      if (savedFlightResponse.flights.isEmpty) {
        savedFlightResponse = response.data;
        flightListState.viewStatus = Status.complete;
      } else {
        if (isPullToRefresh) {
          isPullToRefresh = false;
          savedFlightResponse = response.data;
        } else {
          final SavedFlightModel model = response.data;
          savedFlightResponse.flights.addAll(model.flights);
          paginationState.viewStatus = Status.complete;
        }
      }
      addListingController();
      notifyListeners();
    } else if (response.viewStatus == Status.error) {
      flightListState.viewStatus = Status.error;
      if (response.errorCode != null) {
        flightListState
          ..errorCode = response.errorCode
          ..message = response.message;
      }
      notifyListeners();
    }
  }

  void addListingController() {
    listingControllers = [];
    for (var index = 0; index < savedFlightResponse.flights.length; index++) {
      listingControllers.add(
        ScrollController()
          ..addListener(() {
            if (swipedItemIndex != null) {
              listingControllers[swipedItemIndex ?? 0].position.animateTo(
                    0,
                    duration: const Duration(
                      milliseconds: 20,
                    ),
                    curve: Curves.easeOut,
                  );
            }
          }),
      );
    }
  }

  void updateSwipedIndex(int? index) {
    swipedItemIndex = index;
    notifyListeners();
  }

  /// this is use for get saved flight
  Future<void> deleteSavedFlightApi({
    required BuildContext context,
    String? cartId,
    required int index,
  }) async {
    final SavedFlightListData savedFlightData =
        savedFlightResponse.flights[index];
    savedFlightResponse.flights[index] =
        savedFlightData.copyWith(isSelected: true);
    notifyListeners();
    await _flightStatusRepository
        .deleteSavedFlight(
      cardId: cartId,
    )
        .then((value) {
      if (value.viewStatus == Status.complete) {
        const duration = 3000;
        savedFlightResponse.flights[index] =
            savedFlightData.copyWith(isSelected: false);
        SnackBarUtil.showSnackBar(
          context,
          '${'flight'.localize(context)} ${savedFlightData.flightNo} ${'successfully_removed_from_savedFlight'.localize(context)}',
          duration,
        );
        context.read<FlightCommonState>().callSavedFlightApi();
        notifyListeners();
      }
    });
  }
}
