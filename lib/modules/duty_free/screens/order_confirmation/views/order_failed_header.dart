/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/generate_content_row.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class OrderFailedHeader extends StatelessWidget {
  final CommonOrderDetailBaseResponse item;
  const OrderFailedHeader({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double positionBottom = 75;
    final double containerHeight = 145.sp;
    final double containerWidth = 232.sp;
    final double imageWidth = 110.sp;
    final double imageHeight = 110.sp;
    return Stack(
      children: [
        Container(
          height: containerHeight,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffdc464b),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: containerWidth,
              child: GenerateContentRow(
                titleText: 'order_failed'.localize(context),
                subTitleText:
                    "${'details_sent_via'.localize(context)} ${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? '${item.orderDetail?.dutyfreeDetail?.passengerDetail.first.countryDialCode}-' : ''}${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? item.orderDetail?.dutyfreeDetail?.passengerDetail.first.mobile : ''} ${'and_email_to'.localize(context)} ",
                mobile:
                    '${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? item.orderDetail?.dutyfreeDetail?.passengerDetail.first.emailId : ''}',
                color: context.adColors.whiteTextColor,
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_24,
          // top: context.k_16,
        ),
        Positioned(
          bottom: positionBottom,
          right: 0,
          child: Lottie.asset(
            'lib/assets/gif/lottie/booking_cancelled.json',
            width: imageWidth,
            height: imageHeight,
            repeat: false,
          ),
        ),
      ],
    );
  }
}
