/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io' show Platform;

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AddToAppleWalletWidget extends StatelessWidget {
  AddToAppleWalletWidget({
    Key? key,
    this.containerAlignment,
    this.bottomPadding,
    this.topPadding,
    required this.id,
  }) : super(key: key);

  final containerWidth = 140.sp;
  final containerHeight = 38.sp;
  final String id;
  final AlignmentGeometry? containerAlignment;

  final double? bottomPadding;

  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Align(
            alignment: containerAlignment ?? Alignment.center,
            child: ElevatedButton(
              onPressed: () => {
                HapticFeedback.mediumImpact(),
                Utils.openWallet(
                  id,
                  context,
                ),
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.blackTextColor,
                ),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(
                    containerWidth,
                    containerHeight,
                  ),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline_rounded, size: context.k_18),
                  ADSizedBox(width: context.k_6),
                  Text(
                    'add_to_wallet'.localize(context),
                    style: ADTextStyle600.size14
                        .setTextColor(context.adColors.whiteTextColor),
                  ),
                ],
              ),
            ),
          ).paddingBySide(
            bottom: bottomPadding ?? 0,
            top: topPadding ?? 0,
          )
        : const ADSizedBox.shrink();
  }
}
