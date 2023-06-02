/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this widget is used to select the type of trip which can be
///either One Way or Round Trip
class TripTypeSelectorWidget extends StatelessWidget {
  const TripTypeSelectorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<FlightBookingState, TripDetailModel?>(
      selector: (context, flightViewModel) => _checkTripType(flightViewModel),
      builder: (BuildContext context, type, Widget? child) {
        final FlightBookingState flightViewModel =
            context.read<FlightBookingState>();
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              top: context.k_20,
              bottom: context.k_18,
              left: context.k_12,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => flightViewModel.updateTrip(TripType.oneWay),
                  borderRadius: BorderRadius.circular(context.k_4),
                  child: Row(
                    children: [
                      ADSizedBox(
                        width: context.k_18,
                        child: Radio(
                          key: const Key(FlightAutomationKeys.oneWayKey),
                          fillColor: MaterialStateColor.resolveWith((states) {
                            return FlightUtils.isOnewayTrip(
                              flightViewModel.flightBookingModel.tripType,
                            )
                                ? context.adColors.black
                                : context.adColors.greyTextColor;
                          }),
                          value: TripType.oneWay,
                          groupValue:
                              flightViewModel.flightBookingModel.tripType,
                          onChanged: (TripType? value) =>
                              flightViewModel.updateTrip(TripType.oneWay),
                        ),
                      ),
                      ADSizedBox(
                        width: context.k_4,
                      ),
                      Text(
                        ' ${'one_way'.localize(context)}',
                        style: FlightUtils.isRoundTrip(
                          flightViewModel.flightBookingModel.tripType,
                        )
                            ? ADTextStyle400.size16.setTextColor(
                                context.adColors.greyTextColor,
                              )
                            : ADTextStyle700.size16
                                .setTextColor(context.adColors.black),
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_4,
                    right: context.k_4,
                  ),
                ),
                ADSizedBox(
                  width: context.k_20,
                ),
                InkWell(
                  onTap: () => flightViewModel.updateTrip(TripType.roundTrip),
                  borderRadius: BorderRadius.circular(context.k_4),
                  child: Row(
                    children: [
                      ADSizedBox(
                        width: context.k_20,
                        child: Radio(
                          key: const Key(FlightAutomationKeys.roundKey),
                          fillColor: MaterialStateColor.resolveWith((states) {
                            return FlightUtils.isRoundTrip(
                              flightViewModel.flightBookingModel.tripType,
                            )
                                ? context.adColors.black
                                : context.adColors.greyTextColor;
                          }),
                          value: TripType.roundTrip,
                          groupValue:
                              flightViewModel.flightBookingModel.tripType,
                          onChanged: (TripType? value) =>
                              flightViewModel.updateTrip(TripType.roundTrip),
                        ),
                      ),
                      ADSizedBox(
                        width: context.k_4,
                      ),
                      Text(
                        ' ${'round_trip'.localize(context)}',
                        style: FlightUtils.isOnewayTrip(
                          flightViewModel.flightBookingModel.tripType,
                        )
                            ? ADTextStyle400.size16.setTextColor(
                                context.adColors.greyTextColor,
                              )
                            : ADTextStyle700.size16
                                .setTextColor(context.adColors.black),
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_4,
                    right: context.k_4,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TripDetailModel? _checkTripType(FlightBookingState flightViewModel) {
    return flightViewModel.flightBookingModel.tripType == TripType.oneWay
        ? flightViewModel.flightBookingModel.oneWayTrip
        : flightViewModel.flightBookingModel.roundTrip;
  }
}
