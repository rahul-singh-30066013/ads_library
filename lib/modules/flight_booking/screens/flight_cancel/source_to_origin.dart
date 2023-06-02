/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class SourceToOrigin extends StatelessWidget {
  final String source;
  final String destination;
  const SourceToOrigin({
    Key? key,
    required this.source,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          source,
          style: ADTextStyle600.size18.setTextColor(context.adColors.black),
        ),
        Icon(
          Icons.arrow_forward,
          color: Colors.black,
          size: context.k_16,
        ).paddingBySide(
          left: context.k_6,
          right: context.k_6,
        ),
        Text(
          destination,
          style: ADTextStyle600.size18.setTextColor(context.adColors.black),
        ),
      ],
    );
  }
}
