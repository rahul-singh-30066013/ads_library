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
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is use to manage title and subtitle for sliver app bar
///using FlexibleSpace bar
class ADHomeFlexibleSpaceBar extends StatelessWidget {
  final String selectedAirport;
  final String defaultTitle;
  final int headerMaxLines;

  const ADHomeFlexibleSpaceBar({
    Key? key,
    required this.selectedAirport,
    required this.defaultTitle,
    required this.headerMaxLines,
    // required this.innerBoxIsScrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            defaultTitle,
            style: ADTextStyle700.size32
                .setTextColor(context.adColors.filterBlackText),
            maxLines: headerMaxLines,
          ),
          ADSizedBox(
            height: context.k_6,
          ),
          Row(
            children: [
              Text(
                selectedAirport,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.filterBlackText),
              ),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: context.adColors.blackTextColor,
                size: context.k_16,
              ),
            ],
          ).paddingBySide(left: context.k_2),
        ],
      ),
    );
  }
}
