/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/refund_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/tooltip_shape_border.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const verticalOffset = 12.0;
const lineHeight = 1.5;
const blurRadius = 8.0;

/// this class is use to show refund breakup amount
class OnCancelRefundBreakUp extends StatelessWidget {
  final RefundBreakup refundBreakup;
  final String paymentModeText;
  final bool? isZeroCancellation;
  final bool? isInfantCancelOnly;

  const OnCancelRefundBreakUp({
    Key? key,
    required this.refundBreakup,
    required this.paymentModeText,
    this.isZeroCancellation,
    this.isInfantCancelOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final double promoCouponValue = refundBreakup.refundDetails?.promo ?? 0;
    final bool isZeroCancellationTooltipEnabled =
        (isZeroCancellation ?? false) && !(isInfantCancelOnly ?? false);
    final double partnerFeeValue = refundBreakup.partnerFee ?? 0;
    final double travelInsuranceValue = refundBreakup.insuranceAmt ?? 0;
    final double zeroCancellationValue = refundBreakup.zeroCancellationFee ?? 0;
    final double loyaltyValuePaid = refundBreakup.paymentDetails?.loyalty ?? 0;
    final double couponValuePaid = refundBreakup.paymentDetails?.promo ?? 0;
    final double loyaltyValue = refundBreakup.refundDetails?.loyalty ?? 0;
    final double amountPaidValue =
        refundBreakup.totalPaid >= 1 ? refundBreakup.totalPaid : 0;
    final num totalAmount = refundBreakup.grossAmount ?? 0;
    final num totalDeduction = (refundBreakup.airlineCharge ?? 0) +
        (refundBreakup.partnerFee ?? 0) +
        (refundBreakup.convenienceFe ?? 0) +
        (refundBreakup.insuranceAmt ?? 0) +
        (refundBreakup.zeroCancellationFee ?? 0);

    return Column(
      children: [
        Divider(
          thickness: 1,
          color: context.adColors.tileBorderColor,
        ),
        SizedBox(
          height: context.k_10,
        ),

        Semantics(
          label: '',
          container: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'amount_paid'.localize(context),
                    style: ADTextStyle700.size18.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                  if (amountPaidValue > 0)
                    Tooltip(
                      verticalOffset: verticalOffset,
                      triggerMode: TooltipTriggerMode.tap,
                      preferBelow: true,
                      richMessage: TextSpan(
                        text: paymentModeText.isNotEmpty
                            ? '$paymentModeText       ${FlightUtils.getPriceFormatWithSymbol(
                                price: amountPaidValue,
                              )}\n'
                            : '${'amount_paid'.localize(context)}       ${FlightUtils.getPriceFormatWithSymbol(
                                price: amountPaidValue,
                              )}'
                                '\n',
                        style: ADTextStyle400.size14
                            .setTextColor(
                              context.adColors.whiteTextColor,
                            )
                            .copyWith(
                              height: lineHeight,
                            ),
                      ),
                      decoration: ShapeDecoration(
                        shape: const TooltipShapeBorder(
                          arrowArc: 0.2,
                          arrowHeight: 12,
                          radius: 4,
                          showBottomArrow: false,
                          showTopArrow: true,
                        ),
                        color: context.adColors.blackTextColor,
                        /*shadows: [
                          BoxShadow(
                            color: context.adColors.transparentColor,
                            blurRadius: blurRadius,
                          ),
                        ],*/
                      ),
                      margin: EdgeInsets.only(
                        top: context.k_10,
                      ),
                      padding: EdgeInsets.only(
                        left: context.k_20,
                        right: context.k_20,
                        top: context.k_10,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(context.k_6),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
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
                FlightUtils.getPriceFormatWithSymbol(
                  price: amountPaidValue,
                ),
                style: ADTextStyle700.size18.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ),
            ],
          ).paddingBySide(
            bottom: amountPaidValue > 0 ? 0 : context.k_8,
          ),
        ),
        if (totalAmount > 0)
          ADRow(
            leftText: 'total_fare'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            /* rightText: FlightUtils.getPriceFormatWithSymbol(
                        price: netAmount,
                      ),*/ //as discussed with amrendra using total amount
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: totalAmount.toDouble(),
            ),
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if (travelInsuranceValue > 0)
          ADRow(
            leftText: 'travel_insurance'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: travelInsuranceValue,
            ),
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if ((isZeroCancellation ?? false) && !(isInfantCancelOnly ?? false))
          ADRow(
            leftText: 'zero_cancellation'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: zeroCancellationValue,
            ),
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            // toolTipEnable: true,
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if (couponValuePaid > 0)
          ADRow(
            leftText: 'coupon_discount_'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: '-${FlightUtils.getPriceFormatWithSymbol(
              price: couponValuePaid,
            )}',
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.priceOffGreen,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if (loyaltyValuePaid > 0)
          ADRow(
            leftText: 'reward_points'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: '-${FlightUtils.getPriceFormatWithSymbol(
              price: loyaltyValuePaid.toDouble(),
            )}',
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.priceOffGreen,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if ((refundBreakup.convenienceFe ?? 0) > 0)
          ADRow(
            leftText: 'convenience_fee'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: refundBreakup.convenienceFe ?? 0,
            ),
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        SizedBox(
          height: context.k_10,
        ),
        Divider(
          thickness: 1,
          color: context.adColors.tileBorderColor,
        ),
        SizedBox(
          height: context.k_10,
        ),
        ADRow(
          leftText: 'total_deduction'.localize(context),
          leftTextStyle: ADTextStyle700.size18.setTextColor(
            context.adColors.blackTextColor,
          ),
          rightText: '-${FlightUtils.getPriceFormatWithSymbol(
            price: totalDeduction.toDouble(),
          )}',
          rightTextStyle: ADTextStyle700.size18.setTextColor(
            context.adColors.blackTextColor,
          ),
        ).paddingBySide(
          bottom: context.k_8,
        ),
        // if ((refundBreakup.airlineCharge ?? 0) > 0)
        ADRow(
          leftText: 'airline_cancellation_fee'.localize(context),
          leftTextStyle: ADTextStyle400.size16.setTextColor(
            context.adColors.blackTextColor,
          ),
          rightText: '-${FlightUtils.getPriceFormatWithSymbol(
            price: refundBreakup.airlineCharge ?? 0,
          )}',
          rightTextStyle: ADTextStyle400.size16.setTextColor(
            context.adColors.blackTextColor,
          ),
          toolTipEnable: isZeroCancellationTooltipEnabled,
        ).paddingBySide(
          bottom: context.k_8,
        ),

        /// this is use for platform fee
        // if (partnerFeeValue > 0)
        ADRow(
          leftText: 'clear_trip_fee'.localize(context),
          leftTextStyle: ADTextStyle400.size16.setTextColor(
            context.adColors.blackTextColor,
          ),
          rightText: '-${FlightUtils.getPriceFormatWithSymbol(
            price: partnerFeeValue,
          )}',
          rightTextStyle: ADTextStyle400.size16.setTextColor(
            context.adColors.blackTextColor,
          ),
        ).paddingBySide(
          bottom: context.k_8,
        ),
        if ((refundBreakup.convenienceFe ?? 0) > 0)
          ADRow(
            leftText: 'convenience_fee'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: '-${FlightUtils.getPriceFormatWithSymbol(
              price: refundBreakup.convenienceFe ?? 0,
            )}',
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if (travelInsuranceValue > 0)
          ADRow(
            leftText: 'travel_insurance'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: '-${FlightUtils.getPriceFormatWithSymbol(
              price: travelInsuranceValue,
            )}',
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if ((isZeroCancellation ?? false) && !(isInfantCancelOnly ?? false))
          ADRow(
            leftText: 'zero_cancellation'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: '-${FlightUtils.getPriceFormatWithSymbol(
              price: zeroCancellationValue,
            )}',
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
        if (loyaltyValue > 0)
          ADRow(
            leftText: 'reward_credited'.localize(context),
            leftTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: loyaltyValue.floorToDouble(),
            ),
            rightTextStyle: ADTextStyle400.size16.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_8,
          ),
      ],
    ).paddingBySide(
      left: context.k_14,
      right: context.k_14,
    );
  }
}
