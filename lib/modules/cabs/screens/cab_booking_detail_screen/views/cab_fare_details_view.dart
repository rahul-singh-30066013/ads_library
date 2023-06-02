/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/fare_details_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/cab_complete_fare_details_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double shakeOffset = 10;

class CabFareDetailsView extends StatelessWidget {
  final GlobalKey<ShakeWidgetState> shakeKey;
  final PriceInfo? priceInfo;
  final double? couponDiscount;
  final double? rewardPoints;
  final num? totalAmount;
  final bool detail;
  final bool showBottomDivider;

  const CabFareDetailsView({
    Key? key,
    required this.shakeKey,
    this.priceInfo,
    this.couponDiscount,
    this.rewardPoints,
    this.totalAmount,
    this.detail = true,
    this.showBottomDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double taxesFeeAmount = 0;
    for (final Tax tax in priceInfo?.taxes?.tax ?? []) {
      taxesFeeAmount += tax.amount?.toDouble() ?? 0.0;
    }

    final List<FareDetailsModel> fareList = [
      if (priceInfo?.basePrice != null)
        FareDetailsModel(
          titleText: 'base_fare'.localize(context),
          valueText: FlightUtils.getAmountWithTwoDecimalPoint(
            priceInfo?.basePrice?.toDouble() ?? 0.0,
          ),
          valueStyle: ADTextStyle400.size16
              .setTextColor(context.adColors.blackTextColor),
        ),
      if (taxesFeeAmount > 0)
        FareDetailsModel(
          titleText: 'taxes_and_fees'.localize(context),
          valueText: FlightUtils.getAmountWithTwoDecimalPoint(
            taxesFeeAmount,
          ),
          valueStyle: ADTextStyle400.size16
              .setTextColor(context.adColors.blackTextColor),
        ),
      if (couponDiscount != null && (couponDiscount ?? 0) > 0)
        FareDetailsModel(
          titleText: 'coupon_discount_'.localize(context),
          valueText: '-${FlightUtils.getAmountWithTwoDecimalPoint(
            couponDiscount ?? 0.0,
          )}',
          valueStyle: ADTextStyle400.size16
              .setTextColor(context.adColors.greenTextColor),
        ),
      if (rewardPoints != null && (rewardPoints ?? 0) > 0)
        FareDetailsModel(
          titleText: 'reward_points'.localize(context),
          valueText: '-${FlightUtils.getAmountWithTwoDecimalPoint(
            rewardPoints ?? 0.0,
          )}',
          valueStyle: ADTextStyle400.size16
              .setTextColor(context.adColors.greenTextColor),
        ),
      if (priceInfo?.extraCharges?.totalChargesAmount != null &&
          (priceInfo?.extraCharges?.totalChargesAmount ?? 0) > 0)
        FareDetailsModel(
          titleText: 'paid_to_driver'.localize(context),
          valueText: FlightUtils.getAmountWithTwoDecimalPoint(
            priceInfo?.extraCharges?.totalChargesAmount?.toDouble() ?? 0.0,
          ),
          valueStyle: ADTextStyle400.size16
              .setTextColor(context.adColors.blackTextColor),
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShakeWidget(
              key: shakeKey,
              shakeOffset: shakeOffset,
              shakeDuration: const Duration(milliseconds: 500),
              child: Text(
                'fare_summary'.localize(context),
                style: ADTextStyle700.size22
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ),
            if (detail)
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    context.adColors.lightGreyColor,
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () => {
                  adShowBottomSheet(
                    context: context,
                    childWidget: CabCompleteFareDetailsView(
                      priceInfo: priceInfo,
                      couponDiscount: couponDiscount,
                      rewardPoints: rewardPoints,
                      totalAmount: totalAmount,
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                    ),
                    headerTitle: 'fare_summary'.localize(context),
                  ),
                },
                child: Text(
                  'details'.localize(context),
                  style: ADTextStyle500.size16.copyWith(
                    decoration: TextDecoration.underline,
                    color: context.adColors.blackTextColor,
                  ),
                ),
              ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: fareList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ADRow(
              leftText: fareList[index].titleText,
              rightText: fareList[index].valueText,
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: fareList[index].valueStyle,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return ADSizedBox(
              height: context.k_14,
            );
          },
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Container(
          height: 1,
          color: context.adColors.dividerColor,
        ),
        ADRow(
          leftText: 'total_amount'.localize(context),
          rightText: FlightUtils.getAmountWithTwoDecimalPoint(
            double.parse('$totalAmount'),
          ),
          leftTextStyle: ADTextStyle700.size18
              .setTextColor(context.adColors.blackTextColor),
          rightTextStyle: ADTextStyle700.size18
              .setTextColor(context.adColors.blackTextColor),
        ).paddingBySide(top: context.k_20, bottom: context.k_20),
        if (showBottomDivider)
          Container(
            height: 1,
            color: context.adColors.dividerColor,
          ),
      ],
    );
  }
}
