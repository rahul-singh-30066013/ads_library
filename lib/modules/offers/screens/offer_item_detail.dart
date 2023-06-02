/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const Color greyBrown = Color(0xFF555555);
const double widthPercent = 0.65;

class OfferItemDetail extends StatelessWidget {
  const OfferItemDetail({
    Key? key,
    required this.item,
    required this.headerValue,
    required this.image,
    this.isCouponView = false,
  }) : super(key: key);
  final String item;
  final String headerValue;
  final String image;
  final bool isCouponView;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => {
        if (isCouponView)
          {
            HapticFeedback.vibrate(),
            Clipboard.setData(
              ClipboardData(text: item),
            ).then((_) {
              SnackBarUtil.showSnackBar(
                context,
                'Coupon Code Saved to Clipboard',
              );
            }),
          },
      },
      child: ListTile(
        selectedColor: greyBrown,
        visualDensity: const VisualDensity(vertical: -4),
        dense: true,
        leading: SvgPicture.asset(
          image,
          color: greyBrown,
        ),
        title: Text(
          headerValue,
          style: ADTextStyle400.size12
              .setTextColor(context.adColors.greyTextColor),
          maxLines: 1,
        ),
        subtitle: Row(
          children: [
            if (isCouponView)
              Row(
                children: [
                  Text(
                    item,
                    style: ADTextStyle600.size16.setTextColor(
                      item == 'Expired'
                          ? context.adColors.red900
                          : context.adColors.black,
                    ),
                    maxLines: context.k_2.toInt(),
                  ),
                  SvgPicture.asset(
                    SvgAssets.copyCode,
                    width: context.k_14,
                    height: context.k_14,
                    color: greyBrown,
                  ).paddingBySide(left: context.k_6, bottom: context.k_2),
                ],
              )
            else
              Container(
                width: context.widthOfScreen * widthPercent,
                child: Text(
                  item,
                  style: ADTextStyle600.size16.setTextColor(
                    item == 'Expired'
                        ? context.adColors.red900
                        : context.adColors.black,
                  ),
                  maxLines: context.k_2.toInt(),
                ),
              ),
          ],
        ).paddingBySide(top: context.k_6),
      ).paddingBySide(top: context.k_16),
    );
  }
}
