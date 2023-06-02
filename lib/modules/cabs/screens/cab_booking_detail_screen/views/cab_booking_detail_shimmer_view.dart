/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class CabBookingDetailShimmerView extends StatelessWidget {
  const CabBookingDetailShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ninetySize = 90.sp;
    final oneZeroSevenSize = 107.sp;
    final seventyFiveSize = 75.sp;
    final twoNineFiveSize = context.widthOfScreen * 0.79;
    final threeThreeFourSize = 334.sp;
    final oneEightySize = 180.sp;
    final twoTwoZeroSize = 220.sp;
    const listCount = 2;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ADShimmerWidget.shimmerShape(
              rectanglePadding: const EdgeInsets.all(0),
              type: ShimmerType.rectangleBox,
              height: context.k_26,
              width: ninetySize,
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
            Row(
              children: [
                ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: context.k_60,
                  width: oneZeroSevenSize,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: const EdgeInsets.all(0),
                      type: ShimmerType.rectangleBox,
                      height: context.k_18,
                      width: context.k_64,
                    ).paddingBySide(bottom: context.k_4),
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: const EdgeInsets.all(0),
                      type: ShimmerType.rectangleBox,
                      height: context.k_16,
                      width: context.k_24,
                    ).paddingBySide(bottom: context.k_4),
                    Row(
                      children: [
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_16,
                          width: seventyFiveSize,
                        ),
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.circle,
                          height: context.k_4,
                          width: context.k_4,
                        ).paddingBySide(left: context.k_6, right: context.k_6),
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_16,
                          width: context.k_60,
                        ),
                      ],
                    ),
                  ],
                ).paddingBySide(left: context.k_20),
              ],
            ).paddingBySide(top: context.k_10).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listCount,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: const EdgeInsets.all(0),
                      type: ShimmerType.circle,
                      height: context.k_16,
                      width: context.k_16,
                    ).paddingBySide(right: context.k_15),
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: const EdgeInsets.all(0),
                      type: ShimmerType.rectangleBox,
                      height: context.k_18,
                      width: twoNineFiveSize,
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: context.k_16,
                  width: 1,
                ).paddingBySide(
                  left: context.k_8,
                  right: threeThreeFourSize,
                  top: context.k_4,
                  bottom: context.k_4,
                );
              },
            ).paddingBySide(
              top: context.k_20,
              left: context.k_16,
              right: context.k_16,
            ),
            ADShimmerWidget.shimmerShape(
              rectanglePadding: const EdgeInsets.all(0),
              type: ShimmerType.rectangleBox,
              height: context.k_8,
              width: double.infinity,
            ).paddingBySide(top: context.k_24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: context.k_18,
                  width: context.k_18,
                ),
                ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: context.k_22,
                  width: oneEightySize,
                ).paddingBySide(left: context.k_16, right: context.k_16),
                const Spacer(),
                ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: context.k_14,
                  width: context.k_16,
                ),
              ],
            ).paddingBySide(
              top: context.k_24,
              bottom: context.k_24,
              left: context.k_16,
              right: context.k_16,
            ),
            ADShimmerWidget.shimmerShape(
              rectanglePadding: const EdgeInsets.all(0),
              type: ShimmerType.rectangleBox,
              height: context.k_8,
              width: double.infinity,
            ),
            ADShimmerWidget.shimmerShape(
              rectanglePadding: const EdgeInsets.all(0),
              type: ShimmerType.rectangleBox,
              height: context.k_30,
              width: twoTwoZeroSize,
            ).paddingBySide(
              top: context.k_48,
              left: context.k_16,
              right: context.k_16,
            ),
            ADShimmerWidget.shimmerShape(
              rectanglePadding: const EdgeInsets.all(0),
              type: ShimmerType.rectangleBox,
              height: threeThreeFourSize,
              width: double.infinity,
            ).paddingBySide(
              top: context.k_20,
              left: context.k_16,
              right: context.k_16,
            ),
          ],
        ).paddingBySide(
          top: context.k_30,
          bottom: context.k_30,
        ),
      ),
    );
  }
}
