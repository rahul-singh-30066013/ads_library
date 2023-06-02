/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This class will be used to create an item which contains an image and a title below the image.
/// A user can also select the type of border from following three types i.e. gradient, grey, none.
///sample usage code -
///```dart
/// DutyFreeCategorySliderItem(
///                   placeHolderImagePath: 'lib/assets/gif/hour_glass.gif',
///                   productImageUrl: 'https://picsum.photos/100/100',
///                   categoryText: 'Category Type 1',
///                   textStyle: ADTextStyle600.size14,
///                   imageHeight: 74,
///                   imageWidth: 74,
///                   spaceBetweenIconAndText: 8,
///                   borderType: ADCategorySliderType.grey,
///                   marginBetweenBorderImage: 2,
///                 )
///```
class DutyFreeCategorySliderItem extends StatelessWidget {
  /// this class will be used to create a slider of categories with title
  /// if we need to show an image from asset only then only pass placeHolderImagePath
  ///*[onTapHandler] a function in which we will write the click functionality
  ///*[productImageUrl] network url of image that needs to be shown
  ///*[placeHolderImagePath] path of icon/image that will be shown till the network image is loading
  ///*[categoryText] text that represents category name
  ///*[spaceBetweenIconAndText] margin value that you need to set between icon and title
  ///*[imageHeight] height of icon image
  ///*[imageWidth] width of icon image
  DutyFreeCategorySliderItem({
    Key? key,
    this.onTapHandler,
    this.productImageUrl,
    this.placeHolderImagePath,
    required this.categoryText,
    required this.spaceBetweenIconAndText,
    this.imageHeight,
    this.imageWidth,
    this.enableCircle = true,
  }) : super(key: key);

  ///a function in which we will write the click functionality
  final ADTapCallbackWithValue? onTapHandler;

  ///network url of image that needs to be shown
  final String? productImageUrl;

  ///path of icon/image that will be shown till the network image is loading
  final String? placeHolderImagePath;

  ///text that represents category name
  final String categoryText;
  final double spaceBetweenIconAndText;
  final double? imageHeight;
  final double? imageWidth;

  final defaultImageWidth = 62.sp;

  ///default max lines
  final maxLines = 2;

  /// Default container width
  final containerWidth = 74.sp;

  final bool enableCircle;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => onTapHandler?.call(key),
      child: Column(
        children: [
          Container(
            width: imageWidth ?? containerWidth,
            height: imageHeight ?? containerWidth,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              border: Border.all(
                color: context.adColors.lightGreyGridSeparatorColor,
              ),
              shape: enableCircle ? BoxShape.circle : BoxShape.rectangle,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: enableCircle
                ? ClipOval(
                    child: SizedBox(
                      width: imageWidth ?? defaultImageWidth,
                      height: imageHeight ?? defaultImageWidth,
                      child: ADCachedImage(
                        imageUrl: productImageUrl ?? '',
                        placeHolderSize: context.k_30,
                      ),
                    ),
                  )
                : SizedBox(
                    width: imageWidth ?? defaultImageWidth,
                    height: imageHeight ?? defaultImageWidth,
                    child: ADCachedImage(
                      imageUrl: productImageUrl ?? '',
                      placeHolderSize: context.k_30,
                    ),
                  ),
          ),
          ADSizedBox(
            height: spaceBetweenIconAndText,
          ),
          Text(
            categoryText,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle500.size14
                .setTextColor(context.adColors.neutralInfoMsg),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
