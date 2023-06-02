/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

double size1 = 100;
double size2 = 80;
double qrImageWidth = 142.sp;
double qrImageHeight = 142.sp;

class DutyFreeOrderDetailShimmer extends StatelessWidget {
  const DutyFreeOrderDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                rectanglePadding: EdgeInsets.zero,
                height: 100,
                width: 80,
              ).paddingAllSide(context.k_16),
              Container(
                height: size1.sp,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      rectanglePadding: EdgeInsets.zero,
                      height: context.k_16,
                      width: context.widthOfScreen / context.k_2,
                    ).paddingBySide(bottom: context.k_8),
                    ADShimmerWidget.shimmerShape(
                      type: ShimmerType.rectangleBox,
                      rectanglePadding: EdgeInsets.zero,
                      height: context.k_16,
                      width: context.widthOfScreen / context.k_4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: qrImageWidth,
            height: qrImageHeight,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(context.k_4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.k_4),
                  // border: Border.all(
                  //   color: context.adColors.greyCircleColor,
                  // ),
                ),
                width: qrImageWidth,
                height: qrImageHeight,
                child: const ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  rectanglePadding: EdgeInsets.zero,
                ),
              ),
            ),
          ).paddingBySide(top: context.k_56),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: context.k_30,
          ).paddingBySide(
            top: context.k_8,
            left: context.k_36,
            right: context.k_36,
          ),
          Row(
            children: [
              Column(
                children: [
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.circle,
                    rectanglePadding: EdgeInsets.zero,
                    height: context.k_12,
                    width: context.k_12,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    rectanglePadding: EdgeInsets.zero,
                    height: context.k_56,
                    width: context.k_2,
                  ).paddingBySide(
                    top: context.k_4,
                    bottom: context.k_4,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.circle,
                    rectanglePadding: EdgeInsets.zero,
                    height: context.k_12,
                    width: context.k_12,
                  ),
                ],
              ),
              Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ADShimmerWidget.shimmerShape(
                        type: ShimmerType.rectangleBox,
                        rectanglePadding: EdgeInsets.zero,
                        height: context.k_10,
                        width: context.widthOfScreen / context.k_4,
                      ).paddingBySide(bottom: context.k_4),
                      ADShimmerWidget.shimmerShape(
                        type: ShimmerType.rectangleBox,
                        rectanglePadding: EdgeInsets.zero,
                        height: context.k_10,
                        width: context.widthOfScreen / context.k_2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.k_32,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ADShimmerWidget.shimmerShape(
                        type: ShimmerType.rectangleBox,
                        rectanglePadding: EdgeInsets.zero,
                        height: context.k_10,
                        width: context.widthOfScreen / context.k_4,
                      ).paddingBySide(bottom: context.k_4),
                      ADShimmerWidget.shimmerShape(
                        type: ShimmerType.rectangleBox,
                        rectanglePadding: EdgeInsets.zero,
                        height: context.k_10,
                        width: context.widthOfScreen / context.k_2,
                      ),
                    ],
                  ),
                ],
              ).paddingBySide(left: context.k_8),
            ],
          ).paddingBySide(
            left: context.k_16,
            top: context.k_30,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: 1,
          ).paddingBySide(
            top: context.k_30,
            left: context.k_16,
            right: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: context.k_40,
          ).paddingBySide(
            top: context.k_10,
            left: context.k_16,
            right: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: 1,
          ).paddingBySide(
            top: context.k_10,
            left: context.k_16,
            right: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: context.k_40,
          ).paddingBySide(
            top: context.k_10,
            left: context.k_16,
            right: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: 1,
          ).paddingBySide(
            top: context.k_10,
            left: context.k_16,
            right: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: context.k_40,
          ).paddingBySide(
            top: context.k_10,
            left: context.k_16,
            right: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: 1,
          ).paddingBySide(
            top: context.k_10,
            left: context.k_16,
            right: context.k_16,
          ),
        ],
      ),
    );
  }
}
