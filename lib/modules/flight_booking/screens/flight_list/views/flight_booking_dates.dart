/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/select_date_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class FlightBookingDates extends StatelessWidget {
  const FlightBookingDates({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<FlightBookingState, TripDetailModel?>(
      selector: (context, flightViewModel) => _checkTripType(flightViewModel),
      builder: (BuildContext context, type, Widget? child) {
        final FlightBookingState flightViewModel =
            context.read<FlightBookingState>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => BottomSheetUtils.showBottomSheetDialog(
                  context,
                  ADDraggableScrollableBottomSheet(
                    initialChildSize:
                        BottomSheetUtils.getBottomSheetHeightRatio(
                      context,
                    ),
                    childWidget: DateRangeView(
                      departureDate:
                          flightViewModel.flightBookingModel.oneWayTrip?.date ??
                              DateTime.now(),
                      returnDate:
                          flightViewModel.flightBookingModel.roundTrip?.date ??
                              DateTime.now(),
                      tripType: flightViewModel.flightBookingModel.tripType,
                      tripDetailModel:
                          flightViewModel.flightBookingModel.oneWayTrip,
                      flightBookingState: flightViewModel,
                    ),
                  ),
                ).then(
                  (value) {
                    if (value != null) {
                      flightViewModel.updateSelectedDateFromCalender(
                        value,
                      );
                    }
                  },
                ),
                child: SelectDateView(
                  travelType: 'departure'.localize(context),
                  dateTime: flightViewModel.flightBookingModel.oneWayTrip?.date,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ).paddingBySide(top: context.k_2, bottom: context.k_2),
              ),
            ),
            if (FlightUtils.isRoundTrip(
              flightViewModel.flightBookingModel.tripType,
            ))
              Expanded(
                child: InkWell(
                  onTap: () => BottomSheetUtils.showBottomSheetDialog(
                    context,
                    ADDraggableScrollableBottomSheet(
                      initialChildSize:
                          BottomSheetUtils.getBottomSheetHeightRatio(
                        context,
                      ),
                      childWidget: DateRangeView(
                        departureDate: flightViewModel
                                .flightBookingModel.oneWayTrip?.date ??
                            DateTime.now(),
                        returnDate: flightViewModel
                                .flightBookingModel.roundTrip?.date ??
                            DateTime.now(),
                        tripType: flightViewModel.flightBookingModel.tripType,
                        roundSelected: true,
                        tripDetailModel:
                            flightViewModel.flightBookingModel.oneWayTrip,
                        flightBookingState: flightViewModel,
                      ),
                    ),
                  ).then((value) {
                    if (value != null) {
                      flightViewModel.updateSelectedDateFromCalender(
                        value,
                      );
                    }
                  }),
                  child: SelectDateView(
                    onCrossTap: () =>
                        flightViewModel.updateTrip(TripType.oneWay),
                    isCrossIconEnabled: true,
                    travelType: 'return'.localize(context),
                    dateTime:
                        flightViewModel.flightBookingModel.roundTrip?.date,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ).paddingBySide(top: context.k_2, bottom: context.k_2),
                ),
              )
            else
              Flexible(
                child: InkWell(
                  onTap: () => BottomSheetUtils.showBottomSheetDialog(
                    context,
                    ADDraggableScrollableBottomSheet(
                      initialChildSize:
                          BottomSheetUtils.getBottomSheetHeightRatio(
                        context,
                      ),
                      childWidget: DateRangeView(
                        departureDate: flightViewModel
                                .flightBookingModel.oneWayTrip?.date ??
                            DateTime.now(),
                        returnDate: FlightUtils.nextValidDate(
                          sameDate: flightViewModel
                                  .flightBookingModel.oneWayTrip?.date ??
                              DateTime.now(),
                        ),
                        tripType: flightViewModel.flightBookingModel.tripType,
                        roundSelected: true,
                        tripDetailModel:
                            flightViewModel.flightBookingModel.oneWayTrip,
                        flightBookingState: flightViewModel,
                      ),
                    ),
                  ).then((value) {
                    if (value != null) {
                      flightViewModel.updateSelectedDateFromCalender(
                        value,
                      );
                    }
                  }),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'add_return'.localize(context),
                          textAlign: TextAlign.end,
                          style: ADTextStyle400.size22
                              .setTextColor(context.adColors.greyTextColor),
                          key: const Key(FlightAutomationKeys.addReturn),
                        ).paddingBySide(
                          top: context.k_10,
                          bottom: context.k_10,
                          right: context.k_16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  TripDetailModel? _checkTripType(FlightBookingState flightViewModel) {
    return flightViewModel.flightBookingModel.tripType == TripType.oneWay
        ? flightViewModel.flightBookingModel.oneWayTrip
        : flightViewModel.flightBookingModel.roundTrip;
  }

  DateTime endDate(BuildContext context) {
    final flightViewModel = context.read<FlightBookingState>();
    return FlightUtils.nextValidDate(
      sameDate:
          flightViewModel.flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
    );
  }

  DateTime lastDate() {
    return DateTime.now().add(const Duration(days: 365));
  }
}
