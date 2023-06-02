/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/view/top_container_cancellation_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/flight_detail_view_for_order.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/booking_status_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/guest_details_view_on_my_orders.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/options_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/updates_sent_to_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

int informationStripColor = 0xfffef6ea;
int pointsBadgeColor = 0xfffffcf6;
const containerColor = Color(0xfff5f5f5);
const int controllerIndex = 2;
const travellerListCount = 3;
final double paddingIcon = 20.sp;
final ValueNotifier<String> tripBookingNumber = ValueNotifier('');

class PranaamOrderCancellationWidgetView extends WidgetView<
    PranaamOrderCancellationScreen, PranaamOrderCancellationController> {
  const PranaamOrderCancellationWidgetView(
    PranaamOrderCancellationController state, {
    Key? key,
  }) : super(
          state,
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    ///TODO ADD THIS COLOR TO STYLEGUIDE
    final sizedBoxHeight = 52.sp;
    final bottomSizedBoxHeight = 80.sp;
    return WillPopScope(
      onWillPop: () => state.onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: containerColor,
          elevation: 0,
          title: ADSelectorStateLessWidget<BookingAndCancellationState>(
            viewModel: state.getBookingDetailsState,
            child: Consumer<BookingAndCancellationState>(
              builder: (
                context,
                value,
                child,
              ) {
                return Text(
                  ///TODO Boooking ID will come from my orders section when we click on it.
                  '${'booking_id'.localize(context)} ${tripBookingNumber.value}',
                  style: ADTextStyle700.size16
                      .copyWith(color: context.adColors.black),
                );
              },
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => {
                if (!DeBounce.isRedundantClick())
                  {
                    PranaamOrderDetailController().initHelpAPi(
                      context,
                      state
                              .getBookingDetailsState
                              .bookingDetailsResponse
                              ?.orderDetail
                              ?.pranaamDetail
                              ?.tripDetails
                              ?.serviceAirport ??
                          '',
                    ),
                  },
              },
              child: Text(
                'Help',
                style: ADTextStyle700.size14,
              ).paddingAllSide(context.k_16),
            ),
          ],
        ),
        body: ADSelectorStateLessWidget<BookingAndCancellationState>(
          viewModel: state.getBookingDetailsState,
          child: Consumer<BookingAndCancellationState>(
            builder: (
              context,
              value,
              child,
            ) {
              switch (value.getBookingDetailsState.viewStatus) {
                case Status.complete:
                  final CommonOrderDetailBaseResponse
                      bookingDetailsResponseModel =
                      value.getBookingDetailsState.data;
                  tripBookingNumber.value = bookingDetailsResponseModel
                          .orderDetail
                          ?.pranaamDetail
                          ?.tripDetails
                          ?.tripBookingNumber ??
                      '';

                  final List<int> passengersList = [];
                  final int travellersLength = bookingDetailsResponseModel
                          .orderDetail?.pranaamDetail?.travelers?.length ??
                      0;
                  for (int index = 0; index < travellersLength; index++) {
                    passengersList.add(
                      bookingDetailsResponseModel.orderDetail?.pranaamDetail
                              ?.travelers?[index].passengerId ??
                          0,
                    );
                  }
                  // final  paymentDetailList = state
                  //         .getBookingDetailsState
                  //         .bookingDetailsResponse
                  //         ?.
                  //         .paymentDetails ??
                  //     [];
                  // var promo = 0.0;
                  // var payMode = '';

                  ///TODO FIX THIS
                  // for (final PaymentDetails map in paymentDetailList) {
                  //   if (map.transactionMode == 'Loyalty') {
                  //     payMode = map.transactionMode;
                  //   } else if (map.transactionMode == 'Promo') {
                  //     promo = map.amount;
                  //   } else {
                  //     payMode = payMode.isNotEmpty
                  //         ? '$payMode and ${map.transactionMode}'
                  //         : map.transactionMode;
                  //   }
                  // }
                  return bookingDetailsResponseModel.orderDetail?.pranaamDetail
                              ?.packageDetail?.userId.isNotEmpty ??
                          false
                      ? ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            TopContainerCancellationView(
                              isRoundTrip: widget.isRoundTrip,
                              pranaamOrderDetailController:
                                  PranaamOrderDetailController(),
                            ),
                            ADSizedBox(height: context.k_56),
                            BookingStatusView(
                              cancelled: true,
                              bookingDetailsResponseModel:
                                  bookingDetailsResponseModel,
                            ),
                            /* if (bookingDetailsResponseModel
                                    .createBooking.loyaltyPoint ==
                                null)
                              const ADSizedBox()
                            else
                              RefundCard(
                                bookingAmount: bookingDetailsResponseModel
                                        .createBooking
                                        .loyaltyPoint
                                        ?.burnedRewardPoints ??
                                    0,
                                totalAmount: pricingInfo.totalFare.amount,
                              ),
                            ADSizedBox(
                              height: context.k_20,
                            ),*/
                            FlightDetailViewForOrder(
                              bookingID:
                                  widget.cancellationData?.bookingId ?? '',
                              bookingDetailsResponseModel:
                                  bookingDetailsResponseModel,
                              isRoundTrip: widget.isRoundTrip,
                            ),
                            ADSizedBox(height: context.k_28),
                            OptionsView(
                              isCancelled: true,
                              bookingDetailsResponseModel:
                                  bookingDetailsResponseModel,
                              siteCoreStateManagement:
                                  state.siteCoreStateManagement,
                              bookingID: widget.bookingID,
                            ),
                            //   ADSizedBox(height: sizedBoxHeight),
// const RewardsContainerView(),
// ADSizedBox(height: sizedBoxHeight),
                            ADSizedBox(height: context.k_28),
                            GuestDetailsViewOnMyOrders(
                              bookingDetailsResponseModel:
                                  bookingDetailsResponseModel,
                              siteCoreStateManagement:
                                  state.siteCoreStateManagement,
                              getBookingDetailsState:
                                  state.getBookingDetailsState,
                            ),
                            // PriceDetailsView(
                            //   addOnsList: bookingDetailsResponseModel
                            //       .packageDeatil.packageAddOn,
                            //   promoType: bookingDetailsResponseModel
                            //       .packageDeatil
                            //       .pricingInfo
                            //       .discountCouponDetail
                            //       .promoType,
                            //   isPaidVisible: true,
                            //   modeOfPayment: bookingDetailsResponseModel
                            //           .createBooking.paymentDetails.isNotEmpty
                            //       ? payMode
                            //       : '',
                            //   totalMRP: pricingInfo.totalBaseFare.amount,
                            //   cGst: pricingInfo.totalTax.cgst.amount,
                            //   sGst: pricingInfo.totalTax.sgst.amount,
                            //   expressFareAmount:
                            //       pricingInfo.totalExpressFare?.amount ?? 0,
                            //   totalAmount: pricingInfo.totalFare.amount,
                            //   addOnsAmount: getAddonsTotalPrice(
                            //     state.pranaamAppDataStateManagement
                            //         .cartDataResponse,
                            //   ),
                            //   discountAmount: promo,
                            // ),
                            ADSizedBox(height: sizedBoxHeight),
                            UpdatesSentToView(
                              bookingDetailsResponseModel:
                                  bookingDetailsResponseModel,
                              pranaamUpdateSent: 'pranaam_updates_sent_to',
                            ),
                            ADSizedBox(height: bottomSizedBoxHeight),
                          ],
                        )
                      : ADErrorPage(
                          message: value.getBookingDetailsState.message,
                        );
                case Status.loading:
                  return Center(
                    child: ADDotProgressView(
                      color: context.adColors.black,
                    ),
                  );
                case Status.error:
                  return ADErrorPage(
                    message: value.getBookingDetailsState.message,
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
