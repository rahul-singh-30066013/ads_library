/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// dynamic button for all filter buttons
class ActionButtonWithIcon extends StatelessWidget {
  final bool showIcon;
  final FlightSort type;
  final bool isAscendingOrder;
  final double paddingBetweenTextAndIcon;

  const ActionButtonWithIcon({
    Key? key,
    required this.showIcon,
    required this.type,
    required this.isAscendingOrder,
    required this.paddingBetweenTextAndIcon,
  }) : super(key: key);

  String filterName(FlightSort type, BuildContext context) {
    switch (type) {
      case FlightSort.byPrice:
        return 'price'.localize(context);
      case FlightSort.byDuration:
        return 'duration'.localize(context);
      case FlightSort.byTime:
        return 'time'.localize(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          filterName(type, context),
          textAlign: TextAlign.center,
          style: showIcon
              ? ADTextStyle500.size14.setTextColor(context.adColors.black)
              : ADTextStyle400.size14
                  .setTextColor(context.adColors.greyTextColor),
        ),
        ADSizedBox(
          width: paddingBetweenTextAndIcon,
        ),
        BuildIcon(showIcon: showIcon, isAscendingOrder: isAscendingOrder),
      ],
    );
  }
}

class BuildIcon extends StatelessWidget {
  final bool showIcon;
  final bool isAscendingOrder;
  static const int rotationTurns = 2;

  const BuildIcon({
    Key? key,
    required this.showIcon,
    required this.isAscendingOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconHeight = 12.sp;
    return !isAscendingOrder
        ? SvgPicture.asset(
            'lib/assets/images/svg/icons/flight/sort_arrow.svg',
            color: showIcon
                ? context.adColors.greyTextColor
                : context.adColors.transparentColor,
            height: iconHeight,
          )
        : RotatedBox(
            quarterTurns: rotationTurns,
            child: SvgPicture.asset(
              'lib/assets/images/svg/icons/flight/sort_arrow.svg',
              color: showIcon
                  ? context.adColors.greyTextColor
                  : context.adColors.transparentColor,
              height: iconHeight,
            ),
          );
  }
}
