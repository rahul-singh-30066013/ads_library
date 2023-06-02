/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: cascade_invocations

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/views/choose_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
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

///This class is used for Round Trip widget
class RoundTripView extends StatelessWidget {
  const RoundTripView({
    Key? key,
    required this.bookingScreenController,
  }) : super(key: key);
  final BookingScreenController bookingScreenController;

  @override
  Widget build(BuildContext context) {
    final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    return Selector<PranaamAppDataStateManagement, bool>(
      selector: (_, viewModel) => viewModel.isRoundTripVisible,
      builder: (_, value, __) {
        return Visibility(
          visible: value,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DropDownGeneric(
                      errorMsg: pranaamAppDataStateManagement.transitNotifier,
                      focus: pranaamAppDataStateManagement.transitCityFocusNode,
                      needRightPadding: false,
                      type: 'arrive_from'.localize(context),
                      onTap: () => showDraggableListBottomSheetForOrigin(
                        context: context,
                        headerTitle: 'origin_label',
                      ),
                      controller:
                          pranaamAppDataStateManagement.transitToController,
                    ),
                  ),
                  SizedBox(
                    width: context.k_20,
                  ),
                  Expanded(
                    child: DropDownGeneric(
                      needRightPadding: false,
                      isDisabled: true,
                      type: 'going_to'.localize(context),
                      controller:
                          pranaamAppDataStateManagement.goingToController,
                      iconColor: context.adColors.greyReviewShade,
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
                            calendarStartDate: pranaamAppDataStateManagement
                                    .dateOfJourneyModel?.dateOfJourney ??
                                DateTime.now(),
                            departureDate: pranaamAppDataStateManagement
                                    .transitDateModel?.dateOfJourney ??
                                DateTime.now(),
                          ),
                        ),
                      ).then((value) {
                        if (value != null) {
                          pranaamAppDataStateManagement
                              .isRoundOrTransitDateSelected = true;
                          bookingScreenController.updateDate(
                            value,
                            pranaamAppDataStateManagement.dateController,
                            isTransit: true,
                          );
                        }
                      }),
                      controller: pranaamAppDataStateManagement.dateController,
                    ),
                  ),
                  SizedBox(
                    width: context.k_20,
                  ),
                  Expanded(
                    child: DropDownGeneric(
                      errorMsg:
                          pranaamAppDataStateManagement.transitFlightNotifier,
                      focus:
                          pranaamAppDataStateManagement.transitFlightFocusNode,
                      needRightPadding: false,
                      type: 'flights'.localize(context),
                      onTap: () => showDraggableListBottomSheetForFlightSearch(
                        context: context,
                        headerTitle: 'flights',
                      ).then((value) {
                        searchTextController.clear();
                        bookingScreenController.bookingServiceState
                            .buildSearchList(
                          '',
                          bookingScreenController
                              .bookingServiceState.transitFlightDetailModelList,
                          isTransit: true,
                        );
                      }),
                      controller:
                          pranaamAppDataStateManagement.flightController,
                    ),
                  ),
                ],
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              DropDownGeneric(
                needRightPadding: false,
                type: 'guests'.localize(context),
                onTap: () => adShowBottomSheet(
                  context: context,
                  childWidget: ChooseTravellerScreen(
                    isPranaam: true,
                    allTravellers: pranaamAppDataStateManagement.travellers,
                    callBack: (Travellers value) =>
                        bookingScreenController.onTravellersSelectedCallBack(
                      value,
                      pranaamAppDataStateManagement.guestsController,
                    ),
                  ),
                  headerTitle: 'guests'.localize(context),
                ),
                controller: pranaamAppDataStateManagement.guestsController,
              ),
              ADSizedBox(
                height: context.k_10,
              ),
            ],
          ),
        );
      },
    );
  }

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
                isInternationalPranaam: true,
                isFrom: true,
                fromWhere: false,
                isDomestic:
                    bookingScreenController.isDestinationDomesticAirport(),
                arrivalOrDepartureString:
                    'select_depart_from_city'.localize(context),
                callback: (data) => bookingScreenController.onCitySelected(
                  data,
                  pranaamAppDataStateManagement.transitToController,
                  id_2,
                  context,
                ),
                selectedAirport:
                    pranaamAppDataStateManagement.transitToController.text,
              ),
            );
          },
        ),
      );

  Future<void> showDraggableListBottomSheetForFlightSearch({
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
              childWidget: FlightSearchList(
                scrollController: scrollController,
                callback: (value) =>
                    bookingScreenController.onFlightListCallBack(
                  value,
                  pranaamAppDataStateManagement.flightController,
                  isTransit: true,
                ),
                isTransitFlights: true,
                selectedFlight:
                    pranaamAppDataStateManagement.flightController.text,
              ),
            );
          },
        ),
      );
}
