/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class PranaamConfirmationShimmer extends StatelessWidget {
  const PranaamConfirmationShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double aspectRatioHalf = 0.62;
    final double shimmer_60 = 60.sp;
    final double whiteContainerWidth = context.widthOfScreen / 1.7;
    final double qrWidth = 114.sp;
    final double topHeight = 80.sp;

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
                SizedBox(
                  height: topHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: whiteContainerWidth,
                      height: context.k_60,
                      decoration: BoxDecoration(
                        color: context.adColors.whiteTextColor,
                        borderRadius: BorderRadius.circular(
                          context.k_8,
                        ),
                      ),
                    ),
                    Container(
                      width: context.k_48,
                      height: context.k_48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.adColors.whiteTextColor,
                      ),
                    ).paddingBySide(right: context.k_4),
                  ],
                ),
                Container(
                  width: whiteContainerWidth,
                  height: context.k_30,
                  decoration: BoxDecoration(
                    color: context.adColors.whiteTextColor,
                    borderRadius: BorderRadius.circular(
                      context.k_8,
                    ),
                  ),
                ).paddingBySide(top: context.k_26),
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
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: topHeight,
            right: topHeight,
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
            SizedBox(
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
            SizedBox(
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
            SizedBox(
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
