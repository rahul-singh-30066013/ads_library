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

class OrderPendingHeader extends StatelessWidget {
  final CommonOrderDetailBaseResponse item;
  const OrderPendingHeader({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double positionBottom = 75;
    const double containerOpacity = 0.1000000014901161;
    final double containerHeight = 145.sp;
    final double containerWidth = 232.sp;
    final double imageWidth = 110.sp;
    final double imageHeight = 110.sp;
    return Stack(
      children: [
        Opacity(
          opacity: containerOpacity,
          child: Container(
            height: containerHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffeb9845),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: containerWidth,
              child: GenerateContentRow(
                titleText: 'booking_pending'.localize(context),
                subTitleText: 'status_pending_mobile_message'.localize(context),
                mobile:
                    '${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? '${item.orderDetail?.dutyfreeDetail?.passengerDetail.first.countryDialCode}-' : ''}${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? item.orderDetail?.dutyfreeDetail?.passengerDetail.first.mobile : ''}',
                color: context.adColors.blackTextColor,
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
            'lib/assets/gif/lottie/booking_partially_cancelled.json',
            width: imageWidth,
            height: imageHeight,
            repeat: false,
          ),
        ),
      ],
    );
  }
}
