/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double descriptionAspectRatio = 0.23;

///This widget is used to create a card for product which includes -
///image, title, price, and add button
class AdDepartureCard extends StatelessWidget {
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

  ///Text to be displayed in elevated button for localization
  final String? ctaLink;

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
  /// *[width] is the width of the widget
  /// *[addText] is the text to be displayed in elevated button for localization
  /// *[isBorderRequired] decides whether border need to be displayed or not
  /// *[onTap] handles on press of add button
  const AdDepartureCard({
    Key? key,
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
    this.ctaLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    const int maximumLine = 2;
    const lineHeight = 1.4;
    const double fontHeight = 1.4;

    return TouchableOpacity(
      onTap: () => handlePressed(context, title, ctaLink ?? ''),
      child: Container(
        margin: EdgeInsets.only(left: context.k_10),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(context.k_6)),
              child: Uri.parse(image).isAbsolute
                  ? ADCachedImage(
                      width: width,
                      height: width,
                      imageUrl: image,
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: context.k_22,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: context.k_20,
              ),
              child: Text(
                title,
                style: ADTextStyle700.size18
                    .setTextColor(context.adColors.filterBlackText),
                overflow: TextOverflow.ellipsis,
                maxLines: maximumLine,
              ),
            ),
            SizedBox(height: context.k_16),
            ADSizedBox(
              height: (width ?? 0) * descriptionAspectRatio,
              child: Padding(
                padding: EdgeInsets.only(
                  right: context.k_4,
                ),
                child: Text(
                  subTitle,
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.filterBlackText)
                      .copyWith(
                        overflow: TextOverflow.ellipsis,
                        height: lineHeight,
                      ),
                  maxLines: id_2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: context.k_20,
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: context.adColors.filterBlackText,
                        decoration: TextDecoration.underline,
                      ),
                      children: [
                        TextSpan(
                          text: '${guestType ?? actualPrice}',
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.filterBlackText)
                              .setFontHeight(fontHeight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handlePressed(BuildContext context, String title, String ctaLink) {
    openWebViewWithPranaamBook(
      context: context,
      title: title,
      url: '$ctaLink?isApp=true',
    );
  }
}
