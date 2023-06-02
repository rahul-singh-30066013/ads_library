/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
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

//this screen will be shown to user when booking cancelled
class FlightCancelRefundPopup extends StatelessWidget {
  ///This is to get the callback on click of apply
  final ADTapCallback onProceedCallBack;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;
  final String? btnText;

  const FlightCancelRefundPopup({
    Key? key,
    required this.onProceedCallBack,
    required this.titleString,
    required this.detailString,
    this.btnText,
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
          const PopupHeader(),
          SizedBox(
            height: context.scaled(context.k_6),
          ),
          Text(
            titleString,
            textAlign: TextAlign.left,
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
          ).paddingBySide(left: context.k_16, right: context.k_16),
          SizedBox(
            height: context.k_20,
          ),
          Text(
            detailString,
            textAlign: TextAlign.left,
            style: ADTextStyle400.size16.setTextColor(context.adColors.black),
          ).paddingBySide(left: context.k_16, right: context.k_16),
          SizedBox(
            height: context.scaled(context.k_30),
          ),
          PopupFooter(
            onProceedCallBack: onProceedCallBack,
            btnText: btnText,
          ),
          SizedBox(
            height: context.scaled(context.k_30),
          ),
        ],
      ),
    );
  }
}

///_height is used for header & Tab bar container height
const _height = 50.0;

///_height is used for bottom container height
double _bottomContainerHeight = 48.sp;
double _bottomContainerWidth = 230.sp;

/// This class is used to for create Footer View
///[PopupHeader] is use for create Header View
class PopupHeader extends StatelessWidget {
  const PopupHeader({
    Key? key,
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
          InkWell(
            key: const Key('cancellationDone'),
            splashColor: context.adColors.transparentColor,
            onTap: () => {
              Navigator.pop(context),
            },

            ///Image that will be used to Left Top close button
            child: SvgPicture.asset(
              SvgAssets.closeIcon,
              height: context.k_14,
              width: context.k_14,
              color: closeIconColor,
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
/// [PopupFooter] is used for create footer button
class PopupFooter extends StatelessWidget {
  final String? btnText;
  const PopupFooter({
    this.btnText,
    Key? key,
    required this.onProceedCallBack,
  }) : super(key: key);

  ///This is to get the callback on click of apply
  final ADTapCallback onProceedCallBack;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: _bottomContainerHeight,
        width: _bottomContainerWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: context.adColors.blueColor,
            shape: const StadiumBorder(),
          ),
          onPressed: onProceedCallBack,
          child: Text(
            btnText ?? 'done'.localize(context),
            style: ADTextStyle700.size16
                .setTextColor(context.adColors.whiteTextColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
