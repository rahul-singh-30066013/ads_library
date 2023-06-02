/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AddToWalletButton extends StatelessWidget {
  const AddToWalletButton({Key? key, required this.onTapHandler})
      : super(key: key);
  final ADTapCallback onTapHandler;

  @override
  Widget build(BuildContext context) {
    final containerWidth = 143.sp;
    final containerHeight = 38.sp;
    return Align(
      child: ElevatedButton(
        onPressed: onTapHandler,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.adColors.blackColor,
          shape: const StadiumBorder(),
          maximumSize: Size(containerWidth, containerHeight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgAssets.addSavedFlights,
              height: context.k_18,
              width: context.k_18,
              color: context.adColors.whiteTextColor,
            ),
            ADSizedBox(width: context.k_6),
            Flexible(
              child: FittedBox(
                child: Text(
                  'add_to_wallet'.localize(context),
                  style: ADTextStyle600.size14
                      .setTextColor(context.adColors.whiteTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
