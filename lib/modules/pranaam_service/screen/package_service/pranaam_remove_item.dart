/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class PranaamRemoveItem extends StatefulWidget {
  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  ///This is to get the callback on click of apply
  final ADTapCallback noCallBack;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;

  final String? cancelText;
  final String? confirmText;

  const PranaamRemoveItem({
    Key? key,
    required this.yesCallBack,
    required this.noCallBack,
    required this.titleString,
    required this.detailString,
    this.cancelText,
    this.confirmText,
  }) : super(key: key);

  @override
  _PranaamRemoveItemState createState() => _PranaamRemoveItemState();
}

class _PranaamRemoveItemState extends State<PranaamRemoveItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ADBottomSheetDragBar(
                height: context.k_4,
                width: context.k_40,
              ).paddingBySide(top: context.k_10),
              const DutyFreeRemoveItemHeader(),
              SizedBox(
                height: context.scaled(context.k_6),
              ),
            ],
          ),
          Text(
            widget.titleString,
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
            widget.detailString,
            textAlign: TextAlign.left,
            style: ADTextStyle400.size16.setTextColor(context.adColors.black),
            key: const Key(
              DutyFreeCartAutomationKeys.dutyFreeRemoveDescriptionTitle,
            ),
          ).paddingBySide(left: context.k_16, right: context.k_16),
          SizedBox(
            height: context.scaled(context.k_30),
          ),
          DutyFreeRemoveItemFooter(
            yesCallBack: widget.yesCallBack,
            noCallBack: widget.noCallBack,
            cancelText: widget.cancelText,
            confirmText: widget.confirmText,
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
///[DutyFreeRemoveItemHeader] is use for create Header View
class DutyFreeRemoveItemHeader extends StatelessWidget {
  const DutyFreeRemoveItemHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaled(_height),
      child: Row(
        children: <Widget>[
          InkWell(
            key: const Key('dutyFreeRemoveClose'),
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
/// [DutyFreeRemoveItemFooter] is used for create footer button
class DutyFreeRemoveItemFooter extends StatelessWidget {
  const DutyFreeRemoveItemFooter({
    Key? key,
    required this.yesCallBack,
    required this.noCallBack,
    this.cancelText,
    this.confirmText,
  }) : super(key: key);

  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  ///This is to get the callback on click of apply
  final ADTapCallback noCallBack;
  final String? cancelText;
  final String? confirmText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _bottomContainerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
              onPressed: noCallBack,
              child: Text(
                confirmText ?? 'cancel'.localize(context),
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
              onPressed: yesCallBack,
              child: Selector<PranaamAppDataStateManagement, bool>(
                selector: (context, model) => model.isBookPackageClicked,
                builder: (context, value, child) => value
                    ? ADDotProgressView(
                        color: context.adColors.whiteTextColor,
                        size: dotSize,
                      )
                    : Text(
                        cancelText ?? 'remove'.localize(context),
                        style: ADTextStyle600.size16
                            .setTextColor(context.adColors.whiteTextColor),
                      ),
              ),
            ).paddingBySide(left: context.k_4, right: context.k_16),
          ),
        ],
      ).paddingBySide(bottom: context.k_36),
    );
  }
}
