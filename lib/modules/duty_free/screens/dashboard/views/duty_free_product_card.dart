/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:ui';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_promotion_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/out_of_stock.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/ad_counter_button.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/animated_border.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const k_42 = 42;
const k_80 = 80;
const k_10 = 10;
const double backgroundOpacity = 0.07000000029802322;

///This widget is used to create a card for duty free product which includes -
///image, title, price, and add button
class DutyFreeProductCard extends StatefulWidget {
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
  const DutyFreeProductCard({
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
  }) : super(key: key);

  @override
  State<DutyFreeProductCard> createState() => _DutyFreeProductCardState();
}

class _DutyFreeProductCardState extends State<DutyFreeProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.reset();
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    const double scaledHeight = 320;
    final scaledWidth = widget.isBorderRequired ? 266.sp : 233.sp;
    final buttonWidth = 116.sp;
    const priceFontHeight = 1.4;
    const maxLines = 2;
    const double addedHeight = 50;
    const Color earnTextColor = Color(0xff666666);
    final discountPrice = double.parse(
      widget.discountedPrice.validateWithDefaultValue(
        defaultValue: '0',
      ),
    );
    const lineHeight = 1.5;

    const strokeWidth = 2.0;
    const cornerRadius = 10.0;

    return Container(
      width: widget.width ?? scaledWidth,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? ADColors.white,
        border: Border.all(
          width: widget.isBorderRequired ? 1.sp : 0,
          color: widget.isBorderRequired
              ? const Color(0xffE2E2E2)

              ///TODO
              : context.adColors.transparentColor,
        ),
        borderRadius: BorderRadius.circular(
          widget.borderRadius != null
              ? widget.borderRadius?.sp ?? 0
              : context.k_8,
        ),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => CustomPaint(
          painter: AnimatedBorder(
            currentState: _controller.value,
            strokeWidth: _controller.value == 0 ? 0 : strokeWidth,
            radius: cornerRadius,
          ),
          child: Container(
            padding: widget.isBorderRequired
                ? EdgeInsets.only(
                    left: context.k_16,
                    right: context.k_16,
                  )
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widget.imageScaledWidth ?? scaledWidth,
                  height:
                      (widget.imageScaledHeight ?? scaledHeight) + addedHeight,
                  // height: 220.sp,
                  // margin: isBorderRequired
                  //     ? EdgeInsets.symmetric(vertical: context.k_16)
                  //     : null,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? 0,
                    ),
                    border: Border.all(
                      color: widget.isImageBorderRequired
                          ? context.adColors.greyCircleColor
                          : context.adColors.transparentColor,
                    ),
                    color: !widget.isBorderRequired &&
                            !widget.isImageBorderRequired
                        ? context.adColors.containerGreyBg
                        : null,
                  ),
                  child: Stack(
                    children: [
                      if (widget.promotions?.isNotEmpty ?? false)
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Opacity(
                              opacity: widget.isBorderRequired
                                  ? backgroundOpacity
                                  : 1,
                              child: Container(
                                width: context.k_56,
                                height: context.k_24,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  color: widget.isBorderRequired
                                      ? context.adColors.greenColor
                                      : context.adColors.whiteTextColor,
                                ),
                              ),
                            ),
                            Text(
                              'offer'.localize(context),
                              style: ADTextStyle700.size12.copyWith(
                                color: context.adColors.greenTextColor,
                              ),
                            ),
                          ],
                        ).paddingBySide(
                          left: ((widget.promotions?.isNotEmpty) ?? false)
                              ? widget.isBorderRequired
                                  ? 0
                                  : context.k_8
                              : 0,
                          top: context.k_8,
                        ),
                      if (Utils.startsWithHttp(widget.image))
                        Hero(
                          tag: widget.timeStamp,
                          child: ADCachedImage(
                            imageUrl: widget.image,
                            boxFit: BoxFit.contain,
                          ).paddingBySide(
                            left: context.k_30,
                            right: context.k_30,
                            top: context.k_36,
                            bottom: context.k_36,
                          ),
                        )
                      else
                        ADCachedImage(
                          imageUrl: widget.image,
                          boxFit: BoxFit.contain,
                        ).paddingBySide(
                          left: context.k_30,
                          right: context.k_30,
                          top: context.k_36,
                          bottom: context.k_36,
                        ),
                    ],
                  ),
                ),
                //end container
                ADSizedBox(
                  height: context.k_16,
                ),
                SizedBox(
                  height: context.k_40,
                  child: Text(
                    widget.title,
                    style: widget.titleTextStyle ??
                        ADTextStyle500.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
                ),
                ADSizedBox(
                  height: context.k_13,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: context.adColors.black),
                          children: [
                            if (discountPrice > 0 &&
                                widget.discountedPrice != widget.actualPrice)
                              TextSpan(
                                text:
                                    '${FlightUtils.getPriceFormatWithSymbol(price: double.tryParse(widget.actualPrice) ?? 0)}\n',
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
                                          ? widget.discountedPrice ?? ''
                                          : widget.actualPrice,
                                    ) ??
                                    0,
                              ),
                              style: ADTextStyle700.size16
                                  .setFontHeight(priceFontHeight),
                            ),
                            if ((widget.promotions?.isNotEmpty ?? false) &&
                                widget.promotions?.first.type == 1 &&
                                widget.promotions?.first.quantity == 1)
                              TextSpan(
                                text:
                                    '\n${(double.tryParse(widget.promotions?.first.offer ?? '0') ?? 0).toString().replaceAll(regex, '')}${'offLabel'.localize(context)}',
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
                    if (widget.availability)
                      IntrinsicHeight(
                        child: SizedBox(
                          width: buttonWidth,
                          child: Selector<DutyFreeState, bool>(
                            selector: (context, catalogListViewModel) =>
                                catalogListViewModel.isProgressMap.containsKey(
                              widget.skuCode,
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
                                        color: context.adColors.blueColor
                                            .withOpacity(1),
                                      ),
                                      height: k_42.sp,
                                      width: k_80.sp,
                                      child: ADDotProgressView(
                                        color: context.adColors.whiteTextColor,
                                        size: context.k_4,
                                      ),
                                    )
                                  : context.read<DutyFreeState>().getSkuQty(
                                                widget.skuCode,
                                                storeType: context
                                                    .read<DutyFreeState>()
                                                    .terminalModel
                                                    .value
                                                    .code,
                                              ) <=
                                          0
                                      ? ElevatedButton(
                                          onPressed: () => {
                                            if (widget.isBorderRequired)
                                              _animateCardOutline(),
                                            widget.onTap?.call(),
                                          },
                                          style: ElevatedButton.styleFrom(
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            primary:
                                                context.adColors.whiteTextColor,
                                            shadowColor: Colors.transparent,
                                            fixedSize: Size(
                                              buttonWidth,
                                              context.k_40,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                              style: ADTextStyle600.size16
                                                  .setTextColor(
                                                    context.adColors.blueColor,
                                                  )
                                                  .setFontHeight(1),
                                              children: [
                                                TextSpan(
                                                  text: ' ${widget.addText} ',
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
                                                (int value) => {
                                              _animateCardOutline(),
                                              widget.onIncrementTapHandler
                                                  ?.call(value),
                                            },
                                            onDecrementTapHandler:
                                                widget.onDecrementTapHandler ??
                                                    (int value) {
                                                      adLog('');
                                                    },
                                            onErrorTapHandler: (int value) =>
                                                adLog('value excedeed'),
                                            counterNumber: context
                                                .read<DutyFreeState>()
                                                .getSkuQty(
                                                  widget.skuCode,
                                                  storeType: context
                                                      .read<DutyFreeState>()
                                                      .terminalModel
                                                      .value
                                                      .code,
                                                ),
                                            maxCounterLimit: widget.maxQuantity,
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
                if (widget.bonusString.isNotEmpty &&
                    (num.tryParse(
                              widget.bonusString
                                  .replaceAll(RegExp('[^0-9]'), ''),
                            ) ??
                            0) >
                        1)
                  Visibility(
                    visible: widget.bonusString.isNotEmpty,
                    maintainState: true,
                    maintainSize: true,
                    maintainAnimation: true,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.coinIcon,
                          height: context.k_20,
                          width: context.k_20,
                        ),
                        ADSizedBox(
                          width: context.k_6,
                        ),
                        Text(
                          widget.bonusString,
                          style: ADTextStyle500.size12.setTextColor(
                            earnTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ).paddingBySide(
                      bottom: context.k_6,
                    ),
                  ),
                // else
                //   const ADSizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _animateCardOutline() {
    const delayDuration = Duration(milliseconds: 200);
    _controller.reset();
    _controller.forward().whenComplete(
      () {
        Future.delayed(
          delayDuration,
          () => _controller.reset(),
        );
      },
    );
  }
}
