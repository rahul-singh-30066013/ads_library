/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/calendar_date_range_picker.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

///title Text
String titleText = '';

String restorationId = '';
double thicknessLeft = 1;
double thicknessRight = 1;
bool arrivalIsSelected = false;
bool tapVisibility = false;
bool roundSelected = false;

///Test price case
String amount = '';
DateTimeRange? initialDateRange;

// const double k_220 = 220;
const _calendarFlightDefaultEndDateRange = 365;
const Duration monthScrollDuration = Duration(milliseconds: 200);

const double monthItemHeaderHeight = 72;
const double monthItemFooterHeight = 12;
final double monthItemRowHeight = 54.sp;
const double monthItemSpaceBetweenRows = 16;
const double horizontalPadding = 8;
const double maxCalendarWidthPortrait = 500;
const double dayHeaderHeight = 50;
const double zero = 0;

/// A Material-style date range picker dialog.
class DateRangeView extends StatefulWidget {
  const DateRangeView({
    Key? key,
    required this.departureDate,
    this.returnDate,
    this.tripType = TripType.oneWay,
    this.calendarStartDate,
    this.calendarEndDate,
    this.roundSelected = false,
    this.showAmount = true,
    this.tripDetailModel,
    this.flightBookingState,
    this.titleCalender,
    this.isPranaam = false,
  }) : super(key: key);

  final bool? roundSelected;

  /// This is user selected departure date
  final DateTime departureDate;

  /// This is user selected return date
  final DateTime? returnDate;

  /// This is user selected trip type oneWay for the single selection
  final TripType? tripType;

  final DateTime? calendarStartDate;

  final DateTime? calendarEndDate;
  final bool showAmount;
  final TripDetailModel? tripDetailModel;
  final FlightBookingState? flightBookingState;
  final String? titleCalender;
  final bool? isPranaam;

  @override
  State<DateRangeView> createState() => DateRangeViewState();
}

class DateRangeViewState extends State<DateRangeView> {
  ///Calender date range
  DateTimeRange get initialDateRange => DateTimeRange(
        start: widget.calendarStartDate ?? DateTime.now(),
        end: widget.calendarEndDate ??
            DateTime.now().add(
              const Duration(days: _calendarFlightDefaultEndDateRange),
            ),
      );

  DateTime get _departureDate => selectedDepartureDate ?? widget.departureDate;
  DateTime get _returnDate => selectedReturnDate ?? preferredReturnDate();

  TripType get _tripType => widget.tripType ?? TripType.oneWay;

  bool get _roundSelected => widget.roundSelected ?? false;

  TripType? selectedTripType;
  DateTime? selectedDepartureDate;
  DateTime? selectedReturnDate;
  DateTime preferredReturnDate() {
    return _roundSelected || _tripType == TripType.roundTrip
        ? widget.returnDate ?? widget.departureDate
        : widget.departureDate;
  }

  FlightCommonState? flightCommonModel;
  FlightBookingState bookingState = FlightBookingState();

  @override
  void initState() {
    super.initState();

    /// getting flight common model state
    flightCommonModel = context.read<FlightCommonState>();

    /// getting booking state for api call
    bookingState = widget.flightBookingState ?? FlightBookingState();

    /// getting trip detail for fromToCity and toFromCityKey for getting price
    flightCommonModel?.tripDetailModel = widget.tripDetailModel;

    selectedTripType = _tripType;

    /// fareCalendar api call
    if (widget.showAmount) {
      _fareCalendarApiCall();
    }

    ///setting UI State Need to refactor with tabbar
    if (_roundSelected || _tripType == TripType.roundTrip) {
      arrivalIsSelected = widget.roundSelected ?? false;
      tapVisibility = true;
    } else {
      tapVisibility = false;
      arrivalIsSelected = false;
    }
  }

  /// handle done.
  void _handleOk() {
    if (_roundSelected && _tripType == TripType.oneWay) {
      selectedTripType = TripType.roundTrip;
    }
    navigatorPopScreenWithData(
      context,
      CalendarModel(
        departureDate: _departureDate,
        returnDate: _returnDate,
        tripType: selectedTripType,
      ),
    );
  }

  // void _handleCancel() {
  //   Navigator.pop(context);
  // }

  void _handleStartDateChanged(DateTime? date) {
    setState(() => selectedDepartureDate = date);
  }

  void _handleEndDateChanged(DateTime? date) {
    setState(() => selectedReturnDate = date);
  }

  ///Screen main build
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CalendarDateRangePicker(
          initialStartDate: _departureDate,
          initialEndDate: _returnDate,
          firstDate: initialDateRange.start,
          lastDate: initialDateRange.end,
          currentDate: DateTime.now(),
          onStartDateChanged: _handleStartDateChanged,
          onEndDateChanged: _handleEndDateChanged,
          roundSelected: _roundSelected,
          tripType: _tripType,
          showAmount: widget.showAmount,
          selectCalender: widget.titleCalender,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: widget.isPranaam == true ? context.k_18 : zero,
          ),
          child: SizedBox(
            height: context.k_64,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: _handleOk,
                style: ElevatedButton.styleFrom(
                  primary: context.adColors.blackTextColor,
                  onPrimary: context.adColors.whiteTextColor,
                  minimumSize: Size(double.infinity, context.k_48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.k_32),
                    ),
                  ),
                ),
                child: Text(
                  'done'.localize(context),
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void disposeValues() {
    arrivalIsSelected = false;
  }

  void _fareCalendarApiCall() {
    final tripType = _roundSelected ? TripType.roundTrip : _tripType;
    flightCommonModel?.getFlightsFareCalender(
      bookingState.flightBookingModel,
      tripType,
    );
  }
}

class CalendarModel {
  DateTime departureDate;
  DateTime? returnDate;
  TripType? tripType;

  CalendarModel({
    required this.departureDate,
    this.returnDate,
    this.tripType,
  });
}
