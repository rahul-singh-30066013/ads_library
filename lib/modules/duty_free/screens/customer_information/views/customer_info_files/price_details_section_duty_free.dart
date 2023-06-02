/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/screens/components/header_dialog.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PriceDetailsSectionDutyFree extends StatefulWidget {
  const PriceDetailsSectionDutyFree({
    Key? key,
    this.totalPrice,
    this.discountPrice,
    this.preOrderDiscount,
    this.totalAmount,
    this.loyaltyPoint,
    this.couponDiscount,
    this.percentageDiscount,
    this.shakeKey,
    this.showInfoIcon,
    this.tapInfoIcon,
  }) : super(key: key);
  final double? totalPrice;
  final double? discountPrice;
  final double? preOrderDiscount;
  final double? totalAmount;
  final double? couponDiscount;
  final double? loyaltyPoint;
  final num? percentageDiscount;
  final bool? showInfoIcon;
  final ADTapCallback? tapInfoIcon;

  final GlobalKey<ShakeWidgetState>? shakeKey;

  @override
  _PriceDetailsSectionDutyFreeState createState() =>
      _PriceDetailsSectionDutyFreeState();
}

class _PriceDetailsSectionDutyFreeState
    extends State<PriceDetailsSectionDutyFree> {
  // static const Color paidWithCreditCardSectionColor = Color(0xfffbfbfb);

  final double shakeOffset = 10;

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeState>(
      builder: (BuildContext context, dutyFreeState, Widget? child) {
        // print('price33333 ${dutyFreeState.dutyFreeCartResponse}');
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ADSizedBox(
              height: context.k_14,
            ),
            ShakeWidget(
              shakeOffset: shakeOffset,
              shakeDuration: const Duration(milliseconds: 500),
              key: widget.shakeKey,
              child: const HeaderText(
                title: 'price_details',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'unit_price'.localize(context),
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                Text(
                  FlightUtils.getAmountWithTwoDecimalPoint(
                    widget.totalPrice ?? 0,
                  ),
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
              ],
            ).paddingBySide(
              top: context.k_16,
            ),
            if (_getDiscount() > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'discount_price'.localize(context),
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                  Text(
                    '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                      _getDiscount().toDouble(),
                    )}',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.greenTextColor,
                    ),
                  ),
                ],
              ).paddingBySide(
                top: context.k_16,
              ),
            if (_getPreorderDiscount() > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '${'pre_order_discount'.localize(context)} (${widget.percentageDiscount}%)',
                        style: ADTextStyle400.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      if (widget.showInfoIcon != null &&
                          widget.showInfoIcon == true)
                        GestureDetector(
                          onTap: widget.tapInfoIcon,
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            height: context.k_40,
                            width: context.k_40,
                            child: Center(
                              child: Icon(
                                Icons.info_outline,
                                size: context.k_20,
                                color: context.adColors.greyTextColor,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                      widget.preOrderDiscount?.toDouble() ?? 0,
                    )}',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.greenTextColor,
                    ),
                  ),
                ],
              ).paddingBySide(
                top: context.k_4,
              ),

            /// coupon discount
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'coupon_discount'.localize(context),
            //       style: ADTextStyle400.size16.setTextColor(
            //         context.adColors.blackTextColor,
            //       ),
            //     ),
            //     Text(
            //       '₹${dutyFreeState.dutyFreeCartResponse?.finalAmount?.amount.toDouble() ?? 0}',
            //       style: ADTextStyle400.size16.setTextColor(
            //         context.adColors.priceOffGreen,
            //       ),
            //     ),
            //   ],
            // ).paddingBySide(
            //   top: context.k_20,
            // ),

            if ((context
                        .read<DutyFreeOrderState>()
                        .dutyFreeCancelOrderDetailsResponseModel
                        ?.isLoyaltyApplied() ??
                    0) >
                0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'rewards_points_redeemed'.localize(context),
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                  Text(
                    '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                      context
                              .read<DutyFreeOrderState>()
                              .dutyFreeCancelOrderDetailsResponseModel
                              ?.isLoyaltyApplied() ??
                          0,
                    )}',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.greenTextColor,
                    ),
                  ),
                ],
              ).paddingBySide(
                top: context.k_20,
              ),
            if (_getCouponDiscount() > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'coupon_discount_'.localize(context),
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                  Text(
                    '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                      widget.couponDiscount?.toDouble() ?? 0,
                    )}',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.greenTextColor,
                    ),
                  ),
                ],
              ).paddingBySide(
                top: context.k_20,
              ),
            Divider(
              color: context.adColors.dividerColor,
            ).paddingBySide(
              top: context.k_16,
              bottom: context.k_16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'total_amount_paid'.localize(context),
                  style: ADTextStyle700.size18.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                // const HeaderText(title: ''),
                Text(
                  FlightUtils.getPriceFormatWithSymbol(
                    price: (widget.totalAmount?.toDouble() ?? 0) >= 1
                        ? widget.totalAmount?.toDouble() ?? 0
                        : 0,
                  ),
                  style: ADTextStyle700.size18.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
              ],
            ),

            Container(
              child: Divider(
                color: context.adColors.dividerColor,
              ).paddingBySide(
                top: context.k_16,
              ),
            ),

            /// reward section
            // Container(
            //   margin: EdgeInsets.only(top: context.k_16),
            //   color: paidWithCreditCardSectionColor,
            //   height: context.k_56,
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Icon(Icons.credit_card_outlined),
            //       SizedBox(
            //         width: context.k_14,
            //       ),
            //       Text(
            //         'paid_with_credit+reward'.localize(context),
            //         style: ADTextStyle400.size16.setTextColor(
            //           context.adColors.black,
            //         ),
            //       ),
            //       SizedBox(
            //         width: context.k_4,
            //       ),
            //       Text(
            //         '₹${context.k_28.toInt().toStringAsFixed(0)}',
            //         style: ADTextStyle400.size16.setTextColor(
            //           context.adColors.neutralInfoMsg,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }

  num _getDiscount() {
    return widget.discountPrice ?? 0;
  }

  num _getPreorderDiscount() {
    return widget.preOrderDiscount ?? 0;
  }

  // num _getLoyalityPoint() {
  //   return widget.loyaltyPoint ?? 0;
  // }

  num _getCouponDiscount() {
    return widget.couponDiscount ?? 0;
  }
}
