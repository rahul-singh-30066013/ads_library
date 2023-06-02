
/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class CancellationConfirmationShimmer extends StatelessWidget {
  const CancellationConfirmationShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double aspectRatioHalf = 0.62;
    final double shimmer_60 = 60.sp;
    final double whiteContainerWidth = context.widthOfScreen / 1.7;
    final double topHeight = 80.sp;
    const _flexTwo = 2;

    return Scaffold(
      body: ListView(
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
                ],
              ).paddingBySide(left: context.k_16, right: context.k_16),
            ],
          ),
          ADSizedBox(height: context.k_8,),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            //width: context.widthOfScreen * ,
            height: shimmer_60,
            rectanglePadding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
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
          SizedBox(height: context.k_16,),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            //width: context.widthOfScreen * ,
            height: shimmer_60,
            rectanglePadding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
          SizedBox(height: context.k_16,),
          Row(
            children: [
              Expanded(
                child: ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  rectanglePadding: EdgeInsets.only(
                    left: context.k_16,
                    // right: context.k_64,
                  ),
                  height: context.k_64 + context.k_16,
                ),
              ),
              SizedBox(
                width: context.k_16,
              ),
              Expanded(
                flex: _flexTwo,
                child: ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_64 + context.k_16,
                  rectanglePadding: EdgeInsets.only(
                    right: context.k_16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
