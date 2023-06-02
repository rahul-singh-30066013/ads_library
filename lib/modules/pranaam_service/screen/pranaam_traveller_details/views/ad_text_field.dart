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

class ADTextField extends StatelessWidget {
  const ADTextField({
    Key? key,
    this.keyboardType,
    this.onChanged,
    required this.label,
    this.isBorder = true,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final ADGenericCallback? onChanged;
  final String label;
  final bool? isBorder;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Container(
      height: context.k_60,
      padding: EdgeInsets.symmetric(
        horizontal: context.k_10,
      ),
      decoration: isBorder == true ? buildBoxDecoration(context) : null,
      child: TextFormField(
        keyboardType: keyboardType,
        style: ADTextStyle500.size16.copyWith(color: context.adColors.black),
        onChanged: (value) => onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: ADTextStyle400.size16
              .copyWith(color: context.adColors.greyTextColor),
          fillColor: Colors.white,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
