/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const int flex = 3;
double height = 102.sp;
double aspectRatio = 1.18;

class ProductView extends StatelessWidget {
  /// this is used to draw the ordered Item card which includes its [image],[packageType],
  /// [packagePrice] and [quantity]
  ///
  ///  ProductView(
  ///                 image: 'image',
  ///                 packagePrice: 'packagePrice',
  ///                 packageType: 'packageType',
  ///                 quantity: 'quantity',
  ///               ),
  const ProductView({
    Key? key,
    required this.image,
    required this.packageType,
    required this.quantity,
    required this.packagePrice,
    required this.isAddOn,
    this.isStandAlone = false,
    this.standAloneName = '',
    this.standAlonePrice = '',
    this.standAloneImage = '',
  }) : super(key: key);
  final String image;
  final String packageType;
  final String quantity;
  final String packagePrice;
  final bool isAddOn;
  final bool isStandAlone;
  final String standAloneName;
  final String standAlonePrice;
  final String standAloneImage;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Padding(
      padding: EdgeInsets.only(bottom: context.k_20),
      child: Row(
        children: [
          if (isStandAlone)
            ClipRRect(
              borderRadius: BorderRadius.circular(context.k_8),
              child: Image.asset(
                standAloneImage,
                height: height,
              ),
            )
          else
            Expanded(
              child: Container(
                padding: isAddOn
                    ? EdgeInsets.zero
                    : Utils.startsWithHttp(image)
                        ? EdgeInsets.zero
                        : EdgeInsets.symmetric(horizontal: context.k_10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.k_8),
                  border: Border.all(
                    color: context.adColors.tileBorderColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.k_8),
                  child: !Utils.startsWithHttp(image)
                      ? Image.asset(
                          image,
                          fit: isAddOn ? BoxFit.cover : BoxFit.contain,
                          height: height,
                        )
                      : ADCachedImage(
                          imageUrl: image,
                          height: height,
                          width: height / aspectRatio,
                        ),
                ),
              ),
            ),
          ADSizedBox(
            width: context.k_16,
          ),
          Expanded(
            flex: flex,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isStandAlone ? standAloneName : packageType,
                  style: ADTextStyle400.size16,
                ),
                ADSizedBox(
                  height: context.k_8,
                ),
                // RichText(
                //   text: TextSpan(
                //     text: 'Quantity: $quantity',
                //     style: ADTextStyle400.size16
                //         .copyWith(color: context.adColors.greyTextColor),
                //     children: [
                //       TextSpan(
                //         text: '',
                //         style: ADTextStyle500.size16,
                //       ),
                //     ],
                //   ),
                // ),
                // ADSizedBox(
                //   height: context.k_10,
                // ),
                Text(
                  FlightUtils.getAmountWithTwoDecimalPoint(
                    double.parse(isStandAlone ? standAlonePrice : packagePrice),
                  ),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.blackTextColor),
                ),
                ADSizedBox(
                  height: context.k_16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
