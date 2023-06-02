/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

///This class is used to show loyalty dashboard shimmer view
class DashboardShimmerWidget extends StatelessWidget {
  ///local variables for height and width
  final double shimmerHeight_140 = 140.sp;
  final double shimmerHeight_20 = 20.sp;
  final double shimmerHeight_80 = 80.sp;
  final double shimmerWidth_500 = 500.sp;
  final double shimmerHeight_350 = 358.sp;
  final double shimmerHeight_170 = 170.sp;
  final double shimmerHeight_100 = 100.sp;
  final double shimmerHeight_430 = 430.sp;
  final double containerHorizontalMargin_12 = 12.sp;

  DashboardShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.adColors.whiteTextColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            width: context.widthOfScreen,
            height: shimmerHeight_350,
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            height: shimmerHeight_140,
            width: context.widthOfScreen,
            detailTextWidth: shimmerHeight_80,
            detailTextHeight: context.k_20,
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          Row(
            children: [
              Expanded(
                child: ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: context.widthOfScreen,
                  height: shimmerHeight_100,
                ),
              ),
              // ADSizedBox(
              //   width: context.k_12,
              // ),
              Expanded(
                child: ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: context.widthOfScreen,
                  height: shimmerHeight_100,
                ),
              ),
            ],
          ),
          ADSizedBox(
            height: context.k_48,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.squareBox,
            width: context.widthOfScreen,
            height: shimmerHeight_430,
          ),
          ADSizedBox(
            height: context.k_48,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: containerHorizontalMargin_12,
            ),
            child: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: context.widthOfScreen,
              height: shimmerHeight_170,
            ),
          ),
          ADSizedBox(
            height: context.k_48,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: containerHorizontalMargin_12,
            ),
            child: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: context.widthOfScreen,
              height: context.k_40,
            ),
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: containerHorizontalMargin_12,
            ),
            child: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: context.widthOfScreen,
              height: context.k_40,
            ),
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: containerHorizontalMargin_12,
            ),
            child: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: context.widthOfScreen,
              height: context.k_40,
            ),
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: containerHorizontalMargin_12,
            ),
            child: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: context.widthOfScreen,
              height: context.k_40,
            ),
          ),
          ADSizedBox(
            height: context.k_22,
          ),
        ],
      ),
    );
  }
}
