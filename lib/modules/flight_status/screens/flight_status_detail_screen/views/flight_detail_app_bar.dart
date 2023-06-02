/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/icon_circular_background.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/flight_status_detail_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns flight App Bar View for Flight status Detail Screen
class FlightDetailAppBar extends StatefulWidget {
  const FlightDetailAppBar({
    Key? key,
    required this.onTap,
    required this.lastUpdatedTime,
    required this.isNeedToUpdate,
  }) : super(key: key);

  final ADTapCallback onTap;
  final String lastUpdatedTime;
  final bool isNeedToUpdate;

  @override
  State<FlightDetailAppBar> createState() => _FlightDetailAppBarState();
}

class _FlightDetailAppBarState extends State<FlightDetailAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  double transformBeginValue = 0;
  double transformEndValue = 1;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ADSizedBox(
        height: context.k_48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconCircularBackground(
              icon: Platform.isIOS
                  ? Icons.arrow_back_ios_outlined
                  : Icons.arrow_back_outlined,
              onTap: () => widget.isNeedToUpdate
                  ? navigatorPopScreen(context)
                  : navigatorPopScreenUntil(
                      context,
                      ModalRoute.withName(
                        flightStatusScreen,
                      ),
                    ),
              rightPadding: context.k_2,
            ),
            Selector<FlightStatusDetailState, bool>(
              selector: (context, viewModel) => viewModel.isAbsorbing,
              builder: (context, isAbsorbing, Widget? child) {
                // isAbsorbing ? _controller?.repeat() : _controller?.stop();
                return AbsorbPointer(
                  absorbing: isAbsorbing,
                  child: InkWell(
                    onTap: widget.onTap,
                    child: Row(
                      children: [
                        Text(
                          '${'last_updated'.localize(context)} ${widget.lastUpdatedTime}',
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.whiteTextColor,
                          ),
                        ),
                        ADSizedBox(
                          width: context.k_6,
                        ),
                        ADSizedBox(
                          width: context.k_14,
                          child: RotationTransition(
                            turns: Tween(
                              begin: transformBeginValue,
                              end: transformEndValue,
                            ).animate(
                              _controller ?? AnimationController(vsync: this),
                            ),
                            child: SvgPicture.asset(
                              'lib/assets/images/svg/icons/flight/refresh.svg',
                              color: context.adColors.whiteTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ).paddingBySide(
          left: context.k_10,
          right: context.k_16,
        ),
      ),
    );
  }
}
