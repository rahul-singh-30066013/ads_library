/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_controller.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This  is used to create a card for product which includes -
///image, title, price, and add button
const int maxLines = 2;
const double fontHeight = 1.4;
const double buttonWidth = 122;
const double buttonHeight = 40;
const double widthRatio = 2.6;
double containerHeight = 308.sp;
double heightOfText = 40.sp;
const int operationId = 2;

class AddOnsContainerView extends StatefulWidget {
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

  final PackageAddOn packageAddon;

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
  final CartScreenController state;

  ///Decides whether border need to be displayed or not
  final Color? backgroundColor;

  ///Handles on press of add button
  final ADTapCallback? onTap;
  final bool isAdded;
  final bool isLoading;
  final int index;

  const AddOnsContainerView({
    Key? key,
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
    this.isAdded = false,
    required this.isLoading,
    required this.state,
    required this.packageAddon,
    required this.index,
  }) : super(key: key);

  @override
  State<AddOnsContainerView> createState() => _AddOnsContainerViewState();
}

class _AddOnsContainerViewState extends State<AddOnsContainerView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final buildContext = super.build(context);
    adLog(buildContext.toString());
    final double imageHeight = 148.sp;

    return widget.isAdded
        ? const SizedBox.shrink()
        : Container(
            height: containerHeight,
            margin: EdgeInsets.only(
              left: context.k_10,
              right: context.k_10,
            ),
            width: widget.width ?? context.widthOfScreen / widthRatio,
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? ADColors.white,
              border: Border.all(
                color: widget.isBorderRequired
                    ? context.adColors.tileBorderColor
                    : context.adColors.whiteTextColor,
              ),
              borderRadius: BorderRadius.circular(context.k_8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.k_8),
                    topRight: Radius.circular(context.k_8),
                  ),
                  child: Container(
                    height: imageHeight,
                    decoration: BoxDecoration(
                      color: !widget.isBorderRequired
                          ? context.adColors.containerGreyBg
                          : null,
                      borderRadius: BorderRadius.circular(context.k_8),
                    ),
                    child: Utils.startsWithHttp(widget.image)
                        ? ADCachedImage(
                            imageUrl: widget.image,
                            // placeholder: widget.placeHolder,
                            boxFit: BoxFit.fill,
                          )
                        : Image.asset(
                            widget.image,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: heightOfText,
                  child: Text(
                    widget.title,
                    style: ADTextStyle700.size16,
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ).paddingBySide(left: context.k_16, right: context.k_16),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: context.adColors.black),
                    children: [
                      // if (widget.discountedPrice != null)
                      //   TextSpan(
                      //     text: '₹${widget.actualPrice}\n',
                      //     style: ADTextStyle400.size14
                      //         .setTextColor(context.adColors.greyTextColor)
                      //         .copyWith(decoration: TextDecoration.lineThrough),
                      //   ),
                      TextSpan(
                        text:
                            '₹${widget.discountedPrice ?? widget.actualPrice}',
                        style: ADTextStyle700.size16.setFontHeight(fontHeight),
                      ),
                    ],
                  ),
                ).paddingBySide(left: context.k_16, right: context.k_16),
                SizedBox(
                  height: context.k_14,
                ),
                ElevatedButton(
                  onPressed: !widget.isAdded ? widget.onTap : () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !widget.isAdded
                        ? context.adColors.whiteTextColor
                        : context.adColors.blueColor,
                    fixedSize: Size(
                      context.scaled(buttonWidth),
                      context.scaled(buttonHeight),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        context.scaled(context.k_40),
                      ),
                      side: BorderSide(
                        color: context.adColors.tileBorderColor,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: !widget.isAdded
                      ? widget.isLoading
                          ? ADDotProgressView(
                              size: context.k_8,
                              color: context.adColors.blackTextColor,
                            )
                          : RichText(
                              text: TextSpan(
                                style: ADTextStyle700.size16
                                    .setTextColor(
                                      context.adColors.blueColor,
                                    )
                                    .setFontHeight(1),
                                children: [
                                  TextSpan(
                                    text: ' ${widget.addText} ',
                                  ),
                                  TextSpan(
                                    text: '\u207A',
                                    style: TextStyle(
                                      fontSize: context.k_20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                      : widget.isLoading
                          ? ADDotProgressView(
                              size: context.k_8,
                              color: context.adColors.whiteTextColor,
                            )
                          : Row(
                              children: [
                                SizedBox(
                                  width: context.k_20,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => widget.state.onAddTap(
                                      widget.packageAddon,
                                      quantity: widget.packageAddon.qty > 0
                                          ? widget.packageAddon.qty - 1
                                          : 0,
                                      context: context,
                                      addonIndex: widget.index,
                                      cartItemIndex: 0,
                                    ),
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  widget.state
                                      .getAddonQuantity(
                                        widget.packageAddon,
                                      )
                                      .toString(),
                                  style: ADTextStyle700.size16.setTextColor(
                                    context.adColors.whiteTextColor,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: context.k_20,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => widget.state.onAddTap(
                                      widget.packageAddon,
                                      quantity: widget.packageAddon.qty + 1,
                                      context: context,
                                      addonIndex: widget.index,
                                      cartItemIndex: 0,
                                    ),
                                    icon: const Icon(
                                      Icons.add,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                  bottom: context.k_16,
                ),
              ],
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
