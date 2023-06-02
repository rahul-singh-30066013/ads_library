/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = 150.sp;
    final double imageWidth = 100.sp;
    final double imageHeight = 150.sp;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: context.k_36,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.k_8,
              ),
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                height: imageHeight,
                width: imageWidth,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CartShimmerBox(
                    customPadding: EdgeInsets.only(
                      left: context.k_16,
                      bottom: context.k_20,
                      right: context.k_16,
                      top: context.k_10,
                    ),
                    width: imageWidth,
                  ),
                  const _CartShimmerBox(),
                  _CartShimmerBox(
                    customPadding: EdgeInsets.only(
                      left: context.k_16,
                      right: context.k_16,
                      bottom: context.k_10,
                    ),
                    width: imageWidth,
                  ),
                  const _CartShimmerBox(),
                  const _CartShimmerBox(),
                  SizedBox(
                    height: context.k_36,
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: context.k_8,
          height: context.k_10,
          color: dividerColor,
        ),
        _CartShimmerBox(
          height: context.k_64,
          customPadding: EdgeInsets.zero,
        ),
        Divider(
          thickness: context.k_8,
          height: context.k_10,
          color: dividerColor,
        ),
        SizedBox(
          height: context.k_20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CartShimmerBox(
              customPadding: EdgeInsets.only(
                right: context.k_16,
                bottom: context.k_36,
                left: context.k_16,
              ),
              width: width,
            ),
            const _CartShimmerBox(),
            const _CartShimmerBox(),
            const _CartShimmerBox(),
          ],
        ),
        SizedBox(
          height: context.k_16,
        ),
        Divider(
          indent: context.k_16,
          endIndent: context.k_16,
          thickness: context.k_2,
          height: context.k_10,
          color: dividerColor,
        ),
        SizedBox(
          height: context.k_16,
        ),
        const _CartShimmerBox(),
        Divider(
          indent: context.k_16,
          endIndent: context.k_16,
          thickness: context.k_2,
          height: context.k_10,
          color: dividerColor,
        ),
      ],
    );
  }
}

class _CartShimmerBox extends StatelessWidget {
  final EdgeInsets? customPadding;
  final double width;
  final double? height;
  const _CartShimmerBox({
    Key? key,
    this.customPadding,
    this.width = double.infinity,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ADShimmerWidget.shimmerShape(
      type: ShimmerType.rectangleBox,
      height: height ?? context.k_16,
      width: width,
      rectanglePadding: customPadding ??
          EdgeInsets.only(
            right: context.k_16,
            bottom: context.k_16,
            left: context.k_16,
          ),
    );
  }
}
