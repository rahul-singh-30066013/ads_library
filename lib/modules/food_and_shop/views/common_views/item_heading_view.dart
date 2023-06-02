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

class ItemHeadingView extends StatelessWidget {
  const ItemHeadingView({
    required this.listTitle,
    this.listLength,
    Key? key,
  }) : super(key: key);

  final String listTitle;
  final int? listLength;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.blackTextColor),
            text: listTitle,
          ),
          if (listLength != null)
            TextSpan(
              style: ADTextStyle700.size22.setTextColor(
                context.adColors.brownishGrey,
              ),
              text: ' ($listLength)',
            ),
        ],
      ),
    );
  }
}
