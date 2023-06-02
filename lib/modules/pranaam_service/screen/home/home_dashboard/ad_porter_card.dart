/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

const double borderRadius = 8;
const double sizeBoxHeight_20 = 20;
const int maximumLine = 2;
const double circularWidth_21 = 30;
const int red_13 = 13;
const int green_103 = 103;
const int blue_202 = 202;

///This widget is used to create a card for product which includes -
///image, title, price, and add button
class ADPorterCard extends StatelessWidget {
  ///Image to be displayed using network
  final String image;

  ///Placeholder to be displayed while image is loading
  final String placeHolder;

  ///Title of the product
  final String title;

  ///SubTitle of the product
  final String subTitle;

  ///Actual price of product without discounts
  final int actualPrice;

  ///Discounted price of product (if available)
  final String? guestType;

  ///Height of the widget
  ///Default value assigned
  final double? height;

  ///Width of the widget
  ///Default value assigned
  final double? width;

  ///Text to be displayed in elevated button for localization
  final String addText;

  ///Decides whether border need to be displayed or not
  final bool isBorderRequired;

  ///Decides whether border need to be displayed or not
  final Color? backgroundColor;

  ///Handles on press of add button
  final ADTapCallback? onTap;

  ///Below is the example on usage of widget:
  /// ```
  ///ADProductCard(
  ///                 title: 'Absolute Vodka Plain 100 cl',
  ///                 image:
  ///                     'https://i.pinimg.com/550x/38/b5/14/38b514c5471627565ea8c7f1ff1c80f2.jpg',
  ///                 placeHolder: '',
  ///                 actualPrice: 2000,
  ///                 discountedPrice: 1800,
  ///                 addText: 'Add',
  ///                 isBorderRequired: false,
  ///                 onTap: () {},
  ///               ),
  /// ```
  /// *[image] is the product image to be displayed using network
  /// *[placeHolder] is to be displayed while image is loading
  /// *[title] is the product title
  /// *[actualPrice] of product without discounts
  /// *[guestType] is the product guestType to be displayed using network
  /// *[height] is the height of the widget
  /// *[width] is the width of the widget
  /// *[addText] is the text to be displayed in elevated button for localization
  /// *[isBorderRequired] decides whether border need to be displayed or not
  /// *[onTap] handles on press of add button
  const ADPorterCard({
    Key? key,
    this.height,
    this.width,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.actualPrice,
    this.guestType,
    required this.placeHolder,
    required this.addText,
    this.isBorderRequired = true,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? ADColors.white,
        border: Border.all(
          color: isBorderRequired
              ? context.adColors.tileBorderColor
              : context.adColors.whiteTextColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              child: Utils.startsWithHttp(image)
                  ? FadeInImage.assetNetwork(
                      image: image,
                      fit: BoxFit.cover,
                      placeholder: placeHolder,
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(
            height: sizeBoxHeight_20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_20,
            ),
            child: Text(
              title,
              style: ADTextStyle700.size18,
              overflow: TextOverflow.ellipsis,
              maxLines: maximumLine,
            ),
          ),
          SizedBox(height: context.k_8),
          Padding(
            padding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_20,
            ),
            child: Text(
              subTitle,
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.greyTextColor),
            ),
          ),
          SizedBox(
            height: context.k_20,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_20,
              bottom: context.k_20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: context.adColors.black),
                    children: [
                      TextSpan(
                        text: '₹$actualPrice',
                        style: ADTextStyle700.size18
                            .setTextColor(context.adColors.filterBlackText),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    ///TODO need to add color in style guide
                    backgroundColor: context.adColors.blueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(circularWidth_21)),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.k_26,
                      vertical: context.k_12,
                    ),
                  ),
                  child: Text(
                    addText,
                    style: ADTextStyle700.size14
                        .setTextColor(context.adColors.whiteTextColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
