/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_gradient_border.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This widget is used to show redeem gradient
class RedeemView extends StatelessWidget {
  final ADTapCallback? onTapHandlerKnowMore;

  final String? rightContent;

  const RedeemView({this.rightContent, this.onTapHandlerKnowMore, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rightContent.isNullOrEmpty || rightContent?.compareTo('0') == 0
        ? const SizedBox.shrink()
        : GradientOutLineBorder(
            height: context.k_18,
            width: context.k_32,
            strokeWidth: 1,
            radius: context.k_10,
            gradient: adGradientColorType3,
            onPressed: onTapHandlerKnowMore,
            child: Row(
              children: [
                Text(
                  'redeemLabel'.localize(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: ADTextStyle600.size12,
                ),
                SizedBox(width: context.k_6),
                CircleAvatar(
                  radius: context.k_8,
                  backgroundColor: context.adColors.lightGreyColor,
                  child: Icon(
                    Icons.close,
                    size: context.k_12,
                    color: context.adColors.geryBorderColor,
                  ),
                ),
              ],
            ).paddingBySide(left: context.k_8, right: context.k_8),
          );
  }
}
