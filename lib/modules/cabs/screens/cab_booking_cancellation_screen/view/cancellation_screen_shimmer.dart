/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class CancellationScreenShimmer extends StatelessWidget {
  const CancellationScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double twoFortyFour = 244.sp;
    final double twoZeroZero = 200.sp;
    const int six = 6;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ADSizedBox(
            height: context.k_48,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            //width: context.widthOfScreen * ,
            height: context.k_40,
            rectanglePadding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            //width: context.widthOfScreen * ,
            height: context.k_64,
            rectanglePadding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
          ADSizedBox(
            height: context.k_40,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            //width: context.widthOfScreen * ,
            height: context.k_20,
            rectanglePadding: EdgeInsets.only(
              left: context.k_16,
              right: twoFortyFour,
            ),
          ),
          SizedBox(
            height: context.k_20,
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: six,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.circle,
                    height: context.k_20,
                    width: context.k_20,
                  ).paddingBySide(right: context.k_15),
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.rectangleBox,
                    height: context.k_18,
                    width: twoZeroZero,
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return ADSizedBox(
                height: context.k_24,
              );
            },
          ),
          SizedBox(
            height: context.k_30,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            height: context.k_48,
            rectanglePadding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
          SizedBox(
            height: context.k_48,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            height: context.k_56,
            rectanglePadding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
        ],
      ),
    );
  }
}
