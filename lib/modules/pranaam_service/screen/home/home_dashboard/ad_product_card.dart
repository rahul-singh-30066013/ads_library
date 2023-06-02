/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

const double borderRadius = 8;
const double sizeBoxHeight_20 = 20;
const int maximumLine = 2;
const double fontHeight = 1.4;
const double boxdecHeight_42 = 42;
const double boxdecWidth_116 = 116;
const double textStyle_20 = 20;
final double imageHeight = 200.sp;
const double imageAspectRatio = 0.66;

///This widget is used to create a card for product which includes -
///image, title, price, and add button
class ADProductCard extends StatelessWidget {
  ///Image to be displayed using network
  final String image;

  ///Placeholder to be displayed while image is loading
  final String placeHolder;

  ///Title of the product
  final String title;

  ///SubTitle of the product
  final String subTitle;

  ///Actual price of product without discounts
  final String actualPrice;

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
  const ADProductCard({
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
    adLog('Image $image');
    adLog('Width $width');
    const maxLines = 3;
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? ADColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: (width ?? 1) * imageAspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.k_4),
                  topRight: Radius.circular(context.k_4),
                ),
                child: Utils.startsWithHttp(image)
                    ? ADCachedImage(
                        imageUrl: image,
                      )
                    : Image.asset(
                        '',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(
              height: context.k_16,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.k_16,
                right: context.k_16,
              ),
              child: Text(
                title,
                style: ADTextStyle700.size18,
                overflow: TextOverflow.ellipsis,
                maxLines: maximumLine,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: context.k_10),
            Padding(
              padding: EdgeInsets.only(
                left: context.k_16,
                right: context.k_16,
              ),
              child: Text(
                subTitle,
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.filterBlackText)
                    .copyWith(
                      height: context.k_20 / context.k_14,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                left: context.k_16,
                right: context.k_16,
                bottom: context.k_16,
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: context.adColors.filterBlackText),
                      children: [
                        TextSpan(
                          text: '${FlightUtils.getPriceFormatWithSymbol(
                            price: double.parse(actualPrice),
                          )}\n',
                          style: ADTextStyle700.size18
                              .setTextColor(context.adColors.filterBlackText),
                        ),
                        TextSpan(
                          text: guestType ?? actualPrice,
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.filterBlackText)
                              .setFontHeight(fontHeight),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: context.k_10,
                        horizontal: context.k_24,
                      ), backgroundColor: context.adColors.whiteTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(boxdecHeight_42),
                        ),
                        side:
                            BorderSide(color: context.adColors.filterBlackText),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      addText,
                      style: ADTextStyle500.size14
                          .setTextColor(context.adColors.filterBlackText)
                          .copyWith(
                            height: context.k_20 / context.k_14,
                          ),
                    ).paddingBySide(bottom: context.k_4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static double itemWidth(
    double itemMarginLeft,
    double itemMarginRight,
    double containerWidth,
  ) {
    final totalMarginWidth = itemMarginLeft + itemMarginRight;
    return containerWidth - totalMarginWidth;
  }
}
