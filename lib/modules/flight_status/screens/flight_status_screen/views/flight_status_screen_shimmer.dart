/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class FlightStatusScreenShimmer extends StatelessWidget {
  const FlightStatusScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width130 = 120.sp;
    final double width110 = 100.sp;

    const itemCount = 10;
    return ListView.separated(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ADShimmerWidget.shimmerShape(
                        rectanglePadding: const EdgeInsets.all(0),
                        type: ShimmerType.rectangleBox,
                        height: context.k_18,
                        width: context.k_18,
                      ),
                      ADSizedBox(
                        width: context.k_8,
                      ),
                      ADShimmerWidget.shimmerShape(
                        rectanglePadding: const EdgeInsets.all(0),
                        type: ShimmerType.rectangleBox,
                        height: context.k_12,
                        width: context.k_40,
                      ),
                      ADSizedBox(
                        width: context.k_2,
                      ),
                      ADShimmerWidget.shimmerShape(
                        rectanglePadding: const EdgeInsets.all(0),
                        type: ShimmerType.circle,
                        height: context.k_6,
                      ),
                      ADSizedBox(
                        width: context.k_2,
                      ),
                      ADShimmerWidget.shimmerShape(
                        rectanglePadding: const EdgeInsets.all(0),
                        type: ShimmerType.rectangleBox,
                        height: context.k_12,
                        width: context.k_40,
                      ),
                      ADSizedBox(
                        width: context.k_2,
                      ),
                      ADShimmerWidget.shimmerShape(
                        rectanglePadding: const EdgeInsets.all(0),
                        type: ShimmerType.circle,
                        height: context.k_6,
                      ),
                      ADSizedBox(
                        width: context.k_2,
                      ),
                      ADShimmerWidget.shimmerShape(
                        rectanglePadding: const EdgeInsets.all(0),
                        type: ShimmerType.rectangleBox,
                        height: context.k_12,
                        width: context.k_16,
                      ),
                    ],
                  ),
                  ADSizedBox(
                    height: context.k_16,
                  ),
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.rectangleBox,
                    height: context.k_20,
                    width: width130,
                  ),
                  ADSizedBox(
                    height: context.k_16,
                  ),
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.rectangleBox,
                    height: context.k_16,
                    width: width110,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.rectangleBox,
                    height: context.k_38,
                    width: context.k_48,
                  ),
                  ADShimmerWidget.shimmerShape(
                    rectanglePadding: const EdgeInsets.all(0),
                    type: ShimmerType.rectangleBox,
                    height: context.k_14,
                    width: context.k_56,
                  ),
                ],
              ),
            ],
          ),
        ).paddingBySide(
          top: context.k_20,
          bottom: context.k_20,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 1,
          color: context.adColors.tileBorderColor,
        );
      },
    ).paddingBySide(left: context.k_16, right: context.k_16);
  }
}
