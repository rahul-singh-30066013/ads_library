/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/flight_listing_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class SearchFlightsButtonWidget extends StatelessWidget {
  const SearchFlightsButtonWidget({Key? key}) : super(key: key);

  static final double _buttonHeight = 52.sp;

  @override
  Widget build(BuildContext context) {
    return Selector<FlightBookingState, TripDetailModel?>(
      selector: (context, flightViewModel) =>
          flightViewModel.flightBookingModel.oneWayTrip,
      builder: (BuildContext context, model, Widget? child) {
        final flightViewModel = context.read<FlightBookingState>();
        return ElevatedButton(
          key: const Key(FlightAutomationKeys.searchFlightButton),
          onPressed: () => _searchFlight(model, flightViewModel, context),
          style: ElevatedButton.styleFrom(
            shadowColor: context.adColors.transparentColor,
            fixedSize: Size(double.infinity, _buttonHeight),
            primary: model?.fromCity?.cityCode == model?.toCity?.cityCode
                ? context.adColors.blueColor
                : context.adColors.blueColor,
            shape: const StadiumBorder(),
          ),
          child: Text(
            'search_flight'.localize(context),
            style: ADTextStyle700.size16
                .setTextColor(context.adColors.whiteTextColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).paddingBySide(
            top: context.k_16,
            bottom: context.k_16,
          ),
        ).paddingBySide(
          top: context.k_30,
          left: context.k_16,
          right: context.k_16,
        );
      },
    );
  }

  void _dateValidationCheck(
    BuildContext context,
    FlightBookingModel flightBookingModel,
  ) {
    final flightViewModel = context.read<FlightBookingState>();
    if (FlightUtils.isRoundTrip(
      flightViewModel.flightBookingModel.tripType,
    )) {
      isOneWayTrip = false;
      adLog(
        flightViewModel.flightBookingModel.tripType.toString(),
      );
    } else {
      isOneWayTrip = true;
    }

    if (isOneWayTrip) {
      if (!oneWayDateValidationCheck(
        flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
      )) {
        SnackBarUtil.showSnackBar(
          context,
          'looks_like_you_selected_date_from_the_past_date'.localize(context),
        );
      } else {
        _searchButtonPressed(context, flightBookingModel);
      }
    } else {
      if (!roundWayDateValidationCheck(
        flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
        flightBookingModel.roundTrip?.date ?? DateTime.now(),
      )) {
        SnackBarUtil.showSnackBar(
          context,
          'looks_like_you_selected_date_from_the_past_date'.localize(context),
        );
      } else {
        _searchButtonPressed(context, flightBookingModel);
      }
    }
  }

  // Need to add date validation check
  void _searchButtonPressed(
    BuildContext context,
    FlightBookingModel flightBookingModel,
  ) {
    final flightViewModel = context.read<FlightBookingState>();
    final flightCommonModel = context.read<FlightCommonState>();
    FlightBookingGaAnalytics()
        .prepareFlightGACommonObj(flightBookingModel, flightViewModel);
    final Map<String, Object?> flightBookingGAObject = {}
      ..addAll(Analytics.flightBookingGAObject ?? {});
    flightBookingGAObject[Parameters.departure_date.name] =
        FlightUtils.eventDateYYYYMMDDFormat(
      flightBookingModel.oneWayTrip?.date.toString() ?? 'N/A',
      Constant.dateFormat12,
      Constant.dateFormat22,
    );
    flightBookingGAObject[Parameters.return_date.name] =
        FlightUtils.isRoundTrip(
      flightBookingModel.tripType,
    )
            ? FlightUtils.eventDateYYYYMMDDFormat(
                flightBookingModel.roundTrip?.date.toString() ?? 'N/A',
                Constant.dateFormat12,
                Constant.dateFormat22,
              )
            : 'N/A';

    if (FlightUtils.isRoundTrip(
      flightViewModel.flightBookingModel.tripType,
    )) {
      isOneWayTrip = false;
      adLog(
        flightViewModel.flightBookingModel.tripType.toString(),
      );
    } else {
      isOneWayTrip = true;
    }
    SharedPrefsUtils().putVarValueInPrefs(
      keyToLastSearch,
      flightBookingModel,
    );

    navigateToScreenWithResult(
      context,
      flightListingScreen,
      argumentObject: [flightBookingModel, flightCommonModel],
    ).then((value) {
      return flightViewModel.updateDate(flightBookingModel.tripType);
    });
    ClickEvents.book_flight_search.logEvent(parameters: flightBookingGAObject);
  }

  bool oneWayDateValidationCheck(DateTime departure) {
    final int oneWayDateCheck = FlightUtils.calculateDifference(
      departure,
    );
    return oneWayDateCheck >= 0;
  }

  bool roundWayDateValidationCheck(DateTime departure, DateTime arrival) {
    if (!oneWayDateValidationCheck(departure)) {
      return false;
    } else {
      final int diffCheck = FlightUtils.dateDiffCheck(
        departure,
        arrival,
      );
      return diffCheck <= 0;
    }
  }

  void _searchFlight(
    TripDetailModel? model,
    FlightBookingState flightViewModel,
    BuildContext context,
  ) {
    HapticFeedback.mediumImpact();
    model?.fromCity?.cityCode == model?.toCity?.cityCode
        ? SnackBarUtil.showSnackBar(
            context,
            'departure_arrival_same_cities_error_msg'.localize(context),
          )
        : _dateValidationCheck(
            context,
            flightViewModel.flightBookingModel,
          );
  }
}
