/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabItemDetail extends StatelessWidget {
  final String iconName;
  final String titleName;
  final Widget detailWidget;

  const CabItemDetail({
    Key? key,
    required this.iconName,
    required this.titleName,
    required this.detailWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double titleTextWidth = 102.sp;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.k_18,
          width: context.k_18,
          child: Center(
            child: SvgPicture.asset(
              iconName,
              color: context.adColors.darkGreyTextColor,
            ),
          ),
        ),
        ADSizedBox(
          width: context.k_15,
        ),
        SizedBox(
          width: titleTextWidth,
          child: Text(
            titleName.localize(context),
            style: ADTextStyle600.size14
                .setTextColor(context.adColors.blackTextColor),
          ),
        ),
        ADSizedBox(
          width: context.k_15,
        ),
        Expanded(
          child: detailWidget,
        ),
      ],
    );
  }
}
