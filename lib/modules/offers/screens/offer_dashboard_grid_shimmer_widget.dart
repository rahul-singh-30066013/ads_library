/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class OfferDashboardGridShimmerWidget extends StatelessWidget {
  final double shimmerWidth_156 = 156.sp;
  final double shimmerHeight_196 = 196.sp;
  final double shimmerWidth_120 = 120.sp;
  final double shimmerWidth_160 = 160.sp;
  final double shimmerWidth_140 = 140.sp;
  final double shimmerWidth_100 = 99.sp;

  OfferDashboardGridShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.squareBox,
          height: context.k_40,
          width: context.widthOfScreen,
        ).paddingBySide(
          top: context.k_20,
          right: context.k_4,
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
                    width: shimmerWidth_120,
                  ),
                  ADSizedBox(
                    height: context.k_12,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.squareBox,
                    height: context.k_20,
                    width: shimmerWidth_120,
                  ),
                ],
              ),
            ),
          ],
        ).paddingBySide(
          top: context.k_20,
        ),
      ],
    );
  }
}
