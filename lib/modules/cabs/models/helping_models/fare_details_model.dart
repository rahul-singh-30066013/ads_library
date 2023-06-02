/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

class FareDetailsModel {
  final String titleText;
  final String valueText;
  TextStyle? valueStyle = ADTextStyle400.size16;

  FareDetailsModel({
    required this.titleText,
    required this.valueText,
    this.valueStyle,
  });
}
