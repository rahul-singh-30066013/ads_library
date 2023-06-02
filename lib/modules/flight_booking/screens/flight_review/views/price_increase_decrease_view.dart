/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// [PriceIncreaseDecreaseView] is used to show price change as per increase/decrease type.
class PriceIncreaseDecreaseView extends StatelessWidget {
  const PriceIncreaseDecreaseView({
    Key? key,
    required this.selectedFlightFareFromList,
    required this.currentFlightFare,
    required this.onTap,
  }) : super(key: key);

  final num selectedFlightFareFromList;
  final double currentFlightFare;
  final ADTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    const decreaseColor = Color(0xffe7f5f2);
    const increaseColor = Color(0xfffbeced);
    const increaseIconColor = Color(0xffdc464b);
    return selectedFlightFareFromList == currentFlightFare
        ? const SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
              color: currentFlightFare > selectedFlightFareFromList
                  ? increaseColor
                  : decreaseColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.k_4,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: context.k_4,
              horizontal: context.k_4,
            ),
            child: Row(
              children: [
                IconButton(
                  iconSize: context.k_30,
                  visualDensity: VisualDensity.compact,
                  splashRadius: context.k_20,
                  padding: EdgeInsets.zero,
                  onPressed: onTap,
                  icon: SvgPicture.asset(
                    SvgAssets.closeIcon,
                    height: context.k_14,
                    width: context.k_14,
                    color: context.adColors.greyTextColor,
                  ),
                ),
                SvgPicture.asset(
                  currentFlightFare > selectedFlightFareFromList
                      ? SvgAssets.fareIncrease
                      : SvgAssets.fareDecrease,
                  height: context.k_24,
                  width: context.k_24,
                  color: currentFlightFare > selectedFlightFareFromList
                      ? increaseIconColor
                      : context.adColors.greenColor,
                  //  fit: BoxFit.fill,
                ),
                ADSizedBox(
                  width: context.k_12,
                ),
                Expanded(
                  child: Text(
                    currentFlightFare > selectedFlightFareFromList
                        ? '${'airfare_increased'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(
                            price:
                                currentFlightFare - selectedFlightFareFromList,
                          )}'
                        : '${'airfare_decreased'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(
                            price:
                                selectedFlightFareFromList - currentFlightFare,
                          )}',
                    style: ADTextStyle400.size14.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          );
  }
}
