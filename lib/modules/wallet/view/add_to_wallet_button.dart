/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io' show Platform;

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AddToWalletButton extends StatelessWidget {
  const AddToWalletButton({
    Key? key,
    required this.onTapHandler,
  }) : super(key: key);

  final ADTapCallback onTapHandler;

  @override
  Widget build(BuildContext context) {
    const double textFontSize = 15;
    return Platform.isIOS
        ? Column(
            children: [
              InkWell(
                onTap: onTapHandler,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        size: context.k_18,
                        color: context.adColors.darkGreyTextColor,
                      ),
                      ADSizedBox(
                        width: context.k_12,
                      ),
                      Text(
                        'add_to_wallet'.localize(context),
                        style: ADTextStyle400.size14
                            .copyWith(fontSize: textFontSize)
                            .setTextColor(
                              context.adColors.greyTextColor,
                            ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        SvgAssets.arrowRight,
                        width: context.k_6,
                        height: context.k_12,
                        color: context.adColors.greyTextColor,
                      ),
                    ],
                  ).paddingBySide(
                    bottom: context.k_20,
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_20,
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              ),
            ],
          )
        : const ADSizedBox();
  }
}
