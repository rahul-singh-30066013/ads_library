/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class FlightStatusDetailScreenShimmer extends StatelessWidget {
  const FlightStatusDetailScreenShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double _boxHeight = 38.sp;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: _boxHeight,
                  width: (context.widthOfScreen / context.k_2) - context.k_64,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: _boxHeight,
                  width: (context.widthOfScreen / context.k_2) - context.k_64,
                ),
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: _boxHeight,
                  width: (context.widthOfScreen / context.k_2) - context.k_64,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: _boxHeight,
                  width: (context.widthOfScreen / context.k_2) - context.k_64,
                ),
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: _boxHeight,
                  width: (context.widthOfScreen / context.k_2) - context.k_64,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ADShimmerWidget.shimmerShape(
                  rectanglePadding: const EdgeInsets.all(0),
                  type: ShimmerType.rectangleBox,
                  height: _boxHeight,
                  width: (context.widthOfScreen / context.k_2) - context.k_64,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
