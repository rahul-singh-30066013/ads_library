/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future;

import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_search_data_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/request_models/add_flight_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/repositories/flight_status_repository.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_status_search_options.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class FlightStatusState extends ADBaseViewModel {
  FlightStatusModel flightStatusModel = const FlightStatusModel();

  final FlightStatusRepository _flightListingRepository =
      FlightStatusRepository();
  AirportItemModel? selectedAirport;

  DateTime _date = DateFormat(Constant.dateFormat3)
      .parse(DateFormat(Constant.dateFormat3).format(DateTime.now()));
  FlightType _flightType = FlightType.arrival;
  DateTime _lastUpdatedTime = DateFormat(Constant.dateFormat7)
      .parse(DateFormat(Constant.dateFormat7).format(DateTime.now()));
  String _searchItem = '';
  List<FlightStatusSegment> _filteredFlightSegmentList = [];
  String _selectedTerminal = '';
  List<String>? terminalList;
  bool _isAbsorbing = false;
  String cityCode = 'BOM';

  FlightType get flightType => _flightType;

  DateTime get date => _date;

  DateTime get lastUpdatedTime => _lastUpdatedTime;

  String get searchItem => _searchItem;

  List<FlightStatusSegment> get filteredFlightSegmentList =>
      _filteredFlightSegmentList;

  String get selectedTerminal => _selectedTerminal;

  List<String> get terminals =>
      terminalList ??
      [
        'All Terminals',
      ];

  bool get isAbsorbing => _isAbsorbing;

  /// Initiate loading state for api hit
  ADResponseState flightStatusState = ADResponseState.init();

  void setInitialData({required FidsModel fidsModel}) {
    _date = fidsModel.date ??
        DateFormat(Constant.dateFormat3)
            .parse(DateFormat(Constant.dateFormat3).format(DateTime.now()));
    _flightType = fidsModel.flightType ?? FlightType.arrival;
    _searchItem = fidsModel.searchText ?? '';
    cityCode = selectedAirport?.airportCode ?? '';
  }

  ///It will provide airports status list from api
  Future<void> getFlightStatus() async {
    _isAbsorbing = true;
    notifyListeners();
    final Map<String, dynamic> queryParams = {};
    queryParams['flightType'] =
        flightType == FlightType.arrival ? 'Arrival' : 'Departure';
    queryParams['Search'] = '';
    queryParams['Terminal'] = '';
    queryParams['flightDate'] = DateFormat(Constant.dateFormat5).format(
      date,
    );
    final value = await _flightListingRepository.fetchFlightStatusList(
      queryParameters: queryParams,
      cityCode: cityCode,
    );
    _lastUpdatedTime = DateTime.now();
    _isAbsorbing = false;
    updateFlightListState(value);
  }

  ///It will update date
  void updateDate(DateTime updatedDate) {
    _date = updatedDate;
    updateFlightListState(ADResponseState.loading());
    getFlightStatus();
  }

  ///It will update terminal
  void updateTerminal(String updatedTerminal) {
    adLog(updatedTerminal);
    _selectedTerminal = updatedTerminal;
  }

  void updateFlightType(FlightType updatedFlightType) {
    _flightType = updatedFlightType;
    updateFlightListState(ADResponseState.loading());
    getFlightStatus();
  }

  ///It will update search
  void updateList({
    required FlightSearchDataModel flightSearchDataModel,
    required List<FlightStatusSegment> flightSegmentList,
    required FlightType flightType,
    required String terminalLocale,
    bool needsToNotify = true,
  }) {
    _flightType = flightType;
    _searchItem = flightSearchDataModel.text;
    String option = '';
    if (flightSearchDataModel.flightStatusSearchOptions ==
        FlightStatusSearchOptions.airlineName) {
      option = flightSearchDataModel.airlineCode;
    }
    _filteredFlightSegmentList = flightSegmentList
        .where(
          (flightDataList) =>
              searchMatch(flightDataList, searchItem, terminalLocale, option),
        )
        .toList();
    if (needsToNotify) {
      notifyListeners();
    }
  }

  /// method to match out the search results
  bool searchMatch(
    FlightStatusSegment segment,
    String value,
    String terminalLocale,
    String option,
  ) {
    if (((option != '' &&
                segment.airlinecode
                    .toString()
                    .toUpperCase()
                    .contains(option.toUpperCase())) ||
            ((segment.iatalocalairport
                    .toString()
                    .toUpperCase()
                    .contains(value.toUpperCase())) ||
                (segment.flightnumber
                    .toString()
                    .toUpperCase()
                    .contains(value.toUpperCase())) ||
                (segment.iataroute
                    .toString()
                    .toUpperCase()
                    .contains(value.toUpperCase())))) &&
        (segment.flightkind.toUpperCase() == flightType.name.toUpperCase()) &&
        (selectedTerminal.toUpperCase() == 'All Terminals'.toUpperCase() ||
            '$terminalLocale ${segment.terminal}'.toUpperCase() ==
                selectedTerminal.toUpperCase())) {
      return true;
    }
    return false;
  }

  ///It will update airport flight data of ADResponseState
  void updateFlightListState(ADResponseState response) {
    flightStatusState = response;
    notifyListeners();
  }

  Future<void> addFlight({
    required int index,
    required BuildContext context,
    ADTapCallback? flightAddedSuccessfully,
    ADTapCallback? flightRemovedSuccessfully,
  }) async {
    final FlightStatusSegment flightStatusSegment =
        filteredFlightSegmentList[index];
    final mainListIndex =
        flightStatusModel.flightsegment.indexOf(flightStatusSegment);
    filteredFlightSegmentList[index] =
        flightStatusSegment.copyWith(isFlightAdding: true);
    flightStatusModel.flightsegment[mainListIndex] =
        flightStatusSegment.copyWith(isFlightAdding: true);
    _isAbsorbing = true;
    notifyListeners();
    if (flightStatusSegment.isFlightAdded) {
      final response = await _flightListingRepository.deleteSavedFlight(
        cardId: flightStatusSegment.cardId,
      );
      const duration = 3000;
      if (response.viewStatus == Status.complete) {
        filteredFlightSegmentList[index] = flightStatusSegment.copyWith(
          cardId: '',
          isFlightAdded: false,
          isFlightAdding: false,
        );
        flightStatusModel.flightsegment[mainListIndex] =
            flightStatusSegment.copyWith(
          cardId: '',
          isFlightAdded: false,
          isFlightAdding: false,
        );
        callSavedFlightApi(context);
        flightRemovedSuccessfully?.call();
        SnackBarUtil.showSnackBar(
          context,
          '${'flight'.localize(context)} ${flightStatusSegment.flightnumber} ${'successfully_removed_from_savedFlight'.localize(context)}',
          duration,
        );
      } else {
        filteredFlightSegmentList[index] =
            flightStatusSegment.copyWith(isFlightAdding: false);
        flightStatusModel.flightsegment[mainListIndex] =
            flightStatusSegment.copyWith(isFlightAdding: false);

        if ((response.message ?? '').isNotEmpty) {
          SnackBarUtil.showSnackBar(
            context,
            response.message ?? '',
            duration,
          );
        }
      }
      _isAbsorbing = false;
      notifyListeners();
    } else {
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
        filteredFlightSegmentList[index] = flightStatusSegment.copyWith(
          isFlightAdded: true,
          isFlightAdding: false,
          cardId: cardId,
        );
        flightStatusModel.flightsegment[mainListIndex] =
            flightStatusSegment.copyWith(
          isFlightAdded: true,
          isFlightAdding: false,
          cardId: cardId,
        );
        callSavedFlightApi(context);
        flightAddedSuccessfully?.call();
        SnackBarUtil.showSnackBar(
          context,
          '${'flight'.localize(context)} ${flightStatusSegment.flightnumber} ${'successfully_added_to_savedFlight'.localize(context)}',
          duration,
        );
      } else {
        filteredFlightSegmentList[index] =
            flightStatusSegment.copyWith(isFlightAdding: false);
        flightStatusModel.flightsegment[mainListIndex] =
            flightStatusSegment.copyWith(isFlightAdding: false);

        if ((response.message ?? '').isNotEmpty) {
          SnackBarUtil.showSnackBar(
            context,
            response.message ?? '',
            duration,
          );
        }
      }
      _isAbsorbing = false;
      notifyListeners();
    }
  }

  void callSavedFlightApi(BuildContext context) {
    context.read<FlightCommonState>().callSavedFlightApi();
  }
}
