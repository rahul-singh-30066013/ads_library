/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/utils/constant/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/shop_list_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class LocationView extends StatelessWidget {
  final String locationTerminal;
  final String shopLocation;
  final String labelCheckInArea;
  final bool? isSelected;
  const LocationView({
    required this.locationTerminal,
    required this.labelCheckInArea,
    required this.shopLocation,
    this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.k_20),
      padding: EdgeInsets.all(context.k_20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
        border: Border.all(
          color: isSelected == true
              ? context.adColors.blackTextColor
              : context.adColors.tileBorderColor,
        ),
        color: context.adColors.whiteTextColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locationTerminal,
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
              ).paddingBySide(bottom: context.k_12),
              Text(
                labelCheckInArea,
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.greyTextColor),
              ),
              Text(
                shopLocation,
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.greyTextColor),
              ).paddingBySide(top: context.k_6),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            SvgAssets.icNavigation,
            width: context.k_36,
            height: context.k_36,
            key: const Key(
              ShopListAutomationKeys.checkInAreaNavigationTapKey,
            ),
          ),
        ],
      ),
    );
  }
}
