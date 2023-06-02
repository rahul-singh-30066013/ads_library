/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This class will used to Create Apply Coupon Row.
///
const opacity = 1.0;

class CabBookingApplyCoupon extends StatelessWidget {
  final String? leftHeader;

  const CabBookingApplyCoupon({
    Key? key,
    this.leftHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  SvgAssets.icTag,
                  color: context.adColors.darkGreyTextColor,
                ),
                SizedBox(
                  width: context.k_18,
                ),
                Text(
                  leftHeader ?? '',
                  style: ADTextStyle600.size18
                      .setTextColor(context.adColors.blackTextColor),
                ),
              ],
            ),
            Selector<AppSessionState, bool>(
              selector: (context, appSessionState) =>
                  appSessionState.isLoggedIn,
              builder: (BuildContext context, value, Widget? child) {
                return value
                    ? Opacity(
                        opacity: opacity,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: context.adColors.blackTextColor,
                          size: context.k_16,
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_20,
        ),
        Selector<AppSessionState, bool>(
          selector: (context, appSessionState) => appSessionState.isLoggedIn,
          builder: (BuildContext context, value, Widget? child) {
            return value
                ? ADSizedBox(
                    height: context.k_20,
                  )
                : Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'login'.localize(context),
                          style: ADTextStyle400.size16.copyWith(
                            decoration: TextDecoration.underline,
                            color: context.adColors.blackTextColor,
                          ),
                          children: [
                            TextSpan(
                              text: '_to_see_best_coupons_for_you'
                                  .localize(context),
                              style: ADTextStyle400.size16.copyWith(
                                decoration: TextDecoration.none,
                                color: context.adColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                      ).paddingBySide(left: context.k_34),
                    ],
                  ).paddingBySide(
                    bottom: context.k_10,
                    left: context.k_20,
                    top: context.k_6,
                  );
          },
        ),
      ],
    );
  }
}
