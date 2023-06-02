/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/dashboard_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/shimmer.dart';

///This widget is used to create a shimmer card for duty free product
class DutyFreeProductCardShimmer extends StatelessWidget {
  ///Height of the widget
  ///Default value assigned
  final double? height;

  ///Width of the widget
  ///Default value assigned
  final double? width;

  ///Decides whether border need to be displayed or not
  final bool isBorderRequired;

  ///handles border radius
  final double? borderRadius;

  /// scaled width for image
  final double? imageScaledWidth;

  /// scaled height for image
  final double? imageScaledHeight;

  final ItemMargin? itemMargin;

  final Color? backgroundColor;

  ///Below is the example on usage of widget:
  /// ```
  /// ```
  /// *[height] is the height of the widget
  /// *[width] is the width of the widget
  /// *[isBorderRequired] decides whether border need to be displayed or not
  const DutyFreeProductCardShimmer({
    Key? key,
    this.height,
    this.width,
    this.isBorderRequired = true,
    this.borderRadius,
    this.imageScaledWidth,
    this.imageScaledHeight,
    this.itemMargin,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaledHeight = 320.sp;
    final scaledWidth = isBorderRequired ? 266.sp : 233.sp;
    final buttonWidth = 116.sp;
    const priceFontHeight = 1.4;
    const maxLines = 2;
    return Container(
      width: width ?? scaledWidth,
      height: height ?? scaledHeight,
      padding: isBorderRequired
          ? EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
              bottom: context.k_16,
              top: context.k_16,
            )
          : null,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: isBorderRequired
              ? context.adColors.lightGreyColor
              : context.adColors.transparentColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius != null ? borderRadius?.sp ?? 0 : context.k_8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ADShimmer.fromColors(
            baseColor: context.adColors.baseShimmerColor,
            highlightColor: context.adColors.highlightShimmerColor,
            child: Container(
              width: imageScaledWidth ?? scaledWidth,
              height: imageScaledHeight ?? scaledHeight,
              padding: EdgeInsets.symmetric(vertical: context.k_16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  borderRadius ?? 0,
                ),
                color: context.adColors.containerGreyBg,
              ),
            ),
          ).paddingBySide(top: isBorderRequired ? 0 : itemMargin?.top.sp ?? 0),
          ADSizedBox(
            height: context.k_14,
          ),
          ADShimmer.fromColors(
            baseColor: context.adColors.baseShimmerColor,
            highlightColor: context.adColors.highlightShimmerColor,
            child: Text(
              '',
              style: ADTextStyle500.size16.setTextColor(
                context.adColors.blackTextColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
            ),
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Expanded(
            child: ADShimmer.fromColors(
              baseColor: context.adColors.baseShimmerColor,
              highlightColor: context.adColors.highlightShimmerColor,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: context.adColors.black),
                      children: [
                        TextSpan(
                          text: '₹--',
                          style: ADTextStyle700.size16
                              .setFontHeight(priceFontHeight),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: context.adColors.whiteTextColor,
                      fixedSize: Size(buttonWidth, context.k_40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.k_40),
                        side: BorderSide(
                          color: context.adColors.tileBorderColor,
                        ),
                      ),
                      elevation: 0,
                    ),
                    onPressed: null,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: ADTextStyle600.size14
                            .setTextColor(context.adColors.blueColor)
                            .setFontHeight(1),
                        children: [
                          TextSpan(
                            text: 'add'.localize(context),
                          ),
                          const TextSpan(
                            text: '\u207A',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
