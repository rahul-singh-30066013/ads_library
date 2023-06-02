/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabShowStatusView extends StatelessWidget {
  final bool isFromPayment;
  final CabBookingOrderStatus cabBookingOrderStatus;

  const CabShowStatusView({
    Key? key,
    required this.isFromPayment,
    required this.cabBookingOrderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double statusOpacity = 0.07;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'status'.localize(context),
              style: ADTextStyle400.size14.setTextColor(
                context.adColors.greyTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.k_8,
                vertical: context.k_4,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                color: (cabBookingOrderStatus ==
                            CabBookingOrderStatus.cancelled ||
                        cabBookingOrderStatus == CabBookingOrderStatus.failed)
                    ? const Color(0xffdc464b).withOpacity(
                        statusOpacity,
                      )
                    : cabBookingOrderStatus == CabBookingOrderStatus.pending
                        ? const Color(0xffeb9845).withOpacity(
                            statusOpacity,
                          )
                        : context.adColors.greenColor.withOpacity(
                            statusOpacity,
                          ),
              ),
              child: Text(
                cabBookingOrderStatus.name,
                style: ADTextStyle700.size12.setTextColor(
                  (cabBookingOrderStatus == CabBookingOrderStatus.cancelled ||
                          cabBookingOrderStatus == CabBookingOrderStatus.failed)
                      ? const Color(0xffdc464b)
                      : cabBookingOrderStatus == CabBookingOrderStatus.pending
                          ? const Color(0xffeb9845)
                          : context.adColors.greenColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ).paddingBySide(top: context.k_15),
        if (!isFromPayment &&
            cabBookingOrderStatus == CabBookingOrderStatus.pending)
          Text(
            'It_will_take_us_up_to_10_minutes_to_share_your_order_status.'
                .localize(context),
            style: ADTextStyle400.size14.setTextColor(
              context.adColors.greyTextColor,
            ),
          ).paddingBySide(top: context.k_13),
        Divider(
          color: context.adColors.tileBorderColor,
          height: 1.sp,
          thickness: 1.sp,
        ).paddingBySide(
          top: context.k_15,
        ),
      ],
    );
  }
}
