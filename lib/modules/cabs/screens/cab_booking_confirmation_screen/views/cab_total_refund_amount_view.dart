/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/important_information_bottom_sheet_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabTotalRefundAmountView extends StatelessWidget {
  const CabTotalRefundAmountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cabBookingConfirmationState =
        context.read<CabBookingConfirmationState>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.k_4),
        color: const Color(0xfff4f9ff),
      ),
      padding: EdgeInsets.only(
        top: context.k_20,
        bottom: context.k_20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.failed
                    ? 'refund_information'.localize(context)
                    : 'total_refund_amount'.localize(context),
                style: ADTextStyle700.size16.setTextColor(
                  context.adColors.black,
                ),
              ),
              const Spacer(),
              if (cabBookingConfirmationState.cabBookingOrderStatus !=
                  CabBookingOrderStatus.failed)
                Text(
                  FlightUtils.getAmountWithTwoDecimalPoint(
                    (cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.refundInfo?.totalRefund ??
                        0)
                        .toDouble(),
                  ),
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.black,
                  ),
                ),
            ],
          ).paddingBySide(
            left: context.k_20,
            right: context.k_20,
            bottom: cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.failed
                ? context.k_12
                : context.k_20,
          ),
          if (cabBookingConfirmationState.cabBookingOrderStatus ==
              CabBookingOrderStatus.failed)
            Text(
              'any_amount_deducted_will_be_refunded_to_your_payment_source'
                  .localize(context),
              style: ADTextStyle400.size12.setTextColor(
                context.adColors.blackTextColor,
              ),
            ).paddingBySide(
              left: context.k_20,
              right: context.k_20,
            ),
          if ((cabBookingConfirmationState
              .cabOrderDetailResponseModel?.refundInfo?.totalPaid ??
              0) >
              0)
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/cab_booking/amount_paid.svg',
                      color: context.adColors.greyTextColor,
                      width: context.k_16,
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Expanded(
                      child: Text(
                        'amount_paid'.localize(context),
                        style: ADTextStyle500.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      FlightUtils.getAmountWithTwoDecimalPoint(
                        (cabBookingConfirmationState.cabOrderDetailResponseModel
                            ?.refundInfo?.totalPaid ??
                            0)
                            .toDouble(),
                      ),
                      style: ADTextStyle500.size14.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ],
                ).paddingBySide(
                  left: context.k_20,
                  right: context.k_20,
                ),
                SizedBox(
                  height: context.k_10,
                ),
              ],
            ),
          if ((cabBookingConfirmationState.cabOrderDetailResponseModel
              ?.refundInfo?.cancelationCharges ??
              0) >
              0)
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/cab_booking/cancellation_charge.svg',
                      color: context.adColors.greyTextColor,
                      width: context.k_16,
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Expanded(
                      child: Text(
                        'cancellation_charge'.localize(context),
                        style: ADTextStyle500.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      '-${FlightUtils.getAmountWithTwoDecimalPoint(
                        (cabBookingConfirmationState.cabOrderDetailResponseModel
                            ?.refundInfo?.cancelationCharges ??
                            0)
                            .toDouble(),
                      )}',
                      style: ADTextStyle500.size14.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ],
                ).paddingBySide(
                  left: context.k_20,
                  right: context.k_20,
                ),
                SizedBox(
                  height: context.k_10,
                ),
              ],
            ),
          if (cabBookingConfirmationState.cabBookingOrderStatus !=
              CabBookingOrderStatus.failed)
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/cab_booking/card.svg',
                      color: context.adColors.greyTextColor,
                      width: context.k_16,
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Expanded(
                      child: Text(
                        'will_be_added_to_your_mode_of_payment'
                            .localize(context),
                        style: ADTextStyle500.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      FlightUtils.getAmountWithTwoDecimalPoint(
                        (cabBookingConfirmationState.cabOrderDetailResponseModel
                            ?.refundInfo?.bankRefund ??
                            0)
                            .toDouble(),
                      ),
                      style: ADTextStyle500.size14.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ],
                ).paddingBySide(
                  left: context.k_20,
                  right: context.k_20,
                ),
                SizedBox(
                  height: context.k_10,
                ),
              ],
            ),
          if ((cabBookingConfirmationState
              .cabOrderDetailResponseModel?.refundInfo?.loyaltyRefund ??
              0) >
              0)
            Column(
              children: [
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
                      child: Text(
                        'will_be_added_to_reward_points'.localize(context),
                        style: ADTextStyle500.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ).paddingBySide(top: context.k_4),
                    ),
                    SizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      FlightUtils.getAmountWithTwoDecimalPoint(
                        (cabBookingConfirmationState.cabOrderDetailResponseModel
                            ?.refundInfo?.loyaltyRefund ??
                            0)
                            .toDouble(),
                      ),
                      textAlign: TextAlign.right,
                      style: ADTextStyle500.size14.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ).paddingBySide(top: context.k_4),
                  ],
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_20,
                ),
                SizedBox(
                  height: context.k_10,
                ),
              ],
            ),
          if (cabBookingConfirmationState.cabBookingOrderStatus !=
              CabBookingOrderStatus.failed)
            RichText(
              text: TextSpan(
                text: '',
                style: ADTextStyle400.size14.setTextColor(
                  context.adColors.blackTextColor,
                ),
                children: [
                  TextSpan(
                    text: 'for_details_on_cancellation_charge_please_check_our'
                        .localize(context),
                    style: ADTextStyle400.size14.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                  TextSpan(
                    text: 'cab_cancellation_policy'.localize(context),
                    style: ADTextStyle400.size14
                        .setTextColor(
                      context.adColors.blackTextColor,
                    )
                        .copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        adShowBottomSheet(
                          context: context,
                          childWidget: ImportantInformationBottomSheetView(
                            carInfoDetail: cabBookingConfirmationState
                                .filteredVendorDataResponseModel
                                ?.result
                                ?.infoDetails,
                            initialIndex: 1,
                          ),
                          headerTitle:
                          'cab_cancellation_policy'.localize(context),
                        );
                      },
                  ),
                ],
              ),
            ).paddingBySide(
              left: context.k_20,
              right: context.k_20,
              top: context.k_10,
            ),
        ],
      ),
    );
  }
}
