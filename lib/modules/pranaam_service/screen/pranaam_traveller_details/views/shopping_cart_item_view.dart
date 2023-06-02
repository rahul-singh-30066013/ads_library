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

const int cartFlex = 3;
final double boxWidth = 82.sp;
final double boxHeight = 97.sp;

const double borderWidth = 0.5;

class ShoppingCartItemView extends StatelessWidget {
  /// this class is used to draw the shopping cart list item
  /// having [packageType], [packagePrice] and [quantity].
  ///
  /// ShoppingCartItemView(
  ///               lastIndex: lastIndex,
  ///               packagePrice: 'packagePrice',
  ///               packageType: 'packageType',
  ///               quantity: quantity,
  ///             )
  const ShoppingCartItemView({
    this.lastIndex = false,
    required this.packagePrice,
    required this.packageType,
    required this.quantity,
    required this.addonImage,
    Key? key,
    required this.isAddOn,
  }) : super(key: key);
  final bool lastIndex;
  final String packageType;
  final double packagePrice;
  final int quantity;
  final String addonImage;
  final bool isAddOn;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                width: boxWidth,
                height: boxHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.k_4),
                  ),
                  border: Border.all(
                    color: context.adColors.tileBorderColor,
                    width: borderWidth,
                  ),
                  color: context.adColors.whiteTextColor,
                ),
                child: !Utils.startsWithHttp(addonImage)
                    ? Container(
                        padding: isAddOn
                            ? EdgeInsets.zero
                            : EdgeInsets.only(
                                left: context.k_10,
                                right: context.k_10,
                              ),
                        child: Center(
                          child: Image.asset(
                            addonImage,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(
                          context.k_4,
                        ),
                        child: ADCachedImage(imageUrl: addonImage),
                      ),
              ),
            ),
            ADSizedBox(
              width: context.k_22,
            ),
            Expanded(
              flex: cartFlex,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          packageType,
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.greyTextColor),
                        ),
                        ADSizedBox(
                          height: context.k_4,
                        ),
                        Text(
                          'Quantity $quantity',
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.greyTextColor),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    FlightUtils.getPriceFormatWithSymbol(price: packagePrice),
                    style: ADTextStyle700.size16
                        .setTextColor(context.adColors.filterBlackText),
                  ),
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: lastIndex,
          child: Divider(
            height: context.k_40,
            color: context.adColors.greyTextColor,
          ),
        ),
      ],
    );
  }
}
