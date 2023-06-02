/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// Order cancellation bottom sheet popup
class DutyFreeOrderCancelPopUp extends StatefulWidget {
  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;
  final String? buttonTitle;
  static double k_72 = 72.sp;

  const DutyFreeOrderCancelPopUp({
    Key? key,
    required this.yesCallBack,
    required this.titleString,
    required this.detailString,
    this.buttonTitle,
  }) : super(key: key);

  @override
  _DutyFreeOrderCancelPopUpState createState() =>
      _DutyFreeOrderCancelPopUpState();
}

class _DutyFreeOrderCancelPopUpState extends State<DutyFreeOrderCancelPopUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DutyFreeOrderState>(
        builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
          return AbsorbPointer(
            absorbing:
                dutyFreeOrderState.orderCancellationState == Status.loading,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADBottomSheetDragBar(
                  height: context.k_4,
                  width: context.k_40,
                ).paddingBySide(top: context.k_10),
                DutyFreeRemoveOrderCancelHeader(),
                SizedBox(
                  height: context.scaled(context.k_6),
                ),
                Text(
                  widget.titleString,
                  textAlign: TextAlign.left,
                  style: ADTextStyle700.size22
                      .setTextColor(context.adColors.black),
                  key: const Key(
                    DutyFreeCartAutomationKeys.dutyFreeRemoveHeaderTitle,
                  ),
                ).paddingBySide(left: context.k_16, right: context.k_16),
                SizedBox(
                  height: context.k_20,
                ),
                Text(
                  widget.detailString,
                  textAlign: TextAlign.left,
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.black),
                  key: const Key(
                    DutyFreeCartAutomationKeys.dutyFreeRemoveDescriptionTitle,
                  ),
                ).paddingBySide(left: context.k_16, right: context.k_16),
                SizedBox(
                  height: context.scaled(context.k_30),
                ),
                DutyFreeRemoveOrderCancelFooter(
                  yesCallBack: widget.yesCallBack,
                  isLoading: dutyFreeOrderState.orderCancellationState ==
                      Status.loading,
                  buttonTitle: widget.buttonTitle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

///_height is used for header & Tab bar container height

///_height is used for bottom container height
double _bottomContainerHeight = 84.sp;

/// This class is used to for create Duty Free Remove Item Header & Footer View
///[DutyFreeRemoveOrderCancelHeader] is use for create Header View
class DutyFreeRemoveOrderCancelHeader extends StatelessWidget {
  DutyFreeRemoveOrderCancelHeader({
    Key? key,
  }) : super(key: key);
  final double _height = 50.sp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: Row(
        children: <Widget>[
          InkWell(
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
        ],
      ),
    ).paddingBySide(left: context.k_6, right: context.k_6);
  }
}

/// This class is used for create Footer View
/// [DutyFreeRemoveOrderCancelFooter] is used for create footer button
class DutyFreeRemoveOrderCancelFooter extends StatelessWidget {
  const DutyFreeRemoveOrderCancelFooter({
    Key? key,
    required this.yesCallBack,
    this.isLoading,
    this.buttonTitle,
  }) : super(key: key);

  final String? buttonTitle;

  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  /// isLoading view
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: _bottomContainerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                foregroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.whiteTextColor,
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.blueColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_28)),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
              onPressed: yesCallBack,
              child: (isLoading ?? false)
                  ? ADDotProgressView(
                      color: context.adColors.whiteTextColor,
                    )
                  : Text(
                      buttonTitle ?? 'yes'.localize(context),
                      style: ADTextStyle700.size16
                          .setTextColor(context.adColors.whiteTextColor),
                    ),
            ).paddingBySide(
              left: DutyFreeOrderCancelPopUp.k_72,
              right: DutyFreeOrderCancelPopUp.k_72,
            ),
          ),
        ],
      ).paddingBySide(bottom: context.k_36),
    );
  }
}
