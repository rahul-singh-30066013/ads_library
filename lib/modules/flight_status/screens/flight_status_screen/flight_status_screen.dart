/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_search_data_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_search_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_storage_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_dates/flight_dates_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/remove_save_flight_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_flight_type/flight_arrival_departure_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/fids_initial_loading_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/flight_status_screen_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/flight_status_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/last_update_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/search_airlines_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_terminal/flight_terminal_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/flight_status_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_status_search_options.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class return the Flight status Screen View
class FlightStatusScreen extends StatefulWidget {
  final FidsModel fidsModel;

  const FlightStatusScreen({
    Key? key,
    required this.fidsModel,
  }) : super(key: key);

  @override
  State<FlightStatusScreen> createState() => _FlightStatusScreenState();
}

class _FlightStatusScreenState extends State<FlightStatusScreen>
    with TickerProviderStateMixin {
  FlightStatusState flightStatusProvider = FlightStatusState();
  bool isFirstTime = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final List<String> terminalList = [];
        for (final Terminal terminalObject
            in flightStatusProvider.selectedAirport?.terminalsList ?? []) {
          if ((terminalObject.terminalCode ?? '').isNotEmpty) {
            terminalList.add(
              terminalObject.terminalCode ?? '',
            );
          }
        }
        final selectedAirportTerminals = ['all_terminals'.localize(context)];
        for (final terminal in terminalList) {
          selectedAirportTerminals
              .add('${'terminal'.localize(context)} $terminal');
        }
        flightStatusProvider.terminalList = selectedAirportTerminals;

        callGaEventForFlightStatusSearchModifyOrSelectRefresh(
          clickEvents: ClickEvents.flight_status_search,
        );
      },
    );
    flightStatusProvider.selectedAirport = widget.fidsModel.airportItemModel;
    if (flightStatusProvider.selectedAirport?.city?.toLowerCase() ==
        'other'.toLowerCase()) {
      flightStatusProvider.selectedAirport = context
          .read<SiteCoreStateManagement>()
          .adaniAirportsList
          .singleWhere(
            (element) => element.city?.toLowerCase() == 'mumbai',
            orElse: () =>
                context.read<SiteCoreStateManagement>().adaniAirportsList.first,
          );
    }

    flightStatusProvider = flightStatusProvider
      ..setInitialData(fidsModel: widget.fidsModel)
      ..updateFlightListState(ADResponseState.loading())
      ..getFlightStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (flightStatusProvider.selectedTerminal == '') {
      flightStatusProvider.updateTerminal('all_terminals'.localize(context));
    }
    return ADSelectorStateLessWidget(
      viewModel: flightStatusProvider,
      child: Selector<FlightStatusState, bool>(
        selector: (context, viewModel) => viewModel.isAbsorbing,
        builder: (context, isAbsorbing, Widget? child) {
          return (isAbsorbing && isFirstTime)
              ? Builder(
                  builder: (context) {
                    isFirstTime = false;
                    return FidsInitialLoadingView(fidsModel: widget.fidsModel);
                  },
                )
              : Scaffold(
                  backgroundColor: context.adColors.whiteTextColor,
                  appBar: AppBar(
                    titleSpacing: 0,
                    elevation: 0,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'flight_status'.localize(context),
                          style: ADTextStyle700.size16.setTextColor(
                            context.adColors.neutralInfoMsg,
                          ),
                        ),
                        ADSizedBox(
                          height: context.k_4,
                        ),
                        Row(
                          children: [
                            Text(
                              flightStatusProvider.selectedAirport?.city ?? '',
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.greyTextColor,
                              ),
                            ),
                            Text(
                              ' - ',
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.greyTextColor,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                flightStatusProvider
                                        .selectedAirport?.airportName ??
                                    '',
                                overflow: TextOverflow.ellipsis,
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                ),
                              ),
                            ),
                            ADSizedBox(
                              width: context.k_40,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  body: Selector<FlightStatusState, bool>(
                    selector: (context, viewModel) => viewModel.isAbsorbing,
                    builder: (context, isAbsorbing, Widget? child) {
                      return AbsorbPointer(
                        absorbing: isAbsorbing,
                        child: Stack(
                          children: [
                            SafeArea(
                              child: Column(
                                children: [
                                  ADSizedBox(
                                    height: context.k_14,
                                  ),
                                  SearchAirlinesView(
                                    searchTap: () => showSearchBottomSheet(
                                      flightSegment: flightStatusProvider
                                          .flightStatusModel.flightsegment,
                                    ),
                                    clearTap: () => flightTap(
                                      flightSearchDataModel:
                                          FlightSearchDataModel(
                                        text: '',
                                        flightStatusSearchOptions:
                                            FlightStatusSearchOptions.flightNo,
                                        icon: '',
                                        airlineCode: '',
                                      ),
                                      flightSegment: flightStatusProvider
                                          .flightStatusModel.flightsegment,
                                    ),
                                  ),
                                  LastUpdateView(
                                    refreshTap: updateFlightStatus,
                                    showTerminalBottomSheet:
                                        showTerminalBottomSheet,
                                    showDateListBottomSheet:
                                        showDateListBottomSheet,
                                    showArrivalDepartureBottomSheet:
                                        showArrivalDepartureBottomSheet,
                                  ),
                                  Expanded(
                                    child: Selector<FlightStatusState,
                                        ADResponseState>(
                                      selector: (context, viewModel) =>
                                          viewModel.flightStatusState,
                                      builder: (context, value, Widget? child) {
                                        switch (value.viewStatus) {
                                          case Status.complete:
                                            flightStatusProvider
                                                .flightStatusModel = value.data;
                                            flightStatusProvider.updateList(
                                              flightSegmentList:
                                                  flightStatusProvider
                                                      .flightStatusModel
                                                      .flightsegment,
                                              flightSearchDataModel:
                                                  FlightSearchDataModel(
                                                text: flightStatusProvider
                                                    .searchItem,
                                                flightStatusSearchOptions:
                                                    FlightStatusSearchOptions
                                                        .flightNo,
                                                icon: '',
                                                airlineCode: '',
                                              ),
                                              needsToNotify: false,
                                              flightType: flightStatusProvider
                                                  .flightType,
                                              terminalLocale:
                                                  'terminal'.localize(context),
                                            );
                                            return Selector<FlightStatusState,
                                                List<FlightStatusSegment>>(
                                              selector: (context, viewModel) =>
                                                  viewModel
                                                      .filteredFlightSegmentList,
                                              builder: (
                                                context,
                                                value,
                                                Widget? child,
                                              ) {
                                                return value.isEmpty
                                                    ? Center(
                                                        child: Text(
                                                          (flightStatusProvider
                                                                          .flightType ==
                                                                      FlightType
                                                                          .arrival
                                                                  ? 'no_arrival_airport_flight_status_found'
                                                                  : 'no_departure_airport_flight_status_found')
                                                              .localize(
                                                            context,
                                                          ),
                                                        ),
                                                      )
                                                    : RefreshIndicator(
                                                        color: context.adColors
                                                            .neutralInfoMsg,
                                                        onRefresh: _pullRefresh,
                                                        child:
                                                            ListView.separated(
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return FlightStatusView(
                                                              flightSegment:
                                                                  value[index],
                                                              onTap: () =>
                                                                  navigationToFlightDetail(
                                                                flightStatusSegment:
                                                                    value[
                                                                        index],
                                                              ),
                                                              onAdd: () =>
                                                                  addFlight(
                                                                context,
                                                                index,
                                                              ),
                                                            );
                                                          },
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return Divider(
                                                              indent:
                                                                  context.k_16,
                                                              height: 1,
                                                              endIndent:
                                                                  context.k_16,
                                                              color: context
                                                                  .adColors
                                                                  .tileBorderColor,
                                                              thickness: 1,
                                                            );
                                                          },
                                                          itemCount:
                                                              value.length,
                                                        ),
                                                      );
                                              },
                                            );

                                          case Status.loading:
                                            return const FlightStatusScreenShimmer();
                                          case Status.error:
                                            final imageWidth = 200.sp;
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'lib/assets/gif/internal_server_error_page.gif',
                                                  width: imageWidth,
                                                ).paddingBySide(
                                                  bottom: context.k_20,
                                                ),
                                                Text(
                                                  value.errorCode == 'GAF01'
                                                      ? 'record_not_found'
                                                          .localize(context)
                                                      : value.errorCode ==
                                                              'GAFEX'
                                                          ? 'something_went_wrong'
                                                              .localize(
                                                              context,
                                                            )
                                                          : value.message ??
                                                              'NA',
                                                ),
                                              ],
                                            );
                                          default:
                                            return Center(
                                              child: Text(
                                                'Process'.localize(context),
                                              ),
                                            );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }

  void addFlight(
    BuildContext context,
    int index,
  ) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      final FlightStatusSegment flightStatusSegment =
          flightStatusProvider.filteredFlightSegmentList[index];
      if (flightStatusSegment.isFlightAdded) {
        confirmDismiss(context, index);
      } else {
        flightStatusProvider.addFlight(
          index: index,
          context: context,
          flightAddedSuccessfully: () => {
            callGaEventForAddFlight(
              clickEvents: ClickEvents.add_flight,
              index: index,
            ),
          },
        );
      }
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) => value ? updateFlightStatus() : null,
          isNotFromSplash: true,
          popUpRequired: true,
          currentRouteName: flightStatusScreen,
        ),
      );
    }
  }

  Future<void> confirmDismiss(
    BuildContext context,
    int index,
  ) async {
    callGaEventForAddFlight(
      clickEvents: ClickEvents.remove_flight_initiated,
      index: index,
    );
    return adShowBottomSheet(
      context: context,
      childWidget: RemoveSaveFlightView(
        removeFlight: (isRemoved) => isRemoved
            ? removeFlight(context: context, index: index)
            : callGaEventForAddFlight(
                clickEvents: ClickEvents.remove_flight_cancel,
                index: index,
              ),
      ),
      headerTitle: 'remove_flight'.localize(context),
    );
  }

  void removeFlight({
    required BuildContext context,
    required int index,
  }) {
    flightStatusProvider.addFlight(
      index: index,
      context: context,
      flightRemovedSuccessfully: () => {
        callGaEventForAddFlight(
          clickEvents: ClickEvents.remove_flight_confirm,
          index: index,
        ),
      },
    );
  }

  Future<void> _pullRefresh() async {
    const int milliseconds = 150;
    Future.delayed(
      const Duration(milliseconds: milliseconds),
      updateFlightStatus,
    );
  }

  void updateFlightStatus() {
    flightStatusProvider
      ..updateFlightListState(ADResponseState.loading())
      ..getFlightStatus();
    callGaEventForFlightStatusSearchModifyOrSelectRefresh(
      clickEvents: ClickEvents.select_refresh,
    );
  }

  void showSearchBottomSheet({
    required List<FlightStatusSegment> flightSegment,
  }) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      flightStatusSearchScreen,
      argumentObject: FlightSearchNavigateModel(
        flightSegment: flightSegment,
        searchKeyword: flightStatusProvider.searchItem,
        flightTap: (value) => flightTap(
          flightSearchDataModel: value,
          flightSegment: flightSegment,
        ),
        flightType: flightStatusProvider.flightType,
        flightStatusStorageModel: FlightStatusStorageModel(
          date: flightStatusProvider.date,
          flightType: flightStatusProvider.flightType,
          lastUpdatedTime: flightStatusProvider.lastUpdatedTime,
          cityCode: flightStatusProvider.cityCode,
        ),
        refreshTap: updateFlightStatus,
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
            flightStatusProvider.flightType == FlightType.arrival
                ? 'arrivals_flight_status'.localize(context)
                : 'departure_flight_status'.localize(context),
        flightTypeTap: (value) => flightTypeUpdate(value),
      ),
      headerTitle: 'arrivals_or_departures'.localize(context),
    );
  }

  void showTerminalBottomSheet() {
    adShowBottomSheet(
      context: context,
      childWidget: FlightTerminalScreen(
        terminals: flightStatusProvider.terminals,
        selectedTerminal: flightStatusProvider.selectedTerminal,
        terminalTap: (value) => terminalTap(value),
      ),
      headerTitle: 'select_terminal'.localize(context),
    );
  }

  void showDateListBottomSheet() {
    adShowBottomSheet(
      context: context,
      childWidget: FlightDatesScreen(
        isMumbai: flightStatusProvider.cityCode.toUpperCase() == 'BOM',
        dateTap: (value) => dateTap(dateString: value),
        selectedDate: flightStatusProvider.date,
      ),
      headerTitle: 'select_date'.localize(context),
    );
  }

  void flightTap({
    required FlightSearchDataModel flightSearchDataModel,
    required List<FlightStatusSegment> flightSegment,
  }) {
    flightStatusProvider.updateList(
      flightSegmentList: flightSegment,
      flightSearchDataModel: flightSearchDataModel,
      flightType: flightStatusProvider.flightType,
      terminalLocale: 'terminal'.localize(context),
    );
    callGaEventForFlightStatusSearchModifyOrSelectRefresh(
      clickEvents: ClickEvents.flight_status_search_modify,
    );
  }

  void flightTypeUpdate(
    FlightType flightType,
  ) {
    if (flightStatusProvider.flightType != flightType) {
      flightStatusProvider.updateFlightType(flightType);
      callGaEventForFlightStatusSearchModifyOrSelectRefresh(
        clickEvents: ClickEvents.flight_status_search_modify,
      );
    }
  }

  void terminalTap(String selectedTerminal) {
    if (selectedTerminal != flightStatusProvider.selectedTerminal) {
      flightStatusProvider
        ..updateTerminal(selectedTerminal)
        ..updateList(
          flightSearchDataModel: FlightSearchDataModel(
            text: flightStatusProvider.searchItem,
            flightStatusSearchOptions: FlightStatusSearchOptions.flightNo,
            icon: '',
            airlineCode: '',
          ),
          flightSegmentList:
              flightStatusProvider.flightStatusModel.flightsegment,
          flightType: flightStatusProvider.flightType,
          terminalLocale: 'terminal'.localize(context),
        );
      callGaEventForFlightStatusSearchModifyOrSelectRefresh(
        clickEvents: ClickEvents.flight_status_search_modify,
      );
    }
  }

  void dateTap({
    required String dateString,
  }) {
    final DateTime date = DateFormat(Constant.dateFormat3).parse(dateString);
    if (date != flightStatusProvider.date) {
      flightStatusProvider.updateDate(
        date,
      );
      callGaEventForFlightStatusSearchModifyOrSelectRefresh(
        clickEvents: ClickEvents.flight_status_search_modify,
      );
    }
  }

  void navigationToFlightDetail({
    required FlightStatusSegment flightStatusSegment,
  }) {
    final FlightStatusStorageModel flightStatusStorageModel =
        FlightStatusStorageModel(
      date: flightStatusProvider.date,
      flightType: flightStatusProvider.flightType,
      lastUpdatedTime: flightStatusProvider.lastUpdatedTime,
      cityCode: flightStatusProvider.cityCode,
    );
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      flightStatusDetailScreen,
      argumentObject: FlightStatusDetailModel(
        refreshTap: (value) => {
          updateFlightStatus(),
        },
        flightStatusStorageModel: flightStatusStorageModel,
        flightNumber: flightStatusSegment.flightnumber,
        selectedFlightStatusSegment: flightStatusSegment,
      ),
    );
  }

  void callGaEventForAddFlight({
    required ClickEvents clickEvents,
    required int index,
  }) {
    final airlineInfo = FlightUtils.airlineInfo?[
        flightStatusProvider.filteredFlightSegmentList[index].airlinecode];

    final map = {
      Parameters.category.name: 'flight_status',
      Parameters.sub_category.name: 'select_flight',
      Parameters.airline.name: airlineInfo?.name ?? '',
      Parameters.scheduled_time.name: flightStatusProvider
              .filteredFlightSegmentList[index].scheduletime.isNotEmpty
          ? flightStatusProvider.filteredFlightSegmentList[index].scheduletime
          : '',
      Parameters.flight_number.name:
          flightStatusProvider.filteredFlightSegmentList[index].flightnumber,
      Parameters.arrival_station.name: flightStatusProvider.flightType ==
              FlightType.arrival
          ? flightStatusProvider
              .filteredFlightSegmentList[index].iatalocalairportcode
          : flightStatusProvider.filteredFlightSegmentList[index].iataroutecode,
      Parameters.status.name: flightStatusProvider
              .filteredFlightSegmentList[index].status.isNotEmpty
          ? flightStatusProvider.filteredFlightSegmentList[index].status
          : '',
      Parameters.terminal.name:
          flightStatusProvider.filteredFlightSegmentList[index].terminal,
      Parameters.date.name: DateFormat(Constant.dateFormat21).format(
        DateFormat(Constant.dateFormat5).parse(
          flightStatusProvider.filteredFlightSegmentList[index].scheduledate,
        ),
      ),
      Parameters.departure_station.name: flightStatusProvider.flightType ==
              FlightType.arrival
          ? flightStatusProvider.filteredFlightSegmentList[index].iataroutecode
          : flightStatusProvider
              .filteredFlightSegmentList[index].iatalocalairportcode,
      Parameters.station.name: flightStatusProvider
          .filteredFlightSegmentList[index].iatalocalairport,
      Parameters.baggage_belt.name: flightStatusProvider
              .filteredFlightSegmentList[index].carousel.isNotEmpty
          ? flightStatusProvider.filteredFlightSegmentList[index].carousel
              .map((e) => e.carousel)
              .join(',')
          : '',
      Parameters.estimated_time.name: flightStatusProvider
              .filteredFlightSegmentList[index].scheduletime.isNotEmpty
          ? flightStatusProvider.filteredFlightSegmentList[index].estimatedtime
          : '',
      Parameters.departure_gate.name:
          flightStatusProvider.filteredFlightSegmentList[index].gates.isNotEmpty
              ? flightStatusProvider.filteredFlightSegmentList[index].gates
                  .map((e) => e.gate)
                  .join(',')
              : '',
      Parameters.check_in_row.name: flightStatusProvider
              .filteredFlightSegmentList[index].checkInCounter.isNotEmpty
          ? flightStatusProvider.filteredFlightSegmentList[index].checkInCounter
              .map((e) => e.checkincounter)
              .join(',')
          : '-',
      Parameters.trip_type.name:
          flightStatusProvider.flightType == FlightType.arrival
              ? 'Arrivals'
              : 'departure',
    };
    if (clickEvents == ClickEvents.add_flight) {
      ClickEvents.add_flight.logEvent(parameters: map);
    } else if (clickEvents == ClickEvents.remove_flight_confirm) {
      ClickEvents.remove_flight_confirm.logEvent(parameters: map);
    } else if (clickEvents == ClickEvents.remove_flight_cancel) {
      ClickEvents.remove_flight_cancel.logEvent(parameters: map);
    } else if (clickEvents == ClickEvents.remove_flight_initiated) {
      ClickEvents.remove_flight_initiated.logEvent(parameters: map);
    }
  }

  void callGaEventForFlightStatusSearchModifyOrSelectRefresh({
    required ClickEvents clickEvents,
  }) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'flight_status',
      Parameters.sub_category.name: 'search',
      Parameters.search_text.name: flightStatusProvider.searchItem,
      Parameters.date.name:
          DateFormat(Constant.dateFormat21).format(flightStatusProvider.date),
      Parameters.station.name: flightStatusProvider.selectedAirport?.city ?? '',
      Parameters.trip_type.name:
          flightStatusProvider.flightType == FlightType.arrival
              ? 'Arrivals'
              : 'departure',
      Parameters.type.name:
          getDateTypeForGaEvent(selectedDate: flightStatusProvider.date),
      Parameters.terminal.name: getSelectedTerminalForGaEvent(),
    };
    if (clickEvents == ClickEvents.flight_status_search_modify) {
      ClickEvents.flight_status_search_modify.logEvent(parameters: obj);
    } else if (clickEvents == ClickEvents.select_refresh) {
      ClickEvents.select_refresh.logEvent(parameters: obj);
    } else if (clickEvents == ClickEvents.flight_status_search) {
      ClickEvents.flight_status_search.logEvent(parameters: obj);
    }
  }

  String getDateTypeForGaEvent({required DateTime selectedDate}) {
    const two = 2;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final difference = today.difference(selectedDate).inDays;
    String dateType = 'Other';
    if (difference == 0) {
      dateType = 'Today';
    } else if (difference == 1) {
      dateType = 'Yesterday';
    } else if (difference == -1) {
      dateType = 'Tomorrow';
    } else if (difference == -two) {
      dateType = 'Day After Tomorrow';
    }
    return dateType;
  }

  String getSelectedTerminalForGaEvent() {
    return flightStatusProvider.selectedTerminal ==
            'all_terminals'.localize(context)
        ? 'All'
        : flightStatusProvider.selectedTerminal
            .replaceAll('${'terminal'.localize(context)} ', '');
  }
}
