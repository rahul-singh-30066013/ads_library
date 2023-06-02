/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/gradient_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
const gradient1 = Color(0xff6B5CA6);
const gradient2 = Color(0xff923993);
const gradient3 = Color(0xffF05636);
const gradient4 = Color(0xffF05636);
class PleaseWaitPopUpView extends StatefulWidget {
  const PleaseWaitPopUpView({Key? key}) : super(key: key);

  @override
  _PleaseWaitPopUpViewState createState() => _PleaseWaitPopUpViewState();
}

class _PleaseWaitPopUpViewState extends State<PleaseWaitPopUpView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final strokeWidth = 4.0;
  final radius = 25.0;
  final begin = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController?.addListener(
      () => setState(() {
        ///TODO: joust to avoid empty block warning
        //adLog('');
      }),
    );
    final animationC = _animationController?.repeat();
    adLog(animationC.toString());
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(context.k_20)),
      ), //this right here
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('lib/assets/images/common/adani_logo.svg')
              .paddingBySide(top: context.k_40),
          RotationTransition(
            turns: Tween(begin: begin, end: begin + 1).animate(
              _animationController ?? AnimationController(vsync: this),
            ),
            child: GradientCircularProgressIndicator(
              radius: radius,
              gradientColors: const [
                gradient1,
                gradient2,
                gradient3,
                gradient4,
              ],
              strokeWidth: strokeWidth,
            ),
          ).paddingBySide(top: context.k_40, bottom: context.k_40),
          Text(
            'please_wait'.localize(context),
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
          ).paddingBySide(bottom: context.k_10),
          Text(
            'we_are_verifying_your_booking_status'.localize(context),
            style: ADTextStyle400.size16.setTextColor(context.adColors.black),
            textAlign: TextAlign.center,
          ).paddingBySide(
            left: context.k_20,
            right: context.k_20,
            bottom: context.k_40,
          ),
        ],
      ),
    );
  }
}
