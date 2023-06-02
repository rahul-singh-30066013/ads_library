/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class RefundAmountView extends StatelessWidget {
  const RefundAmountView({
    Key? key,
    this.bookingDetailsResponseModel,
    this.cancelled = false,
  }) : super(key: key);
  final CommonOrderDetailBaseResponse? bookingDetailsResponseModel;
  final bool cancelled;
  static const Color lightBlueColor = Color(0xfff4f9ff);

  /// Flex value for left view
  static int pranaamLeftView = 7;

  /// Flex value for right view
  static int pranaamRightView = 3;

  @override
  Widget build(BuildContext context) {
    final double cashRefundAmt =
        bookingDetailsResponseModel?.refundBreakup?.firstOrNull?.bank ?? 0;
    final double rewardsRefundAmt =
        bookingDetailsResponseModel?.refundBreakup?.firstOrNull?.loyalty ?? 0;
    final double? totalAmt = cashRefundAmt + rewardsRefundAmt;

    return cancelled &&
            (bookingDetailsResponseModel?.refundBreakup?.isNotEmpty ?? false) &&
            ((totalAmt ?? 0) > 0)
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.k_4),
              color: lightBlueColor,
            ),
            margin: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
              bottom: context.k_16,
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
                    ),
                    const Spacer(),
                    Text(
                      (bookingDetailsResponseModel?.refundBreakup?.isNotEmpty ??
                              false)
                          ? FlightUtils.getPriceFormatWithSymbol(
                              price: totalAmt ?? 0,
                            )
                          : FlightUtils.getPriceFormatWithSymbol(
                              price: 0,
                            ),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.black,
                      ),
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
                      width: context.k_8,
                    ),
                    Expanded(
                      flex: pranaamLeftView,
                      child: Text(
                        'refund_to_payment_source'.localize(context),
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: pranaamRightView,
                      child: Text(
                        (bookingDetailsResponseModel
                                    ?.refundBreakup?.isNotEmpty ??
                                false)
                            ? FlightUtils.getPriceFormatWithSymbol(
                                price: cashRefundAmt,
                              )
                            : FlightUtils.getPriceFormatWithSymbol(
                                price: 0,
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

                if (rewardsRefundAmt > 0)
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
                        flex: pranaamLeftView,
                        child: Text(
                          'will_be_added_to_reward_points'.localize(context),
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ).paddingBySide(top: context.k_4),
                      ),
                      Expanded(
                        flex: pranaamRightView,
                        child: Text(
                          FlightUtils.getAmountInThousandFormat(
                            price: rewardsRefundAmt,
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
              ],
            ),
          )
        : const ADSizedBox.shrink();
  }
}
