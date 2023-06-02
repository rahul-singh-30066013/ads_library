/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/flight_detail_app_bar.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/flight_info_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/flight_location_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/flight_status_detail_screen_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/flight_status_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/remove_save_flight_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/flight_status_detail_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns the Flight status Detail Screen View
class FlightStatusDetailScreen extends StatefulWidget {
  final FlightStatusDetailModel flightStatusDetailModel;

  const FlightStatusDetailScreen({
    Key? key,
    required this.flightStatusDetailModel,
  }) : super(key: key);

  @override
  State<FlightStatusDetailScreen> createState() =>
      _FlightStatusDetailScreenState();
}

class _FlightStatusDetailScreenState extends State<FlightStatusDetailScreen> {
  FlightStatusDetailState flightStatusDetailProvider =
      FlightStatusDetailState();

  @override
  void initState() {
    flightStatusDetailProvider
      ..cityCode =
          widget.flightStatusDetailModel.flightStatusStorageModel.cityCode
      ..updateDetailedData(
        flightStatusDetailModel: widget.flightStatusDetailModel,
      );
    if (!widget.flightStatusDetailModel.isNeedToUpdate) {
      callGaEventForFlightSelect(clickEvents: ClickEvents.select_flight_detail);
    }
    super.initState();
  }

  void callGaEventForFlightSelect({
    required ClickEvents clickEvents,
  }) {
    final airlineInfo = FlightUtils.airlineInfo?[
        flightStatusDetailProvider.flightStatusSegment.airlinecode];

    final map = {
      Parameters.category.name: 'flight_status',
      Parameters.sub_category.name: 'select_flight',
      Parameters.airline.name: airlineInfo?.name ?? '',
      Parameters.scheduled_time.name:
          flightStatusDetailProvider.flightStatusSegment.scheduletime.isNotEmpty
              ? flightStatusDetailProvider.flightStatusSegment.scheduletime
              : '',
      Parameters.flight_number.name:
          flightStatusDetailProvider.flightStatusSegment.flightnumber,
      Parameters.arrival_station.name: widget.flightStatusDetailModel
                  .flightStatusStorageModel.flightType ==
              FlightType.arrival
          ? flightStatusDetailProvider.flightStatusSegment.iatalocalairportcode
          : flightStatusDetailProvider.flightStatusSegment.iataroutecode,
      Parameters.status.name:
          flightStatusDetailProvider.flightStatusSegment.status.isNotEmpty
              ? flightStatusDetailProvider.flightStatusSegment.status
              : '',
      Parameters.terminal.name:
          flightStatusDetailProvider.flightStatusSegment.terminal,
      Parameters.date.name: DateFormat(Constant.dateFormat21).format(
        DateFormat(Constant.dateFormat5)
            .parse(flightStatusDetailProvider.flightStatusSegment.scheduledate),
      ),
      Parameters.departure_station.name: widget.flightStatusDetailModel
                  .flightStatusStorageModel.flightType ==
              FlightType.arrival
          ? flightStatusDetailProvider.flightStatusSegment.iataroutecode
          : flightStatusDetailProvider.flightStatusSegment.iatalocalairportcode,
      Parameters.station.name:
          flightStatusDetailProvider.flightStatusSegment.iatalocalairport,
      Parameters.baggage_belt.name:
          flightStatusDetailProvider.flightStatusSegment.carousel.isNotEmpty
              ? flightStatusDetailProvider.flightStatusSegment.carousel
                  .map((e) => e.carousel)
                  .join(',')
              : '',
      Parameters.estimated_time.name:
          flightStatusDetailProvider.flightStatusSegment.scheduletime.isNotEmpty
              ? flightStatusDetailProvider.flightStatusSegment.estimatedtime
              : '',
      Parameters.departure_gate.name:
          flightStatusDetailProvider.flightStatusSegment.gates.isNotEmpty
              ? flightStatusDetailProvider.flightStatusSegment.gates
                  .map((e) => e.gate)
                  .join(',')
              : '',
      Parameters.check_in_row.name: flightStatusDetailProvider
              .flightStatusSegment.checkInCounter.isNotEmpty
          ? flightStatusDetailProvider.flightStatusSegment.checkInCounter
              .map((e) => e.checkincounter)
              .join(',')
          : '-',
      Parameters.trip_type.name:
          widget.flightStatusDetailModel.flightStatusStorageModel.flightType ==
                  FlightType.arrival
              ? 'Arrivals'
              : 'departure',
    };
    if (clickEvents == ClickEvents.select_flight_detail) {
      ClickEvents.select_flight_detail.logEvent(parameters: map);
    } else if (clickEvents == ClickEvents.add_flight) {
      ClickEvents.add_flight.logEvent(parameters: map);
    } else if (clickEvents == ClickEvents.remove_flight_initiated) {
      ClickEvents.remove_flight_initiated.logEvent(parameters: map);
    } else if (clickEvents == ClickEvents.remove_flight_cancel) {
      ClickEvents.remove_flight_cancel.logEvent(parameters: map);
    } else if (clickEvents == ClickEvents.remove_flight_confirm) {
      ClickEvents.remove_flight_confirm.logEvent(parameters: map);
    }
  }

  void refreshTap() {
    /// call back variable used for updating list of saved flight
    widget.flightStatusDetailModel.refreshTap(false);
    flightStatusDetailProvider.updateFlightSegment();
  }

  Future<void> pullRefresh() async {
    const int milliseconds = 150;
    Future.delayed(
      const Duration(milliseconds: milliseconds),
      refreshTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double backGroundImageHeight = context.heightOfScreen * 0.4;
    final double topPadding = context.heightOfScreen * 0.27;
    const double dividerOpacity = 0.5;
    const double imageOpacity = 0.25;

    return ADSelectorStateLessWidget(
      viewModel: flightStatusDetailProvider,
      child: Material(
        child: Stack(
          children: [
            Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                ),
              ),
            ),
            ADSizedBox(
              height: backGroundImageHeight,
              width: double.infinity,
              child: ADCachedImage(
                imageUrl:
                    '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Project/AdaniAirport/Airport/MumbaiAirport/HeroBanners/fidsMobile.jpg',
              ),
            ),
            Container(
              height: backGroundImageHeight,
              width: double.infinity,
              color: Colors.black.withOpacity(imageOpacity),
            ),
            Selector<FlightStatusDetailState, DateTime>(
              selector: (context, viewModel) => viewModel.lastUpdatedTime,
              builder: (context, lastUpdatedTime, Widget? child) {
                return FlightDetailAppBar(
                  onTap: refreshTap,
                  lastUpdatedTime: DateFormat(Constant.dateFormat7).format(
                    lastUpdatedTime,
                  ),
                  isNeedToUpdate: widget.flightStatusDetailModel.isNeedToUpdate,
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(
                left: context.k_16,
                right: context.k_16,
                top: topPadding,
                bottom: context.k_16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(context.k_4)),
                boxShadow: [
                  BoxShadow(
                    color: context.adColors.lightGreyShadowColor,
                    blurRadius: context.k_8,
                    spreadRadius: 1,
                  ),
                ],
                color: context.adColors.whiteTextColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlightLocationView(
                      flightSegment:
                          flightStatusDetailProvider.flightStatusSegment,
                      flightType: widget.flightStatusDetailModel
                          .flightStatusStorageModel.flightType,
                    ),
                    Divider(
                      height: context.k_40,
                      color: context.adColors.lightGreyGridSeparatorColor
                          .withOpacity(dividerOpacity),
                      thickness: 1,
                    ),
                    FlightInfoView(
                      flightSegment:
                          flightStatusDetailProvider.flightStatusSegment,
                    ),
                    Divider(
                      height: context.k_40,
                      color: context.adColors.lightGreyGridSeparatorColor
                          .withOpacity(dividerOpacity),
                      thickness: 1,
                    ),
                    Selector<FlightStatusDetailState, ADResponseState>(
                      selector: (context, viewModel) =>
                          viewModel.flightStatusState,
                      builder: (context, value, Widget? child) {
                        switch (value.viewStatus) {
                          case Status.complete:
                            final FlightStatusModel flightStatusModel =
                                value.data;
                            final updatedFlightSegmentList =
                                flightStatusModel.flightsegment.where(
                              (segment) {
                                return widget
                                            .flightStatusDetailModel
                                            .flightStatusStorageModel
                                            .flightType ==
                                        FlightType.arrival
                                    ? segment.iataroutecode ==
                                        flightStatusDetailProvider
                                            .flightStatusSegment.iataroutecode
                                    : segment.iatalocalairportcode ==
                                        flightStatusDetailProvider
                                            .flightStatusSegment
                                            .iatalocalairportcode;
                              },
                            ).toList();
                            if (updatedFlightSegmentList.isNotEmpty) {
                              flightStatusDetailProvider.flightStatusSegment =
                                  updatedFlightSegmentList.first;
                              return Selector<FlightStatusDetailState, bool>(
                                selector: (context, viewModel) =>
                                    viewModel.isFlightAdding,
                                builder: (context, value, Widget? child) {
                                  return FlightStatusView(
                                    flightSegment: flightStatusDetailProvider
                                        .flightStatusSegment,
                                    pullRefresh: () => pullRefresh(),
                                    addFlightTap: () =>
                                        addFlight(context: context),
                                    removeFlightTap: () =>
                                        confirmDismiss(context),
                                  );
                                },
                              );
                            }
                            return Center(
                              child: Text(
                                'no_data_available'.localize(context),
                              ),
                            );

                          case Status.loading:
                            return const FlightStatusDetailScreenShimmer();
                          case Status.error:
                            final imageWidth = 200.sp;
                            return Column(
                              children: [
                                Image.asset(
                                  'lib/assets/gif/internal_server_error_page.gif',
                                  width: imageWidth,
                                ).paddingBySide(
                                  bottom: context.k_20,
                                ),
                                Text(
                                  value.errorCode == 'GAF01'
                                      ? 'record_not_found'.localize(context)
                                      : value.errorCode == 'GAFEX'
                                          ? 'something_went_wrong'.localize(
                                              context,
                                            )
                                          : value.message ?? 'NA',
                                ),
                              ],
                            );

                          default:
                            return Selector<FlightStatusDetailState, bool>(
                              selector: (context, viewModel) =>
                                  viewModel.isFlightAdding,
                              builder: (context, value, Widget? child) {
                                return FlightStatusView(
                                  flightSegment: flightStatusDetailProvider
                                      .flightStatusSegment,
                                  pullRefresh: () => pullRefresh(),
                                  addFlightTap: () =>
                                      addFlight(context: context),
                                  removeFlightTap: () =>
                                      confirmDismiss(context),
                                );
                              },
                            );
                        }
                      },
                    ),
                  ],
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                  top: context.k_20,
                  bottom: context.k_20,
                ),
              ),
            ),
            const IgnorePointer(
              // TODO:- Don't remove
              child: Scaffold(
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addFlight({
    required BuildContext context,
  }) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      flightStatusDetailProvider.addFlight(
        flightStatusDetailModel: widget.flightStatusDetailModel,
        context: context,
        successfullyAdded: () {
          callGaEventForFlightSelect(clickEvents: ClickEvents.add_flight);
        },
      );
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          /// call back variable used for updating list of saved flight
          isLoginStatusTap: (value) => value ? refreshTap() : null,
          isNotFromSplash: true,
          popUpRequired: true,
          currentRouteName: flightStatusDetailScreen,
        ),
      );
    }
  }

  Future<void> confirmDismiss(BuildContext context) async {
    callGaEventForFlightSelect(
      clickEvents: ClickEvents.remove_flight_initiated,
    );
    return adShowBottomSheet(
      context: context,
      childWidget: RemoveSaveFlightView(
        removeFlight: (isRemoved) => isRemoved
            ? removeFlight(context: context)
            : callGaEventForFlightSelect(
                clickEvents: ClickEvents.remove_flight_cancel,
              ),
      ),
      headerTitle: 'remove_flight'.localize(context),
    );
  }

  void removeFlight({
    required BuildContext context,
  }) {
    callGaEventForFlightSelect(clickEvents: ClickEvents.remove_flight_confirm);
    flightStatusDetailProvider.deleteSavedFlight(
      flightStatusDetailModel: widget.flightStatusDetailModel,
      context: context,
    );
  }
}
