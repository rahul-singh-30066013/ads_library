/*
 * Copyright (c) 2022 .
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
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// This class will used to Create Apply Coupon Row.
///
const opacity = 1.0;
final size54= 54.sp;

class DutyFreeCreateApplyCoupon extends StatelessWidget {
  final String? leftHeader;


  const DutyFreeCreateApplyCoupon({
    Key? key,
    this.leftHeader,
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
        ).paddingBySide(bottom: context.k_20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  SvgAssets.icTag,
                ),
                SizedBox(
                  width: context.k_18,
                ),
                Text(
                  leftHeader ?? '',
                  style: ADTextStyle600.size18,
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
        ),
        Selector<AppSessionState, bool>(
          selector: (context, appSessionState) => appSessionState.isLoggedIn,
          builder: (BuildContext context, value, Widget? child) {
            return value
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'login'.localize(context),
                          style: ADTextStyle400.size16
                              .copyWith(decoration: TextDecoration.underline),
                          children: [
                            TextSpan(
                              text: '_to_see_best_coupons_for_you'
                                  .localize(context),
                              style: ADTextStyle400.size16
                                  .copyWith(decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ).paddingBySide(left: size54),
                    ],
                  ).paddingBySide(top: context.k_10);
          },
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: context.adColors.tileBorderColor,
        ).paddingBySide(top: context.k_20),
      ],
    );
  }
}
