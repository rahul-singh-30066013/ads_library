/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// dropdown item for refund section
class DutyFreeCancelReasonRefund extends StatefulWidget {
  const DutyFreeCancelReasonRefund({Key? key}) : super(key: key);

  @override
  State<DutyFreeCancelReasonRefund> createState() =>
      _DutyFreeCancelReasonRefundState();
}

class _DutyFreeCancelReasonRefundState
    extends State<DutyFreeCancelReasonRefund> {
  // /// notifier for expanded view
  // final ValueNotifier isExpanded = ValueNotifier(false);

  /// TODO aad to styleguide
  static const Color lightBlueColor = Color(0xfff4f9ff);

  /// left view flex
  static int dutyFreeLeftView = 7;

  /// right view flex
  static int dutyFreeRightView = 3;

  /// expand view or not
  bool isWidgetExpand = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // isExpanded.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        isWidgetExpand = !isWidgetExpand;
        FocusManager.instance.primaryFocus?.unfocus();
      }),
      child: Container(
        color: lightBlueColor,
        child: Consumer<DutyFreeOrderState>(
          builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'refund_amount'.localize(context),
                      style: ADTextStyle700.size18.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      FlightUtils.getPriceFormatWithSymbol(
                        price: (dutyFreeOrderState
                                    .dutyFreeCancelOrderDetailsResponseModel
                                    ?.orderDetail
                                    ?.dutyfreeDetail
                                    ?.finalAmount
                                    ?.amount
                                    ?.toDouble() ??
                                0) +
                            (dutyFreeOrderState
                                    .dutyFreeCancelOrderDetailsResponseModel
                                    ?.isLoyaltyApplied() ??
                                0),
                      ),
                      style: ADTextStyle700.size18.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                    Icon(
                      isWidgetExpand
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: context.k_22,
                      color: context.adColors.blackTextColor,
                    ),
                  ],
                ),
                if (isWidgetExpand) ...[
                  SizedBox(
                    height: context.k_20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon(
                      //   Icons.credit_card,
                      //   size: context.k_16,
                      // ),
                      // SizedBox(
                      //   width: context.k_10,
                      // ),
                      Expanded(
                        // flex: dutyFreeLeftView,
                        child: Text(
                          'Total MRP',
                          style: ADTextStyle400.size16.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ),
                      ),
                      Text(
                        FlightUtils.getPriceFormatWithSymbol(
                          price: dutyFreeOrderState
                                  .dutyFreeCancelOrderDetailsResponseModel
                                  ?.orderDetail
                                  ?.dutyfreeDetail
                                  ?.unitPriceResponse
                                  ?.amount
                                  ?.toDouble() ??
                              0,
                        ),
                        textAlign: TextAlign.right,
                        style: ADTextStyle400.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                    ],
                  ).paddingBySide(
                    top: context.k_10,
                  ),
                  if ((dutyFreeOrderState
                              .dutyFreeCancelOrderDetailsResponseModel
                              ?.isLoyaltyApplied() ??
                          0) >
                      0)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   size: context.k_16,
                        // ),
                        // SizedBox(
                        //   width: context.k_10,
                        // ),

                        Expanded(
                          flex: dutyFreeLeftView,
                          child: Text(
                            'Rewards Points',
                            style: ADTextStyle400.size16.copyWith(
                              color: context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: dutyFreeRightView,
                          child: Text(
                            '- ${FlightUtils.getPriceFormatWithSymbol(
                              price: dutyFreeOrderState
                                      .dutyFreeCancelOrderDetailsResponseModel
                                      ?.isLoyaltyApplied() ??
                                  0,
                            )}',
                            textAlign: TextAlign.right,
                            style: ADTextStyle400.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                      ],
                    ).paddingBySide(
                      top: context.k_10,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   size: context.k_16,
                        // ),
                        // SizedBox(
                        //   width: context.k_10,
                        // ),

                        Expanded(
                          flex: dutyFreeLeftView,
                          child: Text(
                            'discount_price'.localize(context),
                            style: ADTextStyle400.size16.copyWith(
                              color: context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: dutyFreeRightView,
                          child: Text(
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
                            textAlign: TextAlign.right,
                            style: ADTextStyle400.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                      ],
                    ).paddingBySide(top: context.k_10),
                  if ((dutyFreeOrderState
                              .dutyFreeCancelOrderDetailsResponseModel
                              ?.orderDetail
                              ?.dutyfreeDetail
                              ?.preOrderDiscount
                              ?.amount
                              ?.toDouble() ??
                          0) >
                      0)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   size: context.k_16,
                        // ),
                        // SizedBox(
                        //   width: context.k_10,
                        // ),
                        Expanded(
                          flex: dutyFreeLeftView,
                          child: Text(
                            'pre_order_discount'.localize(context),
                            style: ADTextStyle400.size16.copyWith(
                              color: context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: dutyFreeRightView,
                          child: Text(
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
                            textAlign: TextAlign.right,
                            style: ADTextStyle400.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                      ],
                    ).paddingBySide(
                      top: context.k_10,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   size: context.k_16,
                        // ),
                        // SizedBox(
                        //   width: context.k_10,
                        // ),

                        Expanded(
                          flex: dutyFreeLeftView,
                          child: Text(
                            'coupon_discount_'.localize(context),
                            style: ADTextStyle400.size16.copyWith(
                              color: context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: dutyFreeRightView,
                          child: Text(
                            '- ${FlightUtils.getPriceFormatWithSymbol(
                              price: dutyFreeOrderState
                                      .dutyFreeCancelOrderDetailsResponseModel
                                      ?.orderDetail
                                      ?.dutyfreeDetail
                                      ?.promoCoupon
                                      .offerValue ??
                                  0.0,
                            )}',
                            textAlign: TextAlign.right,
                            style: ADTextStyle400.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                      ],
                    ).paddingBySide(top: context.k_10),
                ],
                ADSizedBox(
                  height: context.k_20,
                ),
                Divider(
                  color: context.adColors.tileBorderColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADSizedBox(
                      height: context.k_20,
                    ),
                    if ((dutyFreeOrderState
                                .dutyFreeCancelOrderDetailsResponseModel
                                ?.orderDetail
                                ?.dutyfreeDetail
                                ?.finalAmount
                                ?.amount
                                ?.toDouble() ??
                            0) >
                        0)
                      RichText(
                        // textAlign: TextAlign.center,
                        text: TextSpan(
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor),
                          children: [
                            TextSpan(
                              text: FlightUtils.getPriceFormatWithSymbol(
                                price: dutyFreeOrderState
                                        .dutyFreeCancelOrderDetailsResponseModel
                                        ?.orderDetail
                                        ?.dutyfreeDetail
                                        ?.finalAmount
                                        ?.amount
                                        ?.toDouble() ??
                                    0.0,
                              ),
                              style: ADTextStyle700.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                            TextSpan(
                              text:
                                  " ${'refund_to_payment_mode'.localize(context)}",
                            ),
                            // TextSpan(
                            //   text: ' 0 ',
                            //   style: ADTextStyle700.size14
                            //       .setTextColor(context.adColors.blackTextColor),
                            // ),
                            // TextSpan(
                            //   text:
                            //       'reward_point_credited_back'.localize(context),
                            // ),
                          ],
                        ),
                      ),
                    if ((dutyFreeOrderState
                                .dutyFreeCancelOrderDetailsResponseModel
                                ?.isLoyaltyApplied() ??
                            0) >
                        0)
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor),
                          children: [
                            TextSpan(
                              text: FlightUtils.getPriceFormatWithSymbol(
                                price: dutyFreeOrderState
                                        .dutyFreeCancelOrderDetailsResponseModel
                                        ?.isLoyaltyApplied() ??
                                    0,
                              ),
                              style: ADTextStyle700.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                            const TextSpan(
                              text: ' Reward Points will be credited back.',
                            ),
                            // TextSpan(
                            //   text: ' 0 ',
                            //   style: ADTextStyle700.size14
                            //       .setTextColor(context.adColors.blackTextColor),
                            // ),
                            // TextSpan(
                            //   text:
                            //       'reward_point_credited_back'.localize(context),
                            // ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ).paddingAllSide(context.k_20);
          },
        ),
      ),
    );
  }
}
