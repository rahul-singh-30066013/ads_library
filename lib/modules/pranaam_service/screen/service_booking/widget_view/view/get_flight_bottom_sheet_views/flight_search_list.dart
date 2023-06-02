/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/flight_listing_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const double padding_10 = 10;

///
///This class is used to construct view for search and listing of flights.
///[ScrollController] is of type [ScrollController] and since the screen is a part of
///DraggableScrollableSheet, [ScrollController] is passed to construction via builder of DraggableScrollableSheet.
///

class FlightSearchList extends StatefulWidget {
  ///usage
  ///const FlightSearchList(
  ///     Key? key,
  ///     required this.scrollController,
  ///     required this.arrivalOrDepartureString,
  ///   );
  ///
  const FlightSearchList({
    Key? key,
    required this.callback,
    required this.selectedFlight,
    required this.isTransitFlights,
    required this.scrollController,
  }) : super(key: key);
  final ADGenericCallback callback;
  final String selectedFlight;
  final bool isTransitFlights;
  final ScrollController scrollController;

  @override
  State<FlightSearchList> createState() => _FlightSearchListState();
}

class _FlightSearchListState extends State<FlightSearchList> {
  PranaamAppDataStateManagement? pranaamAppDataStateManagement;

  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    adLog('Vaibhav${widget.isTransitFlights}', className: this);

    return Column(
      children: [
        SearchView(
          hintText: 'search_for_flight_hint'.localize(context),
          onChanged: (value) => pranaamAppDataStateManagement?.buildSearchList(
            value,
            getFlights(pranaamAppDataStateManagement),
            isTransit: widget.isTransitFlights,
          ),
          onFieldSubmitted: (value) =>
              pranaamAppDataStateManagement?.buildSearchList(
            value,
            getFlights(pranaamAppDataStateManagement),
            isTransit: widget.isTransitFlights,
          ),
          onIconButtonPressed: () => clearFocusController(context),
        ).paddingBySide(
          top: context.k_14,
          bottom: context.k_24,
          left: context.k_16,
          right: context.k_16,
        ),
        Selector<PranaamAppDataStateManagement, ADResponseState>(
          selector: (context, model) => widget.isTransitFlights
              ? (pranaamAppDataStateManagement?.transitFlightListState ??
                  ADResponseState.loading())
              : (pranaamAppDataStateManagement?.flightListState ??
                  ADResponseState.loading()),
          builder: (
            context,
            flightState,
            child,
          ) {
            return widget.isTransitFlights
                ? Selector<PranaamAppDataStateManagement, List<PranaamFlights>>(
                    selector: (context, model) =>
                        pranaamAppDataStateManagement
                            ?.transitFlightDetailModelList ??
                        [],
                    builder: (context, flights, child) {
                      return FLightListingView(
                        isTransitFlights: widget.isTransitFlights,
                        flightListState: pranaamAppDataStateManagement
                                ?.transitFlightListState ??
                            ADResponseState.loading(),
                        callback: (value) => onBottomSheetTap(value),
                        selectedFlight: widget.selectedFlight,
                        fliteredList: flights,
                        scrollController: widget.scrollController,
                      );
                    },
                  )
                : Selector<PranaamAppDataStateManagement, List<PranaamFlights>>(
                    selector: (context, model) =>
                        pranaamAppDataStateManagement?.flightDetailModelList ??
                        [],
                    builder: (context, flights, child) {
                      return FLightListingView(
                        isTransitFlights: widget.isTransitFlights,
                        flightListState:
                            pranaamAppDataStateManagement?.flightListState ??
                                ADResponseState.loading(),
                        callback: (value) => onBottomSheetTap(value),
                        selectedFlight: widget.selectedFlight,
                        fliteredList: flights,
                        scrollController: widget.scrollController,
                      );
                    },
                  );
          },
        ),
      ],
    );
  }

  List<PranaamFlights> getFlights(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    return widget.isTransitFlights
        ? pranaamAppDataStateManagement?.transitFlightDetailModelList ?? []
        : pranaamAppDataStateManagement?.flightDetailModelList ?? [];
  }

  void onBottomSheetTap(PranaamFlights pranaamFlights) {
    pranaamAppDataStateManagement?.selectedFlightDetailModel = pranaamFlights;
    widget.callback(pranaamFlights);
  }

  void clearFocusController(BuildContext context) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    pranaamAppDataStateManagement?.buildSearchList(
      '',
      getFlights(pranaamAppDataStateManagement),
      isTransit: widget.isTransitFlights,
    );
  }
}
