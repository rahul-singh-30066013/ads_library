import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class PranaamBannerShimmer extends StatelessWidget {
  final double shimmerWidth_120 = 120.sp;
  final double shimmerHeight_37 = 40.sp;

  PranaamBannerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ADShimmerWidget.shimmerShape(
      type: ShimmerType.rectangleImageText,
      width: context.widthOfScreen - shimmerHeight_37,
      height: shimmerWidth_120,
    ).paddingBySide(left: context.k_8);
  }
}
