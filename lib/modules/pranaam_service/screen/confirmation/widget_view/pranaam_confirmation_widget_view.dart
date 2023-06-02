/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart'
    as pranaam_detail;
import 'package:adani_airport_mobile/modules/components/confirmation_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/important_information/important_information_model.dart'
    as important_information;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/add_to_wallet_button.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/booking_confirmed_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/confirmation_order_summary.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/flight_detail_view_for_confirmation.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/pranaam_confirmation_shimmer.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/qr_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/refund_container.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/guests_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/important_information.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/price_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/views/stand_alone_order_summary.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

int informationStripColor = 0xfffef6ea;
int pointsBadgeColor = 0xfffffcf6;
const travellerListCount = 3;
final double paddingIcon = 20.sp;

///This class is used to represent pranaam confirm
class PranaamConfirmationWidgetView extends WidgetView<
    PranaamConfirmationScreen, PranaamConfirmationController> {
  const PranaamConfirmationWidgetView(
    PranaamConfirmationController state, {
    Key? key,
  }) : super(
          state,
          key: key,
        );

  String _getQrMessage(String bookingType, context) {
    switch (bookingType.toLowerCase()) {
      case wheelChairBookingType:
        return 'show_qr_wheelchair'.localize(context);
      case porterBookingType:
        return 'show_qr_porter'.localize(context);
      default:
        return 'show_qr_pranaam_executive'.localize(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    return Scaffold(
      body: ADSelectorStateLessWidget<BookingAndCancellationState>(
        viewModel: state.getBookingDetailsState,
        child: Consumer<BookingAndCancellationState>(
          builder: (
            context,
            value,
            child,
          ) {
            final bool isUpgradeBooking = state
                    .getBookingDetailsState
                    .bookingDetailsResponse
                    ?.orderDetail
                    ?.pranaamDetail
                    ?.pranaamBookingType
                    ?.toLowerCase() ==
                'upgradebooking';
            final bool isRescheduleBooking = isReschedule(
              state.getBookingDetailsState.bookingDetailsResponse?.orderDetail
                      ?.pranaamDetail?.pranaamBookingType
                      ?.toLowerCase() ??
                  '',
            );
            final isRoundTrip = state
                    .getBookingDetailsState
                    .bookingDetailsResponse
                    ?.orderDetail
                    ?.pranaamDetail
                    ?.tripDetails
                    ?.serviceTypeId ==
                id_3;
            const k_2 = 2;
            switch (value.getBookingDetailsState.viewStatus) {
              case Status.complete:
                final CommonOrderDetailBaseResponse
                    bookingDetailsResponseModel =
                    value.getBookingDetailsState.data;

                final standAloneService = isStandAloneService(
                  bookingDetailsResponseModel
                          .orderDetail?.pranaamDetail?.pranaamBookingType ??
                      '',
                );
                final priceInfo = standAloneService
                    ? bookingDetailsResponseModel.orderDetail?.pranaamDetail
                        ?.standaloneProductDetails?.pricingInfo
                    : bookingDetailsResponseModel
                        .orderDetail?.pranaamDetail?.packageDetail?.pricingInfo;

                final orderStatusString = bookingDetailsResponseModel
                    .statusHistory?[
                        ((bookingDetailsResponseModel.statusHistory?.length ??
                                2) -
                            2)]
                    .orderStatus;

                WidgetsBinding.instance.addPostFrameCallback(
                  (_) async {
                    context.read<AppSessionState>().getUpcomingBookings();
                    context
                        .read<AppSessionState>()
                        .updateValueOfBooking(updateValue: true);
                    // final value =
                    //     await context.read<AppSessionState>().getBookings(
                    //           bookType: BookingHistory()
                    //               .bookingType(BookingTabType.booking),
                    //         );
                    // adLog(value.toString());
                  },
                );

                return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: getBackgroundBookingStatusColor(
                      orderStatusString ?? '',
                      context,
                    ),
                    leading: InkWell(
                      onTap: () => state.onCrossTap(),
                      child: Padding(
                        padding: EdgeInsets.only(left: context.k_4),
                        child: Icon(
                          Icons.close,
                          size: context.k_30,
                        ),
                      ),
                    ),
                    foregroundColor: getForegroundBookingStatusColor(
                      orderStatusString ?? '',
                      context,
                    ),
                  ),
                  body: (bookingDetailsResponseModel.orderDetail?.pranaamDetail
                                  ?.tripDetails?.userId ??
                              '')
                          .isNotEmpty
                      ? ListView(
                          padding: EdgeInsets.zero,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            if (PranaamOrderStatus.isPending(
                                  orderStatusString,
                                ) ||
                                PranaamOrderStatus.getStatus(
                                      orderStatusString ?? '',
                                    ) ==
                                    PranaamOrderStatus.FAILED)
                              TopContainerView(
                                bookingDetailsResponseModel:
                                    bookingDetailsResponseModel,
                                state: state,
                                orderStatusString: orderStatusString,
                              )
                            else
                              Stack(
                                alignment: Alignment.bottomCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  TopContainerView(
                                    bookingDetailsResponseModel:
                                        bookingDetailsResponseModel,
                                    state: state,
                                    orderStatusString: orderStatusString,
                                  ),
                                  PositionedDirectional(
                                    bottom: isRoundTrip
                                        ? -context.k_30
                                        : standAloneService
                                            ? context.k_10
                                            : -context.k_34,
                                    start: 0,
                                    end: 0,
                                    child: Column(
                                      children: [
                                        if (isRoundTrip)
                                          const OfficerContainer(),
                                        QrView(
                                          qrCodeString: state
                                                  .getBookingDetailsState
                                                  .bookingDetailsResponse
                                                  ?.orderDetail
                                                  ?.pranaamDetail
                                                  ?.tripDetails
                                                  ?.tripBookingNumber ??
                                              ''.toString(),
                                        ),
                                        Container(
                                          width: qrImageWidth,
                                          child: Text(
                                            _getQrMessage(
                                              state
                                                      .getBookingDetailsState
                                                      .bookingDetailsResponse
                                                      ?.orderDetail
                                                      ?.pranaamDetail
                                                      ?.pranaamBookingType ??
                                                  '',
                                              context,
                                            ),
                                            style: ADTextStyle400.size12
                                                .setTextColor(
                                              context.adColors.greyTextColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Text(
                                          'Reference ID - ${state.getBookingDetailsState.bookingDetailsResponse?.orderDetail?.pranaamDetail?.tripDetails?.tripBookingNumber}',
                                          style: ADTextStyle400.size12
                                              .setTextColor(
                                            context.adColors.greyTextColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ).paddingBySide(top: context.k_8),
                                        if (Platform.isIOS)
                                          AddToWalletButton(
                                            onTapHandler: () => addToWallet(
                                              context,
                                              state
                                                      .getBookingDetailsState
                                                      .bookingDetailsResponse
                                                      ?.orderReferenceId ??
                                                  '',
                                              state
                                                      .getBookingDetailsState
                                                      .bookingDetailsResponse
                                                      ?.orderDetail
                                                      ?.pranaamDetail
                                                      ?.tripDetails
                                                      ?.tripBookingNumber ??
                                                  ''.toString(),
                                            ),
                                          ).paddingBySide(top: context.k_10),
                                        if (bookingDetailsResponseModel
                                                    .orderDetail
                                                    ?.pranaamDetail
                                                    ?.tripDetails
                                                    ?.serviceTypeId !=
                                                id_3 &&
                                            !standAloneService)
                                          const OfficerContainer(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            if (PranaamOrderStatus.getStatus(
                                  orderStatusString,
                                ) ==
                                PranaamOrderStatus.FAILED)
                              const RefundContainer()
                            else
                              const SizedBox.shrink(),
                            if (isRoundTrip)
                              Text(
                                'Departure',
                                style: ADTextStyle700.size22,
                              ).paddingBySide(
                                left: context.k_20,
                                top: !PranaamOrderStatus.isPending(
                                  orderStatusString,
                                )
                                    ? context.k_48
                                    : context.k_30,
                              )
                            else
                              const SizedBox.shrink(),
                            ADSizedBox(
                              height: !PranaamOrderStatus.isPending(
                                orderStatusString,
                              )
                                  ? context.k_10
                                  : 0,
                            ),

                            FlightDetailViewForConfirmation(
                              bookingID: state
                                      .getBookingDetailsState
                                      .bookingDetailsResponse
                                      ?.orderReferenceId ??
                                  '',
                              isRoundTrip: false,
                              tripDetail: bookingDetailsResponseModel
                                      .orderDetail
                                      ?.pranaamDetail
                                      ?.tripDetails ??
                                  const pranaam_detail.TripDetails(),
                            ),

                            if (isRoundTrip)
                              Column(
                                children: [
                                  if (!PranaamOrderStatus.isPending(
                                        orderStatusString,
                                      ) &&
                                      PranaamOrderStatus.getStatus(
                                            orderStatusString ?? '',
                                          ) !=
                                          PranaamOrderStatus.FAILED)
                                    Column(
                                      children: [
                                        QrView(
                                          qrCodeString: state
                                                  .getBookingDetailsState
                                                  .bookingDetailsResponse
                                                  ?.orderDetail
                                                  ?.pranaamDetail
                                                  ?.roundTripDetail
                                                  ?.tripBookingNumber ??
                                              ''.toString(),
                                        ),
                                        Container(
                                          width: qrImageWidth,
                                          child: Text(
                                            'show_qr_pranaam_executive'
                                                .localize(context),
                                            style: ADTextStyle400.size12
                                                .setTextColor(
                                              context.adColors.greyTextColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Text(
                                          'Reference ID - ${state.getBookingDetailsState.bookingDetailsResponse?.orderDetail?.pranaamDetail?.roundTripDetail?.tripBookingNumber}',
                                          style: ADTextStyle400.size12
                                              .setTextColor(
                                            context.adColors.greyTextColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ).paddingBySide(top: context.k_8),
                                        if (Platform.isIOS)
                                          AddToWalletButton(
                                            onTapHandler: () => addToWallet(
                                              context,
                                              state
                                                      .getBookingDetailsState
                                                      .bookingDetailsResponse
                                                      ?.orderReferenceId ??
                                                  '',
                                              state
                                                      .getBookingDetailsState
                                                      .bookingDetailsResponse
                                                      ?.orderDetail
                                                      ?.pranaamDetail
                                                      ?.roundTripDetail
                                                      ?.tripBookingNumber ??
                                                  '',
                                            ),
                                          ).paddingBySide(top: context.k_10),
                                      ],
                                    ),
                                  ADSizedBox(height: context.k_40),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Arrival',
                                      style: ADTextStyle700.size22,
                                      textAlign: TextAlign.left,
                                    ).paddingBySide(left: context.k_20),
                                  ),
                                  FlightDetailViewForConfirmation(
                                    bookingID: state
                                            .getBookingDetailsState
                                            .bookingDetailsResponse
                                            ?.orderReferenceId ??
                                        '',
                                    isRoundTrip: false,
                                    tripDetail: bookingDetailsResponseModel
                                            .orderDetail
                                            ?.pranaamDetail
                                            ?.roundTripDetail ??
                                        const pranaam_detail.TripDetails(),
                                  ),
                                  ADSizedBox(height: context.k_16),
                                  Divider(
                                    thickness: context.k_8,
                                    color: const Color(0xfffbfbfb),
                                  ),
                                ],
                              )
                            else
                              const SizedBox.shrink(),
                            if (!(PranaamOrderStatus.getStatus(
                                  bookingDetailsResponseModel
                                          .statusHistory?[
                                              (bookingDetailsResponseModel
                                                          .statusHistory
                                                          ?.length ??
                                                      k_2) -
                                                  k_2]
                                          .orderStatus ??
                                      '',
                                )?.isPendingGetter ??
                                false))
                              if (!value.isEarnPointsLoading)
                                LoyaltyPointsComponent(
                                  points: bookingDetailsResponseModel
                                          .earning?.total ??
                                      0,
                                  routeThankYou: true,
                                  loyaltyShowScreenType:
                                      LoyaltyShowScreenType.pranaam,
                                ).paddingBySide(
                                  left: context.k_16,
                                  right: context.k_16,
                                )
                              else
                                ADShimmerWidget.shimmerShape(
                                  rectanglePadding:
                                      EdgeInsets.all(context.k_16),
                                  type: ShimmerType.rectangleBox,
                                  width: context.widthOfScreen,
                                  height: context.k_48,
                                ),
                            ADSizedBox(height: context.k_32),
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
                                        salutationText: e.salutationText ?? '',
                                      ),
                                      passengerTypeId: e.passengerTypeId,
                                    ),
                                  )
                                  .toList(),
                            ),
                            ADSizedBox(height: context.k_20),
                            if (standAloneService)
                              StandAloneOrderSummary(
                                name: bookingDetailsResponseModel
                                        .orderDetail
                                        ?.pranaamDetail
                                        ?.standaloneProductDetails
                                        ?.name ??
                                    '',
                                image: (bookingDetailsResponseModel
                                                .orderDetail
                                                ?.pranaamDetail
                                                ?.standaloneProductDetails
                                                ?.packageImageUrl ??
                                            '')
                                        .isEmpty
                                    ? 'lib/assets/images/pranaam/porter2.png'
                                    : bookingDetailsResponseModel
                                            .orderDetail
                                            ?.pranaamDetail
                                            ?.standaloneProductDetails
                                            ?.packageImageUrl ??
                                        '',
                                packagePrice: bookingDetailsResponseModel
                                        .orderDetail
                                        ?.pranaamDetail
                                        ?.standaloneProductDetails
                                        ?.pricingInfo
                                        ?.totalFare
                                        ?.amount
                                        .toString() ??
                                    '',
                                packageType: bookingDetailsResponseModel
                                        .orderDetail
                                        ?.pranaamDetail
                                        ?.standaloneProductDetails
                                        ?.name ??
                                    '',
                                quantity: bookingDetailsResponseModel
                                        .orderDetail
                                        ?.pranaamDetail
                                        ?.standaloneProductDetails
                                        ?.itemCount
                                        .toString() ??
                                    '',
                              )
                            else
                              ConfirmationOrderSummary(
                                bookingDetailsResponseModel:
                                    bookingDetailsResponseModel,
                              ),
                            PriceDetailsView(
                              showApplyCoupon: true,
                              addOnsList:
                                  isUpgradeBooking || isRescheduleBooking
                                      ? []
                                      : bookingDetailsResponseModel.orderDetail
                                              ?.pranaamDetail?.addOnServices ??
                                          [],
                              packageName: standAloneService
                                  ? bookingDetailsResponseModel
                                          .orderDetail
                                          ?.pranaamDetail
                                          ?.standaloneProductDetails
                                          ?.name ??
                                      ''
                                  : bookingDetailsResponseModel.orderDetail
                                      ?.pranaamDetail?.packageDetail?.name,
                              promoType: bookingDetailsResponseModel
                                      .orderDetail
                                      ?.pranaamDetail
                                      ?.packageDetail
                                      ?.pricingInfo
                                      ?.discountCouponDetails
                                      ?.promoType ??
                                  '',
                              reward: isUpgradeBooking || isRescheduleBooking
                                  ? ((bookingDetailsResponseModel
                                                  .transactionHistory?.length ??
                                              0) >
                                          1)
                                      ? bookingDetailsResponseModel
                                              .transactionHistory
                                              ?.last
                                              .paidBy
                                              ?.loyalty
                                              ?.amount
                                              ?.floorToDouble() ??
                                          0
                                      : 0
                                  : bookingDetailsResponseModel.orderDetail
                                          ?.pranaamDetail?.totalLoyalty
                                          ?.floorToDouble() ??
                                      0,
                              totalMRP: priceInfo?.totalBaseFare?.amount ?? 0,
                              cGst: _getCgstAmount(bookingDetailsResponseModel),
                              sGst: _getSgstAmount(bookingDetailsResponseModel),
                              totalAmount:
                                  isUpgradeBooking || isRescheduleBooking
                                      ? bookingDetailsResponseModel
                                              .orderDetail
                                              ?.pranaamDetail
                                              ?.upgradeBankAmount ??
                                          0
                                      : bookingDetailsResponseModel
                                              .orderDetail
                                              ?.pranaamDetail
                                              ?.finalTotalAmount ??
                                          0,
                              addOnsAmount:
                                  isUpgradeBooking || isRescheduleBooking
                                      ? 0
                                      : getAddOnTotalPricePostBooking(
                                          bookingDetailsResponseModel
                                                  .orderDetail
                                                  ?.pranaamDetail
                                                  ?.addOnServices ??
                                              [],
                                        ),

                              /// todo: change this
                              isForRescheduleConfirmation: isReschedule(
                                bookingDetailsResponseModel.orderDetail
                                        ?.pranaamDetail?.pranaamBookingType ??
                                    '',
                              ),

                              discountAmount:
                                  isUpgradeBooking || isRescheduleBooking
                                      ? 0
                                      : bookingDetailsResponseModel
                                              .orderDetail
                                              ?.pranaamDetail
                                              ?.packageDetail
                                              ?.pricingInfo
                                              ?.discountCouponDetails
                                              ?.couponDiscountAmount
                                              ?.toDouble() ??
                                          0,
                              expressFareAmount: bookingDetailsResponseModel
                                      .orderDetail
                                      ?.pranaamDetail
                                      ?.packageDetail
                                      ?.pricingInfo
                                      ?.totalExpressFare
                                      ?.baseFare ??
                                  0,
                              isPostBooking: true,
                            ),
                            ADSizedBox(height: context.k_48 + context.k_4),
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
                                            important_information.ContentList>
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
                                              ShimmerBuilderType.listVertical,
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
                            ADSizedBox(height: context.k_64 + context.k_40),

                            /// AS Per BD, we need to remove other services for now.
                            // const OtherServicesView(),
                            // ADSizedBox(height: context.k_26),
                          ],
                        )
                      : ADErrorPage(
                          message: value.getBookingDetailsState.message,
                        ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: (bookingDetailsResponseModel.orderDetail
                                  ?.pranaamDetail?.tripDetails?.userId ??
                              '')
                          .isNotEmpty
                      ? ConfirmationBottomBar(
                          buttons: [
                            ConfirmationBottomButtonModel(
                              icon: SvgAssets.bottomBarHome,
                              title: 'home'.localize(context),
                              onTap: () => {
                                Navigator.pop(context),
                                (BottomBarState.key.currentWidget
                                        as CustomTabScaffold)
                                    .controller
                                    ?.index = 0,
                                BottomTabNavKeys.homeTabItemKey.currentState
                                    ?.popUntil((route) => route.isFirst),
                              },
                            ),
                            ConfirmationBottomButtonModel(
                              icon: SvgAssets.confirmationBarModify,
                              title: standAloneService
                                  ? 'My Booking'
                                  : 'modify'.localize(context),
                              onTap: () => state.onModifyTap(),
                            ),
                            ConfirmationBottomButtonModel(
                              icon: SvgAssets.help,
                              title: 'help'.localize(context),
                              onTap: () => {
                                PranaamBookingGaAnalytics().helpAnalyticsData(
                                  ClickEvents.view_help_and_support,
                                  context.read<PranaamAppDataStateManagement>(),
                                ),
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
                            ),
                          ],
                        )
                      : const ADSizedBox(),
                );

              case Status.loading:
                return const PranaamConfirmationShimmer();
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
    );
  }

  double _getCgstAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    if (isUpgradeBooking(
          bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.pranaamBookingType ??
              '',
        ) ||
        isReschedule(
          bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.pranaamBookingType ??
              '',
        )) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.packageDetail?.pricingInfo?.totalTax?.cgst?.amount ??
          0;
    }
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.totalTax?.cgst ??
        0;
  }

  double _getSgstAmount(
    CommonOrderDetailBaseResponse bookingDetailsResponseModel,
  ) {
    if (isUpgradeBooking(
          bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.pranaamBookingType ??
              '',
        ) ||
        isReschedule(
          bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.pranaamBookingType ??
              '',
        )) {
      return bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.packageDetail?.pricingInfo?.totalTax?.sgst?.amount ??
          0;
    }
    return bookingDetailsResponseModel
            .orderDetail?.pranaamDetail?.totalTax?.sgst ??
        0;
  }
}

class TopContainerView extends StatelessWidget {
  const TopContainerView({
    Key? key,
    required this.bookingDetailsResponseModel,
    required this.state,
    required this.orderStatusString,
  }) : super(key: key);

  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;
  final PranaamConfirmationController state;
  final String? orderStatusString;

  @override
  Widget build(BuildContext context) {
    final statusHistory = bookingDetailsResponseModel.statusHistory;
    const lastSecondIndex = 2;
    return BookingConfirmedView(
      orderStatusString: orderStatusString ?? '',
      lotte: getBookingStatusTypeLottie(
        orderStatusString ?? '',
        isStandAlone: isStandAloneService(
          bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.pranaamBookingType ??
              '',
        ),
      ),
      backgroundColor: getBackgroundBookingStatusColor(
        orderStatusString ?? '',
        context,
      ),
      foregroundColor: getForegroundBookingStatusColor(
        orderStatusString ?? '',
        context,
      ),
      state: state,
      email: state.getBookingDetailsState.bookingDetailsResponse?.orderDetail
              ?.pranaamDetail?.billingInfo?.email ??
          '',
      title: getBookingStatusTitle(
        orderStatusString ?? '',
      ),
      subTitle: getBookingStatusSubtitle(
        orderStatusString ?? '',
        statusHistory?[statusHistory.length - lastSecondIndex].description ??
            '',
      ),
      phoneNumber: state.getBookingDetailsState.bookingDetailsResponse
              ?.orderDetail?.pranaamDetail?.billingInfo?.mobile ??
          '',
      countryDialCode: state.getBookingDetailsState.bookingDetailsResponse
              ?.orderDetail?.pranaamDetail?.billingInfo?.countryDialCode ??
          '',
      pranaamBookingType: bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.pranaamBookingType ??
          '',
      isRoundTrip: bookingDetailsResponseModel
              .orderDetail?.pranaamDetail?.tripDetails?.serviceTypeId ==
          roundTripServiceId,
      confirmationGifAlignValue: getBookingStatusAlign(
        orderStatusString ?? '',
        isStandAlone: isStandAloneService(
          bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.pranaamBookingType ??
              '',
        ),
        isRoundTrip: bookingDetailsResponseModel
                .orderDetail?.pranaamDetail?.tripDetails?.serviceTypeId ==
            roundTripServiceId,
      ),
    ).paddingBySide(
      bottom:
          (Platform.isIOS && !PranaamOrderStatus.isPending(orderStatusString))
              ? context.k_48
              : 0,
    );
  }
}

class OfficerContainer extends StatelessWidget {
  const OfficerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.k_16),
      padding: EdgeInsets.all(context.k_10),
      decoration: BoxDecoration(
        color: Color(informationStripColor),
        borderRadius: BorderRadius.circular(
          context.k_8,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            SvgAssets.officerIconPranaam,
          ),
          ADSizedBox(
            width: context.k_12,
          ),
          Expanded(
            child: Text(
              'assigned_pranaam_executive'.localize(context),
              style: ADTextStyle400.size14.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
