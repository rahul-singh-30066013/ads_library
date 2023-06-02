/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class PranaamOrderDetailShimmer extends StatelessWidget {
  const PranaamOrderDetailShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double aspectRatioHalf = 0.9;
    final double shimmer_60 = 60.sp;
    final double whiteContainerWidth = 85.sp;
    final double qrWidth = 114.sp;
    final double topHeight = 130.sp;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            ADShimmerWidget.shimmerShape(
              rectanglePadding: EdgeInsets.zero,
              type: ShimmerType.rectangleBox,
              width: context.widthOfScreen,
              height: context.widthOfScreen * aspectRatioHalf,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADSizedBox(
                  height: topHeight,
                ),
                Row(
                  children: [
                    Container(
                      width: whiteContainerWidth,
                      height: whiteContainerWidth,
                      decoration: BoxDecoration(
                        color: context.adColors.whiteTextColor,
                        borderRadius: BorderRadius.circular(
                          context.k_8,
                        ),
                      ),
                    ).paddingBySide(right: context.k_40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: whiteContainerWidth,
                          height: context.k_20,
                          decoration: BoxDecoration(
                            color: context.adColors.whiteTextColor,
                            borderRadius: BorderRadius.circular(
                              context.k_8,
                            ),
                          ),
                        ).paddingBySide(bottom: context.k_10),
                        Container(
                          width: whiteContainerWidth,
                          height: context.k_20,
                          decoration: BoxDecoration(
                            color: context.adColors.whiteTextColor,
                            borderRadius: BorderRadius.circular(
                              context.k_8,
                            ),
                          ),
                        ).paddingBySide(bottom: context.k_10),
                        Container(
                          width: whiteContainerWidth,
                          height: context.k_20,
                          decoration: BoxDecoration(
                            color: context.adColors.whiteTextColor,
                            borderRadius: BorderRadius.circular(
                              context.k_8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ADSizedBox(
                  height: shimmer_60 * aspectRatioHalf,
                ),
                Align(
                  child: Container(
                    color: context.adColors.whiteTextColor,
                    child: ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      height: qrWidth,
                      width: qrWidth,
                      rectanglePadding: EdgeInsets.all(
                        context.k_14,
                      ),
                    ),
                  ),
                ).paddingBySide(top: context.k_22),
              ],
            ).paddingBySide(left: context.k_16, right: context.k_16),
          ],
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          //width: context.widthOfScreen * ,
          height: context.k_30,
          rectanglePadding: EdgeInsets.only(
            left: context.k_40,
            right: context.k_40,
          ),
        ),
        ADSizedBox(
          height: context.k_6,
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          //width: context.widthOfScreen * ,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.all(
            context.k_16,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          //width: context.widthOfScreen * ,
          height: context.k_48,
          rectanglePadding: EdgeInsets.only(
            left: context.k_16,
            right: topHeight + shimmer_60,
            top: context.k_32,
          ),
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          //width: context.widthOfScreen * ,
          height: context.k_48,
          rectanglePadding: EdgeInsets.only(
            left: context.k_16,
            right: topHeight + shimmer_60,
            top: context.k_32,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: context.widthOfScreen * ,
                height: context.k_48,
                rectanglePadding: EdgeInsets.only(
                  left: context.k_16,
                  top: context.k_32,
                ),
              ),
            ),
            ADSizedBox(
              width: shimmer_60,
            ),
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: shimmerWidth_100,
                height: context.k_48,
                rectanglePadding: EdgeInsets.only(
                  right: context.k_16,
                  top: context.k_32,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: context.widthOfScreen * ,
                height: context.k_48,
                rectanglePadding: EdgeInsets.only(
                  left: context.k_16,
                  top: context.k_20,
                ),
              ),
            ),
            ADSizedBox(
              width: shimmer_60,
            ),
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: shimmerWidth_100,
                height: context.k_48,
                rectanglePadding: EdgeInsets.only(
                  right: context.k_16,
                  top: context.k_20,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: context.widthOfScreen * ,
                height: context.k_48,
                rectanglePadding: EdgeInsets.only(
                  left: context.k_16,
                  top: context.k_20,
                ),
              ),
            ),
            ADSizedBox(
              width: shimmer_60,
            ),
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: shimmerWidth_100,
                height: context.k_48,
                rectanglePadding: EdgeInsets.only(
                  right: context.k_16,
                  top: context.k_20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
