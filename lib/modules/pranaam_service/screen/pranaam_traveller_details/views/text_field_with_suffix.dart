/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_prefix_spinner.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_text_field.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/common_colors.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

List<String> list = const [
  'Male',
  'Female',
  'Hello',
];

const int flex = 2;

/// this class is used to draw the textfield with border and suffix.
class TextFieldWithSuffix extends StatefulWidget {
  const TextFieldWithSuffix({
    this.onChanged,
    required this.labelText,
    this.isPrefixVisible,
    this.keyboardType,
    this.prefixText,
    this.prefixLabelText,
    this.prefixIcon,
    this.suffixIcon,
    required this.onPrefixTap,
    this.controller,
    Key? key,
  }) : super(key: key);

  final String? prefixLabelText;
  final String labelText;
  final String? prefixText;
  final bool? isPrefixVisible;
  final ADGenericCallback? onChanged;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final ADGenericCallback onPrefixTap;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  State<TextFieldWithSuffix> createState() => _ADTextFormFieldState();
}

class _ADTextFormFieldState extends State<TextFieldWithSuffix> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Container(
      height: context.k_60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.k_8),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ADPrefixSpinner(
              controller: widget.controller,
              label: widget.prefixLabelText,
              onTapResult: (value) => widget.onPrefixTap(value),
              prefixIcon: widget.prefixIcon,
              iconWidget: widget.suffixIcon,
              isBorder: false,
            ),
          ),
          Container(
            height: context.k_36,
            margin: EdgeInsets.symmetric(horizontal: context.k_10),
            width: 1,
            color: borderColor,
          ),
          Flexible(
            flex: flex,
            child: ADTextField(
              label: widget.labelText,
              onChanged: widget.onChanged,
              keyboardType: widget.keyboardType,
              isBorder: false,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration buildPrefixDecoration(BuildContext context) {
    return InputDecoration(
      prefixIcon: widget.prefixIcon,
      labelText: widget.prefixLabelText,
      labelStyle:
          ADTextStyle400.size16.copyWith(color: context.adColors.greyTextColor),
      fillColor: Colors.white,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }
}
