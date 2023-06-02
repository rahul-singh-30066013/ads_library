/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

///this class is used to show shimmer on loyalty dashboard
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///local variables
    final double size_80 = 80.sp;
    final double shimmerHeight_150 = 150.sp;
    return ADShimmerWidget.shimmerShape(
      type: ShimmerType.rectangleBox,
      height: shimmerHeight_150,
      width: context.widthOfScreen,
      detailTextWidth: size_80,
      detailTextHeight: context.k_20,
    );
  }
}
