/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: unrelated_type_equality_checks

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/constants.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/views/choose_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/service_list_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/travel_sector_list_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/booking_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/flight_search_list.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/airport_search_list.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This class is used for Arrival and Departure widget
class ArrivalDepartureView extends StatelessWidget {
  const ArrivalDepartureView({
    Key? key,
    required this.state,
  }) : super(key: key);
  final BookingScreenController state;
  @override
  Widget build(BuildContext context) {
    final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    return Column(
      children: [
        DropDownGeneric(
          needRightPadding: false,
          type: 'service_label'.localize(context),
          onTap: () => adShowBottomSheet(
            context: context,
            childWidget: ServiceListScreen(
              selectedTitle:
                  pranaamAppDataStateManagement.selectedServiceController.text,
              callback: (value) => state.onServiceListCallBack(
                value,
                pranaamAppDataStateManagement.selectedServiceController,
              ),
            ),
            headerTitle: 'service_label'.localize(context),
          ),
          controller: pranaamAppDataStateManagement.selectedServiceController,
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DropDownGeneric(
                needRightPadding: false,
                type: 'travel_sector_label'.localize(context),
                onTap: () => adShowBottomSheet(
                  context: context,
                  childWidget: TravelSectorListScreen(
                    selectedItem: pranaamAppDataStateManagement
                        .selectedTravelSectorController.text,
                    callback: (value) => state.onTravelListCallBack(
                      value,
                      pranaamAppDataStateManagement
                          .selectedTravelSectorController,
                    ),
                    bookingScreenController: state,
                  ),
                  headerTitle: 'travel_sector_label'.localize(context),
                ),
                controller: pranaamAppDataStateManagement
                    .selectedTravelSectorController,
              ),
            ),
            SizedBox(
              width: context.k_20,
            ),
            Expanded(
              child: DropDownGeneric(
                needRightPadding: false,
                svgIcon: SvgAssets.calenderIcon,
                type: 'date'.localize(context),
                onTap: () => BottomSheetUtils.showBottomSheetDialog(
                  context,
                  ADDraggableScrollableBottomSheet(
                    initialChildSize:
                        BottomSheetUtils.getBottomSheetHeightRatio(
                      context,
                    ),
                    childWidget: DateRangeView(
                      showAmount: false,
                      isPranaam: true,
                      // calendarEndDate: (state.isRoundOrTransitDateSelected &&
                      //         ((state.selectedServiceModel?.serviceId ==
                      //                 id_2) ||
                      //             state.selectedServiceModel?.serviceId ==
                      //                 id_3))
                      //     ? (state.transitDateModel?.dateOfJourney.day ==
                      //             DateTime.now().day
                      //         ? DateTime.now().add(const Duration(minutes: 10))
                      //         : state.transitDateModel?.dateOfJourney)
                      //     : null,
                      departureDate: pranaamAppDataStateManagement
                              .dateOfJourneyModel?.dateOfJourney ??
                          DateTime.now(),
                    ),
                  ),
                ).then((value) {
                  if (value != null) {
                    state.updateDate(
                      value,
                      pranaamAppDataStateManagement
                          .selectedDateOfTravelController,
                    );
                  }
                }),
                controller: pranaamAppDataStateManagement
                    .selectedDateOfTravelController,
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DropDownGeneric(
                errorMsg: pranaamAppDataStateManagement.originCityValueNotifier,
                focus: pranaamAppDataStateManagement.originCityFocusNode,
                needRightPadding: false,
                type: 'depart_from'.localize(context),
                onTap: () => showDraggableListBottomSheetForOrigin(
                  context: context,
                  headerTitle: 'origin_label',
                ),
                controller:
                    pranaamAppDataStateManagement.selectedOriginCityController,
              ),
            ),
            SizedBox(
              width: context.k_20,
            ),
            ValueListenableBuilder<String>(
              valueListenable: pranaamAppDataStateManagement.selectionHeading,
              builder: (BuildContext context, String heading, Widget? child) {
                return Expanded(
                  child: DropDownGeneric(
                    errorMsg: pranaamAppDataStateManagement
                        .destinationCityValueNotifier,
                    focus:
                        pranaamAppDataStateManagement.destinationCityFocusNode,
                    needRightPadding: false,
                    type: heading.localize(context),
                    onTap: () => showDraggableListBottomSheetForDestination(
                      context: context,
                      headerTitle: heading,
                    ),
                    controller: pranaamAppDataStateManagement
                        .selectedDestinationCityController,
                  ),
                );
              },
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Selector<PranaamAppDataStateManagement, bool>(
          selector: (_, viewModel) => viewModel.isGuestVisible,
          builder: (_, value, __) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DropDownGeneric(
                    errorMsg: pranaamAppDataStateManagement.flightNotifier,
                    focus: pranaamAppDataStateManagement.flightsFocusNode,
                    needRightPadding: false,
                    type: 'flights'.localize(context),
                    onTap: () => state.isSelected()
                        ? showDraggableListBottomSheetForFlightSearchList(
                            context: context,
                            headerTitle: 'flights',
                          ).then((value) {
                            searchTextController.clear();
                            state.bookingServiceState.buildSearchList(
                              '',
                              state.bookingServiceState.flightDetailModelList,
                            );
                          })
                        : {},
                    controller:
                        pranaamAppDataStateManagement.selectedFlightController,
                  ),
                ),
                Visibility(
                  visible: value,
                  child: SizedBox(
                    width: context.k_20,
                  ),
                ),
                Visibility(
                  visible: value,
                  child: Expanded(
                    child: DropDownGeneric(
                      needRightPadding: false,
                      type: 'guests'.localize(context),
                      onTap: () => adShowBottomSheet(
                        context: context,
                        childWidget: ChooseTravellerScreen(
                          isPranaam: true,
                          allTravellers:
                              pranaamAppDataStateManagement.travellers,
                          callBack: (Travellers value) =>
                              state.onTravellersSelectedCallBack(
                            value,
                            pranaamAppDataStateManagement.travellersController,
                          ),
                        ),
                        headerTitle: 'guests'.localize(context),
                      ),
                      controller:
                          pranaamAppDataStateManagement.travellersController,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Future<void> showDraggableListBottomSheetForFlightSearchList({
    required BuildContext context,
    required String headerTitle,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (
            BuildContext context,
            ScrollController scrollController,
          ) {
            final pranaamAppDataStateManagement =
                context.read<PranaamAppDataStateManagement>();
            return ADDraggableScrollableSheetBody(
              headerTitle: headerTitle,
              childWidget: FlightSearchList(
                scrollController: scrollController,
                callback: (value) => state.onFlightListCallBack(
                  value,
                  pranaamAppDataStateManagement.selectedFlightController,
                ),
                selectedFlight:
                    pranaamAppDataStateManagement.selectedFlightController.text,
                isTransitFlights: false,
              ),
            );
          },
        ),
      );

  Future<void> showDraggableListBottomSheetForOrigin({
    required BuildContext context,
    required String headerTitle,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            final pranaamAppDataStateManagement =
                context.read<PranaamAppDataStateManagement>();
            return ADDraggableScrollableSheetBody(
              headerTitle: headerTitle,
              childWidget: AirportSearchList(
                scrollController: scrollController,
                isFromPranaam: state.isOriginControllerPranaamAirport(),
                isDomestic: state.isOriginDomesticAirport(),
                isInternationalPranaam: true,
                isFrom: false,
                fromWhere: false,
                arrivalOrDepartureString:
                    'select_depart_from_city'.localize(context),
                callback: (data) => state.onCitySelected(
                  data,
                  pranaamAppDataStateManagement.selectedOriginCityController,
                  id_4,
                  context,
                ),
                pranaamAirPortList: pranaamAirPortList,
                selectedAirport: pranaamAppDataStateManagement
                    .selectedOriginCityController.text,
              ),
            );
          },
        ),
      );

  Future<void> showDraggableListBottomSheetForDestination({
    required BuildContext context,
    required String headerTitle,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            final pranaamAppDataStateManagement =
                context.read<PranaamAppDataStateManagement>();
            return ADDraggableScrollableSheetBody(
              headerTitle: headerTitle,
              childWidget: AirportSearchList(
                scrollController: scrollController,
                isFromPranaam: state.isDestinationControllerPranaamAirport(),
                isFrom: false,
                fromWhere: false,
                isDomestic: state.isDestinationDomesticAirport(),
                isInternationalPranaam: true,
                arrivalOrDepartureString: 'select_going_to'.localize(context),
                callback: (data) => state.onCitySelected(
                  data,
                  pranaamAppDataStateManagement
                      .selectedDestinationCityController,
                  id_1,
                  context,
                ),
                selectedAirport: pranaamAppDataStateManagement
                    .selectedDestinationCityController.text,
              ),
            );
          },
        ),
      );
}
