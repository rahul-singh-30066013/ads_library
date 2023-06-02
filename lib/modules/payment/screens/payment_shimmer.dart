/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

double offerWidth = 100.sp;

class PaymentShimmer extends StatelessWidget {
  const PaymentShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_64,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_20,
            right: context.k_20,
            top: context.k_20,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Container(
            height: context.k_8,
            color: context.adColors.containerGreyBg,
          ),
          Row(
            children: [
              ADShimmerWidget.shimmerShape(
                rectanglePadding: EdgeInsets.zero,
                type: ShimmerType.rectangleBox,
                height: context.k_28,
                width: context.k_28,
              ).paddingBySide(right: context.k_16),
              ADShimmerWidget.shimmerShape(
                rectanglePadding: EdgeInsets.zero,
                type: ShimmerType.rectangleBox,
                height: context.k_24,
                width: offerWidth,
              ),
            ],
          ).paddingBySide(
            left: context.k_20,
            right: context.k_20,
            top: context.k_10,
            bottom: context.k_12,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_12,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_48,
            right: context.k_12,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_12,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_48,
            right: context.k_12,
            top: context.k_4,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_12,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_48,
            right: context.k_12,
            top: context.k_4,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Container(
            height: context.k_8,
            color: context.adColors.containerGreyBg,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_64,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Container(
            height: context.k_8,
            color: context.adColors.containerGreyBg,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_24,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_24,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_10,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Row(
            children: [
              ADShimmerWidget.shimmerShape(
                rectanglePadding: EdgeInsets.zero,
                type: ShimmerType.rectangleBox,
                height: context.k_28,
                width: context.k_28,
              ).paddingBySide(right: context.k_16),
              ADShimmerWidget.shimmerShape(
                rectanglePadding: EdgeInsets.zero,
                type: ShimmerType.rectangleBox,
                height: context.k_28,
                width: context.k_28,
              ).paddingBySide(right: context.k_16),
              ADShimmerWidget.shimmerShape(
                rectanglePadding: EdgeInsets.zero,
                type: ShimmerType.rectangleBox,
                height: context.k_28,
                width: context.k_28,
              ).paddingBySide(right: context.k_16),
              ADShimmerWidget.shimmerShape(
                rectanglePadding: EdgeInsets.zero,
                type: ShimmerType.rectangleBox,
                height: context.k_28,
                width: context.k_28,
              ).paddingBySide(right: context.k_16),
              ADShimmerWidget.shimmerShape(
                rectanglePadding: EdgeInsets.zero,
                type: ShimmerType.rectangleBox,
                height: context.k_28,
                width: context.k_28,
              ).paddingBySide(right: context.k_16),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_40,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_40,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_40,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
          ADShimmerWidget.shimmerShape(
            rectanglePadding: EdgeInsets.zero,
            type: ShimmerType.rectangleBox,
            height: context.k_40,
            width: context.widthOfScreen,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
        ],
      ),
    );
  }
}
