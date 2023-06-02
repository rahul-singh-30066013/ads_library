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
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/zero_cancellation_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/fare_details_sheet.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/tooltip_view/tooltip_screen.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double shakeOffset = 10;

/// [FareDetailView] is used to show the total amount including base fare and taxes.
class FareDetailView extends StatelessWidget {
  const FareDetailView({
    Key? key,
    this.pricedItineraryList,
    required this.paxInfoList,
    required this.reviewScreenType,
    this.shakeKeyReview,
    this.priceSummary,
    this.tripType,
    this.reward,
    this.totalAmount,
    this.insurance,
    this.zeroCancellationSummary,
  }) : super(key: key);

  final TripType? tripType;
  final List<PaxInfoList> paxInfoList;
  final List<PricedItinerary>? pricedItineraryList;
  final ReviewScreenType reviewScreenType;
  final GlobalKey<ShakeWidgetState>? shakeKeyReview;
  final PricingSummary? priceSummary;
  final double? totalAmount;
  final double? reward;
  final Insurance? insurance;
  final ZeroCancellationSummary? zeroCancellationSummary;

  /// this is use for get list of price summery of flight
  List<PricedItinerary> get _pricedList =>
      pricedItineraryList ?? [PricedItinerary()];

  @override
  Widget build(BuildContext context) {
    final double totalBaseFare = _getTotalBaseFare();
    final double totalTaxes = _getTotalTax();
    final double totalAmount = _getAmountPayable();
    final double discount = (priceSummary?.discount ?? 0).toDouble();
    final double discountedCCF =
        (priceSummary?.discountedCCFFee ?? 0).toDouble();

    /// this is use for convenienceFee
    final double convenienceFee = (priceSummary?.ccfFee ?? 0).toDouble();
    const lineHeight = 1.5;

    /// this is use for loyalty point
    final double loyaltyPoints =
        (reward ?? 0) > totalAmount ? totalAmount : reward ?? 0;

    /// Analytics update total_price and cart_price value
    Analytics.flightBookingGAObject?[Parameters.cart_amount.name] =
        totalAmount + discount;
    Analytics.flightBookingGAObject?[Parameters.total_price.name] =
        totalAmount + (loyaltyPoints > 0 ? loyaltyPoints : 0);

    return Padding(
      key: const Key(FlightAutomationKeys.fairDetailKey),
      padding: EdgeInsets.fromLTRB(
        context.k_16,
        0,
        context.k_14,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ADSizedBox(
            height: context.k_26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShakeWidget(
                shakeDuration: const Duration(milliseconds: 500),
                key: shakeKeyReview,
                shakeOffset: shakeOffset,
                child: Text(
                  'fare_summary'.localize(context),
                  style: ADTextStyle700.size22,
                ),
              ),
              if (reviewScreenType != ReviewScreenType.flightPayment)
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      context.adColors.lightGreyColor,
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () => tripType == TripType.oneWay
                      ? adShowBottomSheet(
                          context: context,
                          childWidget: FareDetailsSheet(
                            pricedItineraryList: pricedItineraryList,
                            paxInfoList: paxInfoList,
                            discountApplied:
                                (priceSummary?.discount ?? 0).toDouble(),
                            insurance: insurance,
                            zeroCancellationSummary: zeroCancellationSummary,
                          ),
                          isHeaderRequired: false,
                          headerTitle: '',
                        )
                      : showDraggableListBottomSheet(context: context),
                  child: Text(
                    'details'.localize(context),
                    style: ADTextStyle500.size16.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          ADRow(
            leftText: 'base_fare'.localize(context),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: totalBaseFare,
            ),
            leftTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
            rightTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
          ).paddingBySide(right: context.k_2),
          ADSizedBox(
            height: context.k_16,
          ),
          ADRow(
            leftText: 'taxes_and_fees'.localize(context),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: totalTaxes,
            ),
            leftTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
            rightTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
          ).paddingBySide(right: context.k_2),
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
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
            ).paddingBySide(right: context.k_2),
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
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
            ).paddingBySide(right: context.k_2),
          if (discount > 1)
            ADSizedBox(
              height: context.k_16,
            ),
          if (discount > 0)
            ADRow(
              leftText: 'coupon_discount'.localize(context),
              rightText: '-${FlightUtils.getPriceFormatWithSymbol(
                price: discount,
              )}',
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.greenTextColor),
            ).paddingBySide(right: context.k_2),
          if (loyaltyPoints > 0)
            ADSizedBox(
              height: context.k_16,
            ),
          if (loyaltyPoints > 0)
            ADRow(
              leftText: 'reward_points'.localize(context),
              rightText: '-${FlightUtils.getPriceFormatWithSymbol(
                price: loyaltyPoints.toDouble(),
              )}',
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: ADTextStyle500.size16.setTextColor(
                context.adColors.greenTextColor,
              ),
            ).paddingBySide(right: context.k_2),
          if (convenienceFee > 0)
            ADSizedBox(
              height: context.k_16,
            ),
          if (convenienceFee > 0)
            discountedCCF > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'convenienceFee'.localize(context),
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      SizedBox(
                        width: context.k_4,
                      ),
                      TooltipScreen(
                        richTextHeader:
                            '${'offer_allied_title'.localize(context)}\n',
                        richTextMessage:
                            '${'offer_allied_desc'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(
                          price: discountedCCF.toDouble(),
                        )}',
                        textStyleMessage: ADTextStyle400.size12.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                        textStyleHeader: ADTextStyle400.size12
                            .setTextColor(
                              context.adColors.blackTextColor,
                            )
                            .copyWith(
                              height: lineHeight,
                            ),
                        tooltipColor: context.adColors.whiteTextColor,
                        padding: -context.k_32,
                      ),
                      const Spacer(),
                      Text(
                        FlightUtils.getPriceFormatWithSymbol(
                          price: convenienceFee,
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
                          price: convenienceFee - discountedCCF,
                        ),
                        style: ADTextStyle500.size16,
                      ),
                    ],
                  ).paddingBySide(right: context.k_2)
                : ADRow(
                    leftText: 'convenienceFee'.localize(context),
                    rightText: FlightUtils.getPriceFormatWithSymbol(
                      price: convenienceFee,
                    ),
                    leftTextStyle: ADTextStyle400.size16
                        .setTextColor(context.adColors.blackTextColor),
                    rightTextStyle: ADTextStyle500.size16,
                  ).paddingBySide(right: context.k_2),
          ADSizedBox(
            height: context.k_8,
          ),
          Divider(
            thickness: 1.sp,
            height: context.k_40,
          ).paddingBySide(right: context.k_2),
          ADRow(
            leftText: 'totalAmount'.localize(context),
            rightText: FlightUtils.getPriceFormatWithSymbol(
              price: totalAmount - (loyaltyPoints > 0 ? loyaltyPoints : 0),
            ),
            leftTextStyle: ADTextStyle700.size18,
            rightTextStyle: ADTextStyle700.size18,
          ).paddingBySide(right: context.k_2),
          ADSizedBox(
            height: context.k_20,
          ),
          Divider(
            thickness: 1.sp,
            height: 1.sp,
          ).paddingBySide(right: context.k_2),
          if (reviewScreenType == ReviewScreenType.traveller)
            ADSizedBox(
              height: context.k_20,
            ),
          if (reviewScreenType != ReviewScreenType.flightPayment)
            Visibility(
              visible: false,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    context.adColors.lightGreyColor,
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () => adShowBottomSheet(
                  context: context,
                  childWidget: FareDetailsSheet(
                    pricedItineraryList: pricedItineraryList,
                    paxInfoList: paxInfoList,
                  ),
                  headerTitle: '',
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'view_fare_details'.localize(context),
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.black)
                          .copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.chevron_right,
                        color: context.adColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ).paddingBySide(right: context.k_2),
        ],
      ),
    );
  }

  Future<void> showDraggableListBottomSheet({
    required BuildContext context,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    context.k_22, //
                  ),
                ),
              ),
              child: FareDetailsSheet(
                pricedItineraryList: pricedItineraryList,
                paxInfoList: paxInfoList,
                discountApplied: (priceSummary?.discount ?? 0).toDouble(),
                scrollController: scrollController,
                insurance: insurance,
                zeroCancellationSummary: zeroCancellationSummary,
              ),
            );
          },
        ),
      );

  /// this is use for get total base fair of flight
  double _getTotalBaseFare() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalBaseFare?.amount ?? 0).toDouble();
    }
    return total;
  }

  /// this is use for get total tax of flight
  double _getTotalTax() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalTax?.amount ?? 0).toDouble();
    }
    return total;
  }

  /// this is use for get total fees of flight
  // double _getTotalFees() {
  //   double total = 0;
  //   for (final element in _pricedList) {
  //     total = total + (element.priceInfo.totalFee?.amount ?? 0).toDouble();
  //   }
  //   return total;
  // }

  /// this is use for get total payable of flight
  double _getAmountPayable() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalFare?.amount ?? 0).toDouble();
    }
    // if (insurance != null && (insurance?.netAmt ?? 0) > 0) {
    //   total = total + (insurance?.netAmt ?? 0);
    // }
    return total;
  }
}
