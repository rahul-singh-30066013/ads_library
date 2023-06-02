/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/read_more.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// this class is used to show the descriptio of the selected item like [title],[subTitle],[description]
class ItemDescriptionView extends StatelessWidget {
  /// this defines the name of item.
  final String title;

  /// this defines the type of item.
  final String subTitle;

  /// this will give brief description about the item.
  final String description;

  const ItemDescriptionView({
    required this.title,
    required this.subTitle,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: ADTextStyle700.size22
              .setTextColor(context.adColors.filterBlackText),
        ),
        Text(
          subTitle,
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.neutralInfoMsg),
        ).paddingBySide(top: context.k_6, bottom: context.k_12),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ReadMore(
                description,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
