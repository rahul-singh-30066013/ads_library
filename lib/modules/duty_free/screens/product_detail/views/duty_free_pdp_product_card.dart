/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

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
class DutyFreePdpProductCard extends StatefulWidget {
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
  /// *[addText] is the text to be displayed in elevated button for localization
  /// *[isBorderRequired] decides whether border need to be displayed or not
  /// *[onTap] handles on press of add button
  const DutyFreePdpProductCard({
    Key? key,
    required this.skuCode,
    this.height,
    //this.width,
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
  State<DutyFreePdpProductCard> createState() => _DutyFreePdpProductCardState();
}

class _DutyFreePdpProductCardState extends State<DutyFreePdpProductCard>
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
    //final RegExp offerWidth = RegExp(r'([.]*0)(?!.*\d)');
    const double scaledHeight = 320;
    final double offerWidth = 55.sp;
    final double offerExclusiveWidth = 90.sp;
    final scaledWidth = widget.isBorderRequired ? 266.sp : 233.sp;
    //final buttonWidth = 116.sp;
    const priceFontHeight = 1.4;
    const maxLines = 2;
    const sliderRatio = 0.4489795;
    const double addedHeight = 50;
    const Color earnTextColor = Color(0xff666666);
    final discountPrice = double.parse(
      widget.discountedPrice.validateWithDefaultValue(
        defaultValue: '0',
      ),
    );
    final width =
        (context.widthOfScreen - (context.k_16 * maxLines)) * sliderRatio;
    //const lineHeight = 1.5;

    const strokeWidth = 2.0;
    const cornerRadius = 4.0;

    return Stack(
      children: [
        Container(
          width: width,
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
                      height: (widget.imageScaledHeight ?? scaledHeight) +
                          addedHeight,
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
                              ? context.adColors.lightGreyColor
                              : context.adColors.transparentColor,
                        ),
                        color: !widget.isBorderRequired &&
                                !widget.isImageBorderRequired
                            ? context.adColors.containerGreyBg
                            : null,
                      ),
                      child: Stack(
                        children: [
                          if (Utils.startsWithHttp(widget.image))
                            Center(
                              child: Hero(
                                tag: widget.timeStamp,
                                child: ADCachedImage(
                                  imageUrl: widget.image,
                                  width: widget.imageScaledWidth ?? scaledWidth,
                                  height:
                                      widget.imageScaledHeight ?? scaledHeight,
                                  boxFit: BoxFit.contain,
                                ),
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
                            ),
                        ],
                      ),
                    ),
                    //end container
                    // ADSizedBox(
                    //   height: context.k_16,
                    // ),
                    ADSizedBox(
                      height: context.k_40,
                      child: Text(
                        widget.title,
                        style: widget.titleTextStyle ??
                            ADTextStyle400.size14.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: maxLines,
                      ),
                    ),
                    // ADSizedBox(
                    //   height: context.k_13,
                    // ),
                    RichText(
                      maxLines: maxLines,
                      text: TextSpan(
                        style: TextStyle(
                          color: context.adColors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '${FlightUtils.getPriceFormatWithSymbol(
                              price: double.tryParse(
                                    discountPrice > 0
                                        ? widget.discountedPrice ?? ''
                                        : widget.actualPrice,
                                  ) ??
                                  0,
                            )}  ',
                            style: ADTextStyle700.size14
                                .setFontHeight(priceFontHeight),
                          ),
                          // if (discountPrice > 0 && discountedPrice != actualPrice)
                          //   TextSpan(
                          //     text: FlightUtils.getPriceFormatWithSymbol(
                          //       price: double.tryParse(actualPrice) ?? 0,
                          //     ),
                          //     style: ADTextStyle400.size12
                          //         .setTextColor(
                          //           context.adColors.greyTextColor,
                          //         )
                          //         .copyWith(
                          //           decoration: TextDecoration.lineThrough,
                          //         ),
                          //   ),
                        ],
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_14,
                    ),
                    if (widget.availability)
                      ADSizedBox(
                        width: width,
                        child: Selector<DutyFreeState, bool>(
                          selector: (context, catalogListViewModel) => context
                              .read<DutyFreeState>()
                              .isProgressMap
                              .containsKey(
                                widget.skuCode,
                              ),
                          builder: (
                            BuildContext context,
                            state,
                            Widget? child,
                          ) {
                            switch (state) {
                              case false:
                                return Column(
                                  children: [
                                    if (widget.productCartQty == 0)
                                      ElevatedButton(
                                        // onPressed: widget.onTap,
                                        onPressed: () => {
                                          _animateCardOutline(),
                                          widget.onTap?.call(),
                                        },
                                        style: ElevatedButton.styleFrom(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          primary:
                                              context.adColors.whiteTextColor,
                                          shadowColor: Colors.transparent,
                                          // fixedSize: Size(
                                          //   buttonWidth,
                                          //   context.k_40,
                                          // ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              context.k_40,
                                            ),
                                            side: const BorderSide(
                                              color: Color(0xffC1C2C7),
                                            ),
                                          ),
                                          elevation: 0,
                                          fixedSize: Size(
                                            width,
                                            k_42.sp,
                                          ),
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
                                    else
                                      ADSizedBox(
                                        width: width,
                                        child: ADCounterButton(
                                          onIncrementTapHandler: (int value) =>
                                              {
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
                                          counterNumber: widget.productCartQty,
                                          maxCounterLimit: widget.maxQuantity,
                                        ),
                                      ),
                                  ],
                                );

                              case true:
                                return Container(
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
                                );

                              default:
                                return const ADSizedBox.shrink();
                            }
                          },
                        ),
                      )
                    else
                      OutOfStock(
                        fixedSize: Size(
                          width,
                          k_42.sp,
                        ),
                        textStyle: ADTextStyle400.size14.setTextColor(
                          context.adColors.darkGreyTextColor,
                        ),
                      ),
                    if (widget.bonusString.isNotEmpty &&
                        (num.tryParse(
                                  widget.bonusString
                                      .replaceAll(RegExp('[^0-9]'), ''),
                                ) ??
                                0) >
                            1)
                      Column(
                        children: [
                          if (widget.bonusString.isNotEmpty)
                            ADSizedBox(
                              height: context.k_12,
                            ),
                          Visibility(
                            visible: widget.bonusString.isNotEmpty,
                            maintainState: true,
                            maintainSize: true,
                            maintainAnimation: true,
                            child: widget.bonusString.isNotEmpty
                                ? Row(
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
                                        style:
                                            ADTextStyle500.size12.setTextColor(
                                          earnTextColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ).paddingBySide(
                                    bottom: context.k_6,
                                  )
                                : const ADSizedBox.shrink(),
                          ),
                        ],
                      ),

                    // Expanded(child: ADSizedBox()),
                    // else
                    //   const ADSizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (!widget.isExclusive && (widget.promotions?.isNotEmpty ?? false))
          Container(
            width: offerWidth,
            height: context.k_22,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: widget.isBorderRequired
                  ? context.adColors.greenColor.withOpacity(
                      widget.isBorderRequired ? backgroundOpacity : 1,
                    )
                  : context.adColors.whiteTextColor,
            ),
            child: Text(
              'offer'.localize(context),
              style: ADTextStyle700.size10.copyWith(
                color: context.adColors.greenTextColor,
              ),
            ).paddingBySide(left: context.k_8, top: context.k_4),
          ).paddingBySide(left: context.k_8, top: context.k_8),
        if (widget.isExclusive && (widget.promotions?.isEmpty ?? false))
          Container(
            width: offerWidth,
            height: context.k_18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: widget.isBorderRequired
                  ? context.adColors.adLogoGradient4.withOpacity(
                      widget.isBorderRequired ? backgroundOpacity : 1,
                    )
                  : context.adColors.whiteTextColor,
            ),
            child: Text(
              'exclusive'.localize(context),
              style: ADTextStyle700.size8.copyWith(
                color: context.adColors.adLogoGradient4,
              ),
            ).paddingBySide(left: context.k_8, top: context.k_4),
          ).paddingBySide(left: context.k_8, top: context.k_8),
        if (widget.isExclusive && (widget.promotions?.isNotEmpty ?? false))
          Container(
            width: offerExclusiveWidth,
            height: context.k_18,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: widget.isBorderRequired
                  ? context.adColors.adLogoGradient4.withOpacity(
                      widget.isBorderRequired ? backgroundOpacity : 1,
                    )
                  : context.adColors.whiteTextColor,
            ),
            child: Text(
              '${'exclusive'.localize(context)} + ${'offer'.localize(context)}',
              style: ADTextStyle700.size8.copyWith(
                color: context.adColors.adLogoGradient4,
              ),
            ).paddingBySide(left: context.k_8, top: context.k_4),
          ).paddingBySide(left: context.k_8, top: context.k_8),
        // Text(
        //   'offer'.localize(context),
        //   style: ADTextStyle700.size10.copyWith(
        //     color: context.adColors.greenTextColor,
        //   ),
        // ).paddingBySide(left: context.k_14,top: context.k_12),
      ],
    );

    /*   return Selector<DutyFreeState, bool>(
      selector: (context, catalogListViewModel) => isProgress,
      builder: (BuildContext context, state, Widget? child) {
        switch (state) {
          case false:
            return Container(
              width: width ?? scaledWidth,
              height: height ?? scaledHeight,
              padding: isBorderRequired
                  ? EdgeInsets.only(
                      left: context.k_16,
                      right: context.k_16,
                      bottom: context.k_16,
                    )
                  : null,
              decoration: BoxDecoration(
                color: backgroundColor ?? ADColors.white,
                border: Border.all(
                  width: isBorderRequired ? 1.sp : 0,
                  color: isBorderRequired
                      ? const Color(0xffE2E2E2)

                      ///TODO
                      : context.adColors.transparentColor,
                ),
                borderRadius: BorderRadius.circular(
                  borderRadius != null ? borderRadius?.sp ?? 0 : context.k_8,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: imageScaledWidth ?? scaledWidth,
                        height: imageScaledHeight ?? scaledHeight,
                        margin: isBorderRequired
                            ? EdgeInsets.symmetric(vertical: context.k_16)
                            : null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            borderRadius ?? 0,
                          ),
                          border: isImageBorderRequired
                              ? Border.all(
                                  color: context.adColors.lightGreyColor,
                                )
                              : Border.all(
                                  color: context.adColors.transparentColor,
                                ),
                          color: !isBorderRequired && !isImageBorderRequired
                              ? context.adColors.containerGreyBg
                              : null,
                        ),
                        child: image.contains('http')
                            ? ADCachedImage(
                                imageUrl: image,
                                boxFit: BoxFit.contain,
                              )
                            : Icon(
                                Icons.image_rounded,
                                color: context.adColors
                                    .dividerColor, // Color(0xfff7f7f7),
                                size: context.k_56,
                              ),
                      ),
                      if (isBonusBorderRequired)
                        Positioned(
                          bottom: context.k_16,
                          child: Container(
                            width: _k_96,
                            height: context.k_30,
                            decoration:
                                const BoxDecoration(color: bonusCardColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  'Earn 2x',
                                  style: ADTextStyle600.size14.setTextColor(
                                    context.adColors.blackColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        const ADSizedBox.shrink(),
                    ],
                  ),
                  ADSizedBox(
                    height: context.k_16,
                  ),
                  Text(
                    '$title\n',
                    style: titleTextStyle ??
                        ADTextStyle500.size18.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: context.adColors.black),
                              children: [
                                if (discountPrice > 0 &&
                                    discountedPrice != actualPrice)
                                  TextSpan(
                                    text:
                                        '${FlightUtils.getPriceFormatWithSymbol(price: double.tryParse(actualPrice) ?? 0)}\n',
                                    style: ADTextStyle400.size14
                                        .setTextColor(
                                          context.adColors.greyTextColor,
                                        )
                                        .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
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
                              ],
                            ),
                          ),
                        ),
                        if (isItemAvailable)
                          IntrinsicHeight(
                            child: Selector<DutyFreeState, bool>(
                              selector: (context, catalogListViewModel) =>
                                  false,
                              builder:
                                  (BuildContext context, state, Widget? child) {
                                switch (state) {
                                  case false:
                                    return Column(
                                      children: [
                                        if (productCartQty == 0)
                                          ElevatedButton(
                                            onPressed: onTap,
                                            style: ElevatedButton.styleFrom(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              primary: context
                                                  .adColors.whiteTextColor,
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

                                                  ///TODO
                                                ),
                                              ),
                                              elevation: 0,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                style: ADTextStyle600.size14
                                                    .setTextColor(
                                                      context
                                                          .adColors.blueColor,
                                                    )
                                                    .setFontHeight(1),
                                                children: [
                                                  TextSpan(text: ' $addText '),
                                                  const TextSpan(
                                                    text: '\u207A',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        else
                                          ADSizedBox(
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
                                                  onError(context),
                                              counterNumber: productCartQty,
                                              maxCounterLimit: maxQuantity,
                                            ),
                                          ),
                                      ],
                                    );

                                  case true:
                                    return Container(
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
                                      ),
                                    );

                                  default:
                                    return const ADSizedBox.shrink();
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );

          case true:
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(28),
                ),
                color: context.adColors.blueColor.withOpacity(1),
              ),
              height: k_42.sp,
              width: k_80.sp,
              child: ADDotProgressView(
                color: context.adColors.whiteTextColor,
                size: context.k_4,
              ),
            );

          default:
            return const ADSizedBox.shrink();
        }
      },
    );*/
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
