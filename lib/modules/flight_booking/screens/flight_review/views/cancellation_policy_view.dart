/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///this class is returning a text which is describing the cancellation policy.
class CancellationPolicyView extends StatelessWidget {
  final String? cancellationDescription;
  const CancellationPolicyView({Key? key, this.cancellationDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      cancellationDescription.isNullOrEmpty
          ? 'cancellation_policy'.localize(context)
          : cancellationDescription.validateWithDefaultValue(),
      style: ADTextStyle400.size14
          .setTextColor(context.adColors.darkGreyTextColor),
    ).paddingBySide(
      left: context.k_16,
      right: context.k_20,
      bottom: context.k_16,
    );
  }
}
