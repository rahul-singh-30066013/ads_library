/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double width = 268.sp;
final double height = 260.sp;

class OtherServicesCardView extends StatelessWidget {
  /// this is used to draw the services card with its [image],[title], and [subTitle]
  ///
  ///  OtherServicesCardView(
  ///                         title: 'title',
  ///                         subTitle: 'subTitle',
  ///                         image: 'image',
  ///                       ),
  const OtherServicesCardView({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(context.k_8),
            child: Image.asset(
              image,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: ADTextStyle500.size18,
              ),
              ADSizedBox(
                height: context.k_10,
              ),
              Text(
                subTitle,
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.greyTextColor),
              ),
            ],
          ).paddingBySide(right: context.k_30),
        ],
      ),
    );
  }
}
