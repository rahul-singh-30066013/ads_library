/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class HeaderDialog extends StatelessWidget {
  final double iconHeight = 68.sp;
  final double iconWidth = 72.sp;
  final double closeIconSize = 16.sp;
  final int maxLinesForText = 3;

  final String emailId;

  HeaderDialog({
    Key? key,
    required this.emailId,
  }) : super(key: key);

  final double heightForQrCode = 142.sp;
  final double verticalSpacingForQrCode = 208.sp;
  final double horizontalSpacingForQrCode = 117.sp;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.adColors.greenColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.k_16,
                    height: context.k_16,
                    child: SvgPicture.asset(
                      SvgAssets.closingIcon,
                    ),
                  ).paddingBySide(bottom: context.k_8),
                  Text(
                    'parking_confirmation_message'.localize(context),
                    maxLines: maxLinesForText,
                    overflow: TextOverflow.clip,
                    style: ADTextStyle700.size26
                        .setTextColor(context.adColors.whiteTextColor),
                  ).paddingBySide(
                    top: context.k_8,
                    bottom: context.k_8,
                  ),
                  Text(
                    'parking_confirmation_message_description'
                        .localize(context)
                        .replaceFirst('#-emailId-#', emailId),
                    overflow: TextOverflow.clip,
                    style: ADTextStyle500.size16
                        .setTextColor(context.adColors.whiteTextColor),
                  ).paddingBySide(
                    top: context.k_8,
                    bottom: context.k_10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.k_8,
            ),
            // icon
            Container(
              height: iconHeight,
              width: iconWidth,
              color: context.adColors.whiteTextColor,
            ),
          ],
        ).paddingAllSide(
          context.k_16,
        ),
      ),
    );
  }
}

class ParkingDetailsText extends StatelessWidget {
  final String title;
  final String value;
  final String? optionalText;

  static const int maxLinesForText = 2;

  const ParkingDetailsText({
    Key? key,
    required this.title,
    required this.value,
    this.optionalText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ADTextStyle500.size12.setTextColor(
            context.adColors.greyTextColor,
          ),
        ),
        Text(
          value,
          maxLines: 1,
          style: ADTextStyle600.size16.setTextColor(
            context.adColors.neutralInfoMsg,
          ),
        ).paddingBySide(
          top: context.k_4,
        ),
        if (optionalText?.isNotEmpty ?? false)
          Text(
            optionalText ?? '',
            style: ADTextStyle500.size12.setTextColor(
              context.adColors.darkGreyTextColor,
            ),
            maxLines: maxLinesForText,
          ).paddingBySide(
            top: context.k_4,
          )
        else
          const SizedBox(),
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  final String title;
  final bool showSeeAllOption;

  const HeaderText({
    Key? key,
    required this.title,
    this.showSeeAllOption = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title.localize(context),
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.blackTextColor,
          ),
        ),
        const Spacer(),
        if (showSeeAllOption)
          Text(
            'see_all'.localize(context),
            style: ADTextStyle500.size18
                .setTextColor(
                  context.adColors.blackColor,
                )
                .copyWith(
                  decoration: TextDecoration.underline,
                ),
          ).paddingBySide(top: context.k_32)
        else
          const SizedBox(),
      ],
    );
  }
}
