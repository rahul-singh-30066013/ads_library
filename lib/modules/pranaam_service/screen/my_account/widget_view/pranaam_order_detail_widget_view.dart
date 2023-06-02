/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/important_information/important_information_model.dart'
    as important_information;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/view/top_container_cancellation_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/flight_detail_view_for_order.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/pranaam_dashboard_animation.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/booking_status_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/dummy_options_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/guests_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/important_information.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/options_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/pranaam_order_detail_shimmer.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/refund_amount_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/updates_sent_to_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/price_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

final double rewardPointPadding = 52.sp;
final ValueNotifier<String> tripBookingNumber = ValueNotifier('');

class PranaamOrderDetailWidgetView
    extends WidgetView<PranaamOrderDetailScreen, PranaamOrderDetailController> {
  const PranaamOrderDetailWidgetView(
    PranaamOrderDetailController state, {
    Key? key,
  }) : super(
          state,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    const containerColor = Color(0xfff5f5f5);
    final _sizedBoxHeight = context.k_32;
    final _k_52 = 52.sp;
    return Selector<PranaamAppDataStateManagement, bool>(
      builder: (context, value, child) => Stack(
        children: [
          Scaffold(
            body: Consumer<BookingAndCancellationState>(
              builder: (
                context,
                value,
                child,
              ) {
                adLog(
                  'BookingAndCancellationState build ${state.getBookingStatus()}',
                );

                switch (value.getBookingDetailsState.viewStatus) {
                  case Status.complete:
                    final CommonOrderDetailBaseResponse
                        bookingDetailsResponseModel =
                        value.getBookingDetailsState.data;

                    // tripBookingNumber.value = widget.isRoundTrip
                    //     ? bookingDetailsResponseModel.orderDetail?.pranaamDetail
                    //             ?.roundTripDetail?.tripBookingNumber ??
                    //         ''
                    //     : widget.isRoundTripDeparture
                    //         ? bookingDetailsResponseModel
                    //                 .orderDetail
                    //                 ?.pranaamDetail
                    //                 ?.tripDetails
                    //                 ?.tripBookingNumber ??
                    //             ''
                    //         : bookingDetailsResponseModel.orderReferenceId ??
                    //             '';
                    tripBookingNumber.value =
                        bookingDetailsResponseModel.orderReferenceId ?? '';
                    final isForUpgrade = state
                            .getBookingDetailsState
                            .bookingDetailsResponse
                            ?.orderDetail
                            ?.pranaamDetail
                            ?.pranaamBookingType
                            ?.toLowerCase() ==
                        'upgradebooking';

                    final forReschedule = isReschedule(
                      state
                              .getBookingDetailsState
                              .bookingDetailsResponse
                              ?.orderDetail
                              ?.pranaamDetail
                              ?.pranaamBookingType ??
                          '',
                    );
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
                    final orderStatusString = bookingDetailsResponseModel
                        .statusHistory?[((bookingDetailsResponseModel
                                    .statusHistory?.length ??
                                2) -
                            2)]
                        .orderStatus;
                    final status =
                        PranaamOrderStatus.getStatus(orderStatusString);

                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: containerColor,
                        elevation: 0,
                        leading: IconButton(
                          icon: Platform.isIOS
                              ? const Icon(Icons.arrow_back_ios)
                              : const Icon(Icons.arrow_back),
                          onPressed: () => state.onBackTap(),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${getBookingTitle(
                                state
                                        .getBookingDetailsState
                                        .bookingDetailsResponse
                                        ?.orderDetail
                                        ?.pranaamDetail
                                        ?.pranaamBookingType ??
                                    '',
                                context,
                              )}  ${'service'.localize(context)}',
                              style: ADTextStyle700.size16
                                  .copyWith(color: context.adColors.black),
                            ),
                            ADSizedBox(
                              height: context.k_4,
                            ),
                            Consumer<BookingAndCancellationState>(
                              builder: (
                                context,
                                value,
                                child,
                              ) {
                                return Text(
                                  ///TODO Boooking ID will come from my orders section when we click on it.
                                  '${'Booking ID'} ${tripBookingNumber.value}',
                                  style: ADTextStyle400.size12,
                                );
                              },
                            ),
                            ADSizedBox(
                              height: context.k_4,
                            ),
                          ],
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () => {
                              GaEvent.getInstance().helpAndSupportEvent(),
                              ClickEvents.help_and_support.logEvent(
                                parameters: GaEvent.getInstance().parameterMap,
                              ),
                              if (!DeBounce.isRedundantClick())
                                {
                                  state.initHelpAPi(
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
                      body: bookingDetailsResponseModel
                                  .orderDetail
                                  ?.pranaamDetail
                                  ?.tripDetails
                                  ?.userId
                                  .isNotEmpty ??
                              false
                          ? ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                TopContainerCancellationView(
                                  pranaamOrderDetailController: state,
                                  isRoundTrip: widget.isRoundTrip,
                                ),
                                if (!value.bookingCancelledStatus.value &&
                                    !isStandAloneService(
                                      state
                                              .getBookingDetailsState
                                              .bookingDetailsResponse
                                              ?.orderDetail
                                              ?.pranaamDetail
                                              ?.pranaamBookingType ??
                                          '',
                                    ) &&
                                    PranaamOrderStatus.getStatus(
                                          bookingDetailsResponseModel.status,
                                        ) !=
                                        PranaamOrderStatus.PENDING &&
                                    PranaamOrderStatus.getStatus(
                                          bookingDetailsResponseModel.status,
                                        ) !=
                                        PranaamOrderStatus.FAILED)
                                  const OfficerContainer(),
                                ADSizedBox(height: context.k_40),
                                BookingStatusView(
                                  cancelled: state.getBookingStatus(),
                                  bookingDetailsResponseModel:
                                      bookingDetailsResponseModel,
                                  isRoundTrip: widget.isRoundTrip,
                                ),
                                RefundAmountView(
                                  cancelled: state.getBookingStatus(),
                                  bookingDetailsResponseModel:
                                      bookingDetailsResponseModel,
                                ),
                                FlightDetailViewForOrder(
                                  bookingID: widget.bookingID ?? '',
                                  bookingDetailsResponseModel:
                                      bookingDetailsResponseModel,
                                  isRoundTrip: widget.isRoundTrip,
                                  isRoundTripDeparture:
                                      widget.isRoundTripDeparture,
                                ),
                                ADSizedBox(height: _sizedBoxHeight),
                                if ((status?.isPendingGetter ?? false) ||
                                    (PranaamOrderStatus.getStatus(
                                          bookingDetailsResponseModel.status,
                                        ) ==
                                        PranaamOrderStatus.FAILED))
                                  const DummyOptionsView()
                                else
                                  OptionsView(
                                    bookingDetailsResponseModel:
                                        bookingDetailsResponseModel,
                                    isCancelled:
                                        value.bookingCancelledStatus.value,
                                    bookingID: value.bookingDetailsResponse
                                        ?.orderReferenceId,
                                    passengersList: passengersList,
                                    tripBookingID: widget.isRoundTrip
                                        ? value
                                            .bookingDetailsResponse
                                            ?.orderDetail
                                            ?.pranaamDetail
                                            ?.roundTripDetail
                                            ?.tripBookingNumber
                                        : value
                                            .bookingDetailsResponse
                                            ?.orderDetail
                                            ?.pranaamDetail
                                            ?.tripDetails
                                            ?.tripBookingNumber,
                                    isFromBottomSheet: widget.isFromBottomSheet,
                                    siteCoreStateManagement:
                                        state.siteCoreStateManagement,
                                  ),
                                if (!value.bookingCancelledStatus.value)
                                  ADSizedBox(
                                    height: context.k_48 + context.k_4,
                                  ),

                                ///earned reward points

                                if ((bookingDetailsResponseModel
                                                .earning?.total ??
                                            0) >
                                        0 &&
                                    bookingDetailsResponseModel.isRewardEarned)
                                  LoyaltyPointsComponent(
                                    points: bookingDetailsResponseModel
                                            .earning?.total ??
                                        0,
                                    routeConfirmation: true,
                                    bottomMargin: context.k_24,
                                    loyaltyShowScreenType:
                                        LoyaltyShowScreenType.pranaam,
                                  ).paddingBySide(
                                    left: context.k_16,
                                    right: context.k_16,
                                  ),

                                ///burned reward points

                                // if ((bookingDetailsResponseModel
                                //             .transactionHistory
                                //             ?.firstOrNull
                                //             ?.paidBy
                                //             ?.loyalty
                                //             ?.amount ??
                                //         0) >
                                //     0)
                                //   LoyaltyPointsComponent(
                                //     points: bookingDetailsResponseModel
                                //             .orderDetail
                                //             ?.pranaamDetail
                                //             ?.totalLoyalty ??
                                //         0,
                                //     customTextWidget: RichText(
                                //       text: TextSpan(
                                //         text: '',
                                //         style: ADTextStyle400.size14,
                                //         children: [
                                //           TextSpan(
                                //             text: 'Saved',
                                //             style: ADTextStyle400.size14,
                                //           ),
                                //           WidgetSpan(
                                //             child: ADSizedBox(
                                //               width: context.k_4,
                                //             ),
                                //           ),
                                //           TextSpan(
                                //             text:
                                //                 '₹${bookingDetailsResponseModel.transactionHistory?.firstOrNull?.paidBy?.loyalty?.amount}',
                                //             style: ADTextStyle600.size14,
                                //           ),
                                //           WidgetSpan(
                                //             child: ADSizedBox(
                                //               width: context.k_4,
                                //             ),
                                //           ),
                                //           TextSpan(
                                //             text: 'using reward balance',
                                //             style: ADTextStyle400.size14,
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //     bottomMargin: context.k_48 + context.k_2,
                                //     loyaltyShowScreenType:
                                //         LoyaltyShowScreenType.pranaam,
                                //   ).paddingBySide(
                                //     left: context.k_16,
                                //     right: context.k_16,
                                //   ),

                                ///pending reward points

                                if (!value.bookingCancelledStatus.value &&
                                    !bookingDetailsResponseModel.isRewardEarned)
                                  if ((bookingDetailsResponseModel
                                              .earning?.total ??
                                          0) >
                                      0)
                                    LoyaltyPointsComponent(
                                      points: bookingDetailsResponseModel
                                              .earning?.total ??
                                          0,
                                      routeThankYou: true,
                                      loyaltyShowScreenType:
                                          LoyaltyShowScreenType.pranaam,
                                      bottomMargin: context.k_48 + context.k_2,
                                    ).paddingBySide(
                                      left: context.k_16,
                                      right: context.k_16,
                                    ),

                                GuestsDetailsView(
                                  travellers: (bookingDetailsResponseModel
                                              .orderDetail
                                              ?.pranaamDetail
                                              ?.travelers ??
                                          [])
                                      .map(
                                        (e) => TravellersModel(
                                          personName: PersonNameModel(
                                            firstName: e.firstName ?? '',
                                            salutationId: e.salutationId ?? 0,
                                            salutationText:
                                                e.salutationText ?? '',
                                          ),
                                          passengerTypeId: e.passengerTypeId,
                                        ),
                                      )
                                      .toList(),
                                ),
                                ADSizedBox(height: context.k_12),
                                PriceDetailsView(
                                  showApplyCoupon: true,
                                  addOnsList: bookingDetailsResponseModel
                                          .orderDetail
                                          ?.pranaamDetail
                                          ?.addOnServices ??
                                      [],
                                  promoType: bookingDetailsResponseModel
                                          .orderDetail
                                          ?.pranaamDetail
                                          ?.packageDetail
                                          ?.pricingInfo
                                          ?.discountCouponDetails
                                          ?.promoType ??
                                      '',
                                  reward: bookingDetailsResponseModel
                                              .transactionHistory !=
                                          []
                                      ? bookingDetailsResponseModel.orderDetail
                                              ?.pranaamDetail?.totalLoyalty
                                              ?.floorToDouble() ??
                                          0
                                      : 0,
                                  totalMRP:
                                      _getTotalMRP(bookingDetailsResponseModel),
                                  cGst: _getCgstAmount(
                                    bookingDetailsResponseModel,
                                  ),
                                  sGst: _getSgstAmount(
                                    bookingDetailsResponseModel,
                                  ),
                                  expressFareAmount: _getExpressFare(
                                        bookingDetailsResponseModel,
                                      ) ??
                                      0,
                                  totalAmount: _getTotalAmount(
                                    bookingDetailsResponseModel,
                                  ),
                                  addOnsAmount: isForUpgrade || forReschedule
                                      ? 0
                                      : getAddOnTotalPricePostBooking(
                                          bookingDetailsResponseModel
                                                  .orderDetail
                                                  ?.pranaamDetail
                                                  ?.addOnServices ??
                                              [],
                                        ),
                                  isPaidVisible: true,
                                  modeOfPayment: bookingDetailsResponseModel
                                      .getOrderedPaymentModes(),
                                  discountAmount: bookingDetailsResponseModel
                                          .orderDetail
                                          ?.pranaamDetail
                                          ?.totalPromo
                                          ?.toDouble() ??
                                      0,
                                  packageName: (isStandAloneService(
                                    bookingDetailsResponseModel
                                            .orderDetail
                                            ?.pranaamDetail
                                            ?.pranaamBookingType ??
                                        '',
                                  ))
                                      ? bookingDetailsResponseModel
                                          .orderDetail
                                          ?.pranaamDetail
                                          ?.standaloneProductDetails
                                          ?.name
                                      : bookingDetailsResponseModel.orderDetail
                                          ?.pranaamDetail?.packageDetail?.name,
                                  isForReschedule: forReschedule,
                                  rescheduleAmount: forReschedule
                                      ? bookingDetailsResponseModel
                                          .orderDetail
                                          ?.pranaamDetail
                                          ?.packageDetail
                                          ?.pricingInfo
                                          ?.totalBaseFare
                                          ?.amount
                                      : null,
                                  isPostBooking: true,
                                ),
                                ADSizedBox(height: _k_52),
                                UpdatesSentToView(
                                  bookingDetailsResponseModel:
                                      bookingDetailsResponseModel,
                                  pranaamUpdateSent: 'pranaam_updates_sent_to',
                                ),
                                ADSizedBox(height: _k_52),
                                Selector<BookingAndCancellationState,
                                    ADResponseState>(
                                  selector: (context, viewModel) =>
                                      viewModel.impInfoState,
                                  builder: (
                                    context,
                                    value,
                                    child,
                                  ) {
                                    switch (value.viewStatus) {
                                      case Status.complete:
                                        final important_information.Element
                                            elements = value.data;
                                        final List<
                                                important_information
                                                    .ContentList>
                                            importantInfo =
                                            elements.fields.contentList;
                                        return ImportantInformation(
                                          infoList: importantInfo,
                                        );
                                      case Status.loading:
                                        const shimmerCount = 4;
                                        final containerHeight = context.k_19;
                                        final containerWidth =
                                            context.widthOfScreen / 2;
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ADShimmerWidget.shimmerShape(
                                              type: ShimmerType.rectangleBox,
                                              height: containerHeight,
                                              width: containerWidth,
                                            ),
                                            ADSizedBox(
                                              height: context.k_20,
                                            ),
                                            ADShimmerBuilder(
                                              itemCount: shimmerCount,
                                              shimmerBuilderType:
                                                  ShimmerBuilderType
                                                      .listVertical,
                                              shimmerWidget:
                                                  ADShimmerWidget.shimmerShape(
                                                height: containerHeight,
                                                type: ShimmerType.rectangleBox,
                                              ),
                                            ),
                                          ],
                                        );
                                      default:
                                        return const ADSizedBox();
                                    }
                                  },
                                ),
                                ADSizedBox(height: _sizedBoxHeight),
                              ],
                            )
                          : ADErrorPage(
                              message: value.getBookingDetailsState.message,
                            ),
                    );

                  case Status.loading:
                    return const PranaamOrderDetailShimmer();
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
          if (value) const PranaamDashboardAnimation(),
        ],
      ),
      selector: (context, model) => model.isAnimationLoading,
    );
  }

  double _getCgstAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.finalPranaamTax?.cgstAmount ??
        0;
  }

  double _getSgstAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.finalPranaamTax?.sgstAmount ??
        0;
  }

  double? _getExpressFare(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    final isForUpgrade = isUpgradeBooking(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    );
    final isForReschedule = isReschedule(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    );
    final isForStandalone = isStandAloneService(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    );

    if (isForUpgrade) {
      return bookingDetailsResponseModel
              .orderDetail
              ?.pranaamDetail
              ?.packageDetail
              ?.originalPricingInfo
              ?.totalExpressFare
              ?.baseFare ??
          0;
    }
    if (isForReschedule) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
          ?.packageDetail?.oldPricingInfo?.totalExpressFare?.baseFare;
    }
    if (isForStandalone) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
          ?.standaloneProductDetails?.pricingInfo?.totalExpressFare?.baseFare;
    }

    return bookingDetailsResponseModel.orderDetail?.pranaamDetail?.packageDetail
        ?.pricingInfo?.totalExpressFare?.baseFare;
  }

  double _getTotalMRP(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    if (isUpgradeBooking(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    )) {
      final originalPricingInfo = bookingDetailsResponseModel
          .orderDetail?.pranaamDetail?.packageDetail?.originalPricingInfo;
      return originalPricingInfo?.totalBaseFare?.amount ?? 0;
    } else if (isReschedule(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    )) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.packageDetail?.oldPricingInfo?.totalBaseFare?.amount ??
          0;
    } else if (isStandAloneService(
      bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
    )) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.standaloneProductDetails?.pricingInfo?.totalBaseFare?.amount ??
          0;
    }
    final pricingInfo = bookingDetailsResponseModel
        .orderDetail?.pranaamDetail?.packageDetail?.pricingInfo;
    return pricingInfo?.totalBaseFare?.amount ?? 0;
  }

  double _getTotalAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.finalTotalAmount ??
        0;
  }
}
