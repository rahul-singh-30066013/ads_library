/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_review_order_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ThankyouPickupDutyfreeView extends StatelessWidget {
  const ThankyouPickupDutyfreeView({Key? key, required this.item})
      : super(key: key);
  final CommonOrderDetailBaseResponse item;

  // static const flex2 = 1;
  // static const flex3 = 1;

  @override
  Widget build(BuildContext context) {
    final TextStyle? style1 = ADTextStyle400.size12.setTextColor(
      context.adColors.greyTextColor,
    );
    final TextStyle? style2 = ADTextStyle500.size16.setTextColor(
      context.adColors.blackTextColor,
    );
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomView(
              text1: 'store'.localize(context),
              text2: item.orderDetail?.dutyfreeDetail?.store ?? '',
              style1: style1,
              style2: style2,
            ),
            const ADSizedBox(
              width: 15,
            ),
            BottomView(
              text1: 'collectionPoint'.localize(context),
              text2: item.orderDetail?.dutyfreeDetail?.collectionPoint ?? '',
              style1: style1,
              style2: style2,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomView(
              text1: 'pickup_date'.localize(context),
              text2: item.orderDetail?.dutyfreeDetail?.passengerDetail.first
                      .pickupDate ??
                  '',
              style1: style1,
              style2: style2,
            ),
            const ADSizedBox(
              width: 15,
            ),
            BottomView(
              text1: 'pickup_time'.localize(context),
              // text2: item.orderDetail.passengerDetail.first.pickupTime,
              text2: (DateFormat('hh:mm a').format(
                DateFormat('HH:mm').parse(
                  item.orderDetail?.dutyfreeDetail?.passengerDetail.first
                          .pickupTime ??
                      '',
                ),
              )).replaceAll('AM', 'am').replaceAll('PM', 'pm'),
              style1: style1,
              style2: style2,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomView(
              text1: 'flight'.localize(context),
              text2: item.orderDetail?.dutyfreeDetail?.passengerDetail.first
                      .flightNo ??
                  '',
              style1: style1,
              style2: style2,
            ),
            const ADSizedBox(
              width: 15,
            ),
            BottomView(
              text1: 'order_id'.localize(context),
              text2: item.orderReferenceId ?? '',
              style1: style1,
              style2: style2,
            ),
          ],
        ),
      ],
    );
  }
}
