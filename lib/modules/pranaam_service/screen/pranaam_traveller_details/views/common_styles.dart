/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

BoxDecoration buildBoxDecoration(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(context.k_8),
    border: Border.all(
      color: borderColor,
    ),
  );
}
