/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/video_loyalty_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to provide header lotties animation section view on loyalty dashboard
class DashBoardHeaderBackgroundView extends StatefulWidget {
  final String appImageSrc;
  const DashBoardHeaderBackgroundView({Key? key, required this.appImageSrc})
      : super(key: key);

  @override
  State<DashBoardHeaderBackgroundView> createState() =>
      _DashBoardHeaderBackgroundViewState();
}

class _DashBoardHeaderBackgroundViewState
    extends State<DashBoardHeaderBackgroundView> with TickerProviderStateMixin {
  ///local variables
  final double headerGifHeight = 200.sp;
  final double animationContainerHeight = 300.sp;
  // final double _k_80 = 80.sp;
  //static const _backColor = Color(0xff34b285);

  @override
  Widget build(BuildContext context) {
    final double aspectRatio = animationContainerHeight / context.widthOfScreen;

    return Stack(
      children: [
        // Container(
        //   height: context.widthOfScreen * aspectRatio,
        //   color: ProfileSingleton.profileSingleton.isLoggedIn
        //       ? context.adColors.transparentColor
        //       : _backColor,
        //   width: context.widthOfScreen,
        //   child: Image.asset(
        //     'lib/assets/images/loyalty/dashboard_background.png',
        //     fit: BoxFit.fill,
        //     width: context.widthOfScreen,
        //     // height: context.widthOfScreen * aspectRatio,
        //   ),
        // ),
        ADSizedBox(
          height: context.widthOfScreen * aspectRatio,
          width: context.widthOfScreen,
          child: VideoLoyaltyView(
            appImagSrc: widget.appImageSrc,
            looping: true,
          ),
        ),
        // Container(
        //   height: headerGifHeight,
        //   width: double.infinity,
        //   child: Stack(
        //     clipBehavior: Clip.none,
        //     alignment: Alignment.center,
        //     children: [
        //       // AnimatedView(
        //       //   animationType: Constants.animationTypeLeft,
        //       //   path: SvgAssets.icClouds,
        //       //   height: context.k_22,
        //       //   width: context.k_24,
        //       // ),
        //       AnimatedView(
        //         animationType: Constants.animationTypeRight,
        //         path: SvgAssets.icClouds,
        //         height: context.k_22,
        //         width: context.k_24,
        //         bottom: -context.k_2,
        //       ),
        //       AnimatedView(
        //         left: context.k_10,
        //         bottom: -_k_80.sp,
        //         animationType: Constants.animationTypeTop,
        //         path: SvgAssets.icParasute,
        //         //rotationAngle: Constants.rotationAngle,
        //         height: context.k_60,
        //         width: context.k_40,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
