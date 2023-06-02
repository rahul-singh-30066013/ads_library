/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used to show reward balance
class RewardBalanceView extends StatelessWidget {
  final int balance;
  final int pending;
  final Color? boaderColor;
  final Color? textColor;
  final double? sidePadding;

  const RewardBalanceView({
    Key? key,
    required this.balance,
    this.textColor,
    required this.pending,
    this.boaderColor,
    this.sidePadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///local variables
    const double borderWidth = 1.5;

    ///TODO add to styles
    const _cardColor = Color(0xff5d399a);

    return ProfileSingleton.profileSingleton.isLoggedIn
        ? Container(
            padding: EdgeInsets.all(
              context.k_6,
            ),
            height: context.k_30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.k_16,
                ),
              ),
              border: Border.all(
                color: boaderColor ?? _cardColor,
                width: borderWidth,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgAssets.coinIcon,
                  height: context.k_16,
                  width: context.k_16,
                ).paddingBySide(
                  left: context.k_8,
                ),
                ADSizedBox(
                  width: context.k_6,
                ),
                Text(
                  balance.toString(),
                  style: ADTextStyle500.size14.setTextColor(
                    textColor ?? context.adColors.whiteTextColor,
                  ),
                  textAlign: TextAlign.center,
                ).paddingBySide(
                  right: context.k_8,
                ),
              ],
            ),
          ).paddingAllSide(
            sidePadding ?? context.k_10,
          )
        : const ADSizedBox.shrink();
  }
}
