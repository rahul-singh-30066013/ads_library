/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class ImportantInformationShimmer extends StatelessWidget {
  ImportantInformationShimmer({Key? key}) : super(key: key);

  final double titleHeight = 22.sp;
  final double titleWidth = 152.sp;
  final double subtitleHeight = 50.sp;
  final double subtitleWidth = 300.sp;
  final shimmerItemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleImageText,
          width: titleWidth,
          height: titleHeight,
        ),
        ADSizedBox(
          height: subtitleHeight + context.k_20,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.k_10),
            itemBuilder: (context, index) => ADSizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ADShimmerWidget.shimmerShape(
                    type: ShimmerType.rectangleBox,
                    rectanglePadding: EdgeInsets.zero,
                    width: subtitleWidth,
                    height: subtitleHeight,
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => ADSizedBox(
              width: context.k_20,
            ),
            itemCount: shimmerItemCount,
          ),
        ),
      ],
    ).paddingBySide(bottom: context.k_20);
  }
}
