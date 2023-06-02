/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/select_city_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/airport_search_list.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///this widget is used to select boarding and departure
///city for flight
class CitiesSelectorWidget extends StatefulWidget {
  const CitiesSelectorWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CitiesSelectorWidget> createState() => _CitiesSelectorWidgetState();
}

class _CitiesSelectorWidgetState extends State<CitiesSelectorWidget>
    with TickerProviderStateMixin {
  /// these variable is created to avoid the magic number error
  static const double _k_0 = 0;
  static const double _k_0_5 = 0.5;
  static const double _k_44 = 44;

  FlightBookingState flightViewModel = FlightBookingState();

  ///[controller] is used to animate the rotate icon while.
  AnimationController? controller;

  CityDetailModel? departureSelectedAirport;

  SiteCoreStateManagement? siteCoreStateManagement;

  bool swapActionAnimator = false;

  @override
  void initState() {
    super.initState();
    flightViewModel = context.read<FlightBookingState>();
    siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    siteCoreStateManagement?.fetchPaymentFromSiteCore();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<FlightBookingState, TripDetailModel?>(
      selector: (context, flightViewModel) =>
          flightViewModel.flightBookingModel.oneWayTrip,
      builder: (BuildContext context, model, Widget? child) {
        return Material(
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _showDraggableListBottomSheet(
                    context: context,
                    headerTitle: 'select_departure_city',
                    isFrom: true,
                    arrivalOrDepartureString: 'select_departure_city',
                  ),
                  child: SelectCityView(
                    cityDetail: model?.fromCity,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ).paddingBySide(
                    top: context.k_12,
                    left: context.k_14,
                    right: context.k_16,
                    bottom: context.k_18,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _arrowRotationTap(),
                borderRadius: BorderRadius.circular(context.k_20),
                child: Container(
                  width: _k_44.sp,
                  height: _k_44.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: context.adColors.black),
                    shape: BoxShape.circle,
                  ),
                  child: RotationTransition(
                    turns: Tween(begin: _k_0, end: _k_0_5).animate(
                      controller ??
                          AnimationController(
                            vsync: this,
                          ),
                    ),
                    child: SvgPicture.asset(
                      SvgAssets.arrowIcon,
                      width: context.k_18,
                      height: context.k_18,
                    ),
                  ),
                ),
              ).paddingBySide(
                left: context.k_8,
                right: context.k_8,
                top: context.k_18,
              ),
              Expanded(
                child: InkWell(
                  onTap: () => _showDraggableListBottomSheet(
                    context: context,
                    headerTitle: 'select_arrival_city',
                    isFrom: false,
                    arrivalOrDepartureString: 'select_arrival_city',
                  ),
                  child: SelectCityView(
                    cityDetail: model?.toCity,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ).paddingBySide(
                    top: context.k_12,
                    left: context.k_16,
                    right: context.k_14,
                    bottom: context.k_18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showDraggableListBottomSheet({
    required BuildContext context,
    required String headerTitle,
    required String arrivalOrDepartureString,
    required bool isFrom,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return ADDraggableScrollableSheetBody(
              headerTitle: headerTitle,
              childWidget: AirportSearchList(
                isFrom: isFrom,
                callback: (data) => _airportSelectedCallBack(
                  data,
                  context,
                  isFromCity: isFrom,
                ),
                arrivalOrDepartureString:
                    arrivalOrDepartureString.localize(context),
                scrollController: scrollController,
                isDomestic: false,
              ),
            );
          },
        ),
      );

  void _airportSelectedCallBack(
    data,
    BuildContext context, {
    required bool isFromCity,
  }) {
    departureSelectedAirport = data;
    if (isFromCity) {
      flightViewModel.updateFromCity(
        departureSelectedAirport ?? const CityDetailModel(),
        context,
      );
    } else {
      flightViewModel.updateToCity(
        departureSelectedAirport ?? const CityDetailModel(),
        context,
      );
    }
    _sameCityCheckValidation();
  }

  void _sameCityCheckValidation() {
    siteCoreStateManagement?.fetchListOfAirports();
    if (flightViewModel.flightBookingModel.oneWayTrip?.fromCity?.cityCode ==
        flightViewModel.flightBookingModel.oneWayTrip?.toCity?.cityCode) {
      SnackBarUtil.showSnackBar(
        context,
        'departure_arrival_same_cities_error_msg'.localize(context),
      );
    }
    final sectorID =
        (!flightViewModel.flightBookingModel.isDomesticDepartureCity ||
                !flightViewModel.flightBookingModel.isDomesticArrivalCity)
            ? 'I'
            : 'D';
    final isDomestic = sectorID.toLowerCase() == 'd';
    if (isDomestic) {
      final selectedTraveller = flightViewModel.allTravellers;
      selectedTraveller?.travelClass = TravelClass.economy;
      flightViewModel.updateTravellers(
        Travellers(
          adults: selectedTraveller?.adults ?? 1,
          children: selectedTraveller?.children ?? 0,
          infants: selectedTraveller?.infants ?? 0,
        ),
      );
    }
  }

  void _arrowRotationTap() {
    swapActionAnimator = !swapActionAnimator;
    flightViewModel.rotateCities();
    final TickerFuture? ticker = swapActionAnimator
        ? controller?.forward(from: 0)
        : controller?.reverse(from: 1);
    adLog(ticker.toString());
  }
}
