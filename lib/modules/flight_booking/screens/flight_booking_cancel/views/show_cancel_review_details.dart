/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_booking_cancel_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/FbV2ResponseCancelModel.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_reason.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/flight_booking_cancel_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/refund_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/views/cancel_passenger_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/views/refund_breakup_widget.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/views/widget_fare_break_up_null.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_cancel_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ShowCancelReviewDetails extends StatelessWidget {
  final SelectedPaxTripToCancel selectedPaxTripToCancel;
  final FlightBookingCancelState flightBookingCancelState;
  final CancelReason? cancelReason;

  final double buttonHeight = 52.sp;

  ShowCancelReviewDetails({
    Key? key,
    required this.selectedPaxTripToCancel,
    required this.flightBookingCancelState,
    this.cancelReason,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int cancelBtnFlex = 2;
    final RefundBreakup? refundBreakup = context
        .read<FlightBookingCancelState>()
        .flightFareInfoResponseModel
        ?.refundBreakup;
    final String paymentModeText = (flightBookingCancelState
                    .flightFareInfoResponseModel?.paymentMode ??
                '')
            .isNotEmpty
        ? '${'paid_by'.localize(context)} ${flightBookingCancelState.flightFareInfoResponseModel?.paymentMode ?? ''}'
        : '';
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: context.k_18,
        vertical: context.k_8,
      ),
      children: [
        Text(
          'review_detail_description'.localize(context),
          style: ADTextStyle400.size16.setTextColor(
            context.adColors.blackTextColor,
          ),
        ),
        ADSizedBox(
          height: context.k_30,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: selectedPaxTripToCancel.passengerListInJourneyList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final PassengerListInJourney passengerListJourney =
                selectedPaxTripToCancel.passengerListInJourneyList[index];
            return CancelPassengerList(
              passengerListJourney: passengerListJourney,
              isEnableZeroCancellation: context
                  .read<FlightBookingCancelState>()
                  .flightFareInfoResponseModel
                  ?.isZeroCancellation,
              isInfantCancelOnly: context
                  .read<FlightBookingCancelState>()
                  .flightFareInfoResponseModel
                  ?.isInfantCancelOnly,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: context.k_20,
              thickness: 1.sp,
            ).paddingBySide(bottom: context.k_8);
          },
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        if (refundBreakup != null)
          RefundBreakUpWidget(
            refundBreakup: refundBreakup,
            paymentModeText: paymentModeText,
            flightFareInfoResponseModel: context
                .read<FlightBookingCancelState>()
                .flightFareInfoResponseModel,
          )
        else
          WidgetFareBreakUpNull(
            flightFareInfoResponseModel: context
                .read<FlightBookingCancelState>()
                .flightFareInfoResponseModel,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (context
                    .read<FlightBookingCancelState>()
                    .flightFareInfoResponseModel
                    ?.refundBreakup ==
                null)
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(
                      0,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      context.adColors.black,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      context.adColors.whiteTextColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            context.k_28,
                          ),
                        ),
                        side: const BorderSide(),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return states.contains(MaterialState.pressed)
                            ? context.adColors.dividerColor
                            : null;
                      },
                    ),
                    maximumSize: MaterialStateProperty.all(
                      Size(
                        double.infinity,
                        buttonHeight,
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(0, buttonHeight)),
                  ),
                  onPressed: () => Utils.helpBottomSheet(
                    context,
                    Utils.getHelpContactDetail(),
                  ),
                  child: Text(
                    'contact'.localize(context),
                    style: ADTextStyle500.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                ),
              ),
            if (context
                    .read<FlightBookingCancelState>()
                    .flightFareInfoResponseModel
                    ?.refundBreakup ==
                null)
              ADSizedBox(
                width: context.k_8,
              ),
            Expanded(
              flex: cancelBtnFlex,
              child: ElevatedButton(
                onPressed: () =>
                    flightBookingCancelState.flightFairInfo.viewStatus ==
                            Status.loading
                        ? Null
                        : makeFlightBookingCancelRequest(
                            selectedPaxTripToCancel,
                            context,
                          ),
                /*showModalBottomSheet<void>(
                        useRootNavigator: true,
                        backgroundColor: context.adColors.whiteTextColor,
                        elevation: context.k_8,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                              context.k_22,
                            ),
                          ),
                        ),
                        context: context,
                        builder: (dialogContext) {
                          FlightBookingGaAnalytics().bookingCancelAnalyticsData(
                            ClickEvents.book_flight_confirm_cancellation,
                            cancelReason?.name,
                          );
                          return FlightCancelRefundPopup(
                            detailString:
                                'cancel_popup_description'.localize(context),
                            titleString:
                                'confirm_cancellation'.localize(context),
                            btnText: 'confirm'.localize(context),
                            onProceedCallBack: () =>
                                makeFlightBookingCancelRequest(
                              selectedPaxTripToCancel,
                              context,
                            ),
                          );
                        },
                      ),*/
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(double.infinity, buttonHeight),
                  minimumSize: Size(0, buttonHeight),
                  primary: context.adColors.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        context.k_28,
                      ),
                    ),
                  ),
                ),
                child: flightBookingCancelState.flightFairInfo.viewStatus ==
                            Status.loading &&
                        flightBookingCancelState.flightFareInfoResponseModel !=
                            null
                    ? ADDotProgressView(
                        color: context.adColors.whiteTextColor,
                      )
                    : Text(
                        'confirm_cancellation'.localize(context),
                        style: ADTextStyle700.size16.setTextColor(
                          context.adColors.whiteTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ],
        ).paddingBySide(
          top: context.k_48,
          bottom: context.k_36,
        ),
      ],
    );
  }

  // popup booking cancel confirm click
  // void bookingConfirmCancel(BuildContext context) {
  //
  // }

//to cancel booking - api request
  void makeFlightBookingCancelRequest(
    SelectedPaxTripToCancel selectedPaxTripToCancel,
    BuildContext context,
  ) {
    //confirm
    FlightBookingGaAnalytics().bookingCancelAnalyticsData(
      ClickEvents.book_flight_confirm_cancellation_popup,
      cancelReason?.name,
    );

    // Navigator.pop(context);
    flightBookingCancelState
        .cancelFlightBooking(
      selectedPaxTripToCancel,
    )
        .then(
      (value) {
        context.read<AppSessionState>().updateValueOfBooking(updateValue: true);
        context.read<AppSessionState>().flightBookingType =
            FlightBookingType.cancelled;
        final FbV2ResponseCancelModel
        fbV2ResponseCancelModel =
            value.data ?? FbV2ResponseCancelModel();
        flightBookingCancelState.updateBookingCancellationState(value);
        if (fbV2ResponseCancelModel.status != null) {
          FlightBookingGaAnalytics().bookingCancelAnalyticsData(
            ClickEvents.book_flight_cancellation_success,
            cancelReason?.name,
          );
          // final Map<String, String> cancelObj = {
          //   'cancelledID': flightBookingCancelResponseModel
          //           .cancelRefundResponses?.cancelId ??
          //       '',
          //   'tripId': selectedPaxTripToCancel.orderReferenceId,
          // };
          // navigateUsingPushNamedAndRemoveUntilV2(
          //   context,
          //   flightBookingItemDetails,
          //   tabRoute,
          //   // orderAndBookingsScreen,
          //   // flightBookingItemDetails,
          //   argumentsData: cancelObj,
          // );
          navigatorPopScreenUntil(
            context,
            ModalRoute.withName(flightBookingItemDetails),
          );
        } else {
          if (value.errorCode != null) {
            SnackBarUtil.showSnackBar(
              context,
              value.errorCode.toString().localize(context),
            );
          }
        }
      },
    );
  }
}
