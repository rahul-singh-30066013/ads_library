/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class UnlockedOffersShimmerWidget extends StatelessWidget {
  final double shimmerWidth_156 = 156.sp;
  final double shimmerHeight_140 = 140.sp;
  final double shimmerWidth_120 = 120.sp;
  final double shimmerWidth_160 = 160.sp;
  final double shimmerWidth_140 = 140.sp;
  final double shimmerHeight_30 = 30.sp;
  final double shimmerHeight_37 = 37.sp;

  UnlockedOffersShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: context.k_40,
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.squareBox,
          width: context.widthOfScreen - shimmerHeight_140,
          height: context.k_30,
        ).paddingBySide(left: context.k_16),
        ADSizedBox(
          height: context.k_10,
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.squareBox,
          width: context.widthOfScreen,
          height: context.k_24,
        ).paddingBySide(left: context.k_16, right: context.k_20),
        ADSizedBox(
          height: context.k_10,
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleImageText,
          width: context.widthOfScreen - shimmerHeight_37,
          height: shimmerHeight_140,
        ).paddingBySide(left: context.k_8),
      ],
    );
  }
}
