/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/common_styles.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class ADPrefixSpinner extends StatefulWidget {
  /// This is used to draw spinner having label
  ///
  /// ADPrefixSpinner(
  ///                   label: 'label',
  ///                   onTapResult: (controller) => adShowBottomSheet(
  ///                     context: context,
  ///                     childWidget: GenericBottomSheet(
  ///                       onBottomSheetItemSelect: (value) =>
  ///                           onBottomSheetSelect(controller, value),
  ///                       bottomSheetHeader: 'bottomSheetHeader',
  ///                       bottomSheetList: bottomSheetList,
  ///                     ),
  ///                     headerTitle: 'headerTitle',
  ///                   ),
  ///                 ),
  const ADPrefixSpinner({
    Key? key,
    required this.label,
    this.iconWidget,
    required this.onTapResult,
    this.prefixIcon,
    this.controller,
    this.isBorder = true,
  }) : super(key: key);
  final String? label;
  final Widget? iconWidget;
  final ADGenericCallback onTapResult;
  final Widget? prefixIcon;
  final bool? isBorder;
  final TextEditingController? controller;

  @override
  State<ADPrefixSpinner> createState() => _ADPrefixSpinnerState();
}

class _ADPrefixSpinnerState extends State<ADPrefixSpinner> {
  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return GestureDetector(
      onTap: () => widget.onTapResult(widget.controller),
      child: Container(
        height: context.k_60,
        padding: EdgeInsets.symmetric(horizontal: context.k_10),
        decoration:
            widget.isBorder == true ? buildBoxDecoration(context) : null,
        child: Row(
          children: [
            Flexible(
              child: AbsorbPointer(
                child: TextFormField(
                  keyboardType: TextInputType.none,
                  controller: widget.controller,
                  readOnly: true,
                  style: ADTextStyle400.size16
                      .copyWith(color: context.adColors.black),
                  decoration: InputDecoration(
                    prefixIcon: widget.prefixIcon,
                    labelText: widget.label,
                    labelStyle: ADTextStyle400.size16
                        .copyWith(color: context.adColors.greyTextColor),
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            widget.iconWidget ??
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.chevron_right,
                    color: context.adColors.blackTextColor,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
