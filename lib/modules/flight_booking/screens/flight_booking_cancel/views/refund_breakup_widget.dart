/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_refund_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/flight_fare_info_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/refund_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/views/on_cancel_refund_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// this class is use for refund amount
class RefundBreakUpWidget extends StatelessWidget {
  final RefundBreakup refundBreakup;
  final String paymentModeText;
  final FlightFareInfoResponseModel? flightFareInfoResponseModel;

  const RefundBreakUpWidget({
    required this.refundBreakup,
    required this.paymentModeText,
    this.flightFareInfoResponseModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthOfScreen,
      decoration: BoxDecoration(
        color: DutyFreeRefundScreen.lightBlueColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            context.k_4,
          ),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: Column(
          children: [
            ListTileTheme(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              horizontalTitleGap: 0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                title: ADRow(
                  leftText: 'refund_amount'.localize(context),
                  leftTextStyle: ADTextStyle700.size18.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  rightText: FlightUtils.getPriceFormatWithSymbol(
                    price: refundBreakup.refundDetails?.bank ?? 0,
                  ),
                  rightTextStyle: ADTextStyle700.size18.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                iconColor: context.adColors.blackTextColor,
                collapsedIconColor: context.adColors.blackTextColor,
                children: [
                  OnCancelRefundBreakUp(
                    refundBreakup: refundBreakup,
                    paymentModeText: paymentModeText,
                    isZeroCancellation:
                        flightFareInfoResponseModel?.isZeroCancellation,
                    isInfantCancelOnly:
                        flightFareInfoResponseModel?.isInfantCancelOnly,
                  ).paddingBySide(
                    left: context.k_6,
                    right: context.k_6,
                  ),
                ],
              ).paddingBySide(left: context.k_14, right: context.k_14),
            ),
            Column(
              children: [
                Divider(
                  thickness: 1,
                  height: context.k_2,
                  color: context.adColors.tileBorderColor,
                ).paddingBySide(
                  top: context.k_12,
                  bottom: context.k_16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              style: ADTextStyle700.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                              text: '${FlightUtils.getPriceFormatWithSymbol(
                                price: refundBreakup.refundDetails?.bank ?? 0,
                              )} ',
                            ),
                            TextSpan(
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                              text: 'will_be_refunded_to_your_mode_of_payment'
                                  .localize(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).paddingBySide(top: context.k_2, bottom: context.k_12),
                if ((refundBreakup.refundDetails?.loyalty ?? 0) > 0)
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: ADTextStyle700.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                                text:
                                    '${FlightUtils.getFloorAmountInThousandFormat(price: refundBreakup.refundDetails?.loyalty ?? 0)} ',
                              ),
                              TextSpan(
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                                text: 'reward_points_will_be_credited_back'
                                    .localize(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).paddingBySide(bottom: context.k_12),
                Text(
                  'refund_fare_segment_content'.localize(context),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.blackTextColor),
                ).paddingBySide(
                  bottom: context.k_20,
                ),
                if ((flightFareInfoResponseModel?.isZeroCancellation ??
                        false) &&
                    !(flightFareInfoResponseModel?.isInfantCancelOnly ?? false))
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'zero_cancellation'.localize(context),
                            style: ADTextStyle700.size16
                                .setTextColor(context.adColors.black),
                          ).paddingBySide(
                            right: context.k_4,
                          ),
                          SvgPicture.asset(
                            SvgAssets.zeroCancellationIcon,
                            height: context.k_20,
                            width: context.k_22,
                          ),
                        ],
                      ),
                      Text(
                        'adani_one_will_process_refund'.localize(context),
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                      ).paddingBySide(
                        right: context.k_4,
                        bottom: context.k_20,
                        top: context.k_10,
                      ),
                    ],
                  ),
              ],
            ).paddingBySide(
              left: context.k_14,
              right: context.k_14,
            ),
          ],
        ),
      ),
    );
  }
}
