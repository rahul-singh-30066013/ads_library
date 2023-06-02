/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_detail_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class will used to Create Apply Coupon Row.
///
const opacity = 0.3;
const containerWidth = 90;

/// this widget is used to show the applied coupon with the coupon amount.
class CabBookingAppliedCoupon extends StatelessWidget {
  final String amount;
  final String couponCode;
  final ADTapCallback onTap;

  const CabBookingAppliedCoupon({
    Key? key,
    required this.amount,
    required this.couponCode,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    SvgAssets.icTag,
                    color: context.adColors.darkGreyTextColor,
                  ),
                  SizedBox(
                    width: context.k_18,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "'$couponCode'",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: ADTextStyle700.size18.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                            ),
                            Text(
                              'applied'.localize(context),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: ADTextStyle700.size18.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${"you_saved".localize(context)} $amount',
                          style: ADTextStyle500.size14.copyWith(
                            color: context.adColors.greenTextColor,
                          ),
                        ).paddingBySide(top: context.k_6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Selector<CabBookingDetailState, bool?>(
              selector: (context, stateClass) =>
                  stateClass.isRemovedCouponClicked,
              builder: (BuildContext context, value, Widget? child) {
                return Container(
                  alignment: Alignment.centerRight,
                  width: containerWidth.sp,
                  height: context.k_30,
                  child: value == true
                      ? ADDotProgressView(
                          color: context.adColors.blackTextColor,
                          size: context.k_4,
                        )
                      : TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                              context.adColors.lightGreyColor,
                            ),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: onTap,
                          child: Text.rich(
                            TextSpan(
                              text: 'remove'.localize(context),
                              style: ADTextStyle400.size14.copyWith(
                                decoration: TextDecoration.underline,
                                color: context.adColors.blackTextColor,
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_10,
          top: context.k_10,
        ),
      ],
    );
  }
}
