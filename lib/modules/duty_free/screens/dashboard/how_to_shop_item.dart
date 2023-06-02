/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

final _heightOfImage = 100.sp;

///this class is used to for creating shopItemCard in dutyfree screen
class HowToShopItem extends StatelessWidget {
  final num index;
  final String title;
  final String description;
  final Color indexBackgroundColor;
  final Color indexColor;
  final Color backgroundColor;
  final Color textColor;
  final double? marginLeft;
  final double? marginRight;
  final double? subItemWidth;
  final String mobileImage;

  const HowToShopItem({
    required this.textColor,
    required this.index,
    required this.title,
    required this.indexBackgroundColor,
    required this.indexColor,
    required this.description,
    this.marginLeft,
    this.marginRight,
    this.subItemWidth,
    required this.backgroundColor,
    required this.mobileImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth =
        context.widthOfScreen * (subItemWidth ?? 1); // 225.sp;
    // const double heightScreen = 0.8;
    return Container(
      margin: EdgeInsets.only(
        left: marginLeft?.sp ?? context.k_10,
        right: marginRight?.sp ?? context.k_10,
        bottom: context.k_30,
      ),
      width: containerWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(context.k_8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: context.k_14,
          right: context.k_14,
          top: context.k_20,
          bottom: context.k_10,
        ),
        child: Column(
          children: [
            // NumberRotatedView(
            //   backgroundColor: indexBackgroundColor,
            //   textColor: indexColor,
            //   index: index,
            // ),

            SizedBox(
              height: _heightOfImage,
              width: _heightOfImage,
              child: ADCachedImage(
                maxWidthDiskCache: containerWidth.toInt(),
                imageUrl: mobileImage,
              ),
            ),
            SizedBox(height: context.k_16),
            Text(
              title,
              maxLines: 1,
              style: ADTextStyle700.size20.copyWith(color: textColor),
            ),
            SizedBox(height: context.k_12),
            Flexible(
              child: Text(
                description,
                style: ADTextStyle400.size14.copyWith(
                  color: textColor,
                ),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
