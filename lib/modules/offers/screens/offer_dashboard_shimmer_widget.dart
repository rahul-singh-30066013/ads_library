/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class OfferDashboardShimmerWidget extends StatelessWidget {
  ///local variables for height and width
  final double shimmerHeight_70 = 56.sp;
  final double shimmerHeight_220 = 220.sp;
  final double containerHorizontalMargin_12 = 12.sp;
  final double shimmerWidth_156 = 156.sp;
  final double shimmerHeight_196 = 196.sp;
  final double shimmerWidth_120 = 120.sp;
  final double shimmerWidth_160 = 160.sp;
  final double shimmerWidth_140 = 140.sp;
  final double shimmerWidth_100 = 100.sp;

  OfferDashboardShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.adColors.whiteTextColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ADSizedBox(
            height: context.k_4,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleImageText,
            width: context.widthOfScreen - context.k_38,
            height: shimmerHeight_220,
          ).paddingBySide(left: context.k_8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.squareBox,
                width: shimmerWidth_100,
                height: context.k_40,
              ),
              ADSizedBox(
                width: context.k_16,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.squareBox,
                width: shimmerWidth_100,
                height: context.k_40,
              ),
              ADSizedBox(
                width: context.k_14,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.squareBox,
                width: shimmerWidth_100,
                height: context.k_40,
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            height: context.k_40,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_20,
            top: context.k_20,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      width: shimmerWidth_160,
                      height: shimmerHeight_196,
                    ).paddingBySide(right: context.k_8),
                    ADSizedBox(
                      height: context.k_16,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_120,
                    ),
                    ADSizedBox(
                      height: context.k_14,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_30,
                      width: shimmerWidth_160,
                    ),
                    ADSizedBox(
                      height: context.k_12,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_140,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      width: shimmerWidth_160,
                      height: shimmerHeight_196,
                    ).paddingBySide(left: context.k_8),
                    ADSizedBox(
                      height: context.k_16,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_120,
                    ),
                    ADSizedBox(
                      height: context.k_14,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_30,
                      width: shimmerWidth_160,
                    ),
                    ADSizedBox(
                      height: context.k_12,
                    ),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.squareBox,
                      height: context.k_20,
                      width: shimmerWidth_140,
                    ),
                  ],
                ),
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
        ],
      ),
    );
  }
}
