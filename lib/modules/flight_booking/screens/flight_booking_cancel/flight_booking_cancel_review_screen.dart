/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_booking_cancel_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_reason.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/views/show_cancel_review_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_cancel_state.dart';
import 'package:adani_airport_mobile/modules/payment/utils/extensions/tappable_widget.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_internet_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

//This class is used for review details while cancel booking.
class FlightBookingCancelReviewScreen extends StatefulWidget {
  final SelectedPaxTripToCancel selectedPaxTripToCancel;

  const FlightBookingCancelReviewScreen({
    Key? key,
    required this.selectedPaxTripToCancel,
  }) : super(key: key);

  @override
  State<FlightBookingCancelReviewScreen> createState() =>
      _FlightBookingCancelReviewScreenState();
}

class _FlightBookingCancelReviewScreenState
    extends State<FlightBookingCancelReviewScreen> {
  final FlightBookingCancelState flightBookingCancelState =
      FlightBookingCancelState();
  CancelReason? cancelReason;
  final int contactBtnFlex = 1;
  final int cancelBtnFlex = 2;

  @override
  void initState() {
    super.initState();
    flightBookingCancelState.flightRefundInfo(
      widget.selectedPaxTripToCancel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.adColors.whiteTextColor,
          elevation: 0,
          title: Text(
            'review_detail'.localize(context),
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
          ),
        ),
        body: ADSelectorStateLessWidget<FlightBookingCancelState>(
          key: const Key('BookingCancelReview'),
          viewModel: flightBookingCancelState,
          child: Consumer<FlightBookingCancelState>(
            builder: (BuildContext context, value, Widget? child) {
              return AbsorbPointer(
                absorbing: flightBookingCancelState.flightFairInfo.viewStatus ==
                    Status.loading,
                child: flightBookingCancelState.flightFairInfo.viewStatus ==
                            Status.loading &&
                        flightBookingCancelState.flightFareInfoResponseModel ==
                            null
                    ? const Center(
                        child: ADDotProgressView(),
                      )
                    : flightBookingCancelState.flightFairInfo.viewStatus ==
                            Status.error
                        ? NoInternetView(
                            statusCode: value.error,
                            pageMainDesc: value
                                    .flightFairInfo.errorCode.isNullOrEmpty
                                ? 'oops_something_went_wrong'.localize(context)
                                : value.flightFairInfo.errorCode.toString() ==
                                        '51'
                                    ? 'cant_find_you'.localize(context)
                                    : value.flightFairInfo.errorCode
                                        .toString()
                                        .safeLocalize(
                                          context,
                                          'oops_something_went_wrong'
                                              .localize(context),
                                        ),
                            pageSubDesc: value
                                    .flightFairInfo.errorCode.isNullOrEmpty
                                ? ''
                                : value.flightFairInfo.errorCode.toString() ==
                                        '51'
                                    ? 'please_check_your_internet'
                                        .localize(context)
                                    : '',
                          )
                        : ShowCancelReviewDetails(
                            selectedPaxTripToCancel:
                                widget.selectedPaxTripToCancel,
                            flightBookingCancelState: flightBookingCancelState,
                            cancelReason:
                                widget.selectedPaxTripToCancel.cancelReason,
                          ),
              );
            },
          ),
        ),
      ).onTap(() => FocusScope.of(context).unfocus()),
    );
  }
}
