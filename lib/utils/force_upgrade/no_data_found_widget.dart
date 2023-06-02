/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///The class returns the design for the screens
///when no data is found

class NoDataFoundWidget extends StatefulWidget {
  const NoDataFoundWidget({
    Key? key,
    this.pageMainDesc,
    this.pageSubDesc,
    this.showButton,
    this.buttonText,
    required this.imageStyle,
    this.onTapHandler,
    this.showNotNow,
    this.onTapHandlerNotNow,
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
  final Widget imageStyle;

  ///use the typedef [ADTapCallback] a callback for button pressed.
  final ADTapCallback? onTapHandler;
  final bool? showNotNow;
  final ADTapCallback? onTapHandlerNotNow;

  @override
  State<NoDataFoundWidget> createState() => _NoDataFoundWidgetState();
}

class _NoDataFoundWidgetState extends State<NoDataFoundWidget> {
  final double horizontalPadding = 66.sp;
  final double topPadding = 92.sp;
  final dullBlackColor = const Color(0xff222222);
  final blackColor = const Color(0xff000000);

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
    final String? mainDesc = widget.pageMainDesc;
    final String? subDesc = widget.pageSubDesc;
    final String btnText = widget.buttonText ?? '';
    return Material(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: context.scaled(width),
              //   height: context.scaled(height),
              //   child: widget.imageStyle,
              // ),
              Container(
                padding: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                  top: topPadding.sp,
                ),
                child: widget.imageStyle,
              ),
              if (mainDesc != null)
                SizedBox(
                  height: context.k_20,
                )
              else
                const SizedBox.shrink(),
              if (mainDesc != null)
                Center(
                  child: Text(
                    mainDesc,
                    textAlign: TextAlign.center,
                    style: ADTextStyle700.size22.copyWith(
                      color: context.adColors.filterBlackText,
                      decoration: TextDecoration.none,
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              if (subDesc != null)
                SizedBox(
                  height: context.k_20,
                )
              else
                const SizedBox.shrink(),
              if (subDesc != null)
                Center(
                  child: Text(
                    subDesc,
                    textAlign: TextAlign.center,
                    style: ADTextStyle400.size16.copyWith(
                      color: context.adColors.neutralInfoMsg,
                      decoration: TextDecoration.none,
                    ),
                  ).paddingBySide(left: context.k_30, right: context.k_30),
                )
              else
                const SizedBox.shrink(),
              SizedBox(
                height: context.k_32,
              ),
              Visibility(
                visible: widget.showButton ?? false,
                child: SizedBox(
                  height: context.k_48,
                  width: context.widthOfScreen - context.k_32,
                  child: ElevatedButton(
                    onPressed: widget.onTapHandler,
                    style: ElevatedButton.styleFrom(
                      primary: context.adColors.blackTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(context.k_48),
                        side: BorderSide(
                          color: context.adColors.blackTextColor,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      btnText,
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ).paddingBySide(
                    left: context.scaled(context.k_16),
                    right: context.scaled(context.k_16),
                  ),
                ),
              ),
              SizedBox(
                height: context.k_24,
              ),
              Visibility(
                visible: widget.showNotNow ?? false,
                child: Center(
                  child: TextButton(
                    onPressed: widget.onTapHandlerNotNow,
                    style: TextButton.styleFrom(
                      primary: dullBlackColor,
                    ),
                    child: Text(
                      'not_now'.localize(context),
                      textAlign: TextAlign.center,
                      style: ADTextStyle600.size14.copyWith(
                        color: blackColor,
                        decoration: TextDecoration.underline,
                      ),
                    ).paddingBySide(left: context.k_48, right: context.k_48),
                  ),
                ),
              ),
            ],
          ),
        ).paddingBySide(bottom: context.k_10),
      ),
    );
  }
}
