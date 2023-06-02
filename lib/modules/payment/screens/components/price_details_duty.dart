/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_pre_order_price_info.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/payment/models/price_detail_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///Price details widget for payment screen
const Color separatorColor = Color(0xffe4e4e4);
double shakeOffset = 10;

@immutable
class PriceDetailsDuty extends StatelessWidget {
  final ADTapCallback? tapInfoIcon;

  const PriceDetailsDuty({
    Key? key,
    required this.priceDetailList,
    required this.totalAmount,
    required this.shakeKey,
    this.tapInfoIcon,
    this.reward = 0,
  }) : super(key: key);
  final List<PriceDetailModel> priceDetailList;
  final GlobalKey<ShakeWidgetState> shakeKey;

  final double totalAmount;
  final double reward;

  @override
  Widget build(BuildContext context) {
    final amount = reward > totalAmount
        ? totalAmount.ceilToDouble() - reward
        : totalAmount - reward;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShakeWidget(
          key: shakeKey,
          shakeOffset: shakeOffset,
          shakeDuration: const Duration(milliseconds: 500),
          child: Text(
            'priceDetails'.localize(context),
            style: ADTextStyle700.size18,
          ),
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ADRow(
            leftText: priceDetailList[index].key,
            rightText: priceDetailList[index].value.toString(),
            leftTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.greyTextColor),
            rightTextStyle: ADTextStyle500.size16
                .setTextColor(priceDetailList[index].color),
            showInfoIcon: priceDetailList[index].showInfoIcon,
            tapInfoIcon: () => adShowBottomSheet(
              childWidget: DutyFreePreOrderPriceInfo(
                preOrderDiscountBreakupList: context
                        .read<DutyFreeState>()
                        .dutyFreeCartResponse
                        ?.preOrderDiscountBreakup ??
                    [],
              ),
              context: context,
              headerTitle: 'pre_order_discount_breakup'.localize(context),
            ),
          ),
          separatorBuilder: (context, index) => ADSizedBox(
            height: context.k_16,
          ),
          itemCount: priceDetailList.length,
        ),
        if (reward > 0)
          ADSizedBox(
            height: context.k_16,
          ),
        if (reward > 0)
          ADRow(
            leftText: 'reward_points'.localize(context),
            rightText: '- ${FlightUtils.getAmountWithTwoDecimalPoint(
              double.parse(reward.toString()),
            )}',
            //' -₹$reward',
            leftTextStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.greyTextColor),
            rightTextStyle: ADTextStyle500.size16
                .setTextColor(context.adColors.greenTextColor),
          ),
        ADSizedBox(
          height: context.k_20,
        ),
        Container(
          height: 1,
          color: context.adColors.paleGrey,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: context.k_20),
          child: ADRow(
            leftText: 'totalAmount'.localize(context),
            rightText: FlightUtils.getAmountWithTwoDecimalPoint(
              amount < 1 ? 0 : amount,
            ),
            leftTextStyle: ADTextStyle600.size16,
            rightTextStyle: ADTextStyle700.size18,
          ),
        ),
        Container(
          height: 1,
          color: context.adColors.paleGrey,
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      top: context.k_30,
      right: context.k_16,
    );
  }
}
