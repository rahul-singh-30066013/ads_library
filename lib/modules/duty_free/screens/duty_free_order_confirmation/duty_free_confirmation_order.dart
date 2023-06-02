/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/components/header_dialog.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/cancellation_date_change_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/duty_free_allowances_section.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_help_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_option_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_order_detail_shimmer.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_order_status.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_qr_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_refund_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_update_send.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/horizontal_cart_list.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/important_information_shimmer.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_pre_order_price_info.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const int maxLines = 2;
const int lengthNumber = 2;

///[DutyFreeConfirmationOrder] is user for duty free confirm order details.
///
class DutyFreeConfirmationOrder extends StatefulWidget {
  const DutyFreeConfirmationOrder({Key? key, required this.referenceId})
      : super(key: key);

  /// TODO add to Styleguide
  static const Color grayBackground = Color(0xfff5f5f5);

  /// Height of grey container with QR View
  static double greyContainerHeight = 60.sp;
  static double containerHeight = 32.sp;
  static double padding50 = 50.sp;
  static double padding52 = 52.sp;
  static double padding44 = 44.sp;
  static double padding42 = 42.sp;

  static const Color paidWithCreditCardSectionColor = Color(0xfffbfbfb);
  final String referenceId;

  @override
  State<DutyFreeConfirmationOrder> createState() =>
      _DutyFreeConfirmationOrderState();
}

class _DutyFreeConfirmationOrderState extends State<DutyFreeConfirmationOrder> {
  final verticalOffset = 12.0;
  final lineHeight = 1.5;
  final blurRadius = 8.0;
  final opacity = 0.18;
  final rewardContainerWidth = 343.sp;
  final letterSpacing = 0.17;
  final k_52 = 52.sp;
  final secondLastNumber = 2;
  DutyFreeOrderState? dutyFreeOrderState;
  @override
  void initState() {
    ScreenEvents.order_confirmation_screen.log();
    _getCancelOrderData(
      context,
      widget.referenceId,
    );
    dutyFreeOrderState = context.read<DutyFreeOrderState>();
    dutyFreeOrderState?.transactionId = widget.referenceId;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    dutyFreeOrderState?.dutyFreeCancelOrderDetailsResponseModel = null;
  }

  void _getCancelOrderData(
    BuildContext context,
    String referenceId,
  ) {
    context.read<DutyFreeOrderState>().getDutyCancelOrderDetailsData(
          referenceId,
          context.read<SiteCoreStateManagement>(),
        );
  }

  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DutyFreeConfirmationOrder.grayBackground,
        actions: [
          TextButton(
            child: Text(
              'help'.localize(context),
              style: ADTextStyle600.size14.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
            onPressed: () => helpBottomSheet(context),
          ),
        ],
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ADSizedBox(
              height: context.k_4,
            ),
            Consumer<DutyFreeOrderState>(
              builder: (context, state, child) =>
                  state.cancelOrderDetailsState.viewStatus != Status.loading
                      ? Text(
                          state.dutyFreeCancelOrderDetailsResponseModel
                                  ?.businessSubType ??
                              '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: maxLines,
                          style: ADTextStyle700.size16.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        )
                      : ADShimmerWidget.shimmerShape(
                          rectanglePadding: EdgeInsets.zero,
                          type: ShimmerType.rectangleBox,
                          width: context.k_56,
                          height: context.k_10,
                        ),
            ),
            ADSizedBox(
              height: context.k_4,
            ),
            Text(
              '${'order_id'.localize(context)} ${widget.referenceId}',
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
              style: ADTextStyle400.size12.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
            ADSizedBox(
              height: context.k_4,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Consumer<DutyFreeOrderState>(
          builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
            // if (dutyFreeOrderState
            //     .cancelOrderDetailsState.viewStatus ==
            //     Status.complete) _importantInfoApi();
            final statusHistoryLength = dutyFreeOrderState
                    .dutyFreeCancelOrderDetailsResponseModel
                    ?.statusHistory
                    ?.length ??
                0;
            String? currentOrderStatus = '';
            for (int statusCount = 0;
                statusCount < statusHistoryLength;
                statusCount++) {
              if (dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                      ?.statusHistory?[statusCount].progress
                      ?.toLowerCase() ==
                  'current') {
                currentOrderStatus = dutyFreeOrderState
                    .dutyFreeCancelOrderDetailsResponseModel
                    ?.statusHistory?[statusCount]
                    .orderStatus;
              }
            }
            final bool loyaltyAvailable = dutyFreeOrderState
                            .dutyFreeCancelOrderDetailsResponseModel?.earning !=
                        null &&
                    ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                                ?.earning?.total ??
                            0) >
                        0) ||
                (dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                            ?.earning?.total ??
                        0) >
                    0 ||
                (dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                            ?.earning?.total ??
                        0) >
                    0;
            final bool rewardsRedeemed = (dutyFreeOrderState
                            .dutyFreeCancelOrderDetailsResponseModel
                            ?.isLoyaltyApplied() ??
                        0) >
                    0 &&
                dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                        ?.isLoyaltyApplied() !=
                    null;
            return Center(
              child: Stack(
                children: [
                  if (dutyFreeOrderState.cancelOrderDetailsState.viewStatus ==
                      Status.loading) ...{
                    const DutyFreeOrderDetailShimmer(),
                  } else if (dutyFreeOrderState
                          .cancelOrderDetailsState.viewStatus ==
                      Status.error) ...{
                    NoDataFoundErrorScreen(
                      paddingBetweenImageAndErrorTitle: context.k_20,
                      paddingBetweenErrorMessageAndRetry: context.k_30,
                      errorTitle: 'no_data_available'.localize(context),
                      onRetryTap: () => {
                        _getCancelOrderData(
                          context,
                          widget.referenceId,
                        ),
                      },
                    ),
                  } else if (dutyFreeOrderState
                          .cancelOrderDetailsState.viewStatus ==
                      Status.complete) ...{
                    SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller:
                          context.read<DutyFreeOrderState>().scrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const HorizontalCartList(),
                              Container(
                                color: context.adColors.whiteTextColor,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: (currentOrderStatus
                                                      ?.toLowerCase() ==
                                                  'confirmed' ||
                                              dutyFreeOrderState.orderCancelled)
                                          ? DutyFreeConfirmationOrder
                                              .greyContainerHeight
                                          : DutyFreeConfirmationOrder
                                              .containerHeight,
                                      color: DutyFreeConfirmationOrder
                                          .grayBackground,
                                    ),
                                    if (!(currentOrderStatus?.toLowerCase() ==
                                            'pending') &&
                                        !(currentOrderStatus?.toLowerCase() ==
                                            'failed'))
                                      const DutyFreeQRView().paddingBySide(
                                        top: context.k_30,
                                        left: context.k_16,
                                        right: context.k_16,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: context.adColors.whiteTextColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (dutyFreeOrderState.orderCancelled)
                                  const DutyFreeRefundScreen().paddingBySide(
                                    top: DutyFreeConfirmationOrder.padding52,
                                  ),
                                // ADSizedBox(
                                //   height: DutyFreeConfirmationOrder.padding42,
                                // ),
                                const DutyFreeOrderStatus().paddingBySide(
                                  left: context.k_16,
                                  right: context.k_16,
                                  top: dutyFreeOrderState.orderCancelled
                                      ? 0
                                      : DutyFreeConfirmationOrder.padding42,
                                  bottom: context.k_20,
                                ),
                                if (!dutyFreeOrderState.orderCancelled) ...[
                                  const DutyFreeOptionView(),
                                  Selector<DutyFreeOrderState, bool>(
                                    selector: (context, viewModel) =>
                                        viewModel.isEarnPointsLoading,
                                    builder: (
                                      context,
                                      isEarnPointsLoading,
                                      Widget? child,
                                    ) {
                                      return !dutyFreeOrderState
                                                  .orderCancelled &&
                                              !(currentOrderStatus
                                                      ?.toLowerCase() ==
                                                  'pending') &&
                                              !dutyFreeOrderState.orderFailed
                                          ? isEarnPointsLoading
                                              ? ADShimmerWidget.shimmerShape(
                                                  rectanglePadding:
                                                      EdgeInsets.zero,
                                                  type:
                                                      ShimmerType.rectangleBox,
                                                  width: context.widthOfScreen,
                                                  height: context.k_48,
                                                ).paddingBySide(
                                                  top: context.k_20,
                                                  left: context.k_16,
                                                  right: context.k_16,
                                                )
                                              : (!(currentOrderStatus
                                                              ?.toLowerCase() ==
                                                          'fulfilled' ||
                                                      currentOrderStatus
                                                              ?.toLowerCase() ==
                                                          'part_fulfilled')
                                                  ? (!(dutyFreeOrderState
                                                              .dutyFreeCancelOrderDetailsResponseModel
                                                              ?.isRewardEarned ??
                                                          false))
                                                      ? LoyaltyPointsComponent(
                                                          routeThankYou: true,
                                                          points: dutyFreeOrderState
                                                                  .dutyFreeCancelOrderDetailsResponseModel
                                                                  ?.earning
                                                                  ?.total ??
                                                              0,
                                                        ).paddingBySide(
                                                          top: context.k_20,
                                                          left: context.k_16,
                                                          right: context.k_16,
                                                          bottom: context.k_20,
                                                        )
                                                      : LoyaltyPointsComponent(
                                                          routeConfirmation:
                                                              true,
                                                          points: dutyFreeOrderState
                                                                  .dutyFreeCancelOrderDetailsResponseModel
                                                                  ?.earning
                                                                  ?.total ??
                                                              0,
                                                        ).paddingBySide(
                                                          top: context.k_20,
                                                          left: context.k_16,
                                                          right: context.k_16,
                                                          bottom: context.k_20,
                                                        )
                                                  : LoyaltyPointsComponent(
                                                      routeThankYou: true,
                                                      points: dutyFreeOrderState
                                                              .dutyFreeCancelOrderDetailsResponseModel
                                                              ?.earning
                                                              ?.total ??
                                                          0,
                                                    ).paddingBySide(
                                                      top: context.k_20,
                                                      left: context.k_16,
                                                      right: context.k_16,
                                                      bottom: context.k_20,
                                                    ))
                                          : Container();
                                    },
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const HeaderText(title: 'price_details'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'total_price'.localize(context),
                                            style: ADTextStyle400.size16
                                                .setTextColor(
                                              context.adColors.blackTextColor,
                                            ),
                                          ),
                                          Text(
                                            FlightUtils
                                                .getPriceFormatWithSymbol(
                                              price: dutyFreeOrderState
                                                      .dutyFreeCancelOrderDetailsResponseModel
                                                      ?.orderDetail
                                                      ?.dutyfreeDetail
                                                      ?.unitPriceResponse
                                                      ?.amount
                                                      ?.toDouble() ??
                                                  0,
                                            ),
                                            style: ADTextStyle400.size16
                                                .setTextColor(
                                              context.adColors.blackTextColor,
                                            ),
                                          ),
                                        ],
                                      ).paddingBySide(
                                        top: context.k_20,
                                      ),
                                      if ((dutyFreeOrderState
                                                  .dutyFreeCancelOrderDetailsResponseModel
                                                  ?.orderDetail
                                                  ?.dutyfreeDetail
                                                  ?.discountPrice
                                                  ?.amount ??
                                              0) >
                                          0)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'discount'.localize(context),
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                context.adColors.blackTextColor,
                                              ),
                                            ),
                                            Text(
                                              '- ${FlightUtils.getPriceFormatWithSymbol(
                                                price: dutyFreeOrderState
                                                        .dutyFreeCancelOrderDetailsResponseModel
                                                        ?.orderDetail
                                                        ?.dutyfreeDetail
                                                        ?.discountPrice
                                                        ?.amount
                                                        ?.toDouble() ??
                                                    0,
                                              )}',
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                context.adColors.priceOffGreen,
                                              ),
                                            ),
                                          ],
                                        ).paddingBySide(
                                          top: context.k_20,
                                        ),
                                      if ((dutyFreeOrderState
                                                  .dutyFreeCancelOrderDetailsResponseModel
                                                  ?.orderDetail
                                                  ?.dutyfreeDetail
                                                  ?.preOrderDiscount
                                                  ?.amount ??
                                              0) >
                                          0)

                                        /*dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.preOrderDiscount.percentageDiscount*/
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '${'pre_order_discount'.localize(context)} (${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.preOrderDiscount?.percentageDiscount}%)',
                                                  style: ADTextStyle400.size16
                                                      .setTextColor(
                                                    context.adColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                                if (dutyFreeOrderState
                                                        .dutyFreeCancelOrderDetailsResponseModel
                                                        ?.orderDetail
                                                        ?.dutyfreeDetail
                                                        ?.preOrderDiscountBreakup
                                                        ?.isNotEmpty ??
                                                    false)
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                      context.k_6,
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          adShowBottomSheet(
                                                        childWidget:
                                                            DutyFreePreOrderPriceInfo(
                                                          preOrderDiscountBreakupList:
                                                              dutyFreeOrderState
                                                                      .dutyFreeCancelOrderDetailsResponseModel
                                                                      ?.orderDetail
                                                                      ?.dutyfreeDetail
                                                                      ?.preOrderDiscountBreakup ??
                                                                  [],
                                                        ),
                                                        context: context,
                                                        headerTitle:
                                                            'pre_order_discount_breakup'
                                                                .localize(
                                                          context,
                                                        ),
                                                      ),
                                                      behavior: HitTestBehavior
                                                          .translucent,
                                                      child: Icon(
                                                        Icons.info_outline,
                                                        size: context.k_20,
                                                        color: context.adColors
                                                            .greyTextColor,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              '- ${FlightUtils.getPriceFormatWithSymbol(
                                                price: dutyFreeOrderState
                                                        .dutyFreeCancelOrderDetailsResponseModel
                                                        ?.orderDetail
                                                        ?.dutyfreeDetail
                                                        ?.preOrderDiscount
                                                        ?.amount
                                                        ?.toDouble() ??
                                                    0,
                                              )}',
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                context.adColors.priceOffGreen,
                                              ),
                                            ),
                                          ],
                                        ).paddingBySide(
                                          top: context.k_20,
                                        ),
                                      if ((dutyFreeOrderState
                                                  .dutyFreeCancelOrderDetailsResponseModel
                                                  ?.orderDetail
                                                  ?.dutyfreeDetail
                                                  ?.promoCoupon
                                                  .offerValue ??
                                              0) >
                                          0)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'coupon_discount_'
                                                  .localize(context),
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                context.adColors.blackTextColor,
                                              ),
                                            ),
                                            Text(
                                              '- ${FlightUtils.getPriceFormatWithSymbol(
                                                price: (dutyFreeOrderState
                                                            .dutyFreeCancelOrderDetailsResponseModel
                                                            ?.orderDetail
                                                            ?.dutyfreeDetail
                                                            ?.promoCoupon
                                                            .offerValue ??
                                                        0)
                                                    .toDouble(),
                                              )}',
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                context.adColors.priceOffGreen,
                                              ),
                                            ),
                                          ],
                                        ).paddingBySide(
                                          top: context.k_20,
                                        ),
                                      if ((dutyFreeOrderState
                                                  .dutyFreeCancelOrderDetailsResponseModel
                                                  ?.isLoyaltyApplied() ??
                                              0) >
                                          0)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'reward_points_redeemed'
                                                  .localize(context),
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                context.adColors.blackTextColor,
                                              ),
                                            ),
                                            Text(
                                              '- ${FlightUtils.getPriceFormatWithSymbol(
                                                price: dutyFreeOrderState
                                                        .dutyFreeCancelOrderDetailsResponseModel
                                                        ?.isLoyaltyApplied() ??
                                                    0,
                                              )}',
                                              style: ADTextStyle400.size16
                                                  .setTextColor(
                                                context.adColors.priceOffGreen,
                                              ),
                                            ),
                                          ],
                                        ).paddingBySide(
                                          top: context.k_20,
                                        ),
                                      ADSizedBox(
                                        height: context.k_26,
                                      ),
                                      // if (!dutyFreeOrderState.orderCancelled)
                                      //   LoyaltyPointsComponent(
                                      //     points: dutyFreeOrderState
                                      //             .dutyFreeCancelOrderDetailsResponseModel
                                      //             ?.loyaltyPoint
                                      //             ?.earnedRewardPoints ??
                                      //         0,
                                      //     loyaltyShowScreenType:
                                      //         LoyaltyShowScreenType.dutyFree,
                                      //   ),
                                      Divider(
                                        height: 1,
                                        color:
                                            context.adColors.widgetDividerLine,
                                      ).paddingBySide(
                                        bottom: context.k_16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'totalAmount'.localize(context),
                                            style: ADTextStyle700.size18
                                                .setTextColor(
                                              context.adColors.blackTextColor,
                                            ),
                                          ),
                                          // const HeaderText(title: ''),
                                          Text(
                                            FlightUtils
                                                .getPriceFormatWithSymbol(
                                              price: (dutyFreeOrderState
                                                              .dutyFreeCancelOrderDetailsResponseModel
                                                              ?.orderDetail
                                                              ?.dutyfreeDetail
                                                              ?.finalAmount
                                                              ?.amount
                                                              ?.toDouble() ??
                                                          0) >=
                                                      1
                                                  ? dutyFreeOrderState
                                                          .dutyFreeCancelOrderDetailsResponseModel
                                                          ?.orderDetail
                                                          ?.dutyfreeDetail
                                                          ?.finalAmount
                                                          ?.amount
                                                          ?.toDouble() ??
                                                      0
                                                  : 0,
                                            ),
                                            style: ADTextStyle700.size18
                                                .setTextColor(
                                              context.adColors.blackTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (dutyFreeOrderState
                                              .paymentMode?.isNotEmpty ??
                                          false)
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: context.k_16,
                                          ),
                                          color: DutyFreeConfirmationOrder
                                              .paidWithCreditCardSectionColor,
                                          height: context.k_56,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.k_16,
                                          ),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              if ((dutyFreeOrderState
                                                          .dutyFreeCancelOrderDetailsResponseModel
                                                          ?.transactionHistory
                                                          ?.length ==
                                                      1) &&
                                                  (dutyFreeOrderState
                                                          .dutyFreeCancelOrderDetailsResponseModel
                                                          ?.transactionHistory
                                                          ?.last
                                                          .transactionMode ==
                                                      'Reward'))
                                                SvgPicture.asset(
                                                  SvgAssets.coinIcon,
                                                  height: context.k_20,
                                                  width: context.k_20,
                                                )
                                              else
                                                const Icon(
                                                  Icons.credit_card_outlined,
                                                ),
                                              SizedBox(
                                                width: context.k_14,
                                              ),
                                              Text(
                                                'paid_with'.localize(context),
                                                style: ADTextStyle400.size16
                                                    .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: context.k_4,
                                              ),
                                              Text(
                                                dutyFreeOrderState
                                                        .paymentMode ??
                                                    'N/A',
                                                style: ADTextStyle400.size16
                                                    .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ).paddingBySide(
                                    top: loyaltyAvailable
                                        ? currentOrderStatus?.toLowerCase() ==
                                                'pending'
                                            ? context.k_40
                                            : 0
                                        : context.k_40,
                                    left: context.k_16,
                                    right: context.k_16,
                                  ),
                                  if (!(dutyFreeOrderState
                                              .dutyFreeCancelOrderDetailsResponseModel
                                              ?.transactionHistory
                                              ?.first
                                              .transactionMode
                                              ?.toLowerCase() ==
                                          'loyalty') &&
                                      (!(dutyFreeOrderState
                                              .dutyFreeCancelOrderDetailsResponseModel
                                              ?.transactionHistory
                                              ?.first
                                              .transactionMode
                                              ?.toLowerCase() ==
                                          'promo')))
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: context.k_16,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: context.k_18,
                                        horizontal: context.k_16,
                                      ),
                                      width: double.infinity,
                                      height: context.k_56,
                                      color: const Color(0xfffbfbfb),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.credit_card,
                                            size: context.k_16,
                                          ),
                                          ADSizedBox(
                                            width: context.k_16,
                                          ),
                                          Text(
                                            'Paid with ${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.transactionHistory?.first.transactionMode}',
                                            style: ADTextStyle500.size16
                                                .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                                .copyWith(
                                                  letterSpacing: letterSpacing,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ADSizedBox(
                                    height: context.k_26,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: context.adColors.widgetDividerLine,
                                  ).paddingBySide(
                                    bottom: context.k_16,
                                  ),
                                  const DutyFreeUpdateSend().paddingBySide(
                                    top: (dutyFreeOrderState
                                                .paymentMode?.isNotEmpty ??
                                            false)
                                        ? context.k_16
                                        : context.k_22,
                                    left: context.k_16,
                                    right: context.k_16,
                                    bottom: context.k_20,
                                  ),
                                  Selector<DutyFreeOrderState, Status>(
                                    selector: (context, orderState) =>
                                        orderState.importantInformationStatus,
                                    builder: (
                                      BuildContext context,
                                      status,
                                      Widget? child,
                                    ) {
                                      return status == Status.loading
                                          ? ImportantInformationShimmer()
                                          : dutyFreeOrderState
                                                  .importantInformationPolicyList
                                                  .isNotEmpty
                                              ? Column(
                                                  children: [
                                                    DutyfreeAllowancesSection(
                                                      policiesList:
                                                          dutyFreeOrderState
                                                              .importantInformationPolicyList,
                                                    ).paddingBySide(
                                                      left: context.k_16,
                                                      right: context.k_16,
                                                    ),
                                                    CancellationDateChangeView(
                                                      policiesList:
                                                          dutyFreeOrderState
                                                              .cancellationPolicyList,
                                                    ).paddingBySide(
                                                      top: context.k_2,
                                                    ),
                                                  ],
                                                )
                                              : const ADSizedBox.shrink();
                                    },
                                  ),
                                ] else
                                  const SizedBox.shrink(),
                              ],
                            ),
                          ).paddingBySide(
                            bottom: dutyFreeOrderState.orderCancelled
                                ? DutyFreeConfirmationOrder.padding52
                                : context.k_22,
                          ),
                        ],
                      ),
                    ),
                  },
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // bool isOrderCancelled(DutyFreeOrderState dutyFreeOrderState) {
  //   return (dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
  //                   ?.statusHistory?.length ??
  //               0) >
  //           0 &&
  //       ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
  //                   ?.statusHistory?.last.status ??
  //               'Canceled') ==
  //           'Cancelled');
  // }

  void helpBottomSheet(
    BuildContext context,
  ) {
    //final name = context.read<SiteCoreStateManagement>();
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return DutyFreeHelpBottomSheet();
      },
    );
  }

  bool? toolTipTap() {
    PranaamBookingGaAnalytics().rewardToolTipAnalyticsData();
    final showToolTip = tooltipKey.currentState?.ensureTooltipVisible();
    return showToolTip;
  }
}

extension CustomIterable<T> on Iterable<T> {
  T? get secondToLast {
    return length < lengthNumber ? null : elementAt(length - lengthNumber);
  }
}
