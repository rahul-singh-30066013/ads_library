/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class TitleSubTitleView extends StatelessWidget {
  final String title;
  final String subTitle;
  final ADTapCallback onTap;

  const TitleSubTitleView({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_16,
          top: context.k_22,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: ADTextStyle400.size16.setTextColor(
                  context.adColors.greyTextColor,
                ),
              ),
              SizedBox(
                height: context.k_6,
              ),
              Text(
                subTitle,
                style: ADTextStyle500.size20.setTextColor(
                  context.adColors.neutralInfoMsg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
