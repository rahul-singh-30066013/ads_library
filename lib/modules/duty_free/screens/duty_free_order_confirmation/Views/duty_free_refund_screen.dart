/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// Refund section for duty free cancellation page
class DutyFreeRefundScreen extends StatelessWidget {
  const DutyFreeRefundScreen({Key? key}) : super(key: key);

  /// TODO add to Styleguide
  static const Color lightBlueColor = Color(0xfff4f9ff);

  /// Flex value for left view
  static int dutyFreeLeftView = 7;

  /// Flex value for right view
  static int dutyFreeRightView = 3;
  static double padding52 = 52.sp;

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeOrderState>(
      builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.k_4),
            color: lightBlueColor,
          ),
          margin: EdgeInsets.only(
            left: context.k_16,
            right: context.k_16,
            bottom: padding52,
          ),
          padding: EdgeInsets.only(
            top: context.k_20,
            // left: context.k_20,
            // right: context.k_20,
            bottom: context.k_20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'total_refund_amount'.localize(context),
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.black,
                    ),
                  ).paddingBySide(
                    top: context.k_8,
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
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.black,
                    ),
                  ).paddingBySide(
                    top: context.k_8,
                  ),
                ],
              ).paddingBySide(
                right: context.k_20,
                left: context.k_20,
                bottom: context.k_20,
              ),
              //actual amount

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: context.k_16,
                  ),
                  SizedBox(
                    width: context.k_10,
                  ),
                  Expanded(
                    flex: dutyFreeLeftView,
                    child: Text(
                      'refund_to_payment_source'.localize(context),
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: dutyFreeRightView,
                    child: Text(
                      FlightUtils.getPriceFormatWithSymbol(
                        price: dutyFreeOrderState
                                .dutyFreeCancelOrderDetailsResponseModel
                                ?.orderDetail
                                ?.dutyfreeDetail
                                ?.finalAmount
                                ?.amount
                                ?.toDouble() ??
                            0,
                      ),
                      textAlign: TextAlign.right,
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ),
                ],
              ).paddingBySide(
                right: context.k_20,
                left: context.k_20,
              ),

              //reward points

              if ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
                          ?.isLoyaltyApplied() ??
                      0) >
                  0)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Lottie.asset(
                      'lib/assets/images/loyalty/reward_point.json',
                      width: context.k_24,
                      height: context.k_24,
                    ),
                    SizedBox(
                      width: context.k_4,
                    ),
                    Expanded(
                      flex: dutyFreeLeftView,
                      child: Text(
                        'will_be_added_to_reward_points'.localize(context),
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ).paddingBySide(top: context.k_4),
                    ),
                    Expanded(
                      flex: dutyFreeRightView,
                      child: Text(
                        FlightUtils.getPriceFormatWithSymbol(
                          price: dutyFreeOrderState
                                  .dutyFreeCancelOrderDetailsResponseModel
                                  ?.isLoyaltyApplied() ??
                              0,
                        ),
                        textAlign: TextAlign.right,
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ).paddingBySide(top: context.k_4),
                    ),
                  ],
                ).paddingBySide(
                  right: context.k_20,
                  left: context.k_16,
                  top: context.k_6,
                ),
              // if ((dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel
              //             ?.loyaltyPoint?.burnedRewardPoints ??
              //         0) >
              //     0)
              //   Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SvgPicture.asset(
              //         SvgAssets.coinIcon,
              //         height: context.k_16,
              //         width: context.k_16,
              //       ),
              //       SizedBox(
              //         width: context.k_10,
              //       ),
              //       Expanded(
              //         flex: dutyFreeLeftView,
              //         child: Text(
              //           'reward_points_refund'.localize(context),
              //           style: ADTextStyle400.size14.copyWith(
              //             color: context.adColors.blackTextColor,
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         flex: dutyFreeRightView,
              //         child: Text(
              //           (dutyFreeOrderState
              //                       .dutyFreeCancelOrderDetailsResponseModel
              //                       ?.loyaltyPoint
              //                       ?.burnedRewardPoints ??
              //                   0)
              //               .toString(),
              //           textAlign: TextAlign.right,
              //           style: ADTextStyle400.size12.setTextColor(
              //             context.adColors.blackTextColor,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ).paddingBySide(
              //     right: context.k_20,
              //     left: context.k_20,
              //     top: context.k_6,
              //   ),
            ],
          ),
        );
      },
    );
  }
}
