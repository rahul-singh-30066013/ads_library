/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/pre_order_discount_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class DutyFreePreOrderPriceInfo extends StatelessWidget {
  final List<PreOrderDiscountBreakup>  preOrderDiscountBreakupList;

  const DutyFreePreOrderPriceInfo({
     required this.preOrderDiscountBreakupList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: preOrderDiscountBreakupList.length,
        itemBuilder: (context, index) {
          return index < preOrderDiscountBreakupList.length - 1
              ? Container(
                  height: context.k_34,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          preOrderDiscountBreakupList[index].material,
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ),
                      Text(
                        FlightUtils.getAmountWithTwoDecimalPoint(
                          preOrderDiscountBreakupList[index].amount,
                        ),
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                    ],
                  ),
                ).paddingBySide(left: context.k_16, right: context.k_16)
              : Column(
                  children: [
                    const Divider(
                      height: 1,
                    ).paddingBySide(top: context.k_20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            preOrderDiscountBreakupList[index].material,
                            style: ADTextStyle500.size20
                                .setTextColor(context.adColors.blackTextColor),
                          ),
                        ),
                        Text(
                          FlightUtils.getAmountWithTwoDecimalPoint(
                            preOrderDiscountBreakupList[index].amount,
                          ),
                          style: ADTextStyle600.size20
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ],
                    ).paddingBySide(
                      top: context.k_24,
                      bottom: context.k_24,
                    ),
                    const Divider(
                      height: 1,
                    ),
                  ],
                ).paddingBySide(left: context.k_16, right: context.k_16);
        },
      ),
    );
  }
}
