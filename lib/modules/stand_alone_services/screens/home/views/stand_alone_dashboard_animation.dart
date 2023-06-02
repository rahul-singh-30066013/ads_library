/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneDashboardAnimation extends StatefulWidget {
  const StandAloneDashboardAnimation({Key? key}) : super(key: key);

  @override
  State<StandAloneDashboardAnimation> createState() =>
      _StandAloneDashboardAnimationState();
}

class _StandAloneDashboardAnimationState
    extends State<StandAloneDashboardAnimation>
    with SingleTickerProviderStateMixin {
  final ScrollController _listScrollController = ScrollController();
  Animation<double>? planeAnimation;
  AnimationController? planeAnimationController;
  final double _planeBeginPosition = -54;
  final double _planeEndPosition = -44;

  final double size430 = 430.sp;
  final double size330 = 330.sp;
  final double size50 = 50.sp;
  final double size80 = 80.sp;
  final int gridCount = 100000;
  final int plantDivisor = 12;
  final int stripDivisor = 4;
  final double stripOpacity = 0.8;
  final k_5 = 5;

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

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 7000),
        curve: Curves.linear,
      ),
    );
    super.initState();
  }

  String _getTitle(StandAloneServiceType currentType, int count) {
    switch (currentType) {
      case StandAloneServiceType.porter:
        return count > 1
            ? 'porters'.localize(context)
            : 'porter_title'.localize(context);
      case StandAloneServiceType.wheelchair:
        return count > 1
            ? 'wheelchairs'.localize(context)
            : 'wheelchair_title'.localize(context);
      default:
        return 'porter_title'.localize(context);
    }
  }

  @override
  void dispose() {
    planeAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<StandAloneServiceBookingStateManagement>(
        // selector: (context, model) => model.serviceBookingData,
        builder: (context, model, child) {
          final String outBoundDateTime =
              model.selectedArrivalDepartureFlight?.serviceDateTime == null
                  ? ''
                  : DateFormat(Constant.dateFormat13).format(
                      DateFormat('yyyy-MM-dd hh:mm:ss').parse(
                        '${model.selectedArrivalDepartureFlight?.serviceDateTime}',
                      ),
                    );

          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      height: size430,
                    ),
                    AbsorbPointer(
                      child: SizedBox(
                        height: size330,
                        child: GridView.builder(
                          controller: _listScrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: gridCount,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffCAD9FF)),
                              color: const Color(0xffdbe7ff),
                            ),
                            height: size50,
                            width: size80,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      if (((index + 1) % plantDivisor) == 0)
                                        SvgPicture.asset(
                                          'lib/assets/images/svg/animation/plant.svg',
                                          // alignment: Alignment.bottomCenter,
                                          height: context.k_28,
                                        ),
                                      if (((index + 1) % stripDivisor) == 0)
                                        Divider(
                                          height: context.k_12,
                                          thickness: context.k_12,
                                          color: const Color(0xffCAD9FF)
                                              .withOpacity(stripOpacity),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      builder: (context, child) {
                        // return Positioned(
                        //   bottom: planeAnimation?.value,
                        //   child: SvgPicture.asset(
                        //     widget.animationPath,
                        //   ),
                        // );
                        return Positioned(
                          bottom: planeAnimation?.value,
                          child: Lottie.asset(
                            'lib/assets/images/svg/animation/porter_animation.json',
                            // width: context.k_28,
                            height: context.k_64 * k_5,
                            fit: BoxFit.fitWidth,
                          ),
                        );
                      },
                      animation: planeAnimationController?.view ??
                          AnimationController(vsync: this),
                    ),
                  ],
                ),
                const Spacer(),
                ADSizedBox(
                  height: context.k_60,
                ),
                Text(
                  'Sit back and relax!',
                  style: ADTextStyle700.size16,
                  textAlign: TextAlign.center,
                ),
                ADSizedBox(height: context.k_10),
                Text(
                  'Your world of hassle-free travel is almost here.',
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
                Text(
                  '${model.getServiceAirport(model.selectedService.serviceId)?.cityCode} (${model.porterCount} ${_getTitle(model.standAloneStateManagement.currentServiceType, model.porterCount ?? 0)})',
                  style: ADTextStyle700.size24,
                ),
                ADSizedBox(
                  height: context.k_12,
                ),
                Text(
                  '$outBoundDateTime • ${model.selectedArrivalDepartureFlight?.flightFinalNumber}',
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.greyTextColor),
                  textAlign: TextAlign.center,
                ),
                ADSizedBox(
                  height: context.k_8,
                ),
                if (model.selectedService.serviceId == roundTripServiceId)
                  Text(
                    '${DateFormat(Constant.dateFormat13).format(
                      DateFormat('yyyy-MM-dd hh:mm:ss').parse(
                        '${model.selectedRoundTripFlight?.serviceDateTime}',
                      ),
                    )} • ${model.selectedRoundTripFlight?.flightFinalNumber}',
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.greyTextColor),
                    textAlign: TextAlign.center,
                  ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
