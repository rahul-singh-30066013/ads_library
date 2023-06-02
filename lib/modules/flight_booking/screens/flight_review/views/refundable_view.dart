/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// [RefundableView] is used to show refundable policy and fare rules.
class RefundableView extends StatelessWidget {
  final bool? refundable;

  const RefundableView({
    Key? key,
    this.refundable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Divider(
        //   thickness: 1.sp,
        //   height: context.k_40,
        // ),
        ADSizedBox(
          height: context.k_10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              SvgAssets.refundableCheck,
              color: refundable ?? false ? context.adColors.greenColor : null,
            ),
            ADSizedBox(
              width: context.k_8,
            ),
            Text(
              refundable ?? false
                  ? 'partially_refundable'.localize(context)
                  : 'not_refundable'.localize(context),
              style: ADTextStyle400.size16
                  .setTextColor(context.adColors.greyTextColor),
            ),
            const Spacer(),
          ],
        ),
        ADSizedBox(
          height: context.k_8,
        ),
        // Divider(
        //   thickness: 1.sp,
        //   height: context.k_30,
        // ),
      ],
    );
  }
}
