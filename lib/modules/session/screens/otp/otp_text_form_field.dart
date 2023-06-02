/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class OtpTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String value) onChanged;
  final ADTapCallback onTapClick;
  final int index;

  const OtpTextFormField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onTapClick,
    required this.focusNode,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textRightPadding = 7.sp;
    return Expanded(
      child: TextFormField(
        onTap: onTapClick,
        enableInteractiveSelection: false,
        controller: controller,
        key: const Key(FlightAutomationKeys.otpBox),
        focusNode: focusNode,
        cursorColor: context.adColors.blackTextColor,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        style: ADTextStyle500.size18,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            right: index == 0
                ? 0
                : controller.text.trim().isEmpty
                    ? textRightPadding
                    : 0,
          ),
          counterText: '',
          hintText: '',
          hintStyle: TextStyle(color: context.adColors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.adColors.greyTextColor,
            ),
            borderRadius: BorderRadius.circular(
              context.scaled(context.k_6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.adColors.blackTextColor,
            ),
            borderRadius: BorderRadius.circular(
              context.scaled(context.k_6),
            ),
          ),
        ),
      ).paddingBySide(
        right: context.k_8,
        left: context.k_8,
      ),
    );
  }
}
