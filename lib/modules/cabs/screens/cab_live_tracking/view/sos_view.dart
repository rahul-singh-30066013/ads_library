/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/state_management/cab_live_tracking_state.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class SOSView extends StatefulWidget {
  final String? orderReferenceId;
  final String? titleText;
  final String? alertIcon;
  final String? infoText;
  final String? buttonDialText;
  final String? buttonActionText;
  final ADTapCallback? buttonDial;
  final ADTapCallback? buttonAction;

  const SOSView({
    Key? key,
    this.orderReferenceId,
    this.titleText,
    this.alertIcon,
    this.infoText,
    this.buttonDialText,
    this.buttonActionText,
    this.buttonDial,
    this.buttonAction,
  }) : super(key: key);

  @override
  State<SOSView> createState() => _SOSViewState();
}

class _SOSViewState extends State<SOSView> {
  CabLiveTrackingState cabLiveTrackingState = CabLiveTrackingState();

  @override
  void initState() {
    cabLiveTrackingState.orderReferenceId = widget.orderReferenceId;
    super.initState();
  }

  @override
  void dispose() {
    cabLiveTrackingState.sosResponseState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = 58.sp;
    const redColor = Color(0xffdc464b);
    return ValueListenableBuilder(
      valueListenable: cabLiveTrackingState.sosResponseState,
      builder: (context, Status? status, child) {
        return SafeArea(
          child: AbsorbPointer(
            absorbing: status == Status.loading,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.titleText ?? '',
                        style: ADTextStyle700.size26.copyWith(
                          color: redColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: height,
                      child: SvgPicture.asset(
                        widget.alertIcon ?? '',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.k_20,
                ),
                Text(
                  widget.infoText ?? '',
                  style: ADTextStyle400.size16.copyWith(
                    color: context.adColors.blackTextColor,
                  ),
                ),
                SizedBox(
                  height: context.k_30,
                ),
                SizedBox(
                  height: height,
                  width: context.widthOfScreen,
                  child: ElevatedButton(
                    onPressed: () => {
                      navigatorPopScreen(context),
                      widget.buttonDial?.call(),
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: redColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      widget.buttonDialText ?? '',
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.k_20,
                ),
                SizedBox(
                  height: height,
                  width: context.widthOfScreen,
                  child: ElevatedButton(
                    onPressed: () => {
                      cabLiveTrackingState.checkLocationPermission(
                        context,
                        () => {
                          navigatorPopScreen(context),
                          widget.buttonAction?.call(),
                        },
                      ),
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<StadiumBorder>(
                        const StadiumBorder(
                          side: BorderSide(
                            color: redColor,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                    child: (status == Status.loading)
                        ? const ADDotProgressView(
                            color: redColor,
                          )
                        : Text(
                            widget.buttonActionText ?? '',
                            style: ADTextStyle700.size16.setTextColor(
                              redColor,
                            ),
                          ),
                  ),
                ),
              ],
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
        );
      },
    );
  }
}
