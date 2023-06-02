/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// This class will used to Create Apply Coupon Row.
///
const opacity = 0.3;
const containerWidth = 90;

/// this widget is used to show the applied coupon with the coupon amount.
class DutyFreeAppliedCoupon extends StatelessWidget {
  final String amount;
  final String couponCode;
  final ADTapCallback onTap;

  const DutyFreeAppliedCoupon({
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
        Divider(
          height: 1,
          thickness: 1,
          color: context.adColors.tileBorderColor,
        ).paddingBySide(bottom: context.k_10),
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
                                style: ADTextStyle700.size18,
                              ),
                            ),
                            Text(
                              'applied'.localize(context),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: ADTextStyle700.size18,
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
            Selector<DutyFreeState, bool?>(
              selector: (context, stateClass) =>
                  stateClass.isRemovedCouponClicked,
              builder: (BuildContext context, value, Widget? child) {
                return Container(
                  alignment: Alignment.centerRight,
                  width: containerWidth.sp,
                  height: context.k_30,
                  child: value == true
                      ? ADDotProgressView(
                          color: context.adColors.blackColor,
                          size: context.k_4,
                        )
                      : TextButton(
                          onPressed: onTap,
                          child: Text.rich(
                            TextSpan(
                              text: 'remove'.localize(context),
                              style: ADTextStyle400.size14.copyWith(
                                decoration: TextDecoration.underline,
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
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: context.adColors.tileBorderColor,
        ).paddingBySide(
          top: context.k_10,
        ),
      ],
    );
  }
}
