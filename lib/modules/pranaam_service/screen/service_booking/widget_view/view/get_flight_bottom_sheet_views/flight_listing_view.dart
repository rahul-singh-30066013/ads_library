/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/show_flight_listing.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/show_shimmer_for_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/network_check.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class FLightListingView extends StatefulWidget {
  const FLightListingView({
    Key? key,
    required this.flightListState,
    required this.callback,
    required this.selectedFlight,
    required this.fliteredList,
    required this.isTransitFlights,
    required this.scrollController,
  }) : super(key: key);

  final ADResponseState flightListState;
  final ADGenericCallback callback;
  final String selectedFlight;
  final List<PranaamFlights> fliteredList;
  final bool isTransitFlights;
  final ScrollController scrollController;

  @override
  State<FLightListingView> createState() => _FLightListingViewState();
}

class _FLightListingViewState extends State<FLightListingView> {
  bool isInternetPresent = true;

  @override
  Widget build(BuildContext context) {
    NetworkCheck().check().then((internet) {
      if (!internet) {
        isInternetPresent = internet;
        setState(() {
          adLog('$internet');
        });
      }
    });

    switch (widget.flightListState.viewStatus) {
      case Status.none:
        return NoDataFoundErrorScreen(
          paddingBetweenImageAndErrorTitle: context.k_20,
          paddingBetweenErrorMessageAndRetry: context.k_30,
          errorTitle: isInternetPresent
              ? 'no_internet_msg'.localize(context)
              : noInternetMessage,
          onRetryTap: () => {
            //         bookingServiceState.resetSelectedFlight(),
          },
        );
      case Status.loading:
        return const ShowShimmerForFlights();
      case Status.complete:
        return widget.fliteredList.isNotEmpty
            ? ShowFLightListing(
                isTransitFlights: widget.isTransitFlights,
                pranaamFlights: widget.fliteredList,
                callback: widget.callback,
                selectedFlight: widget.selectedFlight,
                scrollController: widget.scrollController,
              )
            : NoDataFoundErrorScreen(
                paddingBetweenImageAndErrorTitle: context.k_20,
                paddingBetweenErrorMessageAndRetry: context.k_30,
                errorTitle: isInternetPresent
                    ? 'no_internet_msg'.localize(context)
                    : noInternetMessage,
              );
      case Status.error:
        return NoDataFoundErrorScreen(
          paddingBetweenImageAndErrorTitle: context.k_20,
          paddingBetweenErrorMessageAndRetry: context.k_30,
          errorTitle: isInternetPresent
              ? 'no_internet_msg'.localize(context)
              : noInternetMessage,
          onRetryTap: () => {
            //   bookingServiceState.resetSelectedFlight(),
          },
        );
      default:
        return NoDataFoundErrorScreen(
          paddingBetweenImageAndErrorTitle: context.k_20,
          paddingBetweenErrorMessageAndRetry: context.k_30,
          errorTitle: isInternetPresent
              ? 'no_internet_msg'.localize(context)
              : noInternetMessage,
          onRetryTap: () => {
            //        bookingServiceState.resetSelectedFlight(),
          },
        );
    }
  }
}
