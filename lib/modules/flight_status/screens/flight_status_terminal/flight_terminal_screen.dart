/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
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
class FlightTerminalScreen extends StatelessWidget {
  final List<String> terminals;
  final String selectedTerminal;
  final ADTapCallbackWithValue terminalTap;

  const FlightTerminalScreen({
    Key? key,
    required this.terminals,
    required this.selectedTerminal,
    required this.terminalTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: terminals.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => terminalTapCall(index: index, context: context),
        child: Container(
          color: selectedTerminal == terminals[index]
              ? context.adColors.lightBlue
              : Colors.transparent,
          child: Row(
            children: [
              Text(
                terminals[index],
                style: selectedTerminal == terminals[index]
                    ? ADTextStyle600.size16
                        .setTextColor(context.adColors.blackColor)
                    : ADTextStyle400.size16
                        .setTextColor(context.adColors.blackColor),
              ),
              Expanded(
                child: Visibility(
                  visible: selectedTerminal == terminals[index],
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

  void terminalTapCall({
    required int index,
    required BuildContext context,
  }) {
    terminalTap(
      terminals[index],
    );
    navigatorPopScreen(context);
  }
}
