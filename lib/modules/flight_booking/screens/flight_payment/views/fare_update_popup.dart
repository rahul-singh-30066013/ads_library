/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

//this screen will be shown to user when price has been changed while booking flight
class FareUpdatePopup extends StatelessWidget {
  ///This is to get the callback on click of reset
  final ADTapCallback onChangeCallBack;

  ///This is to get the callback on click of apply
  final ADTapCallback? onProceedCallBack;

  ///This is to get the callback on click of cross
  final ADTapCallback? onCrossCallback;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;

  const FareUpdatePopup({
    Key? key,
    required this.onChangeCallBack,
    required this.onProceedCallBack,
    required this.titleString,
    required this.detailString,
    this.onCrossCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ).paddingBySide(top: context.k_10),
          FareUpdatePopupHeader(onCrossCallback: onCrossCallback),
          SizedBox(
            height: context.k_6,
          ),
          Text(
            titleString,
            textAlign: TextAlign.left,
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
            key: const Key(
              DutyFreeCartAutomationKeys.dutyFreeRemoveHeaderTitle,
            ),
          ).paddingBySide(left: context.k_16, right: context.k_16),
          SizedBox(
            height: context.k_20,
          ),
          Text(
            detailString,
            textAlign: TextAlign.left,
            style: ADTextStyle400.size16.setTextColor(context.adColors.black),
            key: const Key(
              DutyFreeCartAutomationKeys.dutyFreeRemoveDescriptionTitle,
            ),
          ).paddingBySide(left: context.k_16, right: context.k_16),
          SizedBox(
            height: context.k_30,
          ),
          FareUpdatePopupFooter(
            onChangeCallBack: onChangeCallBack,
            onProceedCallBack: onProceedCallBack,
          ),
        ],
      ),
    );
  }
}

///_height is used for header & Tab bar container height
const _height = 50.0;

///_height is used for bottom container height
double _bottomContainerHeight = 84.sp;

/// This class is used to for create Duty Free Remove Item Header & Footer View
///[FareUpdatePopupHeader] is use for create Header View
class FareUpdatePopupHeader extends StatelessWidget {
  final ADTapCallback? onCrossCallback;
  const FareUpdatePopupHeader({
    Key? key,
    this.onCrossCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaled(_height),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: context.k_12,
          ),
          if (onCrossCallback != null)
            InkWell(
              key: const Key('fareUpdateClose'),
              splashColor: context.adColors.transparentColor,
              onTap: onCrossCallback ??
                  () => {
                        Navigator.pop(context),
                      },

              ///Image that will be used to Left Top close button
              child: SvgPicture.asset(
                SvgAssets.closeIcon,
                height: context.k_14,
                width: context.k_14,
                color: closeIconColor,
              ),
            )
          else
            SizedBox(
              width: context.k_14,
              height: context.k_14,
            ),
          SizedBox(
            width: context.k_4,
          ),
        ],
      ),
    ).paddingBySide(left: context.k_6, right: context.k_6);
  }
}

/// This class is used for create Footer View
/// [FareUpdatePopupFooter] is used for create footer button
class FareUpdatePopupFooter extends StatelessWidget {
  const FareUpdatePopupFooter({
    Key? key,
    required this.onChangeCallBack,
    required this.onProceedCallBack,
  }) : super(key: key);

  ///This is to get the callback on click of reset
  final ADTapCallback onChangeCallBack;

  ///This is to get the callback on click of apply
  final ADTapCallback? onProceedCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _bottomContainerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (onProceedCallBack != null)
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
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
                onPressed: onProceedCallBack,
                child: Text(
                  'ok_button_label'.localize(context),
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.blackTextColor),
                ),
              ).paddingBySide(left: context.k_16, right: context.k_4),
            ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                foregroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.whiteTextColor,
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(context.adColors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_28)),
                    side: const BorderSide(),
                  ),
                ),
              ),
              onPressed: onChangeCallBack,
              child: Text(
                'change_flight'.localize(context),
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.whiteTextColor),
              ),
            ).paddingBySide(
              left: onProceedCallBack != null ? context.k_4 : context.k_16,
              right: context.k_16,
            ),
          ),
        ],
      ).paddingBySide(bottom: context.k_36),
    );
  }
}
