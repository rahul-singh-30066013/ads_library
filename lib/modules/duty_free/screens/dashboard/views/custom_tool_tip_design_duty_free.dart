/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

ValueNotifier<bool> isFirstOpeDutyFreeScreen = ValueNotifier(true);

class CustomToolTipDesignDutyFree extends StatelessWidget {
  CustomToolTipDesignDutyFree({Key? key}) : super(key: key);
  final double height = 28.sp;
  final double width = 180.sp;
  final double rotateDegree = 0.135;
  final double bottomPadding = 1.sp;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_4),
          ),
        ),
        child: Stack(
          children: [
            RotationTransition(
              alignment: Alignment.topLeft,
              turns: AlwaysStoppedAnimation(rotateDegree),
              child: Container(
                color: Colors.black,
                height: context.k_20,
                width: context.k_20,
              ),
            ).paddingBySide(left: context.k_10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'you_can_change_the_terminal_to_see_the_range_of_products_available_there'
                        .localize(context),
                    style: ADTextStyle400.size10
                        .setTextColor(context.adColors.whiteTextColor),
                  ).paddingBySide(
                    left: context.k_10,
                    right: context.k_10,
                    bottom: bottomPadding,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    iconSize: context.k_14,
                    splashRadius: context.k_12,
                    color: context.adColors.whiteTextColor,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => readToolTipDisplay(context),
                    icon: const Icon(Icons.close),
                  ).paddingBySide(right: context.k_6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void readToolTipDisplay(BuildContext context) {
  context.read<DutyFreeState>().terminalToolTipDisplay = false;
  isFirstOpeDutyFreeScreen.value = false;
}

void setFirstOpenDutyFree(value, DutyFreeState? dutyFreeState) {
  // final dataObj = <String, Object>{
  //   'key': 'isInitialOpenDutyFree',
  //   'dataType': 'boolean',
  //   'value': value,
  // };
  // AdaniMobilePlugin.writeSharedPref(dataObj);
  dutyFreeState?.terminalToolTipDisplay = value;
}

// Future<void> checkFirstOpenDutyFree(DutyFreeState? dutyFreeState) async {
//   // final dataObj = <String, Object>{
//   //   'key': 'isInitialOpenDutyFree',
//   //   'dataType': 'boolean',
//   // };
//   // await AdaniMobilePlugin.readSharedPref(dataObj).then((value) {
//   //   isFirstOpeDutyFreeScreen.value = value;
//   // });
//   isFirstOpeDutyFreeScreen.value =
//       dutyFreeState?.terminalToolTipDisplay ?? false;
// }

Future<void> wait2SecandDismissToolTip(DutyFreeState? dutyFreeState) async {
  // setFirstOpenDutyFree(true);
  Future.delayed(const Duration(seconds: 5), () async {
    dutyFreeState?.terminalToolTipDisplay = false;
    isFirstOpeDutyFreeScreen.value = false;
  });
}
