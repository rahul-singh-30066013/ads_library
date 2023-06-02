/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/flight_booking_dates.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/select_traveller_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/views/choose_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/views/cities_selector_widget.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/views/search_flights_button_widget.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/views/trip_type_selector_widget.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/screens/flight_booking_offer_slider_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

///TODO: need to implement in style guide.
/// TODO cyclomatic-complexity 65
const double k_50 = 50;
const int k_365 = 365;
const double offerShimmerHeight = 150;

///this class return the booking screen view.
class FlightBookingSearchScreen extends StatefulWidget {
  /// *[flightBookingModel] is the request model of this screen.
  final FlightBookingModel flightBookingModel;
  final bool isFromDeepLink;

  const FlightBookingSearchScreen({
    Key? key,
    required this.flightBookingModel,
    this.isFromDeepLink = false,
  }) : super(key: key);

  @override
  State<FlightBookingSearchScreen> createState() =>
      _FlightBookingSearchScreenState();
}

class _FlightBookingSearchScreenState extends State<FlightBookingSearchScreen> {
  FlightBookingState flightViewModel = FlightBookingState();

  ADTapCallback? onTapRetry;

  Travellers? selectedTraveller;

  @override
  void initState() {
    super.initState();
    if (widget.isFromDeepLink) {
      flightViewModel
        ..flightBookingModel = widget.flightBookingModel
        ..allTravellers = widget.flightBookingModel.travellers
        ..getAllOffers();
    } else {
      flightViewModel
        ..flightBookingModel = widget.flightBookingModel
        ..fetchRecentDataFromPref()
        ..allTravellers = Travellers()
        ..getAllOffers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ADSelectorStateLessWidget(
        viewModel: flightViewModel,
        child: ListView(
          children: [
            const TripTypeSelectorWidget(),
            const CitiesSelectorWidget(),
            const Divider(
              height: 1,
            ),
            const FlightBookingDates(),
            const Divider(
              height: 1,
            ),
            InkWell(
              onTap: () => adShowBottomSheet(
                context: context,
                childWidget: ChooseTravellerScreen(
                  allTravellers: flightViewModel.allTravellers,
                  callBack: (Travellers value) => selectedTraveller = value,
                  flightBookingModel: flightViewModel.flightBookingModel,
                ),
                headerTitle: 'traveller_class'.localize(context),
              ).then((value) {
                if (selectedTraveller == null) {
                  return;
                }
                flightViewModel
                    .updateTravellers(selectedTraveller ?? Travellers());
              }),
              child: SelectTravellerView(
                type: 'travellers_class'.localize(context),
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            const Divider(
              height: 1,
            ),
            ADSizedBox(
              height: context.k_10,
            ),
            const SearchFlightsButtonWidget(),
            ADSizedBox(
              height: context.k_28,
            ),
            Selector<FlightBookingState, List<WidgetItem>>(
              selector: (context, viewModel) => viewModel.filteredOfferList,
              builder: (
                context,
                value,
                Widget? child,
              ) {
                return flightViewModel.offersState.viewStatus == Status.complete
                    ? value.isNotEmpty
                        ? Column(
                            children: [
                              FlightBookingOfferSliderView(
                                flightBookingOfferItems: value,
                              ),
                              SizedBox(height: context.k_48),
                            ],
                          )
                        : const SizedBox.shrink()
                    : flightViewModel.offersState.viewStatus == Status.loading
                        ? ADShimmerWidget.shimmerShape(
                            type: ShimmerType.squareBox,
                            height: offerShimmerHeight.sp,
                            width: context.widthOfScreen,
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_20,
                            top: context.k_20,
                          )
                        : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
