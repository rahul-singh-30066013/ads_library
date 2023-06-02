/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///set ProgressIndicator view
class ADLinearProgressIndicator extends StatelessWidget {
  final int visibleItems;
  final int totalItems;

  static const double height = 2;

  const ADLinearProgressIndicator({
    Key? key,
    required this.visibleItems,
    required this.totalItems,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ///TODO:- text will be change letter via api
          'Showing $visibleItems of $totalItems',
          style: ADTextStyle400.size14.setTextColor(
            context.adColors.blackTextColor,
          ),
        ),
        ADSizedBox(
          height: context.k_14,
        ),
        LinearProgressIndicator(
          minHeight: height,
          backgroundColor: context.adColors.contentBulletColor,
          color: context.adColors.filterBlackText,
          value: visibleItems / totalItems,
        ),
      ],
    );
  }
}
