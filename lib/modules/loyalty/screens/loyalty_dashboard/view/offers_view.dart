/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used to show loyalty offers
class OffersView extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String img;
  final double? imgHeight;
  const OffersView({
    Key? key,
    this.title,
    this.subTitle,
    required this.img,
    this.imgHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// local variables
    final containerHeight = 114.sp;
    final _imgHeight = 50.sp;
    final _imgWidth = 62.sp;
    final _positionRight = -2.sp;
    final _positionBotttom = 4.sp;
    const maxLines = 2;
    const lineSpacing = 1.5;
    const Color blackColor = Color(0xff000000);

    ///Todo add in styles
    const Color borderColor = Color(0xffc4b4e0);

    return Expanded(
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: ADTextStyle700.size18
                      .setTextColor(context.adColors.neutralInfoMsg),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                ADSizedBox(
                  height: context.k_4,
                ),
                Text(
                  subTitle?.replaceAll(r'\n', '\n') ?? '',
                  style: ADTextStyle400.size14
                      .setTextColor(blackColor)
                      .copyWith(height: lineSpacing),
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ).paddingBySide(
              left: context.k_14,
              right: context.k_14,
              top: context.k_22,
              bottom: context.k_12,
            ),
            Positioned(
              right: -_positionRight,
              bottom: _positionBotttom,
              child: Image.network(
                img,
                fit: BoxFit.cover,
                height: imgHeight ?? _imgHeight,
                width: _imgWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
