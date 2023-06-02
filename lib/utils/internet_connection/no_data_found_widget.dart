/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/filters_list_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///The class returns the design for the screens
///when no data is found

class NoDataFoundWidget extends StatefulWidget {
  const NoDataFoundWidget({
    Key? key,
    this.pageMainDesc,
    this.pageSubDesc,
    this.showButton,
    this.buttonText,
    this.imageStyle,
    this.onTapHandler,
  }) : super(key: key);

  //The main description of the page/screen
  final String? pageMainDesc;

  //The sub heading or description of the page/screen

  final String? pageSubDesc;

  //Bool value to determine whether to show any action button or not
  final bool? showButton;

  //If the button is to be shown this defines the text on the button
  final String? buttonText;

  //The type of image to be shown on the screen
  final Widget? imageStyle;

  ///use the typedef [ADTapCallback] a callback for button pressed.
  final ADTapCallback? onTapHandler;

  @override
  State<NoDataFoundWidget> createState() => _NoDataFoundWidgetState();
}

class _NoDataFoundWidgetState extends State<NoDataFoundWidget> {
  // StreamSubscription? connectivityStream;
  final sizeConstant = 200.0;
  final heightConstant = 32.0;
  final btnWidth = 256;
  final btnHeight = 48;
  final bottomPaddingConst = 10;
  final buttonHeight = 56.0;
  final buttonWidth = 150.0;
  final borderWidth = 1.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: context.scaled(sizeConstant),
              height: context.scaled(sizeConstant),
              child: widget.imageStyle,
            ),
          ),
          const SizedBox(
            height: k_20,
          ),
          Center(
            child: Text(
              widget.pageMainDesc?.localize(context) ?? '',
              style: ADTextStyle700.size24.copyWith(
                color: context.adColors.blackTextColor,
              ),
            ),
          ),
          const SizedBox(
            height: k_20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.k_48),
            child: Text(
              widget.pageSubDesc?.localize(context) ?? '',
              textAlign: TextAlign.center,
              style: ADTextStyle400.size14.copyWith(
                color: context.adColors.greyTextColor,
              ),
            ),
          ),
          SizedBox(height: heightConstant),
          Visibility(
            visible: widget.showButton ?? false,
            child: Center(
              child: Container(
                height: buttonHeight,
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: widget.onTapHandler,
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    primary: ADColors.white,
                    side: BorderSide(
                      width: borderWidth,
                      color: ADColors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.buttonText?.localize(context) ?? '',
                      style: ADTextStyle500.size14
                          .setTextColor(context.adColors.blackColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ).paddingBySide(
                      top: context.k_16,
                      bottom: context.k_16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).paddingBySide(bottom: bottomPaddingConst.sp);
  }
}
