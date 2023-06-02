/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//set load more button view
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class ADLoadMoreButton extends StatelessWidget {
  const ADLoadMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return OutlinedButton(
    //   style: OutlinedButton.styleFrom(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(context.k_26),
    //     ),
    //     side: BorderSide(
    //       color: context.adColors.blackTextColor,
    //     ),
    //   ),
    //   onPressed: null,
    //   child: Align(
    //     alignment: Alignment.bottomCenter,
    //     child: Text(
    //       'load_more'.localize(context),
    //       style: ADTextStyle500.size18.setTextColor(
    //         context.adColors.blackTextColor,
    //       ),
    //     ).paddingAllSide(context.k_14),
    //   ),
    // ).paddingBySide(
    //   left: context.k_64,
    //   bottom: context.k_24,
    //   right: context.k_64,
    // );

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.k_26),
        ),
        side: BorderSide(
          color: context.adColors.blackTextColor,
        ),
      ),
      onPressed: null,
      child: Text(
        'load_more'.localize(context),
        textAlign: TextAlign.center,
        style: ADTextStyle500.size18.setTextColor(
          context.adColors.blackTextColor,
        ),
      ).paddingBySide(
        bottom: context.k_12,
        top: context.k_12,
      ),
    );
  }
}
