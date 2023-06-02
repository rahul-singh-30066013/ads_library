/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/request_models/add_flight_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/repositories/flight_status_repository.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class FlightStatusDetailState extends ADBaseViewModel {
  final FlightStatusRepository _flightListingRepository =
      FlightStatusRepository();

  DateTime _date = DateTime.now();
  FlightType _flightType = FlightType.arrival;
  DateTime _lastUpdatedTime = DateTime.now();
  String _searchItem = '';
  FlightStatusSegment flightStatusSegment = const FlightStatusSegment();
  bool _isAbsorbing = false;
  bool _isFlightAdding = false;

  DateTime get date => _date;

  FlightType get flightType => _flightType;

  DateTime get lastUpdatedTime => _lastUpdatedTime;

  String get searchItem => _searchItem;

  bool get isAbsorbing => _isAbsorbing;

  bool get isFlightAdding => _isFlightAdding;
  String cityCode = 'BOM';

  /// Initiate loading state for api hit
  ADResponseState flightStatusState = ADResponseState.init();

  ///It will update airport flight data of ADResponseState
  void updateFlightListState(ADResponseState response) {
    flightStatusState = response;
    notifyListeners();
  }

  /// Date update
  void updateDetailedData({
    required FlightStatusDetailModel flightStatusDetailModel,
  }) {
    _date = flightStatusDetailModel.flightStatusStorageModel.date;
    _flightType = flightStatusDetailModel.flightStatusStorageModel.flightType;
    _searchItem = flightStatusDetailModel.flightNumber;
    _lastUpdatedTime =
        flightStatusDetailModel.flightStatusStorageModel.lastUpdatedTime;
    notifyListeners();
    getFilteredSegment(flightStatusDetailModel: flightStatusDetailModel);
    if (flightStatusDetailModel.isNeedToUpdate) {
      updateFlightSegment();
    }
  }

  void getFilteredSegment({
    required FlightStatusDetailModel flightStatusDetailModel,
  }) {
    flightStatusSegment = flightStatusDetailModel.selectedFlightStatusSegment;
    notifyListeners();
  }

  Future<void> updateFlightSegment({
    bool isFromPullToRefresh = false,
  }) async {
    if (!isFromPullToRefresh) {
      updateFlightListState(ADResponseState.loading());
    }
    _isAbsorbing = true;
    notifyListeners();
    final Map<String, dynamic> queryParams = {};
    queryParams['flightType'] =
        flightType == FlightType.arrival ? 'Arrival' : 'Departure';
    queryParams['Search'] = searchItem;
    queryParams['Terminal'] = '';
    queryParams['flightDate'] = DateFormat(Constant.dateFormat5).format(
      date,
    );

    final response = await _flightListingRepository.fetchFlightStatusList(
      queryParameters: queryParams,
      cityCode: cityCode,
    );
    _lastUpdatedTime = DateTime.now();
    _isAbsorbing = false;
    updateFlightListState(response);
  }

  Future<void> addFlight({
    required FlightStatusDetailModel flightStatusDetailModel,
    required BuildContext context,
    required ADTapCallback successfullyAdded,
  }) async {
    if (!flightStatusSegment.isFlightAdded) {
      flightStatusSegment = flightStatusSegment.copyWith(isFlightAdding: true);
      _isFlightAdding = true;
      notifyListeners();

      final airlineInfo =
          FlightUtils.airlineInfo?[flightStatusSegment.airlinecode];
      final AddFlightRequestModel addFlightRequestModel = AddFlightRequestModel(
        FlightDetails(
          flightStatusSegment.flightnumber,
          flightStatusSegment.scheduledate,
          flightStatusSegment.scheduletime,
          airlineInfo?.name ?? '',
          Location(
            flightType == FlightType.departure
                ? flightStatusSegment.iatalocalairportcode
                : flightStatusSegment.iataroutecode,
            flightType == FlightType.departure
                ? flightStatusSegment.iatalocalairport
                : flightStatusSegment.iataroute,
          ),
          Location(
            flightType == FlightType.departure
                ? flightStatusSegment.iataroutecode
                : flightStatusSegment.iatalocalairportcode,
            flightType == FlightType.departure
                ? flightStatusSegment.iataroute
                : flightStatusSegment.iatalocalairport,
          ),
          flightStatusSegment.terminal,
          flightStatusSegment.status,
          flightStatusSegment.flightkind,
          flightStatusSegment.airlinecode,
          '',
        ),
      );

      final response = await _flightListingRepository.addFlight(
        addFlightRequestModel: addFlightRequestModel,
      );
      const duration = 3000;

      if (response.viewStatus == Status.complete) {
        final data = response.data as Map;
        final String cardId = data['cardId'];
        flightStatusSegment = flightStatusSegment.copyWith(
          isFlightAdded: true,
          isFlightAdding: false,
          cardId: cardId,
        );
        flightStatusDetailModel.refreshTap(false);
        callSavedFlightApi(context);
        SnackBarUtil.showSnackBar(
          context,
          '${'flight'.localize(context)} ${flightStatusSegment.flightnumber} ${'successfully_added_to_savedFlight'.localize(context)}',
          duration,
        );
        successfullyAdded.call();
      } else {
        flightStatusSegment = flightStatusSegment.copyWith(
          isFlightAdding: false,
        );
        if ((response.message ?? '').isNotEmpty) {
          SnackBarUtil.showSnackBar(
            context,
            response.message ?? '',
            duration,
          );
        }
      }
      _isFlightAdding = false;
      notifyListeners();
    }
  }

  void callSavedFlightApi(BuildContext context) {
    context.read<FlightCommonState>().callSavedFlightApi();
  }

  /// this is use for get saved flight
  Future<void> deleteSavedFlight({
    required FlightStatusDetailModel flightStatusDetailModel,
    required BuildContext context,
  }) async {
    flightStatusSegment = flightStatusSegment.copyWith(
      isFlightAdding: true,
    );
    _isFlightAdding = true;
    notifyListeners();
    final response = await _flightListingRepository.deleteSavedFlight(
      cardId: flightStatusSegment.cardId,
    );
    const duration = 3000;
    if (response.viewStatus == Status.complete) {
      flightStatusSegment = flightStatusSegment.copyWith(
        cardId: '',
        isFlightAdded: false,
        isFlightAdding: false,
      );
      flightStatusDetailModel.refreshTap(true);
      SnackBarUtil.showSnackBar(
        context,
        '${'flight'.localize(context)} ${flightStatusSegment.flightnumber} ${'successfully_removed_from_savedFlight'.localize(context)}',
        duration,
      );
      callSavedFlightApi(context);
    } else {
      flightStatusSegment = flightStatusSegment.copyWith(
        isFlightAdding: false,
      );
      SnackBarUtil.showSnackBar(
        context,
        response.message ?? '',
        duration,
      );
    }
    _isFlightAdding = false;
    notifyListeners();
  }
}
