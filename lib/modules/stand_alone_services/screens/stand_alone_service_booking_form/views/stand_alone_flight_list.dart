import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/get_flights_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/pranaam_app_data_repository/pranaam_app_data_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/show_shimmer_for_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_flight_list_view.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/network_check.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class StandAloneFlightList extends StatefulWidget {
  const StandAloneFlightList({
    Key? key,
    required this.response,
    required this.callback,
    required this.selectedFlight,
  }) : super(key: key);
  final ValueNotifier<ADResponseState> response;
  final ADGenericCallback<PranaamFlights> callback;
  final String selectedFlight;

  @override
  State<StandAloneFlightList> createState() => _StandAloneFlightListState();
}

class _StandAloneFlightListState extends State<StandAloneFlightList> {
  List<PranaamFlights> fliterList = [];
  List<PranaamFlights> pranaamFlights = [];
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
    return Column(
      children: [
        SearchView(
          hintText: 'search_for_flight_hint'.localize(context),
          onChanged: _searchFLight,
          onFieldSubmitted: (value) => _searchFLight,
          onIconButtonPressed: () => clearFocusController(context),
        ).paddingBySide(
          top: context.k_14,
          bottom: context.k_24,
          left: context.k_16,
          right: context.k_16,
        ),
        ValueListenableBuilder(
          valueListenable: widget.response,
          builder: (
            BuildContext context,
            ADResponseState value,
            Widget? child,
          ) {
            switch (value.viewStatus) {
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
                pranaamFlights =
                    (value.data as GetFlightsResponseModel).pranaamFlights ??
                        [];
                return pranaamFlights.isNotEmpty
                    ? StandAloneFlightListView(
                        selectedFlight: widget.selectedFlight,
                        pranaamFlights:
                            (fliterList.isEmpty) ? pranaamFlights : fliterList,
                        callback: widget.callback,
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
          },
        ),
      ],
    );
  }

  void _searchFLight(value) {
    adLog('Search Term: is $value');
    final PranaamAppDataRepository _pranaamAppDataRepository =
        PranaamAppDataRepository();
    fliterList =
        _pranaamAppDataRepository.getFilteredFlightList(pranaamFlights, value);
    setState(() => {});
  }

  void clearFocusController(BuildContext context) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    _searchFLight('');
  }
}
