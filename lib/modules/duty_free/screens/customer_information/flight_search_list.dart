/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/flight/flight_search_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const double padding_10 = 11;
final double k17 = 17.sp;
final double k_3 = 3.sp;

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
    this.date,
    this.time,
    this.storeType,
    this.airportCode,
  }) : super(key: key);
  final ADGenericCallback callback;
  final DateTime? date;
  final String? time;
  final String? storeType;
  final String? airportCode;

  @override
  State<FlightSearchList> createState() => _FlightSearchListState();
}

class _FlightSearchListState extends State<FlightSearchList> {
  FlightSearchState flightSearchState = FlightSearchState();

  @override
  void initState() {
    super.initState();
    final String timeValue =
        widget.time ?? context.read<DutyFreeState>().pickupTime;

    flightSearchState.fetchFlightDetails(
      pickUpDate: widget.date ?? context.read<DutyFreeState>().pickUpDate,
      pickUpTime: timeValue,
      terminal: widget.storeType ??
          context
              .read<DutyFreeState>()
              .dutyFreeCartResponse
              ?.itemDetails
              .first
              .storeType,
      airportCode: widget.airportCode ??
          context.read<DutyFreeState>().dutyFreeCartResponse?.airportCode,
    );
  }

  final k84 = 84.sp;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return ADSelectorStateLessWidget(
      viewModel: flightSearchState,
      child: Scaffold(
        body: SliverAppBarBaseComponent(
          searchBarMaxHeight: k84,
          searchBarMinHeight: k84,
          appBarLeftPadding: context.k_2,
          appBarRightPadding: context.k_12,
          flexibleTitleTopPadding: k17,
          flexibleTitleLeftPadding: k_3,
          closeScreenWidget: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              key: const Key(FlightAutomationKeys.headerIconKey),
              iconSize: context.k_48,
              visualDensity: VisualDensity.compact,
              splashRadius: context.k_20,
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                SvgAssets.closeIcon,
                height: context.k_14,
                width: context.k_14,
                color: closeIconColor,
              ),
            ),
          ),
          searchBarPadding: EdgeInsets.only(
            top: context.k_14,
            bottom: context.k_24,
            left: context.k_16,
            right: context.k_16,
          ),
          stickyWidget: SearchView(
            hintText: 'search_for_flight_hint'.localize(context),
            onChanged: (value) => {
              flightSearchState.filterFlights(value),
            },
            onFieldSubmitted: (value) => flightSearchState.filterFlights(value),
            onIconButtonPressed: () => clearFocusController(context),
            textInputType: TextInputType.text,
          ),
          body: Consumer<FlightSearchState>(
            builder: (
              context,
              FlightSearchState model,
              child,
            ) =>
                Builder(
              builder: (context) => FLightListingView(
                flightSearchState: flightSearchState,
                callback: widget.callback,
                airportCode: widget.airportCode ??
                    context
                        .read<DutyFreeState>()
                        .dutyFreeCartResponse
                        ?.airportCode ??
                    '',
              ),
            ),
          ),
          title: 'flights'.localize(context),
        ),
      ),
    );
  }

  void dragSheetTap(BuildContext context) {
    searchTextController.clear();
    navigatorPopScreen(context);
  }

  void clearFocusControllerAndPop(BuildContext context, int index) {
    final List<FlightStatusSegment> flights =
        flightSearchState.filteredFlightList;
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    flightSearchState.filterFlights('');
    navigatorPopScreenWithData(
      context,
      flights[index],
    );
  }

  void clearFocusController(BuildContext context) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    flightSearchState.filterFlights('');
  }

  InputBorder getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        color: context.adColors.transparentColor,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _scrollController.dispose();
  }
}

class FLightListingView extends StatelessWidget {
  const FLightListingView({
    Key? key,
    required this.flightSearchState,
    required this.callback,
    required this.airportCode,
  }) : super(key: key);

  final FlightSearchState flightSearchState;
  final ADGenericCallback callback;
  final String airportCode;

  @override
  Widget build(BuildContext context) {
    switch (flightSearchState.flightStatusState.viewStatus) {
      case Status.none:
        return NoDataFoundErrorScreen(
          paddingBetweenImageAndErrorTitle: context.k_20,
          paddingBetweenErrorMessageAndRetry: context.k_30,
          errorTitle: flightSearchState.flightStatusState.message ?? '',
          onRetryTap: () => {
            flightSearchState.fetchFlightDetails(
              airportCode: airportCode,
            ),
          },
        );
      case Status.loading:
        return const ShowShimmerForFlights();
      case Status.complete:
        return ShowFLightListing(
          flightSearchState: flightSearchState,
          callback: callback,
        );
      case Status.error:
        return NoDataFoundErrorScreen(
          paddingBetweenImageAndErrorTitle: context.k_20,
          paddingBetweenErrorMessageAndRetry: context.k_30,
          errorTitle: flightSearchState.flightStatusState.message ?? '',
          onRetryTap: () => {
            flightSearchState.fetchFlightDetails(
              airportCode: airportCode,
            ),
          },
        );
      default:
        return NoDataFoundErrorScreen(
          paddingBetweenImageAndErrorTitle: context.k_20,
          paddingBetweenErrorMessageAndRetry: context.k_30,
          errorTitle: flightSearchState.flightStatusState.message ?? '',
          onRetryTap: () => {
            flightSearchState.fetchFlightDetails(
              airportCode: airportCode,
            ),
          },
        );
    }
  }
}

class ShowFLightListing extends StatelessWidget {
  const ShowFLightListing({
    Key? key,
    required this.flightSearchState,
    required this.callback,
  }) : super(key: key);
  final FlightSearchState flightSearchState;
  final ADGenericCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.adColors.whiteTextColor,
      child: Selector<FlightSearchState, int>(
        selector: (context, model) => model.filteredFlightList.length,
        builder: (context, value, child) =>
            flightSearchState.filteredFlightList.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.only(bottom: context.k_10),
                    itemCount: flightSearchState.filteredFlightList.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: ShowFilteredFlights(
                          index: index,
                          flightList: flightSearchState.filteredFlightList,
                          selectedFlightNumber: context
                              .read<DutyFreeState>()
                              .flightNumberController
                              .text
                              .trim(),
                        ),
                        onTap: () => clearFocusControllerAndPop(
                          context,
                          flightSearchState.filteredFlightList,
                          index,
                          callback,
                        ),
                      );
                    },
                  )
                : NoDataFoundErrorScreen(
                    paddingBetweenImageAndErrorTitle: context.k_20,
                    paddingBetweenErrorMessageAndRetry: context.k_30,
                    errorTitle: 'oops_no_results_found'.localize(context),
                    onRetryTap: onRetryTap,
                  ),
      ),
    );
  }

  void onRetryTap() {
    searchTextController.clear();
    flightSearchState.filterFlights('');
  }

  void clearFocusControllerAndPop(
    BuildContext context,
    List<FlightStatusSegment> flights,
    int index,
    ADGenericCallback callback,
  ) {
    searchTextController.clear();
    FocusScope.of(context).unfocus();
    flightSearchState.fetchFlightDetails();
    callback(flights[index]);
    navigatorPopScreen(context);
  }
}

///
///This class is used to construct view for rows of flight list.
///[index] is of type [int] and it is the index at which row has to build.
///[flightList] is of type List<FlightDetailsModel>.
///
class ShowFilteredFlights extends StatelessWidget {
  ///
  /// usage
  /// ShowFilteredAirports(
  ///     index = 1,
  ///     flightListState=[],
  ///   );
  ///
  const ShowFilteredFlights({
    Key? key,
    required this.index,
    required this.flightList,
    required this.selectedFlightNumber,
  }) : super(key: key);

  final int index;
  final List<FlightStatusSegment> flightList;
  final String selectedFlightNumber;

  @override
  Widget build(BuildContext context) {
    final FlightStatusSegment flightDetailsModel = flightList[index];

    return Container(
      padding: EdgeInsets.only(
        top: context.k_14,
        bottom: context.k_14,
      ),
      decoration: BoxDecoration(
        color: selectedFlightNumber == flightDetailsModel.flightnumber
            ? context.adColors.lightBlue
            : Colors.white,
      ),
      child: Row(
        children: [
          ADSizedBox(
            width: context.k_16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(context.k_4),
            child: ADCachedImage(
              imageUrl: FlightUtils
                      .airlineInfo?[flightDetailsModel.airlinecode]?.icon ??
                  '',
              width: context.k_26,
              height: context.k_26,
            ),
          ),
          // SvgPicture.network(
          //   FlightUtils.airlineInfo?[flightDetailsModel.airlinecode]?.icon ?? '',
          //   // getAirlineLogo(flightDetailsModel.airlinecode.),
          //   width: context.k_28,
          //   height: context.k_28,
          // ),
          ADSizedBox(
            width: context.k_10,
          ),
          Expanded(
            child: Text(
              flightDetailsModel.flightnumber,
            ),
          ),
          if (selectedFlightNumber == flightDetailsModel.flightnumber)
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: context.adColors.filterBlackText,
                ),
                ADSizedBox(
                  width: context.k_10,
                ),
              ],
            ),
        ],
      ),
    );
  }

  String getAirlineLogo(String airlineCode) {
    if (airlineCode == '6E') {
      return 'lib/assets/images/common/indigo.png';
    } else if (airlineCode == 'AI') {
      return 'lib/assets/images/common/air-india.png';
    } else if (airlineCode == 'G8') {
      return 'lib/assets/images/common/go-first.png';
    } else if (airlineCode == 'SG') {
      return 'lib/assets/images/common/spice-jet.png';
    } else if (airlineCode == 'UK') {
      return 'lib/assets/images/common/vistra.png';
    } else {
      return 'lib/assets/images/common/air-asia.png';
    }
  }
}

class ShowShimmerForFlights extends StatelessWidget {
  ///
  /// usage
  /// ShowShimmerForFlights();
  ///
  ///
  const ShowShimmerForFlights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.adColors.whiteTextColor,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        //itemCount: padding_10.toInt(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              ADSizedBox(
                width: context.k_16,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                width: context.k_28,
                height: context.k_28,
                rectanglePadding: EdgeInsets.zero,
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                height: context.k_20,
                width: context.k_60,
                rectanglePadding: EdgeInsets.zero,
              ),
            ],
          );
        },
        itemCount: padding_10.toInt(),
        separatorBuilder: (context, index) => ADSizedBox(
          height: context.k_24,
        ),
      ),
    );
  }
}
