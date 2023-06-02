/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/app_bar_title.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class FlightLoadingAnimation extends StatefulWidget {
  final FlightBookingModel? flightBookingModel;

  const FlightLoadingAnimation({
    Key? key,
    required this.flightBookingModel,
  }) : super(key: key);

  @override
  State<FlightLoadingAnimation> createState() => _FlightLoadingAnimationState();
}

class _FlightLoadingAnimationState extends State<FlightLoadingAnimation>
    with TickerProviderStateMixin {
  Animation<double>? planeAnimation;
  AnimationController? planeAnimationController;

  final double _planeBeginPosition = 20;
  final double _planeEndPosition = 50;

  Animation<double>? cloudAnimation;
  AnimationController? cloudAnimationController;

  Animation<double>? bottomCloudAnimation;
  AnimationController? bottomCloudAnimationController;

  final double _cloudBeginPosition = -200.sp;
  final double _cloudEndPosition = 400.sp;

  final double planeContainerHeight = 400;

  final double planeHeight = 80.sp;

  final double bottomCloudPadding = 50.sp;

  @override
  void initState() {
    planeAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    planeAnimation =
        Tween<double>(begin: _planeBeginPosition, end: _planeEndPosition)
            .animate(
      CurvedAnimation(
        parent: planeAnimationController ?? AnimationController(vsync: this),
        curve: Curves.easeInOut,
      ),
    );
    planeAnimationController
        ?.repeat(reverse: true)
        .then((value) => adLog('animation controller repeating'));

    cloudAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    cloudAnimation =
        Tween<double>(begin: _cloudBeginPosition, end: _cloudEndPosition)
            .animate(
      CurvedAnimation(
        parent: cloudAnimationController ?? AnimationController(vsync: this),
        curve: Curves.linear,
      ),
    );
    cloudAnimationController
        ?.repeat()
        .then((value) => adLog('animation controller repeating'));

    bottomCloudAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    bottomCloudAnimation =
        Tween<double>(begin: _cloudBeginPosition, end: _cloudEndPosition)
            .animate(
      CurvedAnimation(
        parent:
            bottomCloudAnimationController ?? AnimationController(vsync: this),
        curve: Curves.linear,
      ),
    );
    bottomCloudAnimationController
        ?.repeat()
        .then((value) => adLog('animation controller repeating'));
    super.initState();
  }

  @override
  void dispose() {
    planeAnimationController?.dispose();
    cloudAnimationController?.dispose();
    bottomCloudAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.widthOfScreen,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  builder: (context, child) {
                    return Positioned(
                      top: 0,
                      right: cloudAnimation?.value ?? 0,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'lib/assets/images/svg/animation/cloud.svg',
                            height: context.k_40,
                          ),
                          const SizedBox(width: 150),
                        ],
                      ),
                    );
                  },
                  animation: cloudAnimationController?.view ??
                      AnimationController(vsync: this),
                ),
                AnimatedBuilder(
                  builder: (context, child) {
                    return Positioned(
                      bottom: bottomCloudPadding,
                      right: bottomCloudAnimation?.value ?? 0,
                      child: Row(
                        children: [
                          const SizedBox(width: 100),
                          SvgPicture.asset(
                            'lib/assets/images/svg/animation/cloud.svg',
                            height: context.k_26,
                          ),
                        ],
                      ),
                    );
                  },
                  animation: bottomCloudAnimationController?.view ??
                      AnimationController(vsync: this),
                ),
                AnimatedBuilder(
                  builder: (context, child) {
                    return Container(
                      height: planeContainerHeight,
                      padding: EdgeInsets.only(
                        bottom: planeAnimation?.value ?? 0,
                      ),
                      child: SvgPicture.asset(
                        'lib/assets/images/svg/animation/aeroplane.svg',
                        height: planeHeight,
                      ),
                    );
                  },
                  animation: planeAnimationController?.view ??
                      AnimationController(vsync: this),
                ),
              ],
            ),
          ),
          Text(
            'Get set to jet off!',
            style: ADTextStyle700.size16,
            textAlign: TextAlign.center,
          ),
          ADSizedBox(height: context.k_10),
          Text(
            'Searching best fares for you.',
            style: ADTextStyle400.size12
                .setTextColor(context.adColors.greyTextColor),
            textAlign: TextAlign.center,
          ),
          ADSizedBox(height: context.k_20),
          Container(
            height: context.k_2,
            width: context.k_30,
            decoration: BoxDecoration(gradient: adGradientColorType3),
          ),
          ADSizedBox(height: context.k_20),
          Center(
            child: AppBarTitle(
              flightBookingModel: widget.flightBookingModel,
              isFlightLoadingAnimation: true,
            ),
          ),
        ],
      ),
    );
  }
}
