/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class CabBookingHomeShimmerView extends StatelessWidget {
  const CabBookingHomeShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const videoRatio = 0.1452380952;
    final titlePadding = 80.sp;
    final offerHeight = 200.sp;
    const listCount = 3;
    const pointSeven = 0.7;
    const pointTwoFive = 0.25;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: context.widthOfScreen * videoRatio,
              width: context.widthOfScreen,
            ),
            ADShimmerWidget.shimmerShape(
              rectanglePadding: const EdgeInsets.all(0),
              type: ShimmerType.rectangleBox,
              height: context.k_40,
              width: context.widthOfScreen - titlePadding,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.circle,
                          height: context.k_20,
                          width: context.k_20,
                        ).paddingBySide(right: context.k_12),
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_20,
                          width: context.k_64 + context.k_16,
                        ),
                      ],
                    ),
                    ADSizedBox(
                      width: context.k_30,
                    ),
                    Row(
                      children: [
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.circle,
                          height: context.k_20,
                          width: context.k_20,
                        ).paddingBySide(right: context.k_12),
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_20,
                          width: context.k_64 + context.k_16,
                        ),
                      ],
                    ),
                  ],
                ).paddingBySide(bottom: context.k_24),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_64 + context.k_28,
                          width: context.widthOfScreen,
                        ),
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_64 + context.k_28,
                          width: context.widthOfScreen,
                        ).paddingBySide(top: context.k_20),
                      ],
                    ),
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: const EdgeInsets.all(0),
                      type: ShimmerType.circle,
                      height: context.k_48,
                      width: context.k_48,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: const EdgeInsets.all(0),
                      type: ShimmerType.squareBox,
                      height: context.k_48 + context.k_4,
                      width:
                          (context.widthOfScreen - context.k_32) * pointSeven,
                    ),
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: const EdgeInsets.all(0),
                      type: ShimmerType.squareBox,
                      height: context.k_48 + context.k_4,
                      width:
                          (context.widthOfScreen - context.k_32) * pointTwoFive,
                    ),
                  ],
                ).paddingBySide(top: context.k_28),
              ],
            ).paddingBySide(top: context.k_30),
            SizedBox(
              height: context.k_64 + context.k_36,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listCount,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.k_12),
                      border: Border.all(
                        color: context.adColors.lightGreyGridSeparatorColor,
                      ),
                      color: const Color(0xffffffff),
                    ),
                    padding: EdgeInsets.all(context.k_16),
                    child: Row(
                      children: [
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: const EdgeInsets.all(0),
                          type: ShimmerType.rectangleBox,
                          height: context.k_22,
                          width: context.k_22,
                        ).paddingBySide(right: context.k_12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ADShimmerWidget.shimmerShape(
                              rectanglePadding: const EdgeInsets.all(0),
                              type: ShimmerType.rectangleBox,
                              height: context.k_8,
                              width: context.k_64,
                            ).paddingBySide(bottom: context.k_4),
                            ADShimmerWidget.shimmerShape(
                              rectanglePadding: const EdgeInsets.all(0),
                              type: ShimmerType.rectangleBox,
                              height: context.k_8,
                              width: context.k_64,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.k_10,
                  );
                },
              ).paddingBySide(top: context.k_32),
            ).paddingBySide(
              top: context.k_24,
            ),
            ADShimmerWidget.shimmerShape(
              rectanglePadding: const EdgeInsets.all(0),
              type: ShimmerType.rectangleBox,
              height: offerHeight,
              width: double.infinity,
            ).paddingBySide(
              top: context.k_48 + context.k_4,
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_30,
        ),
      ),
    );
  }
}
// ADShimmerWidget.shimmerShape(
// rectanglePadding: EdgeInsets.all(0),
// type: ShimmerType.rectangleBox,
// height: double.infinity,
// width: 100,
// ),
