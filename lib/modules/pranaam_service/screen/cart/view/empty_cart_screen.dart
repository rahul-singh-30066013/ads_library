/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/utils/constant/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to show empty screen cart design.
final cartHeightImage = 50.sp;
final cartWidthImage = 78.sp;
final cartHeightBetweenImage = 19.sp;

class EmptyCartScreen extends StatelessWidget {
  final ADTapCallback? adTapCallback;
  final String? hyperLinkTitle;
  final double? heightBetweenCartAndErrorTitle;
  final double? heightBetweenErrorTitleAndErrorMsg;
  final String? cartImage;
  final String? cartErrorTitle;
  final String? cartErrorMessage;

  ///used this for dynamic height between home and call back of back to home button.
  const EmptyCartScreen({
    Key? key,
    this.cartImage,
    this.heightBetweenCartAndErrorTitle,
    this.heightBetweenErrorTitleAndErrorMsg,
    this.adTapCallback,
    this.hyperLinkTitle,
    this.cartErrorTitle,
    this.cartErrorMessage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              cartImage ?? SvgAssets.icTag,
              height: cartHeightImage,
              width: cartWidthImage,
            ),
            ADSizedBox(
              height: heightBetweenCartAndErrorTitle ?? context.k_20,
            ),
            Text(
              cartErrorTitle ?? 'seemsLikeCart'.localize(context),
              style: ADTextStyle700.size14
                  .setTextColor(context.adColors.filterBlackText),
              textAlign: TextAlign.center,
            ),
            ADSizedBox(
              height: heightBetweenErrorTitleAndErrorMsg ?? context.k_10,
            ),
            Text(
              cartErrorMessage ?? 'letsPickup'.localize(context),
              style: ADTextStyle400.size12
                  .setTextColor(context.adColors.greyTextColor),
              textAlign: TextAlign.center,
            ),
            ADSizedBox(
              height: heightBetweenCartAndErrorTitle ?? context.k_20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, shadowColor: context.adColors.whiteTextColor,
              ),
              child: Text(
                hyperLinkTitle ?? 'back_to_home'.localize(context),
                style: ADTextStyle500.size14
                    .setTextColor(context.adColors.filterBlackText)
                    .copyWith(decoration: TextDecoration.underline),
              ),
              onPressed: () => adTapCallback,
            ),
          ],
        ),
      ),
    );
  }
}
