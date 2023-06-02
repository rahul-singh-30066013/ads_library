/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double imageTitleWidgetAspectRatio = 0.176;
const double imageTitleContainerHeight = 70;
const double imageTitleContainerWidth = 72;
const double imageBorderRadius = 47.5;
const int maxDescriptionLines = 11;

///text style height = line height /text size
const double lineHeight = 1.5;

class ADPranaamCustomerTestimony extends StatelessWidget {
  const ADPranaamCustomerTestimony({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: context.adColors.whiteTextColor,
      ),
      child: Column(
        children: [
          ADSizedBox(
            height: context.widthOfScreen * imageTitleWidgetAspectRatio,
            child: Row(
              children: [
                Container(
                  height: imageTitleContainerHeight,
                  width: imageTitleContainerWidth,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(imageBorderRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: context.adColors.lightGreyGridSeparatorColor,
                      ),
                    ],
                  ),
                  child: Uri.parse(imageUrl).isAbsolute
                      ? ADCachedImage(
                          imageUrl: imageUrl,
                          width: context.widthOfScreen,
                        )
                      : Image.network(
                          imageUrl,
                          width: context.widthOfScreen,
                          fit: BoxFit.cover,
                        ),
                ),
                ADSizedBox(
                  width: context.k_18,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: ADTextStyle700.size18
                        .setTextColor(context.adColors.filterBlackText),
                  ),
                ),
              ],
            ),
          ).paddingBySide(
            top: context.k_22,
            left: context.k_26,
            right: context.k_10,
          ),
          Expanded(
            child: Text(
              description,
              style: ADTextStyle400.size16.copyWith(
                color: context.adColors.filterBlackText,
                height: lineHeight,
              ),
              maxLines: maxDescriptionLines,
              overflow: TextOverflow.ellipsis,
            ).paddingBySide(
              top: context.k_10,
              left: context.k_26,
              right: context.k_10,
            ),
          ),
        ],
      ),
    );
  }
}
