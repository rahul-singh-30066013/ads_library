/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/coming_soon.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to create a item that contains an image, a product name string ,
///a supporting/description text, some highlighted information
///sample usage code
///```dart
///     ImageWithText(
///                 placeHolderImagePath: 'lib/assets/gif/hour_glass.gif',
///                 productImageUrl: 'https://picsum.photos/1500/800',
///                 titleText: "title text",
///                 descriptionText:"supporting text",
///                 actionText:"Know More")
///```
class ImageWithText extends StatelessWidget {
  ///this constructor is used to create a item that contains an image, a product name string ,
  ///a supporting/description text, some highlighted information
  ///*[productImageUrl] network url of image that needs to be shown
  ///*[placeHolderImagePath] path of icon/image that will be shown till the network image is loading
  ///*[titleText] a string that represent title of the product
  ///*[descriptionText] a string that represent description of the product
  ///*[actionText] blue colored text
  const ImageWithText({
    Key? key,
    required this.productImageUrl,
    this.placeHolderImagePath,
    required this.titleText,
    this.descriptionText,
    this.actionText,
    this.aspectRatio,
    this.outsidePadding = const EdgeInsets.all(0),
    this.paddingForTextContent = const EdgeInsets.all(0),
    this.borderRadius,
    this.innerBorderRadius,
    this.ctaUrl,
    this.uniqueId,
    this.tagName,
    this.titleColor,
    this.descriptionColor,
    this.ctaColor,
    this.backgroundColor,
    this.decoration,
  }) : super(key: key);

  ///network url of image that needs to be shown
  final String productImageUrl;

  ///path of icon/image that will be shown till the network image is loading
  final String? placeHolderImagePath;

  ///a string that represent title of the product
  final String titleText;

  ///a string that represent description of the product
  final String? descriptionText;

  /// some highlighted text
  final String? actionText;

  final String? ctaUrl;
  final String? uniqueId;
  final TagName? tagName;

  /// some highlighted text
  final double? aspectRatio;
  final EdgeInsetsGeometry? outsidePadding;

  //For Text content box
  final EdgeInsetsGeometry? paddingForTextContent;

  final BorderRadius? borderRadius;
  final BorderRadius? innerBorderRadius;

  final Color? titleColor;

  final Color? descriptionColor;

  final Color? ctaColor;

  final Color? backgroundColor;

  final BoxDecoration? decoration;

  static const defaultAspectRatio = 0.65;

  @override
  Widget build(BuildContext context) {
    final double itemWidth =
        context.widthOfScreen - (outsidePadding?.horizontal ?? context.k_32);
    const maxLines = 2;
    const maxDescLines = 2;
    const lineHeight = 1.4;
    return Container(
      padding: outsidePadding,
      width: itemWidth,
      child: ClipRRect(
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: decoration?.copyWith(
                borderRadius: innerBorderRadius,
              ) ??
              const BoxDecoration(
                color: ADColors.white,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: innerBorderRadius,
                child: Container(
                  color: context.adColors.containerGreyBg,
                  width: itemWidth,
                  height: itemWidth * (aspectRatio ?? defaultAspectRatio),
                  child: ADCachedImage(
                    height: itemWidth * (aspectRatio ?? defaultAspectRatio).sp,
                    width: itemWidth.sp,
                    imageUrl: productImageUrl,
                  ),
                ),
              ),
              Container(
                color: backgroundColor,
                padding: paddingForTextContent?.add(
                  EdgeInsets.only(
                    top: context.k_20,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          titleText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: maxLines,
                          style: ADTextStyle700.size18.setTextColor(
                            titleColor ?? context.adColors.blackTextColor,
                          ),
                        ),
                        if (tagName?.name?.isNotEmpty ?? false)
                          Row(
                            children: [
                              ADSizedBox(
                                width: context.k_10,
                              ),
                              ComingSoon(
                                tagName: tagName?.name,
                                textColor: tagName?.textColor,
                                backgroundColor: tagName?.backgroundColor,
                              ),
                            ],
                          ),
                      ],
                    ),
                    ADSizedBox(height: context.k_10),
                    Text(
                      descriptionText ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: maxDescLines,
                      style: ADTextStyle400.size16.copyWith(
                        height: lineHeight,
                        color:
                            descriptionColor ?? context.adColors.blackTextColor,
                        fontSize: fifteenFontSize,
                      ),
                    ),
                    if ((ctaUrl?.isNotEmpty ?? false) ||
                        (uniqueId?.isNotEmpty ?? false))
                      ADSizedBox(height: context.k_10),
                    if ((ctaUrl?.isNotEmpty ?? false) ||
                        (uniqueId?.isNotEmpty ?? false))
                      Text(
                        actionText ?? 'know_more'.localize(context),
                        overflow: TextOverflow.ellipsis,
                        style: ADTextStyle400.size16.copyWith(
                          color: ctaColor ?? context.adColors.blackTextColor,
                          decoration: TextDecoration.underline,
                          fontSize: fifteenFontSize,
                        ),
                      ).paddingBySide(bottom: context.k_2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
