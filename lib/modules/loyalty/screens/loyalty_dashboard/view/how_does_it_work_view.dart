/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used fir Single item for adani rewards program
class HowDoesItWorkView extends StatelessWidget {
  final num index;
  final String title;
  final String description;
  final String img;
  final Color indexBackgroundColor;
  final Color indexColor;
  final Color backgroundColor;
  final Color textColor;

  const HowDoesItWorkView({
    required this.textColor,
    required this.index,
    required this.title,
    required this.indexBackgroundColor,
    required this.indexColor,
    required this.description,
    required this.backgroundColor,
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth = 225.sp;
    const double lineSpacing = 1.6;
    final double iconHeight = 88.sp;
    final double iconWidth = 160.sp;
    const int maxLines = 4;
    //  const Color coinTextColor = Color(0xff85670c);
    const Color whiteShadowColor = Color(0x0a000000);

    ///Todo add in styles
    const Color borderColor = Color(0xffc4b4e0);
    const Color blackColor = Color(0xff000000);
    return Container(
      width: containerWidth,
      height: context.heightOfScreen,
      padding: EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_24,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
        boxShadow: [
          BoxShadow(
            color: whiteShadowColor,
            blurRadius: context.k_4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                img,
                height: iconHeight,
                width: iconWidth,
                // fit: BoxFit.cover,
              ),

              // Text(
              //   (index + 1).toString(),
              //   style: ADTextStyle600.size18.setTextColor(coinTextColor),
              // ),
            ],
          ),
          ADSizedBox(height: context.k_12),
          Text(
            title,
            // maxLines: 1,
            textAlign: TextAlign.center,
            style: ADTextStyle700.size18,
          ),
          ADSizedBox(
            height: context.k_8,
          ),
          Flexible(
            child: Text(
              description,
              style: ADTextStyle400.size14.copyWith(
                color: blackColor,
                height: lineSpacing,
              ),
              textAlign: TextAlign.center,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ).paddingBySide(
      right: context.k_20,
      // bottom: context.k_22,
      // left: context.k_16,
      // top: context.k_10,
    );
  }
}
