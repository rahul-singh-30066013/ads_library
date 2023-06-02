/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/fare_details_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double shakeOffset = 10;

class CabCompleteFareDetailsView extends StatelessWidget {
  final PriceInfo? priceInfo;
  final double? couponDiscount;
  final double? rewardPoints;
  final num? totalAmount;

  const CabCompleteFareDetailsView({
    Key? key,
    this.priceInfo,
    this.couponDiscount,
    this.rewardPoints,
    this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FareDetailsModel> taxesList = [
      FareDetailsModel(
        titleText: 'base_fare'.localize(context),
        valueText: FlightUtils.getAmountWithTwoDecimalPoint(
          priceInfo?.basePrice?.toDouble() ?? 0.0,
        ),
        valueStyle:
            ADTextStyle400.size16.setTextColor(context.adColors.blackTextColor),
      ),
    ];
    for (final Tax tax in priceInfo?.taxes?.tax ?? []) {
      taxesList.add(
        FareDetailsModel(
          titleText: (tax.taxCode ?? '').capitalize(),
          valueText: FlightUtils.getAmountWithTwoDecimalPoint(
            tax.amount?.toDouble() ?? 0.0,
          ),
          valueStyle: ADTextStyle400.size16
              .setTextColor(context.adColors.blackTextColor),
        ),
      );
    }

    final List<FareDetailsModel> fareList = [
      if (priceInfo?.totalAmount != null)
        FareDetailsModel(
          titleText: 'total_fare'.localize(context),
          valueText: FlightUtils.getAmountWithTwoDecimalPoint(
            double.parse('${priceInfo?.totalAmount}'),
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: taxesList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ADRow(
              leftText: taxesList[index].titleText,
              rightText: taxesList[index].valueText,
              leftTextStyle: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
              rightTextStyle: taxesList[index].valueStyle,
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
        Container(
          height: 1,
          color: context.adColors.dividerColor,
        ),
      ],
    );
  }
}
