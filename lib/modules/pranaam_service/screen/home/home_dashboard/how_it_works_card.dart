/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

const double imageAspectRatio = 0.72;

class HowItWorksCard extends StatelessWidget {
  ///Image to be displayed using network
  final String image;

  ///textOne
  final String textOne;

  ///textTwo
  final String textTwo;

  ///textThree
  final String textThree;

  ///Width of the widget
  ///Default value assigned
  final double? subItemAspectRatio;

  ///Handles on press of add button
  final ADTapCallback? onTap;

  ///Below is the example on usage of widget:
  /// ```
  ///HowItWorksCard(
  ///                 textOne: 'Absolute Vodka Plain 100 cl',
  ///                 image:
  ///                     'https://i.pinimg.com/550x/38/b5/14/38b514c5471627565ea8c7f1ff1c80f2.jpg',
  ///                 textTwo: '',
  ///                 textThree: '',
  ///                 onTap: () {},
  ///               ),
  /// ```
  /// *[image] is the product image to be displayed using network
  /// *[textOne] is the product title
  /// *[subItemAspectRatio] is the width of the widget
  /// *[onTap] handles on press of add button
  const HowItWorksCard({
    Key? key,
    this.subItemAspectRatio,
    required this.image,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    const int maximumLine = 2;
    adLog('image url $image');
    final double widthOfCard =
        context.widthOfScreen * (subItemAspectRatio ?? imageAspectRatio);
    const lineHeight = 1.4;
    return GestureDetector(
      onTap: () => {},
      child: Container(
        margin: EdgeInsets.only(left: context.k_16),
        width: widthOfCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(context.k_6)),
              child: Uri.parse(image).isAbsolute
                  ? ADCachedImage(
                      width: widthOfCard,
                      height: widthOfCard,
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
                textOne,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.filterBlackText),
                overflow: TextOverflow.ellipsis,
                maxLines: maximumLine,
              ),
            ),
            SizedBox(height: context.k_10),
            Padding(
              padding: EdgeInsets.only(
                right: context.k_4,
              ),
              child: Text(
                textTwo,
                style: ADTextStyle700.size18
                    .setTextColor(context.adColors.filterBlackText)
                    .copyWith(overflow: TextOverflow.ellipsis),
                maxLines: id_3,
              ),
            ),
            SizedBox(
              height: context.k_10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: context.k_4,
                ),
                child: Text(
                  textThree,
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.filterBlackText)
                      .copyWith(
                        overflow: TextOverflow.ellipsis,
                        height: lineHeight,
                      ),
                  maxLines: id_3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
