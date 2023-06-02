/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This Class is used to check and change flight status terminals
class FlightArrivalDepartureScreen extends StatelessWidget {
  final List<String> flightTypes;
  final String selectedFlightType;
  final ADTapCallbackWithValue flightTypeTap;

  const FlightArrivalDepartureScreen({
    Key? key,
    required this.flightTypes,
    required this.selectedFlightType,
    required this.flightTypeTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: flightTypes.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => flightTapCall(index: index, context: context),
        child: Container(
          color: selectedFlightType == flightTypes[index]
              ? context.adColors.lightBlue
              : Colors.transparent,
          child: Row(
            children: [
              Text(
                flightTypes[index],
                style: selectedFlightType == flightTypes[index]
                    ? ADTextStyle600.size16
                        .setTextColor(context.adColors.blackColor)
                    : ADTextStyle400.size16
                        .setTextColor(context.adColors.blackColor),
              ),
              Expanded(
                child: Visibility(
                  visible: selectedFlightType == flightTypes[index],
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ADSizedBox(
                      height: context.k_12,
                      width: context.k_14,
                      child: SvgPicture.asset(
                        SvgAssets.refundableCheck,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).paddingBySide(
            top: context.k_14,
            bottom: context.k_14,
            left: context.k_16,
            right: context.k_16,
          ),
        ),
      ),
    );
  }

  void flightTapCall({
    required int index,
    required BuildContext context,
  }) {
    flightTypeTap(
      index == 0 ? FlightType.arrival : FlightType.departure,
    );
    navigatorPopScreen(context);
  }
}
