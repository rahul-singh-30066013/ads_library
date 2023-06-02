/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_promotion_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/out_of_stock.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/ad_counter_button.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const k_42 = 42;
const k_80 = 80;
const k_10 = 10;
const double backgroundOpacity = 0.07000000029802322;

///This widget is used to create a exclusive card for duty free exclusive products which includes -
///image, title, price, and add button
class DutyFreeExclusiveProductCard extends StatelessWidget {
  ///Image to be displayed using network
  final String image;

  ///Placeholder to be displayed while image is loading
  final String placeHolder;

  ///Title of the product
  final String title;

  ///Actual price of product without discounts
  final String actualPrice;

  ///Discounted price of product (if available)
  final String? discountedPrice;

  ///Height of the widget
  ///Default value assigned
  final double? height;

  ///skuCode, is used to uniquely identify the item
  final String skuCode;

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

  ///handles border radius
  final double? borderRadius;

  ///bool to check to display border around image
  final bool isImageBorderRequired;

  ///bool to check to display border around image
  final bool isBonusBorderRequired;

  ///string to set loyalty type
  final String bonusString;

  /// scaled width for image
  final double? imageScaledWidth;

  /// scaled height for image
  final double? imageScaledHeight;

  /// text style for title
  final TextStyle? titleTextStyle;

  /// text style for discount price
  final TextStyle? discountPriceTextStyle;

  /// text style for price
  final TextStyle? priceTextStyle;

  ///use this function to decrement product cart qty
  final ADCounterTapCallback? onDecrementTapHandler;

  ///use this function to increment product cart qty
  final ADCounterTapCallback? onIncrementTapHandler;

  ///use to set product price after discount in this product
  final bool availability;

  ///use to set product cart qty.
  final int productCartQty;

  ///use to restrict the max quantity
  final int maxQuantity;

  final int index;

  final String timeStamp;

  final List<DutyFreeProductPromotionModel>? promotions;

  final bool isExclusive;

  ///Below is the example on usage of widget:
  /// ```
  /// ```
  /// *[image] is the product image to be displayed using network
  /// *[placeHolder] is to be displayed while image is loading
  /// *[title] is the product title
  /// *[actualPrice] of product without discounts
  /// *[discountedPrice] is the product image to be displayed using network
  /// *[height] is the height of the widget
  /// *[width] is the width of the widget
  /// *[addText] is the text to be displayed in elevated button for localization
  /// *[isBorderRequired] decides whether border need to be displayed or not
  /// *[onTap] handles on press of add button
  const DutyFreeExclusiveProductCard({
    Key? key,
    required this.skuCode,
    this.height,
    this.width,
    required this.image,
    required this.title,
    required this.actualPrice,
    this.discountedPrice,
    required this.placeHolder,
    required this.addText,
    this.isBorderRequired = true,
    this.backgroundColor,
    this.onTap,
    this.borderRadius,
    this.isImageBorderRequired = false,
    this.isBonusBorderRequired = false,
    required this.bonusString,
    this.imageScaledWidth,
    this.imageScaledHeight,
    this.titleTextStyle,
    this.discountPriceTextStyle,
    this.priceTextStyle,
    this.onIncrementTapHandler,
    this.onDecrementTapHandler,
    this.productCartQty = 0,
    this.maxQuantity = k_10,
    this.promotions,
    required this.index,
    required this.timeStamp,
    required this.availability,
    this.isExclusive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    const double scaledHeight = 320;
    final scaledWidth = 233.sp;
    final buttonWidth = 105.sp;
    const priceFontHeight = 1.4;
    const maxLines = 2;
    const lineHeight = 1.5;
    final discountPrice = double.parse(
      discountedPrice.validateWithDefaultValue(
        defaultValue: '0',
      ),
    );

    return Container(
      width: width ?? scaledWidth,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            child: Container(
              width: imageScaledWidth ?? scaledWidth,
              height: imageScaledHeight ?? scaledHeight,
              child: Stack(
                children: [
                  // if (isExclusive && (promotions?.isEmpty ?? false))
                  //   Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       Opacity(
                  //         opacity: backgroundOpacity,
                  //         child: Container(
                  //           width: k_80.sp,
                  //           height: context.k_24,
                  //           decoration: BoxDecoration(
                  //             borderRadius: const BorderRadius.all(
                  //               Radius.circular(8),
                  //             ),
                  //             color: context.adColors.adLogoGradient4,
                  //           ),
                  //         ),
                  //       ),
                  //       Text(
                  //         'exclusive'.localize(context),
                  //         style: ADTextStyle700.size12.copyWith(
                  //           color: context.adColors.adLogoGradient4,
                  //         ),
                  //       ),
                  //     ],
                  //   ).paddingBySide(
                  //     bottom: isExclusive ? context.k_16 : 0,
                  //   ),
                  // if (isExclusive && (promotions?.isNotEmpty ?? false))
                  //   Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       Opacity(
                  //         opacity: backgroundOpacity,
                  //         child: Container(
                  //           width: k_131.sp,
                  //           height: context.k_24,
                  //           decoration: BoxDecoration(
                  //             borderRadius: const BorderRadius.all(
                  //               Radius.circular(8),
                  //             ),
                  //             color: context.adColors.adLogoGradient4,
                  //           ),
                  //         ),
                  //       ),
                  //       Text(
                  //         '${'exclusive'.localize(context)} + ${'offer'.localize(context)}',
                  //         style: ADTextStyle700.size12.copyWith(
                  //           color: context.adColors.adLogoGradient4,
                  //         ),
                  //       ),
                  //     ],
                  //   ).paddingBySide(
                  //     bottom: isExclusive ? context.k_16 : 0,
                  //   ),
                  if (Utils.startsWithHttp(image))
                    Hero(
                      tag: timeStamp,
                      child: ADCachedImage(
                        imageUrl: image,
                        boxFit: BoxFit.fill,
                      ),
                    )
                  else
                    ADCachedImage(
                      imageUrl: image,
                      boxFit: BoxFit.fill,
                    ),
                ],
              ),
            ),
          ),
          //end container
          ADSizedBox(
            height: context.k_20,
          ),
          SizedBox(
            height: context.k_48,
            child: Text(
              title,
              style: titleTextStyle ??
                  ADTextStyle500.size18.setTextColor(
                    context.adColors.blackTextColor,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: context.adColors.black),
                    children: [
                      if (discountPrice > 0 && discountedPrice != actualPrice)
                        TextSpan(
                          text:
                              '${FlightUtils.getPriceFormatWithSymbol(price: double.tryParse(actualPrice) ?? 0)}\n',
                          style: ADTextStyle400.size14
                              .setTextColor(
                                context.adColors.greyTextColor,
                              )
                              .copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                      TextSpan(
                        text: FlightUtils.getPriceFormatWithSymbol(
                          price: double.tryParse(
                                discountPrice > 0
                                    ? discountedPrice ?? ''
                                    : actualPrice,
                              ) ??
                              0,
                        ),
                        style: ADTextStyle700.size16
                            .setFontHeight(priceFontHeight),
                      ),
                      if ((promotions?.isNotEmpty ?? false) &&
                          promotions?.first.type == 1 &&
                          promotions?.first.quantity == 1)
                        TextSpan(
                          text:
                              '\n${(double.tryParse(promotions?.first.offer ?? '0') ?? 0).toString().replaceAll(regex, '')}${'offLabel'.localize(context)}',
                          style: ADTextStyle700.size12.copyWith(
                            height: lineHeight,
                            color: context.adColors.greenTextColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (availability)
                IntrinsicHeight(
                  child: SizedBox(
                    width: buttonWidth,
                    height: context.k_38,
                    child: Selector<DutyFreeState, bool>(
                      selector: (context, catalogListViewModel) =>
                          catalogListViewModel.isProgressMap.containsKey(
                        skuCode,
                      ),
                      builder: (
                        BuildContext context,
                        state,
                        Widget? child,
                      ) {
                        return state
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                  color:
                                      context.adColors.blueColor.withOpacity(1),
                                ),
                                height: k_42.sp,
                                width: k_80.sp,
                                child: ADDotProgressView(
                                  color: context.adColors.whiteTextColor,
                                  size: context.k_4,
                                ),
                              )
                            : context.read<DutyFreeState>().getSkuQty(
                                          skuCode,
                                          storeType: context
                                              .read<DutyFreeState>()
                                              .terminalModel
                                              .value
                                              .code,
                                        ) <=
                                    0
                                ? ElevatedButton(
                                    onPressed: onTap,
                                    style: ElevatedButton.styleFrom(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      backgroundColor:
                                          context.adColors.whiteTextColor,
                                      shadowColor: Colors.transparent,
                                      fixedSize: Size(
                                        buttonWidth,
                                        context.k_40,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          context.k_40,
                                        ),
                                        side: const BorderSide(
                                          color: Color(0xffC1C2C7),
                                        ),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        style: ADTextStyle700.size16
                                            .setTextColor(
                                              context.adColors.blueColor,
                                            )
                                            .setFontHeight(1),
                                        children: [
                                          TextSpan(
                                            text: ' $addText ',
                                          ),
                                          const TextSpan(
                                            text: '\u207A',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: buttonWidth,
                                    child: ADCounterButton(
                                      onIncrementTapHandler:
                                          onIncrementTapHandler ??
                                              (int value) {
                                                adLog('');
                                              },
                                      onDecrementTapHandler:
                                          onDecrementTapHandler ??
                                              (int value) {
                                                adLog('');
                                              },
                                      onErrorTapHandler: (int value) =>
                                          adLog('value exceeded'),
                                      counterNumber: context
                                          .read<DutyFreeState>()
                                          .getSkuQty(
                                            skuCode,
                                            storeType: context
                                                .read<DutyFreeState>()
                                                .terminalModel
                                                .value
                                                .code,
                                          ),
                                      maxCounterLimit: maxQuantity,
                                    ),
                                  );
                      },
                    ),
                  ),
                )
              else
                OutOfStock(
                  fixedSize: Size(buttonWidth, context.k_40),
                  textStyle: ADTextStyle400.size14.setTextColor(
                    context.adColors.darkGreyTextColor,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
