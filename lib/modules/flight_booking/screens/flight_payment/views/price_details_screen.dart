/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/insurance.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/zero_cancellation_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/fare_details_sheet.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/tooltip_view/tooltip_screen.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double shakeOffset = 10;
const opacity = 0.18;
const verticalOffset = 12.0;
const lineHeight = 1.5;
const blurRadius = 8.0;

/// this class is use for Price details
class PriceDetailsScreen extends StatelessWidget {
  /// this defines the base fair of the flight.
  final String baseFare;

  /// this defines the taxes application to the base fair.
  final String taxes;

  /// this defines the total amount.
  final String totalAmount;

  /// this defines the total amount.
  final String discountOnFare;

  /// this defines the loyalty amount.
  final double loyaltyPoints;

  /// this defines the convenience fee amount.
  final String convenienceFee;
  final GlobalKey<ShakeWidgetState> shakeKey;

  /// this defines the loyalty amount.
  final double discountedCCFFee;

  static const int toolTipTime = 10;

  final List<PaxInfoList> paxInfoList;
  final List<PricedItinerary>? pricedItineraryList;
  final Insurance? insurance;
  final ZeroCancellationSummary? zeroCancellationSummary;

  const PriceDetailsScreen({
    Key? key,
    required this.baseFare,
    required this.discountOnFare,
    required this.taxes,
    this.loyaltyPoints = 0,
    required this.convenienceFee,
    required this.totalAmount,
    required this.shakeKey,
    required this.pricedItineraryList,
    required this.paxInfoList,
    this.discountedCCFFee = 0,
    this.insurance,
    this.zeroCancellationSummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Analytics.flightBookingGAObject?[Parameters.cart_amount.name] =
        double.parse(baseFare) +
            double.parse(taxes) +
            (insurance?.netAmt ?? 0).toDouble() +
            double.parse(convenienceFee);
    Analytics.flightBookingGAObject?[Parameters.total_price.name] =
        double.parse(totalAmount) + loyaltyPoints;
    Analytics.flightBookingGAObject?[Parameters.convenience_fee.name] =
        double.parse(convenienceFee);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.k_16,
        context.k_26,
        0,
        0,
      ),
      child: Column(
        key: const Key(FlightAutomationKeys.fairDetailKey),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            label: '',
            child: Row(
              key: const Key(FlightAutomationKeys.adRowKey),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShakeWidget(
                  key: shakeKey,
                  shakeOffset: shakeOffset,
                  shakeDuration: const Duration(milliseconds: 500),
                  child: Text(
                    'fare_summary'.localize(context),
                    style: ADTextStyle700.size18,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      context.adColors.lightGreyColor,
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () => adShowFareDetailsBottomSheet(
                    context: context,
                    isHeaderRequired: false,
                    childWidget: FareDetailsSheet(
                      pricedItineraryList: pricedItineraryList,
                      paxInfoList: paxInfoList,
                      discountApplied: double.parse(discountOnFare),
                      rewardsApplied: loyaltyPoints,
                      discountedCCFFee: discountedCCFFee,
                      convenienceFee: double.parse(convenienceFee),
                      insurance: insurance,
                      zeroCancellationSummary: zeroCancellationSummary,
                      isCcfToShow: true,
                    ),
                    headerTitle: '',
                  ),
                  child: Text(
                    'details'.localize(context),
                    style: ADTextStyle500.size16.copyWith(
                      decoration: TextDecoration.underline,
                      color: context.adColors.neutralInfoMsg,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ).paddingBySide(right: context.k_10),
              ],
            ),
          ),
          ADSizedBox(
            height: context.k_14,
          ),
          ADRow(
            leftText: 'base_fare'.localize(context),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: double.parse(baseFare),
            ),
            leftTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.greyTextColor),
            rightTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.neutralInfoMsg),
          ).paddingBySide(right: context.k_16),
          if (double.parse(taxes) > 0)
            ADSizedBox(
              height: context.k_16,
            ),
          ADRow(
            leftText: 'taxes_and_fees'.localize(context),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: double.parse(taxes),
            ),
            leftTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.greyTextColor),
            rightTextStyle: ADTextStyle500.size16,
          ).paddingBySide(right: context.k_16),
          if (insurance?.insured ?? false)
            ADSizedBox(
              height: context.k_16,
            ),
          if (insurance?.insured ?? false)
            ADRow(
              leftText: 'travel_insurance'.localize(context),
              rightText: FlightUtils.getPriceFormatWithSymbol(
                price: (insurance?.netAmt ?? 0).toDouble(),
              ),
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.greyTextColor),
              rightTextStyle: ADTextStyle500.size16,
            ).paddingBySide(right: context.k_16),
          if (zeroCancellationSummary?.isActive ?? false)
            ADSizedBox(
              height: context.k_16,
            ),
          if (zeroCancellationSummary?.isActive ?? false)
            ADRow(
              leftText: 'zero_cancellation'.localize(context),
              rightText: FlightUtils.getPriceFormatWithSymbol(
                price: (zeroCancellationSummary?.netAmt ?? 0).toDouble(),
              ),
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.greyTextColor),
              rightTextStyle: ADTextStyle500.size16,
            ).paddingBySide(right: context.k_16),
          if (double.parse(discountOnFare) > 0)
            ADSizedBox(
              height: context.k_16,
            ),
          if (double.parse(discountOnFare) > 0)
            ADRow(
              leftText: 'coupon_discount'.localize(context),
              rightText: '-${FlightUtils.getPriceFormatWithSymbol(
                price: double.parse(discountOnFare),
              )}',
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.greyTextColor),
              rightTextStyle: ADTextStyle500.size16.setTextColor(
                context.adColors.greenTextColor,
              ),
            ).paddingBySide(right: context.k_16),
          if (loyaltyPoints > 0)
            ADSizedBox(
              height: context.k_16,
            ),
          if (loyaltyPoints > 0)
            ADRow(
              leftText: 'reward_points'.localize(context),
              rightText: '-${FlightUtils.getPriceFormatWithSymbol(
                price: loyaltyPoints.floor().toDouble(),
              )}',
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.greyTextColor),
              rightTextStyle: ADTextStyle500.size16.setTextColor(
                context.adColors.greenTextColor,
              ),
            ).paddingBySide(right: context.k_16),
          // if (double.parse(convenienceFee) > 0)
          ADSizedBox(
            height: context.k_16,
          ),
          // if (double.parse(convenienceFee) > 0)
          if (discountedCCFFee > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'convenienceFee'.localize(context),
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.greyTextColor),
                ),
                SizedBox(
                  width: context.k_4,
                ),
                TooltipScreen(
                  richTextHeader:
                      '${'convenience_fee_info'.localize(context)}\n',
                  richTextMessage:
                      '\n${'convenience_fee_non_refund_description'.localize(context)}\n',
                  textStyleMessage: ADTextStyle400.size14.setTextColor(
                    context.adColors.tileBorderColor,
                  ),
                  textStyleHeader: ADTextStyle600.size16
                      .setTextColor(
                        context.adColors.whiteTextColor,
                      )
                      .copyWith(
                        height: lineHeight,
                      ),
                  tooltipColor: context.adColors.blackColor,
                  padding: -context.k_2,
                  divider: true,
                  dividerTextMessage:
                      '${'offer_allied_desc'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(
                    price: discountedCCFFee.toDouble(),
                  )}',
                  dividerTextHeader: ADTextStyle400.size14.setTextColor(
                    context.adColors.tileBorderColor,
                  ),
                ),
                const Spacer(),
                Text(
                  FlightUtils.getPriceFormatWithSymbol(
                    price: double.parse(convenienceFee),
                  ),
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.greyTextColor)
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: context.k_2,
                ),
                Text(
                  FlightUtils.getPriceFormatWithSymbol(
                    price: double.parse(convenienceFee) - discountedCCFFee,
                  ),
                  style: ADTextStyle500.size16,
                ),
              ],
            ).paddingBySide(right: context.k_16)
          else
            Semantics(
              label: '',
              child: Row(
                key: const Key(FlightAutomationKeys.adRowKey),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'convenienceFee'.localize(context),
                    style: ADTextStyle400.size16
                        .setTextColor(context.adColors.greyTextColor),
                  ),
                  SizedBox(
                    width: context.k_4,
                  ),
                  TooltipScreen(
                    richTextHeader:
                        '${'convenience_fee_info'.localize(context)}\n',
                    richTextMessage:
                        '\n${'convenience_fee_non_refund_description'.localize(context)}',
                    textStyleMessage: ADTextStyle400.size14.setTextColor(
                      context.adColors.tileBorderColor,
                    ),
                    textStyleHeader: ADTextStyle600.size16
                        .setTextColor(
                          context.adColors.whiteTextColor,
                        )
                        .copyWith(
                          height: lineHeight,
                        ),
                    tooltipColor: context.adColors.blackColor,
                    padding: -context.k_2,
                  ),
                  const Spacer(),
                  Text(
                    FlightUtils.getPriceFormatWithSymbol(
                      price: double.parse(convenienceFee),
                    ),
                    style: ADTextStyle500.size16,
                  ), /*SizedBox(                  width: context.k_2,                ),                Text(                  FlightUtils.getPriceFormatWithSymbol(                    price:                    double.parse(convenienceFee) - discountedCCFFee,                  ),                  style: ADTextStyle500.size16,                ),*/
                ],
              ).paddingBySide(right: context.k_16),
            ),
          ADSizedBox(
            height: context.k_12,
          ),
          Container(
            height: 1,
            color: context.adColors.paleGrey,
          ).paddingBySide(
            top: context.k_10,
            bottom: context.k_20,
            right: context.k_16,
          ),
          ADRow(
            leftText: 'totalAmount'.localize(context),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price:
                  double.parse(totalAmount) < 1 ? 0 : double.parse(totalAmount),
            ),
            leftTextStyle: ADTextStyle600.size16
                .setTextColor(context.adColors.blackTextColor),
            rightTextStyle: ADTextStyle700.size18
                .setTextColor(context.adColors.blackTextColor),
          ).paddingBySide(right: context.k_16),
          Container(
            height: 1,
            color: context.adColors.paleGrey,
          ).paddingBySide(
            top: context.k_22,
            right: context.k_16,
          ),
        ],
      ),
    );
  }
}
