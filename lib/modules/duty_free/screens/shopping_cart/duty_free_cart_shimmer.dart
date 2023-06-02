/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const int topHeight = 52;
const double k_180 = 180;
const double k_120 = 120;

const double imageWidth = 100;
const double textHeight = 50;
const int k_2 = 2;
const itemCount = 10;

class DutyFreeCartShimmer extends StatelessWidget {
  const DutyFreeCartShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: context.k_16),
        children: [
          ADSizedBox(
            height: context.k_20,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            rectanglePadding: EdgeInsets.zero,
            width: context.widthOfScreen,
            height: context.k_64,
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              height: k_180,
              child: Row(
                children: [
                  const ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    rectanglePadding: EdgeInsets.zero,
                    width: imageWidth,
                    height: k_180,
                  ),
                  ADSizedBox(
                    width: context.k_16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ADShimmerWidget.shimmerShape(
                          type: ShimmerType.rectangleBox,
                          rectanglePadding: EdgeInsets.zero,
                          height: textHeight,
                          width: context.widthOfScreen -
                              (context.k_16 * k_2 + imageWidth),
                        ),
                        ADSizedBox(
                          width: context.k_16,
                        ),
                        const ADShimmerWidget.shimmerShape(
                          type: ShimmerType.rectangleBox,
                          rectanglePadding: EdgeInsets.zero,
                          height: textHeight,
                          width: imageWidth,
                        ),
                        ADSizedBox(
                          width: context.k_16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ADShimmerWidget.shimmerShape(
                              type: ShimmerType.rectangleBox,
                              rectanglePadding: EdgeInsets.zero,
                              height: context.k_30,
                              width: imageWidth,
                            ),
                            ADShimmerWidget.shimmerShape(
                              type: ShimmerType.rectangleBox,
                              rectanglePadding: EdgeInsets.zero,
                              height: context.k_30,
                              width: imageWidth,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => ADSizedBox(
              height: context.k_16,
            ),
            itemCount: itemCount,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: context.k_64,
        child: Container(
          padding: EdgeInsets.only(
            left: context.k_16,
            right: context.k_16,
          ),
          width: context.widthOfScreen,
          height: context.k_64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ADSizedBox(
                    height: context.k_8,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    rectanglePadding: EdgeInsets.zero,
                    width: k_120,
                    height: context.k_20,
                  ),
                  ADSizedBox(
                    height: context.k_8,
                  ),
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    rectanglePadding: EdgeInsets.zero,
                    width: context.k_64,
                    height: context.k_20,
                  ),
                  ADSizedBox(
                    height: context.k_8,
                  ),
                ],
              ),
              ADSizedBox(
                height: context.k_16,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                rectanglePadding: EdgeInsets.zero,
                width: k_180,
                height: context.k_48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
