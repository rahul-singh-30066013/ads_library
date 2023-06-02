/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class CabListingShimmerView extends StatelessWidget {
  const CabListingShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double loyaltyViewWidth = 263.sp;
    final double cabViewWidth = 110.sp;
    const listCount = 7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADShimmerWidget.shimmerShape(
          rectanglePadding: const EdgeInsets.all(0),
          type: ShimmerType.rectangleBox,
          height: context.k_36,
          width: context.widthOfScreen - context.k_32,
        ).paddingBySide(top: context.k_24),
        ADShimmerWidget.shimmerShape(
          rectanglePadding: const EdgeInsets.all(0),
          type: ShimmerType.rectangleBox,
          height: context.k_32,
          width: context.widthOfScreen - loyaltyViewWidth,
        ).paddingBySide(
          top: context.k_20,
          bottom: context.k_20,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: listCount,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.rectangleBox,
                    height: context.k_36,
                    width: context.k_64,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_16,
                          width: cabViewWidth,
                        ),
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_12,
                          width: context.k_48,
                        ).paddingBySide(top: context.k_4),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                    ),
                  ),
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.rectangleBox,
                    height: context.k_16,
                    width: context.k_48,
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.k_30,
              );
            },
          ),
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}
