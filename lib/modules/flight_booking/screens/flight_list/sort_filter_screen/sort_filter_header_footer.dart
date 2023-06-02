/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///_height is used for header & Tab bar container height
const _height = 50.0;

///_height is used for bottom container height
const _bottomContainerHeight = 64.0;

/// This class is used to for create Sort & Filter Header & Footer View
///[SortFilterHeaderFooter] is use for create Header View
///[SortFooterView] is use for create Footer View
class SortFilterHeaderFooter extends StatelessWidget {
  const SortFilterHeaderFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaled(_height),
      child: Row(
        children: <Widget>[
          InkWell(
            key: const Key('sortFilterClose'),
            splashColor: context.adColors.transparentColor,
            onTap: () => {
              Navigator.pop(context),
            },

            ///Image that will be used to Left Top close button
            child: Container(
              width: context.k_34,
              height: context.k_34,
              child: Image.asset(
                'lib/assets/images/common/cross_black.png',
                width: context.scaled(context.k_10),
                height: context.scaled(context.k_10),
              ).paddingAllSide(context.k_10),
            ),
          ),
          SizedBox(
            width: context.scaled(context.k_4),
          ),
          Text(
            'sort & filter'.localize(context),
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.neutralInfoMsg),
          ),
        ],
      ),
    );
  }
}

/// This class is used for create Footer View
/// [SortFooterView] is used for create footer button
class SortFooterView extends StatelessWidget {
  const SortFooterView({
    Key? key,
    required this.resetTapCallback,
    required this.applyTapCallback,
  }) : super(key: key);

  ///This is to get the callback on click of reset
  final ADTapCallback resetTapCallback;

  ///This is to get the callback on click of apply
  final ADTapCallback applyTapCallback;

  static const int flex1 = 30;
  static const int flex2 = 37;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaled(_bottomContainerHeight),
      color: context.adColors.whiteTextColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: flex1,
            child: ElevatedButton(
              key: const Key(FlightAutomationKeys.sortFilterReset),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(context.adColors.black),
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.whiteTextColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_28)),
                    side: const BorderSide(),
                  ),
                ),
              ),
              onPressed: resetTapCallback,
              child: Text(
                'reset'.localize(context),
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ).paddingBySide(left: context.k_16, right: context.k_4),
          ),
          Expanded(
            flex: flex2,
            child: ElevatedButton(
              key: const Key(FlightAutomationKeys.sortFilterApply),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.whiteTextColor,
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.blackTextColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_28)),
                    side: const BorderSide(),
                  ),
                ),
              ),
              onPressed: applyTapCallback,
              child: Text(
                'apply'.localize(context),
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.whiteTextColor),
              ),
            ).paddingBySide(left: context.k_4, right: context.k_16),
          ),
        ],
      ).paddingBySide(top: context.k_16),
    );
  }
}
