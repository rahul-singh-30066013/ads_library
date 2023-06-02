/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/add_flight_information/views/title_subtitle_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_airports/flight_airports_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_dates/flight_dates_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_flight_type/flight_arrival_departure_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/add_flight_information_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class AddFlightInformationScreen extends StatefulWidget {
  final String? appBarTitle;
  const AddFlightInformationScreen({
    Key? key,
    this.appBarTitle = 'Add flight information',
  }) : super(key: key);

  @override
  State<AddFlightInformationScreen> createState() =>
      _AddFlightInformationScreenState();
}

class _AddFlightInformationScreenState
    extends State<AddFlightInformationScreen> {
  AddFlightInformationState addFlightInformationProvider =
      AddFlightInformationState();

  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<String> dynamicTitle = ValueNotifier<String>('');
  final double leadingWidth_42 = 42.sp;
  final double expandedHeight = 90.sp;
  final percentageOfScrollScreen = 65.sp;

  void _scrollListener() {
    final double percentageOfScroll =
        ((_scrollController.position.maxScrollExtent -
                    _scrollController.offset) /
                _scrollController.position.maxScrollExtent) *
            100;

    dynamicTitle.value = percentageOfScroll <= percentageOfScrollScreen
        ? widget.appBarTitle ?? 'add_flight_information'.localize(context)
        : '';
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    adLog(addFlightInformationProvider.selectedAirport?.city);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (addFlightInformationProvider.selectedAirport?.isNonAdaniAirport ==
          true) {
        Future.delayed(
          const Duration(milliseconds: 1000),
          () => showAirportListBottomSheet(),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    dynamicTitle.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            pinned: true,
            title: AnimatedBuilder(
              animation: Listenable.merge([dynamicTitle]),
              builder: (BuildContext context, _) => Text(
                dynamicTitle.value,
                style: ADTextStyle700.size22,
                maxLines: 1,
              ).paddingBySide(left: context.k_10),
            ),
            leadingWidth: Platform.isIOS ? leadingWidth_42 : context.k_38,
            leading: const BackButton().paddingBySide(left: context.k_10),
            expandedHeight: expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: expandedHeight,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.appBarTitle ??
                              'add_flight_information'.localize(context),
                          style: ADTextStyle700.size32.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ).paddingBySide(
                          left: context.k_16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: ADSelectorStateLessWidget(
          viewModel: addFlightInformationProvider,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.k_8,
              ),
              Selector<AddFlightInformationState, AirportItemModel?>(
                selector: (context, viewModel) => viewModel.selectedAirport,
                builder: (context, selectedAirport, Widget? child) {
                  return Row(
                    children: [
                      Expanded(
                        child: TitleSubTitleView(
                          title: 'select_airport'.localize(context),
                          subTitle: selectedAirport?.isNonAdaniAirport == true
                              ? ''
                              : selectedAirport?.city ?? '',
                          onTap: showAirportListBottomSheet,
                        ),
                      ),
                      GestureDetector(
                        onTap: showAirportListBottomSheet,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: context.adColors.circleGreyTextColor,
                          size: context.k_30,
                        ).paddingBySide(right: context.k_16),
                      ),
                    ],
                  );
                },
              ),
              Divider(
                height: 1,
                color: context.adColors.lightGreyGridSeparatorColor,
              ),
              Selector<AddFlightInformationState, FlightType>(
                selector: (context, viewModel) => viewModel.flightType,
                builder: (context, flightType, Widget? child) {
                  return TitleSubTitleView(
                    title: 'arrivals_or_departures'.localize(context),
                    subTitle: flightType == FlightType.arrival
                        ? 'arrivals_flight_status'.localize(context)
                        : 'departure_flight_status'.localize(context),
                    onTap: showArrivalDepartureBottomSheet,
                  );
                },
              ),
              Divider(
                height: 1,
                color: context.adColors.lightGreyGridSeparatorColor,
              ),
              Selector<AddFlightInformationState, DateTime>(
                selector: (context, viewModel) => viewModel.date,
                builder: (context, date, Widget? child) {
                  return TitleSubTitleView(
                    title: 'pick_a_date'.localize(context),
                    subTitle: DateFormat(Constant.dateFormat9).format(
                      date,
                    ),
                    onTap: showDateListBottomSheet,
                  );
                },
              ),
              Divider(
                height: 1,
                color: context.adColors.lightGreyGridSeparatorColor,
              ),
              // SizedBox(
              //   height: context.k_38,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: context.k_16),
              //   child: Text(
              //     'search_airline_flight_city'.localize(context),
              //     style: ADTextStyle400.size20.setTextColor(
              //       context.adColors.greyTextColor,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: context.k_26,
              // ),
              // Divider(
              //   height: 1,
              //   color: context.adColors.lightGreyGridSeparatorColor,
              // ),
              SizedBox(
                height: context.k_28,
              ),
              Container(
                width: double.infinity,
                height: context.k_48,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: context.k_16,
                    right: context.k_16,
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: context.adColors.blueColor,
                    ),
                    onPressed: checkFlight,
                    child: Text(
                      'check_flight'.localize(context),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showArrivalDepartureBottomSheet() {
    adShowBottomSheet(
      context: context,
      childWidget: FlightArrivalDepartureScreen(
        flightTypes: [
          'arrivals_flight_status'.localize(context),
          'departure_flight_status'.localize(context),
        ],
        selectedFlightType:
            addFlightInformationProvider.flightType == FlightType.arrival
                ? 'arrivals_flight_status'.localize(context)
                : 'departure_flight_status'.localize(context),
        flightTypeTap: (value) => flightTypeUpdate(value),
      ),
      headerTitle: 'arrivals_or_departures'.localize(context),
    );
  }

  void showDateListBottomSheet() {
    adShowBottomSheet(
      context: context,
      childWidget: FlightDatesScreen(
        isMumbai: (addFlightInformationProvider.selectedAirport?.airportCode
                    ?.toUpperCase() ==
                'BOM') ||
            ((addFlightInformationProvider.selectedAirport?.city ?? '')
                    .trim()
                    .toLowerCase() ==
                'Other'.toLowerCase()),
        dateTap: (value) => dateTap(dateString: value),
        selectedDate: addFlightInformationProvider.date,
      ),
      headerTitle: 'select_date'.localize(context),
    );
  }

  void showAirportListBottomSheet() {
    adShowBottomSheet(
      context: context,
      childWidget: FlightAirportsScreen(
        selectedAirport:
            addFlightInformationProvider.selectedAirport ?? AirportItemModel(),
        airportTap: airportTap,
      ),
      headerTitle: 'select_airport'.localize(context),
    );
  }

  void airportTap(AirportItemModel airportItemModel) {
    final AirportItemModel selectedAirport = airportItemModel;
    addFlightInformationProvider.updateSelectedAirport(selectedAirport);
  }

  void flightTypeUpdate(
    FlightType flightType,
  ) {
    if (addFlightInformationProvider.flightType != flightType) {
      addFlightInformationProvider.updateFlightType(flightType);
    }
  }

  void dateTap({
    required String dateString,
  }) {
    final DateTime date = DateFormat(Constant.dateFormat3).parse(dateString);
    if (date != addFlightInformationProvider.date) {
      addFlightInformationProvider.updateDate(
        date,
      );
    }
  }

  void checkFlight() {
    if (addFlightInformationProvider.selectedAirport?.isNonAdaniAirport ==
        true) {
      SnackBarUtil.showSnackBar(
        context,
        'Please Select Airport',
      );
    } else {
      callGaEventForCheckFlight();
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        flightStatusScreen,
        argumentObject: FidsModel(
          airportItemModel: addFlightInformationProvider.selectedAirport,
          searchText: '',
          flightType: addFlightInformationProvider.flightType,
          date: addFlightInformationProvider.date,
        ),
      );
    }
  }

  void callGaEventForCheckFlight() {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'flight_status',
      Parameters.sub_category.name: 'saved_flight',
      Parameters.trip_type.name:
          addFlightInformationProvider.flightType == FlightType.arrival
              ? 'Arrivals'
              : 'departure',
      Parameters.picked_date.name: DateFormat(Constant.dateFormat21)
          .format(addFlightInformationProvider.date),
      Parameters.select_airport.name:
          addFlightInformationProvider.selectedAirport?.city ?? '',
    };
    ClickEvents.check_flight.logEvent(parameters: obj);
  }
}
