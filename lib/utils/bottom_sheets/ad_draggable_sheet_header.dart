/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///TODO add in style
const closeIconColor = Color(0xff222222);

///This class creates header widget having cancel button and title aligned vertically.
///[headerTitle] it is a string value marked as required.
///[closeCallBack] callback for tap on close icon.
///
class ADDraggableSheetHeader extends StatelessWidget {
  ///
  ///Usage
  ///ADDraggableSheetHeader(headerTitle = 'Header Value',closeCallBack: (){},);
  ///

  const ADDraggableSheetHeader({
    Key? key,
    required this.headerTitle,
    required this.closeCallBack,
  }) : super(key: key);

  ///[headerTitle] it is a string value marked as required.
  final String headerTitle;

  ///[closeCallBack] callback for tap on close icon.
  final ADGenericCallback closeCallBack;

  ///TODO design is changes as recommend by designing team
  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key(FlightAutomationKeys.headerKey),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            key: const Key(FlightAutomationKeys.headerIconKey),
            iconSize: context.k_48,
            visualDensity: VisualDensity.compact,
            splashRadius: context.k_20,
            padding: EdgeInsets.zero,
            onPressed: () => closeCallBack('close'),
            icon: SvgPicture.asset(
              SvgAssets.closeIcon,
              height: context.k_14,
              width: context.k_14,
              color: closeIconColor,
            ),
          ),
        ),
        if (headerTitle.isNotEmpty)
          Text(
            headerTitle,
            key: const Key(FlightAutomationKeys.headerTitleKey),
            style: ADTextStyle700.size20
                .setTextColor(context.adColors.blackTextColor),
          ).paddingBySide(
            top: context.k_6,
            left: context.k_16,
          ),
      ],
    );
  }
}
