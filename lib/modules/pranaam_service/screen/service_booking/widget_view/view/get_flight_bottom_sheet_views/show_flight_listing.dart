/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/show_filtered_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ShowFLightListing extends StatelessWidget {
  const ShowFLightListing({
    Key? key,
    required this.pranaamFlights,
    required this.callback,
    required this.selectedFlight,
    required this.isTransitFlights,
    required this.scrollController,
  }) : super(key: key);
  final List<PranaamFlights> pranaamFlights;
  final ADGenericCallback callback;
  final String selectedFlight;
  final bool isTransitFlights;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: pranaamFlights.length,
        controller: scrollController,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => clearFocusControllerAndPop(
              context,
              pranaamFlights,
              index,
              callback,
              isTransitFlights: isTransitFlights,
            ),
            child: Container(
              color: selectedFlight == pranaamFlights[index].flightFinalNumber
                  ? context.adColors.lightBlue
                  : context.adColors.transparentColor,
              child: ShowFilteredFlights(
                index: index,
                flightList: pranaamFlights,
                selectedFlight: selectedFlight,
              ),
            ),
          );
        },
      ),
    );
  }

  void clearFocusControllerAndPop(
    BuildContext context,
    List<PranaamFlights> flights,
    int index,
    ADGenericCallback callback, {
    bool isTransitFlights = false,
  }) {
    searchTextController.clear();

    FocusScope.of(context).unfocus();
    context
        .read<PranaamAppDataStateManagement>()
        .buildSearchList('', flights, isTransit: isTransitFlights);
    callback(flights[index]);
    navigatorPopScreen(context);
  }
}
